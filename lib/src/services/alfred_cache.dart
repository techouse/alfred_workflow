import 'dart:io' show Platform;

import 'package:path/path.dart' show dirname;
import 'package:stash/stash_api.dart'
    show
        Cache,
        CacheEntryCreatedEvent,
        CacheEntryEvictedEvent,
        CacheEntryExpiredEvent,
        CacheEntryRemovedEvent,
        CacheEntryUpdatedEvent,
        CacheExtension,
        CreatedExpiryPolicy,
        EventListenerMode,
        EvictionPolicy,
        ExpiryPolicy,
        LruEvictionPolicy;
import 'package:stash_file/stash_file.dart'
    show FileCacheStore, newFileLocalCacheStore;

class AlfredCache<T> {
  AlfredCache({
    required this.fromEncodable,
    this.path,
    this.maxEntries = 10,
    this.name = 'query_cache',
    this.evictionPolicy = const LruEvictionPolicy(),
    this.expiryPolicy = const CreatedExpiryPolicy(
      Duration(minutes: 1),
    ),
    this.verbose = false,
  }) : assert(maxEntries > 0, 'maxEntries must be positive number');

  final T Function(Map<String, dynamic>) fromEncodable;
  final String? path;
  final int maxEntries;
  final String name;
  final EvictionPolicy evictionPolicy;
  final ExpiryPolicy expiryPolicy;
  final bool verbose;

  late final FileCacheStore store = newFileLocalCacheStore(
    path: path ?? dirname(Platform.script.toFilePath()),
    fromEncodable: fromEncodable,
  );

  late final Cache<T> cache = store.cache<T>(
    name: name,
    maxEntries: maxEntries,
    eventListenerMode: EventListenerMode.synchronous,
    evictionPolicy: evictionPolicy,
    expiryPolicy: expiryPolicy,
  )
    ..on<CacheEntryCreatedEvent<T>>().listen(
      verbose ? (event) => print('Key "${event.entry.key}" added') : null,
    )
    ..on<CacheEntryUpdatedEvent<T>>().listen(
      verbose ? (event) => print('Key "${event.newEntry.key}" updated') : null,
    )
    ..on<CacheEntryRemovedEvent<T>>().listen(
      verbose ? (event) => print('Key "${event.entry.key}" removed') : null,
    )
    ..on<CacheEntryExpiredEvent<T>>().listen(
      verbose ? (event) => print('Key "${event.entry.key}" expired') : null,
    )
    ..on<CacheEntryEvictedEvent<T>>().listen(
      verbose ? (event) => print('Key "${event.entry.key}" evicted') : null,
    );
}
