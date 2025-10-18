import 'dart:convert' show jsonEncode, utf8;
import 'dart:typed_data';

import 'package:alfred_workflow/src/extensions/string_helpers.dart';
import 'package:alfred_workflow/src/models/github_asset.dart';
import 'package:alfred_workflow/src/models/github_release.dart';
import 'package:alfred_workflow/src/services/alfred_updater.dart';
import 'package:collection/collection.dart';
import 'package:faker/faker.dart';
import 'package:file/file.dart';
import 'package:file/memory.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:pub_semver/pub_semver.dart' show Version;
import 'package:stash/src/api/cache/cache.dart';
import 'package:test/test.dart';

import '../../fixtures/extensions/fixture_factory_extension.dart';
import '../../fixtures/models/github_release_fixture.dart';
import '../../fixtures/services/alfred_updater_fixture.dart';
import 'alfred_updater_test.mocks.dart';

@GenerateMocks([http.Client])
void main() async {
  final Faker faker = Faker();
  late MockClient client;
  late String repoName;
  late String login;

  setUp(() {
    client = MockClient();
    repoName = faker.lorem.words(3).join('-').toLowerCase();
    login = faker.lorem.word().toLowerCase();
  });

  group('updateAvailable', () {
    test('returns true when the local version is outdated', () async {
      final String currentVersion = '1.0.0';

      final AlfredUpdater updater = AlfredUpdaterFixture.factory.states([
        AlfredUpdaterFixture.factory.githubRepositoryUrl(
          Uri.https('github.com', '/$login/$repoName'),
        ),
        AlfredUpdaterFixture.factory.currentVersion(currentVersion),
        AlfredUpdaterFixture.factory.client(client),
      ]).makeSingle();

      final GithubRelease githubRelease = GithubReleaseFixture.factory
          .redefine(
            GithubReleaseFixture.factory.withDetails(
              repoName: repoName,
              login: login,
              tagName: 'v2.0.0',
            ),
          )
          .makeSingle();

      when(
        client.get(
          Uri.https(
            'api.github.com',
            '/repos/$login/$repoName/releases/latest',
          ),
        ),
      ).thenAnswer(
        (_) async => http.Response(jsonEncode(githubRelease.toJson()), 200),
      );

      expect(await updater.updateAvailable(), true);
    });

    test('returns false when the local version is up to date', () async {
      final String currentVersion = '1.0.0';

      final AlfredUpdater updater = AlfredUpdaterFixture.factory.states([
        AlfredUpdaterFixture.factory.githubRepositoryUrl(
          Uri.https('github.com', '/$login/$repoName'),
        ),
        AlfredUpdaterFixture.factory.currentVersion(currentVersion),
        AlfredUpdaterFixture.factory.client(client),
      ]).makeSingle();

      final GithubRelease githubRelease = GithubReleaseFixture.factory
          .redefine(
            GithubReleaseFixture.factory.withDetails(
              repoName: repoName,
              login: login,
              tagName: 'v1.0.0',
            ),
          )
          .makeSingle();

      when(
        client.get(
          Uri.https(
            'api.github.com',
            '/repos/$login/$repoName/releases/latest',
          ),
        ),
      ).thenAnswer(
        (_) async => http.Response(jsonEncode(githubRelease.toJson()), 200),
      );

      expect(await updater.updateAvailable(), false);
    });

    test('returns false when the local version from the future', () async {
      final String currentVersion = '2.0.0';

      final AlfredUpdater updater = AlfredUpdaterFixture.factory.states([
        AlfredUpdaterFixture.factory.githubRepositoryUrl(
          Uri.https('github.com', '/$login/$repoName'),
        ),
        AlfredUpdaterFixture.factory.currentVersion(currentVersion),
        AlfredUpdaterFixture.factory.client(client),
      ]).makeSingle();

      final GithubRelease githubRelease = GithubReleaseFixture.factory
          .redefine(
            GithubReleaseFixture.factory.withDetails(
              repoName: repoName,
              login: login,
              tagName: 'v1.0.0',
            ),
          )
          .makeSingle();

      when(
        client.get(
          Uri.https(
            'api.github.com',
            '/repos/$login/$repoName/releases/latest',
          ),
        ),
      ).thenAnswer(
        (_) async => http.Response(jsonEncode(githubRelease.toJson()), 200),
      );

      expect(await updater.updateAvailable(), false);
    });

    test('cached Github release version comparison', () async {
      final testCases = [
        {
          'currentVersion': '2.0.0',
          'tagName': 'v2.0.0',
          'expectedResult': false,
          'description': 'equal',
        },
        {
          'currentVersion': '2.0.0',
          'tagName': 'v2.0.1',
          'expectedResult': true,
          'description': 'higher',
        },
        {
          'currentVersion': '2.0.0',
          'tagName': 'v1.9.9',
          'expectedResult': false,
          'description': 'lower',
        },
      ];

      for (final testCase in testCases) {
        // Set up test using testCase values
        final String currentVersion = testCase['currentVersion'] as String;
        final String tagName = testCase['tagName'] as String;
        final bool expectedResult = testCase['expectedResult'] as bool;
        final String description = testCase['description'] as String;

        final AlfredUpdater updater = AlfredUpdaterFixture.factory.states([
          AlfredUpdaterFixture.factory.githubRepositoryUrl(
            Uri.https('github.com', '/$login/$repoName'),
          ),
          AlfredUpdaterFixture.factory.currentVersion(currentVersion),
          AlfredUpdaterFixture.factory.client(client),
        ]).makeSingle();

        final GithubRelease githubRelease = GithubReleaseFixture.factory
            .redefine(
              GithubReleaseFixture.factory.withDetails(
                repoName: repoName,
                login: login,
                tagName: tagName,
              ),
            )
            .makeSingle();

        final Cache<GithubRelease> cache = await updater.fileCache;

        await cache.put(AlfredUpdater.updateKey.md5hex, githubRelease);

        final GithubRelease? cachedRelease = await cache.get(
          AlfredUpdater.updateKey.md5hex,
        );

        expect(cachedRelease, isNotNull);
        expect(cachedRelease, githubRelease);

        expect(
          await updater.updateAvailable(),
          expectedResult,
          reason: 'When cached version is $description to current version',
        );
      }
    });
  });

  group('update', () {
    late String currentVersion;
    late AlfredUpdater updater;
    late GithubRelease githubRelease;
    late GithubAsset asset;

    setUp(() {
      currentVersion = '1.0.0';

      updater = AlfredUpdaterFixture.factory.states([
        AlfredUpdaterFixture.factory.githubRepositoryUrl(
          Uri.https('github.com', '/$login/$repoName'),
        ),
        AlfredUpdaterFixture.factory.currentVersion(currentVersion),
        AlfredUpdaterFixture.factory.client(client),
      ]).makeSingle();

      githubRelease = GithubReleaseFixture.factory
          .redefine(
            GithubReleaseFixture.factory.withDetails(
              repoName: repoName,
              login: login,
              tagName: 'v2.0.0',
            ),
          )
          .makeSingle();

      asset = githubRelease.assets.first;
    });

    test('fetchLatestRelease', () async {
      when(
        client.get(
          Uri.https(
            'api.github.com',
            '/repos/$login/$repoName/releases/latest',
          ),
        ),
      ).thenAnswer(
        (_) async => http.Response(jsonEncode(githubRelease.toJson()), 200),
      );

      expect(await updater.fetchLatestRelease(), githubRelease);
    });

    test('findAlfredWorkflowAsset', () {
      expect(updater.findAlfredWorkflowAsset(githubRelease), asset);
    });

    test('download', () async {
      final List<int> bytes = utf8.encode(
        faker.randomGenerator.string(1024 * 10),
      );

      when(
        client.get(githubRelease.assets.first.browserDownloadUrl),
      ).thenAnswer((_) async => http.Response.bytes(bytes, 200));

      final FileSystem fileSystem = MemoryFileSystem();
      final Directory directory = await fileSystem.systemTempDirectory
          .createTemp('alfred_workflow_update');
      expect(await fileSystem.directory(directory.path).exists(), true);

      final File? file = await updater.downloadAsset(
        asset,
        fileSystem: fileSystem,
        directory: directory,
      );
      expect(file != null, true);
      expect(file, isA<File>());
      expect(await file!.readAsBytes(), Uint8List.fromList(bytes));
    });
  });

  group('Equatable', () {
    test('props contains expected properties', () {
      final AlfredUpdater updater = AlfredUpdaterFixture.factory.states([
        AlfredUpdaterFixture.factory.githubRepositoryUrl(
          Uri.https('github.com', '/user/repo'),
        ),
        AlfredUpdaterFixture.factory.currentVersion('1.0.0'),
        AlfredUpdaterFixture.factory.client(client),
      ]).makeSingle();

      // Test that props contains all the expected properties
      expect(updater.props, isNotEmpty);
      expect(updater.props, contains(updater.githubRepositoryUrl));

      // Check for Version object
      final Object? versionInProps = updater.props.firstWhere(
        (prop) => prop is Version,
        orElse: () => null,
      );
      expect(versionInProps, isNotNull);
      expect(versionInProps, isA<Version>());
      expect((versionInProps as Version).toString(), equals('1.0.0'));

      expect(updater.props, contains(updater.updateInterval));
    });

    test('instances with different properties are not equal', () {
      final AlfredUpdater updater1 = AlfredUpdaterFixture.factory.states([
        AlfredUpdaterFixture.factory.githubRepositoryUrl(
          Uri.https('github.com', '/user/repo'),
        ),
        AlfredUpdaterFixture.factory.currentVersion('1.0.0'),
        AlfredUpdaterFixture.factory.client(client),
      ]).makeSingle();

      final AlfredUpdater updater2 = AlfredUpdaterFixture.factory.states([
        AlfredUpdaterFixture.factory.githubRepositoryUrl(
          Uri.https('github.com', '/user/repo'),
        ),
        AlfredUpdaterFixture.factory.currentVersion(
          '2.0.0',
        ), // Different version
        AlfredUpdaterFixture.factory.client(client),
      ]).makeSingle();

      // They should not be equal because currentVersion is different
      expect(updater1.currentVersion, isNot(equals(updater2.currentVersion)));

      // Get Version objects from props
      final Version? version1 =
          updater1.props.firstWhereOrNull((Object? prop) => prop is Version)
              as Version?;

      final Version? version2 =
          updater2.props.firstWhereOrNull((Object? prop) => prop is Version)
              as Version?;

      expect(version1, isNotNull);
      expect(version2, isNotNull);
      expect(version1.toString(), equals('1.0.0'));
      expect(version2.toString(), equals('2.0.0'));
      expect(version1, isNot(equals(version2)));

      expect(updater1.props, isNot(equals(updater2.props)));
    });
  });
}
