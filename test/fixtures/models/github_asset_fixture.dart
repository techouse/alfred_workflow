import 'package:alfred_workflow/src/models/github_asset.dart';
import 'package:data_fixture_dart/data_fixture_dart.dart';

import '../extensions/fixture_factory_extension.dart';
import 'github_user_fixture.dart';

extension GithubAssetFixture on GithubAsset {
  static _GithubAssetFactory get factory => _GithubAssetFactory();
}

class _GithubAssetFactory extends FixtureFactory<GithubAsset> {
  final DateTime _now = DateTime.now();

  @override
  FixtureDefinition<GithubAsset> definition() => define(
        (Faker faker) {
          final String repoName = faker.lorem.words(3).join('-').toLowerCase();
          final String login = faker.lorem.word().toLowerCase();
          final int userId =
              faker.randomGenerator.integer(9999999, min: 1000000);
          final int assetId =
              faker.randomGenerator.integer(9999999, min: 1000000);
          final String assetTag =
              'v${faker.randomGenerator.integer(9)}.${faker.randomGenerator.integer(9)}.${faker.randomGenerator.integer(9, min: 1)}';
          final String assetName =
              '${faker.lorem.words(3).join('-').toLowerCase()}-${assetTag}.alfredworkflow';
          final DateTime createdAt = faker.date
              .dateTime(
                maxYear: _now.year,
                minYear: _now.year - 2,
              )
              .toUtc();

          return GithubAsset(
            url: Uri.parse(
              'https://api.github.com/repos/${login}/${repoName}/releases/assets/${assetId}',
            ),
            id: assetId,
            nodeId: faker.randomGenerator.string(19),
            name: assetName,
            label: null,
            uploader: GithubUserFixture.factory.states([
              GithubUserFixture.factory.id(userId),
              GithubUserFixture.factory.login(login),
            ]).makeSingle(),
            contentType: 'application/octet-stream',
            state: 'uploaded',
            size: faker.randomGenerator.integer(9999999, min: 1000000),
            downloadCount: faker.randomGenerator.integer(1000),
            createdAt: createdAt,
            updatedAt: createdAt,
            browserDownloadUrl: Uri.parse(
              'https://github.com/${login}/${repoName}/releases/download/${assetTag}/${assetName}',
            ),
          );
        },
      );

  FixtureRedefinitionBuilder<GithubAsset> withDetails({
    required String repoName,
    required String login,
    required int userId,
    required String assetTag,
    required DateTime createdAt,
  }) {
    final int assetId = faker.randomGenerator.integer(9999999, min: 1000000);
    final String assetName =
        '${faker.lorem.words(3).join('-').toLowerCase()}-${assetTag}.alfredworkflow';

    return (GithubAsset asset) => asset.copyWith(
          url: Uri.parse(
            'https://api.github.com/repos/${login}/${repoName}/releases/assets/${assetId}',
          ),
          id: assetId,
          name: assetName,
          uploader: GithubUserFixture.factory.states([
            GithubUserFixture.factory.id(userId),
            GithubUserFixture.factory.login(login),
          ]).makeSingle(),
          createdAt: createdAt,
          updatedAt: createdAt,
          browserDownloadUrl: Uri.parse(
            'https://github.com/${login}/${repoName}/releases/download/${assetTag}/${assetName}',
          ),
        );
  }
}
