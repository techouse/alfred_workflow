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

import '../models/alfred_items.dart';

class AlfredCache {
  AlfredCache({
    String? path,
    int maxEntries = 10,
    String name = 'query_cache',
    EvictionPolicy evictionPolicy = const LruEvictionPolicy(),
    ExpiryPolicy expiryPolicy = const CreatedExpiryPolicy(
      Duration(minutes: 1),
    ),
    bool verbose = false,
  })  : _path = path,
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

  late final FileCacheStore _store = newFileLocalCacheStore(
    path: _path ?? dirname(Platform.script.toFilePath()),
    fromEncodable: (Map<String, dynamic> json) => AlfredItems.fromJson(json),
  );

  late final Cache cache = _store.cache<AlfredItems>(
    name: _name,
    maxEntries: _maxEntries,
    eventListenerMode: EventListenerMode.synchronous,
    evictionPolicy: _evictionPolicy,
    expiryPolicy: _expiryPolicy,
  )
    ..on<CacheEntryCreatedEvent<AlfredItems>>().listen(
      _verbose ? (event) => print('Key "${event.entry.key}" added') : null,
    )
    ..on<CacheEntryUpdatedEvent<AlfredItems>>().listen(
      _verbose ? (event) => print('Key "${event.newEntry.key}" updated') : null,
    )
    ..on<CacheEntryRemovedEvent<AlfredItems>>().listen(
      _verbose ? (event) => print('Key "${event.entry.key}" removed') : null,
    )
    ..on<CacheEntryExpiredEvent<AlfredItems>>().listen(
      _verbose ? (event) => print('Key "${event.entry.key}" expired') : null,
    )
    ..on<CacheEntryEvictedEvent<AlfredItems>>().listen(
      _verbose ? (event) => print('Key "${event.entry.key}" evicted') : null,
    );
}
