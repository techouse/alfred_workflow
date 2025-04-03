import 'package:alfred_workflow/src/models/alfred_automatic_cache.dart';
import 'package:data_fixture_dart/data_fixture_dart.dart';
import 'package:meta/meta.dart';

extension AlfredAutomaticCacheFixture on AlfredAutomaticCache {
  static AlfredAutomaticCacheFactory get factory =>
      AlfredAutomaticCacheFactory();
}

@internal
final class AlfredAutomaticCacheFactory
    extends FixtureFactory<AlfredAutomaticCache> {
  @override
  FixtureDefinition<AlfredAutomaticCache> definition() => define(
        (Faker faker) => AlfredAutomaticCache(
          seconds: faker.randomGenerator.integer(86400, min: 5),
          looseReload: faker.randomGenerator.boolean(),
        ),
      );

  FixtureRedefinitionBuilder<AlfredAutomaticCache> seconds(int value) =>
      (AlfredAutomaticCache cache) => cache.copyWith(seconds: value);

  FixtureRedefinitionBuilder<AlfredAutomaticCache> looseReload(
    bool? value,
  ) =>
      (AlfredAutomaticCache cache) => cache.copyWith(looseReload: value);
}
