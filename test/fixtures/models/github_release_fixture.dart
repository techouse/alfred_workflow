import 'package:alfred_workflow/src/models/github_release.dart';
import 'package:data_fixture_dart/data_fixture_dart.dart';
import 'package:meta/meta.dart';
import 'package:pub_semver/pub_semver.dart';

import '../extensions/fixture_factory_extension.dart';
import 'github_asset_fixture.dart';
import 'github_user_fixture.dart';

extension GithubReleaseFixture on GithubRelease {
  static GithubReleaseFactory get factory => GithubReleaseFactory();
}

@internal
final class GithubReleaseFactory extends FixtureFactory<GithubRelease> {
  final DateTime _now = DateTime.now();

  @override
  FixtureDefinition<GithubRelease> definition() => define(
        (Faker faker, [int index = 0]) {
          final String repoName = faker.lorem.words(3).join('-').toLowerCase();
          final String login = faker.lorem.word().toLowerCase();
          final int userId =
              faker.randomGenerator.integer(9999999, min: 1000000);
          final int releaseId =
              faker.randomGenerator.integer(9999999, min: 1000000);
          final String tagName =
              'v${faker.randomGenerator.integer(9)}.${faker.randomGenerator.integer(9)}.${faker.randomGenerator.integer(9, min: 1)}';
          final DateTime createdAt = faker.date
              .dateTime(
                maxYear: _now.year,
                minYear: _now.year - 2,
              )
              .toUtc();

          return GithubRelease(
            url: Uri.parse(
              'https://api.github.com/repos/$login/$repoName/releases/$releaseId',
            ),
            assetsUrl: Uri.parse(
              'https://api.github.com/repos/$login/$repoName/releases/$releaseId/assets',
            ),
            uploadUrl: Uri.parse(
              'https://upload.github.com/repos/$login/$repoName/releases/$releaseId/assets{?name,label}',
            ),
            htmlUrl: Uri.parse(
              'https://github.com/$login/$repoName/releases/tag/$tagName',
            ),
            id: releaseId,
            author: GithubUserFixture.factory.states([
              GithubUserFixture.factory.id(userId),
              GithubUserFixture.factory.login(login),
            ]).makeSingle(),
            nodeId: faker.randomGenerator.string(19),
            tagName: Version.parse(tagName.substring(1)),
            targetCommitish: 'master',
            name: tagName,
            draft: false,
            prerelease: false,
            createdAt: createdAt,
            publishedAt: createdAt,
            assets: GithubAssetFixture.factory
                .redefine(GithubAssetFixture.factory.withDetails(
                  repoName: repoName,
                  login: login,
                  userId: userId,
                  assetTag: tagName,
                  createdAt: createdAt,
                ))
                .makeMany(1),
            tarballUrl: Uri.parse(
              'https://api.github.com/repos/$login/$repoName/tarball/$tagName',
            ),
            zipballUrl: Uri.parse(
              'https://api.github.com/repos/$login/$repoName/zipball/$tagName',
            ),
            body: faker.lorem.sentence(),
          );
        },
      );

  FixtureRedefinitionBuilder<GithubRelease> withDetails({
    String? repoName,
    String? login,
    int? userId,
    int? releaseId,
    String? tagName,
    DateTime? createdAt,
  }) {
    repoName ??= faker.lorem.words(3).join('-').toLowerCase();
    login ??= faker.lorem.word().toLowerCase();
    userId ??= faker.randomGenerator.integer(9999999, min: 1000000);
    releaseId ??= faker.randomGenerator.integer(9999999, min: 1000000);
    tagName ??=
        'v${faker.randomGenerator.integer(9)}.${faker.randomGenerator.integer(9)}.${faker.randomGenerator.integer(9, min: 1)}';
    createdAt ??= faker.date
        .dateTime(
          maxYear: _now.year,
          minYear: _now.year - 2,
        )
        .toUtc();

    return (GithubRelease githubRelease, [int index = 0]) =>
        githubRelease.copyWith(
          url: Uri.parse(
            'https://api.github.com/repos/$login/$repoName/releases/$releaseId',
          ),
          assetsUrl: Uri.parse(
            'https://api.github.com/repos/$login/$repoName/releases/$releaseId/assets',
          ),
          uploadUrl: Uri.parse(
            'https://upload.github.com/repos/$login/$repoName/releases/$releaseId/assets{?name,label}',
          ),
          htmlUrl: Uri.parse(
            'https://github.com/$login/$repoName/releases/tag/$tagName',
          ),
          id: releaseId!,
          author: GithubUserFixture.factory.states([
            GithubUserFixture.factory.id(userId!),
            GithubUserFixture.factory.login(login!),
          ]).makeSingle(),
          nodeId: faker.randomGenerator.string(19),
          tagName: Version.parse(tagName!.substring(1)),
          targetCommitish: 'master',
          name: tagName,
          draft: false,
          prerelease: false,
          createdAt: createdAt!,
          publishedAt: createdAt,
          assets: GithubAssetFixture.factory
              .redefine(GithubAssetFixture.factory.withDetails(
                repoName: repoName!,
                login: login,
                userId: userId,
                assetTag: tagName,
                createdAt: createdAt,
              ))
              .makeMany(1),
          tarballUrl: Uri.parse(
            'https://api.github.com/repos/$login/$repoName/tarball/$tagName',
          ),
          zipballUrl: Uri.parse(
            'https://api.github.com/repos/$login/$repoName/zipball/$tagName',
          ),
          body: faker.lorem.sentence(),
        );
  }
}
