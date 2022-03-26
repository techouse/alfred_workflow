import 'package:alfred_workflow/src/models/alfred_items.dart';
import 'package:alfred_workflow/src/services/alfred_cache.dart';
import 'package:data_fixture_dart/data_fixture_dart.dart';
import 'package:stash_file/stash_file.dart';

extension AlfredCacheFixture on AlfredCache {
  static _AlfredCacheFactory get factory => _AlfredCacheFactory();
}

class _AlfredCacheFactory
    extends FixtureFactory<_InMemoryAlfredCache<AlfredItems>> {
  @override
  FixtureDefinition<_InMemoryAlfredCache<AlfredItems>> definition() => define(
        (Faker faker) => _InMemoryAlfredCache<AlfredItems>(
          fromEncodable: (Map<String, dynamic> json) =>
              AlfredItems.fromJson(json),
        ),
      );
}

class _InMemoryAlfredCache<T> extends AlfredCache<T> {
  _InMemoryAlfredCache({
    required T Function(Map<String, dynamic>) fromEncodable,
  }) : super(fromEncodable: fromEncodable);

  late final FileCacheStore store = newFileMemoryCacheStore(
    fromEncodable: fromEncodable,
  );
}
