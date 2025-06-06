import 'package:alfred_workflow/src/models/github_release.dart';
import 'package:alfred_workflow/src/services/alfred_updater.dart';
import 'package:data_fixture_dart/data_fixture_dart.dart';
import 'package:http/http.dart' show Client;
import 'package:meta/meta.dart';
import 'package:stash/stash_api.dart';

import '../../helpers/mock_alfred_cache.dart';

extension AlfredUpdaterFixture on AlfredUpdater {
  static AlfredUpdaterFactory get factory => AlfredUpdaterFactory();
}

@internal
final class AlfredUpdaterFactory extends FixtureFactory<AlfredUpdater> {
  @override
  FixtureDefinition<AlfredUpdater> definition() => define(
        (Faker faker, [int index = 0]) {
          final String repoName = faker.lorem.words(3).join('-').toLowerCase();
          final String login = faker.lorem.word().toLowerCase();
          final String currentVersion =
              '${faker.randomGenerator.integer(9)}.${faker.randomGenerator.integer(9)}.${faker.randomGenerator.integer(9, min: 1)}';

          return AlfredUpdater(
            githubRepositoryUrl: Uri.https('github.com', '/$login/$repoName'),
            currentVersion: currentVersion,
            cache: MockAlfredCache<GithubRelease>(
              fromEncodable: (Map<String, dynamic> json) =>
                  GithubRelease.fromJson(json),
              maxEntries: 1,
              name: 'update_cache',
            ),
          );
        },
      );

  FixtureRedefinitionBuilder<AlfredUpdater> githubRepositoryUrl(
    Uri githubRepositoryUrl,
  ) =>
      (AlfredUpdater alfredUpdater, [int index = 0]) => alfredUpdater.copyWith(
            githubRepositoryUrl: githubRepositoryUrl,
          );

  FixtureRedefinitionBuilder<AlfredUpdater> currentVersion(
    String currentVersion,
  ) =>
      (AlfredUpdater alfredUpdater, [int index = 0]) =>
          alfredUpdater.copyWith(currentVersion: currentVersion);

  FixtureRedefinitionBuilder<AlfredUpdater> updateInterval(
    Duration updateInterval,
  ) =>
      (AlfredUpdater alfredUpdater, [int index = 0]) => alfredUpdater.copyWith(
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
      (AlfredUpdater alfredUpdater, [int index = 0]) =>
          alfredUpdater.copyWith(client: client);
}
