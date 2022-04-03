import 'dart:io' show Platform;
import 'dart:developer' show log;

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
        LruEvictionPolicy,
        Store;
import 'package:stash_file/stash_file.dart'
    show FileCacheStore, newFileLocalCacheStore;

class AlfredCache<T> {
  /// Builds an [AlfredCache] providing a [Cache] backed by a [Store]
  ///
  /// * [fromEncodable] : A custom function the converts to the object from a `Map<String, dynamic>` representation
  /// * [path] : Optionally customize the base storage location for this store
  /// * [maxEntries] : The max number of entries this cache can hold if provided. Defaults to 10.
  /// * [name] : The name of the cache. Defaults to "query_cache".
  /// * [evictionPolicy] : Optionally customize the [EvictionPolicy]. Defaults to [LruEvictionPolicy]
  /// * [expiryPolicy] : Optionally customize the [ExpiryPolicy]. Defaults to [CreatedExpiryPolicy] with a [Duration] of 1 minute.
  /// * [verbose] : If set to true then listeners will print events to the developer log. Defaults to false.
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

  /// A custom function the converts to the object from a `Map<String, dynamic>` representation
  final T Function(Map<String, dynamic>) fromEncodable;

  /// The base storage location for this store
  final String? path;

  /// The max number of entries this cache can hold if provided. To trigger the eviction policy this value should be provided
  final int maxEntries;

  /// The name of the cache
  final String name;

  /// Defines the eviction policy contract that every cache eviction algorithm should implement
  final EvictionPolicy evictionPolicy;

  /// Defines functions to determine when cache entries will expire based on
  /// creation, access and modification operations.
  ///
  /// Each of the functions return a new [Duration] that specifies the
  /// amount of time that must pass before a cache entry is considered expired.
  final ExpiryPolicy expiryPolicy;

  /// If [verbose] = true then listeners will print events to the developer log
  final bool verbose;

  /// The local [FileCacheStore]
  late final FileCacheStore store = newFileLocalCacheStore(
    path: path ?? dirname(Platform.script.toFilePath()),
    fromEncodable: fromEncodable,
  );

  /// The [Cache] backed by a [Store]
  late final Cache<T> cache = store.cache<T>(
    name: name,
    maxEntries: maxEntries,
    eventListenerMode: EventListenerMode.synchronous,
    evictionPolicy: evictionPolicy,
    expiryPolicy: expiryPolicy,
  )
    ..on<CacheEntryCreatedEvent<T>>().listen(
      verbose ? (event) => log('Key "${event.entry.key}" added') : null,
    )
    ..on<CacheEntryUpdatedEvent<T>>().listen(
      verbose ? (event) => log('Key "${event.newEntry.key}" updated') : null,
    )
    ..on<CacheEntryRemovedEvent<T>>().listen(
      verbose ? (event) => log('Key "${event.entry.key}" removed') : null,
    )
    ..on<CacheEntryExpiredEvent<T>>().listen(
      verbose ? (event) => log('Key "${event.entry.key}" expired') : null,
    )
    ..on<CacheEntryEvictedEvent<T>>().listen(
      verbose ? (event) => log('Key "${event.entry.key}" evicted') : null,
    );
}
