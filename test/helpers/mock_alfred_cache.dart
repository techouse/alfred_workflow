import 'package:alfred_workflow/src/services/alfred_cache.dart';
import 'package:stash/stash_api.dart';
import 'package:stash_file/stash_file.dart';

class MockAlfredCache<T> extends AlfredCache<T> {
  MockAlfredCache({
    required T Function(Map<String, dynamic>) fromEncodable,
    String? path,
    int maxEntries = 10,
    String name = 'query_cache',
    EvictionPolicy evictionPolicy = const LruEvictionPolicy(),
    ExpiryPolicy expiryPolicy = const CreatedExpiryPolicy(
      Duration(minutes: 1),
    ),
    bool verbose = false,
  }) : super(
          fromEncodable: fromEncodable,
          path: path,
          maxEntries: maxEntries,
          name: name,
          evictionPolicy: evictionPolicy,
          expiryPolicy: expiryPolicy,
          verbose: verbose,
        );

  @override
  Future<FileCacheStore> get store => newFileMemoryCacheStore();
}
