import 'package:alfred_workflow/src/models/alfred_script_filter_cache.dart';
import 'package:data_fixture_dart/data_fixture_dart.dart';
import 'package:meta/meta.dart';

extension AlfredScriptFilterCacheFixture on AlfredScriptFilterCache {
  static AlfredScriptFilterCacheFactory get factory =>
      AlfredScriptFilterCacheFactory();
}

@internal
final class AlfredScriptFilterCacheFactory
    extends FixtureFactory<AlfredScriptFilterCache> {
  @override
  FixtureDefinition<AlfredScriptFilterCache> definition() => define(
        (Faker faker) => AlfredScriptFilterCache(
          seconds: faker.randomGenerator.integer(86400, min: 5),
          looseReload: faker.randomGenerator.boolean(),
        ),
      );

  FixtureRedefinitionBuilder<AlfredScriptFilterCache> seconds(int value) =>
      (AlfredScriptFilterCache cache) => cache.copyWith(seconds: value);

  FixtureRedefinitionBuilder<AlfredScriptFilterCache> looseReload(
    bool? value,
  ) =>
      (AlfredScriptFilterCache cache) => cache.copyWith(looseReload: value);
}
