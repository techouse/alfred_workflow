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
    required T Function(Map<String, dynamic>) fromEncodable,
    String? path,
    int maxEntries = 10,
    String name = 'query_cache',
    EvictionPolicy evictionPolicy = const LruEvictionPolicy(),
    ExpiryPolicy expiryPolicy = const CreatedExpiryPolicy(
      Duration(minutes: 1),
    ),
    bool verbose = false,
  })  : _fromEncodable = fromEncodable,
        _path = path,
        _name = name,
        assert(maxEntries > 0, 'maxEntries must be positive number'),
        _maxEntries = maxEntries,
        _evictionPolicy = evictionPolicy,
        _expiryPolicy = expiryPolicy,
        _verbose = verbose;

  final String? _path;
  final String _name;
  final int _maxEntries;
  final EvictionPolicy _evictionPolicy;
  final ExpiryPolicy _expiryPolicy;
  final bool _verbose;
  final T Function(Map<String, dynamic>) _fromEncodable;

  late final FileCacheStore _store = newFileLocalCacheStore(
    path: _path ?? dirname(Platform.script.toFilePath()),
    fromEncodable: _fromEncodable,
  );

  late final Cache<T> cache = _store.cache<T>(
    name: _name,
    maxEntries: _maxEntries,
    eventListenerMode: EventListenerMode.synchronous,
    evictionPolicy: _evictionPolicy,
    expiryPolicy: _expiryPolicy,
  )
    ..on<CacheEntryCreatedEvent<T>>().listen(
      _verbose ? (event) => print('Key "${event.entry.key}" added') : null,
    )
    ..on<CacheEntryUpdatedEvent<T>>().listen(
      _verbose ? (event) => print('Key "${event.newEntry.key}" updated') : null,
    )
    ..on<CacheEntryRemovedEvent<T>>().listen(
      _verbose ? (event) => print('Key "${event.entry.key}" removed') : null,
    )
    ..on<CacheEntryExpiredEvent<T>>().listen(
      _verbose ? (event) => print('Key "${event.entry.key}" expired') : null,
    )
    ..on<CacheEntryEvictedEvent<T>>().listen(
      _verbose ? (event) => print('Key "${event.entry.key}" evicted') : null,
    );
}
