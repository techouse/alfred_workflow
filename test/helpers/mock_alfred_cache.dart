import 'package:alfred_workflow/src/services/alfred_cache.dart';
import 'package:stash_file/stash_file.dart';

final class MockAlfredCache<T> extends AlfredCache<T> {
  MockAlfredCache({
    required super.fromEncodable,
    super.path,
    super.maxEntries,
    super.name,
    super.evictionPolicy,
    super.expiryPolicy,
    super.verbose,
  });

  @override
  Future<FileCacheStore> get store => newFileMemoryCacheStore();
}
