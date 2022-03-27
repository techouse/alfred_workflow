import 'dart:convert' show jsonEncode, utf8;
import 'dart:typed_data';

import 'package:alfred_workflow/alfred_workflow.dart';
import 'package:alfred_workflow/src/models/github_asset.dart';
import 'package:alfred_workflow/src/models/github_release.dart';
import 'package:faker/faker.dart';
import 'package:file/file.dart';
import 'package:file/memory.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import '../../fixtures/extensions/fixture_factory_extension.dart';
import '../../fixtures/models/github_release_fixture.dart';
import '../../fixtures/services/alfred_updater_fixture.dart';
import 'alfred_updater_test.mocks.dart';

@GenerateMocks([http.Client])
void main() async {
  final Faker faker = Faker();

  group('updateAvailable', () {
    test('returns true when the local version is outdated', () async {
      final MockClient client = MockClient();
      final String repoName = faker.lorem.words(3).join('-').toLowerCase();
      final String login = faker.lorem.word().toLowerCase();
      final String currentVersion = '1.0.0';

      final AlfredUpdater updater = AlfredUpdaterFixture.factory.states([
        AlfredUpdaterFixture.factory.githubRepositoryUrl(
          Uri.https('github.com', '/${login}/${repoName}'),
        ),
        AlfredUpdaterFixture.factory.currentVersion(currentVersion),
        AlfredUpdaterFixture.factory.client(client),
      ]).makeSingle();

      final GithubRelease githubRelease = GithubReleaseFixture.factory
          .redefine(GithubReleaseFixture.factory.withDetails(
            repoName: repoName,
            login: login,
            tagName: 'v2.0.0',
          ))
          .makeSingle();

      when(
        client.get(
          Uri.https(
            'api.github.com',
            '/repos/${login}/${repoName}/releases/latest',
          ),
        ),
      ).thenAnswer(
        (_) async => http.Response(jsonEncode(githubRelease.toJson()), 200),
      );

      expect(await updater.updateAvailable(), true);
    });

    test('returns false when the local version is up to date', () async {
      final MockClient client = MockClient();
      final String repoName = faker.lorem.words(3).join('-').toLowerCase();
      final String login = faker.lorem.word().toLowerCase();
      final String currentVersion = '1.0.0';

      final AlfredUpdater updater = AlfredUpdaterFixture.factory.states([
        AlfredUpdaterFixture.factory.githubRepositoryUrl(
          Uri.https('github.com', '/${login}/${repoName}'),
        ),
        AlfredUpdaterFixture.factory.currentVersion(currentVersion),
        AlfredUpdaterFixture.factory.client(client),
      ]).makeSingle();

      final GithubRelease githubRelease = GithubReleaseFixture.factory
          .redefine(GithubReleaseFixture.factory.withDetails(
            repoName: repoName,
            login: login,
            tagName: 'v1.0.0',
          ))
          .makeSingle();

      when(
        client.get(
          Uri.https(
            'api.github.com',
            '/repos/${login}/${repoName}/releases/latest',
          ),
        ),
      ).thenAnswer(
        (_) async => http.Response(jsonEncode(githubRelease.toJson()), 200),
      );

      expect(await updater.updateAvailable(), false);
    });

    test('returns false when the local version from the future', () async {
      final MockClient client = MockClient();
      final String repoName = faker.lorem.words(3).join('-').toLowerCase();
      final String login = faker.lorem.word().toLowerCase();
      final String currentVersion = '2.0.0';

      final AlfredUpdater updater = AlfredUpdaterFixture.factory.states([
        AlfredUpdaterFixture.factory.githubRepositoryUrl(
          Uri.https('github.com', '/${login}/${repoName}'),
        ),
        AlfredUpdaterFixture.factory.currentVersion(currentVersion),
        AlfredUpdaterFixture.factory.client(client),
      ]).makeSingle();

      final GithubRelease githubRelease = GithubReleaseFixture.factory
          .redefine(GithubReleaseFixture.factory.withDetails(
            repoName: repoName,
            login: login,
            tagName: 'v1.0.0',
          ))
          .makeSingle();

      when(
        client.get(
          Uri.https(
            'api.github.com',
            '/repos/${login}/${repoName}/releases/latest',
          ),
        ),
      ).thenAnswer(
        (_) async => http.Response(jsonEncode(githubRelease.toJson()), 200),
      );

      expect(await updater.updateAvailable(), false);
    });
  });

  group('update', () {
    final MockClient client = MockClient();
    final String repoName = faker.lorem.words(3).join('-').toLowerCase();
    final String login = faker.lorem.word().toLowerCase();
    final String currentVersion = '1.0.0';

    final AlfredUpdater updater = AlfredUpdaterFixture.factory.states([
      AlfredUpdaterFixture.factory.githubRepositoryUrl(
        Uri.https('github.com', '/${login}/${repoName}'),
      ),
      AlfredUpdaterFixture.factory.currentVersion(currentVersion),
      AlfredUpdaterFixture.factory.client(client),
    ]).makeSingle();

    final GithubRelease githubRelease = GithubReleaseFixture.factory
        .redefine(GithubReleaseFixture.factory.withDetails(
          repoName: repoName,
          login: login,
          tagName: 'v2.0.0',
        ))
        .makeSingle();

    final GithubAsset asset = githubRelease.assets.first;

    test('fetchLatestRelease', () async {
      when(
        client.get(
          Uri.https(
            'api.github.com',
            '/repos/${login}/${repoName}/releases/latest',
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
      final List<int> bytes =
          utf8.encode(faker.randomGenerator.string(1024 * 10));

      when(client.get(githubRelease.assets.first.browserDownloadUrl))
          .thenAnswer(
        (_) async => http.Response.bytes(bytes, 200),
      );

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
}