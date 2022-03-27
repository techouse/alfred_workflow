import 'package:alfred_workflow/src/models/github_release.dart';
import 'package:alfred_workflow/src/services/alfred_updater.dart';
import 'package:data_fixture_dart/data_fixture_dart.dart';
import 'package:http/http.dart' show Client;
import 'package:stash/stash_api.dart';

import '../../helpers/mock_alfred_cache.dart';

extension AlfredUpdaterFixture on AlfredUpdater {
  static _AlfredUpdaterFactory get factory => _AlfredUpdaterFactory();
}

class _AlfredUpdaterFactory extends FixtureFactory<AlfredUpdater> {
  @override
  FixtureDefinition<AlfredUpdater> definition() => define(
        (Faker faker) {
          final String repoName = faker.lorem.words(3).join('-').toLowerCase();
          final String login = faker.lorem.word().toLowerCase();
          final String currentVersion =
              '${faker.randomGenerator.integer(9)}.${faker.randomGenerator.integer(9)}.${faker.randomGenerator.integer(9, min: 1)}';

          return AlfredUpdater(
            githubRepositoryUrl:
                Uri.https('github.com', '/${login}/${repoName}'),
            currentVersion: currentVersion,
            cache: MockAlfredCache<GithubRelease>(
              fromEncodable: (Map<String, dynamic> json) =>
                  GithubRelease.fromJson(json),
              maxEntries: 1,
              name: 'update_cache',
              evictionPolicy: const FifoEvictionPolicy(),
              expiryPolicy: CreatedExpiryPolicy(Duration.zero),
            ),
          );
        },
      );

  FixtureRedefinitionBuilder<AlfredUpdater> githubRepositoryUrl(
    Uri githubRepositoryUrl,
  ) =>
      (AlfredUpdater alfredUpdater) => alfredUpdater.copyWith(
            githubRepositoryUrl: githubRepositoryUrl,
          );

  FixtureRedefinitionBuilder<AlfredUpdater> currentVersion(
    String currentVersion,
  ) =>
      (AlfredUpdater alfredUpdater) =>
          alfredUpdater.copyWith(currentVersion: currentVersion);

  FixtureRedefinitionBuilder<AlfredUpdater> updateInterval(
    Duration updateInterval,
  ) =>
      (AlfredUpdater alfredUpdater) => alfredUpdater.copyWith(
            cache: MockAlfredCache<GithubRelease>(
              fromEncodable: (Map<String, dynamic> json) =>
                  GithubRelease.fromJson(json),
              maxEntries: 1,
              name: 'update_cache',
              evictionPolicy: const FifoEvictionPolicy(),
              expiryPolicy: CreatedExpiryPolicy(updateInterval),
            ),
          );

  FixtureRedefinitionBuilder<AlfredUpdater> client(Client client) =>
      (AlfredUpdater alfredUpdater) => alfredUpdater.copyWith(client: client);
}
