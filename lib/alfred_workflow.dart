/// Alfred Workflow library for Dart.
library;

import 'dart:convert' show jsonEncode;
import 'dart:io' show stdout;

import 'package:alfred_workflow/src/models/alfred_automatic_cache.dart';
import 'package:meta/meta.dart';
import 'package:stash/stash_api.dart' show Cache, CreatedExpiryPolicy, Store;

import 'src/extensions/string_helpers.dart' show StringHelpers;
import 'src/models/alfred_item.dart' show AlfredItem;
import 'src/models/alfred_items.dart' show AlfredItems;
import 'src/services/alfred_cache.dart' show AlfredCache;

export 'src/extensions/index.dart';
export 'src/models/index.dart';
export 'src/services/index.dart';

final class AlfredWorkflow {
  /// Builds an [AlfredWorkflow]
  ///
  /// * [automaticCache] : Optionally customize the [AlfredAutomaticCache] to configure Alfred's automatic caching
  /// * [fileCache] : Optionally customize the [AlfredCache] providing a [Cache] backed by a [Store]
  AlfredWorkflow({
    AlfredAutomaticCache? automaticCache,
    AlfredCache<AlfredItems>? fileCache,
  }) : _alfredAutomaticCache = automaticCache,
       _alfredFileCache = fileCache;

  /// Alfred learns to prioritise item results like he learns any other, meaning
  /// the order in which your workflow results are presented will be based on
  /// Alfred's knowledge (using the item UID) and not the order your script
  /// returns the items.
  ///
  /// To have Alfred present the items in the exact sequence you define, set
  /// [disableAlfredSmartResultOrdering] to true.
  bool disableAlfredSmartResultOrdering = false;

  /// This preserves the given item order while allowing Alfred to retain
  /// knowledge of your items, like your current selection during a re-run.
  ///
  /// Only available in Alfred 5
  bool? skipKnowledge;

  // ignore: prefer_const_constructors
  final AlfredItems _items = AlfredItems([]);

  final AlfredAutomaticCache? _alfredAutomaticCache;

  final AlfredCache<AlfredItems>? _alfredFileCache;

  /// The cache key is used to identify the cached data.
  String? get cacheKey => _cacheKey;

  String? _cacheKey;

  set cacheKey(String? value) {
    if (value != null) {
      // Prevent double caching
      _useAutomaticCache = false;
    }

    _cacheKey = value;
  }

  /// The time to live for the cache in seconds.
  int? get cacheTimeToLive =>
      _cacheTimeToLive ??
      _alfredAutomaticCache?.seconds ??
      _alfredFileCache?.expiryPolicy.getExpiryForCreation().inSeconds;

  int? _cacheTimeToLive;

  @visibleForTesting
  static const int defaultCacheTimeToLive = 60;

  set cacheTimeToLive(int? value) {
    if (value != null &&
        value >= AlfredAutomaticCache.minSeconds &&
        value <= AlfredAutomaticCache.maxSeconds) {
      _cacheTimeToLive = value;
    } else {
      _cacheTimeToLive = null;
    }
  }

  /// The maximum number of entries in the cache.
  int? get maxCacheEntries => _alfredFileCache?.maxEntries ?? _maxCacheEntries;

  int? _maxCacheEntries;

  @visibleForTesting
  static const int defaultMaxCacheEntries = 10;

  set maxCacheEntries(int? value) {
    if (value != null && value > 0) {
      _maxCacheEntries = value;

      // Prevent double caching
      _useAutomaticCache = false;
    } else {
      _maxCacheEntries = null;
    }
  }

  /// Scripts which take a while to return can cache results so users see data sooner on subsequent runs.
  /// The Script Filter presents the results from the previous run when caching is active and hasn't expired.
  /// Because the script won't execute when loading cached data, we recommend this option only be used with
  /// "Alfred filters results".
  ///
  /// Time to live for cached data is defined as a number of seconds between 5 and 86400 (i.e. 24 hours).
  bool get useAutomaticCache =>
      (_alfredAutomaticCache != null ? true : _useAutomaticCache) ?? false;

  bool? _useAutomaticCache;

  set useAutomaticCache(bool? value) {
    if (value == true) {
      // Prevent double caching
      _cacheKey = null;
    }

    _useAutomaticCache = value;
  }

  @visibleForTesting
  AlfredAutomaticCache? get automaticCache => useAutomaticCache
      ? _alfredAutomaticCache ??
            AlfredAutomaticCache(
              seconds: cacheTimeToLive ?? defaultCacheTimeToLive,
              looseReload: true,
            )
      : null;

  @visibleForTesting
  AlfredCache<AlfredItems> get fileCache =>
      _alfredFileCache ??
      AlfredCache<AlfredItems>(
        fromEncodable: AlfredItems.fromJson,
        maxEntries: maxCacheEntries ?? defaultMaxCacheEntries,
        expiryPolicy: CreatedExpiryPolicy(
          Duration(seconds: cacheTimeToLive ?? defaultCacheTimeToLive),
        ),
      );

  Future<Cache<AlfredItems>> get _fileCache => fileCache.cache;

  /// Always use this to check for any AlfredItems.
  Future<AlfredItems> getItems() async {
    return switch (cacheKey) {
      null => _items,
      _ => await (await _fileCache).get(cacheKey!.md5hex) ?? _items,
    };
  }

  /// Add multiple [items]
  ///
  /// If the [cacheKey] is set those [items] will be cached.
  Future<void> addItems(List<AlfredItem> items) async {
    _items.addAll(items);
    if (cacheKey != null) {
      await (await _fileCache).put(cacheKey!.md5hex, _items);
    }
  }

  /// Add single [item]
  ///
  /// Optionally you can add the [AlfredItem] to the beginning by setting [toBeginning] to true.
  /// If the [cacheKey] is set that [item] will be cached.
  Future<void> addItem(AlfredItem item, {bool toBeginning = false}) async {
    if (toBeginning) {
      _items.insert(0, item);
    } else {
      _items.add(item);
    }

    if (cacheKey != null) {
      final Cache<AlfredItems> cache = await _fileCache;

      final AlfredItems? cachedItems = await cache.get(cacheKey!.md5hex);

      await cache.put(
        cacheKey!.md5hex,
        cachedItems != null
            ? switch (toBeginning) {
                true => cachedItems..insert(0, item),
                false => cachedItems..add(item),
              }
            : AlfredItems([item]),
      );
    }
  }

  /// Delete all [AlfredItem].
  Future<void> clearItems() async {
    _items.clear();
    if (cacheKey != null) {
      await (await _fileCache).remove(cacheKey!.md5hex);
    }
  }

  /// Returns a JSON [String] representation of the [AlfredItem] items.
  ///
  /// Optionally you can add an [AlfredItem] to the beginning by using [addToBeginning] or to the end by using [addToEnd].
  /// Either item will never be cached!
  Future<String> toJsonString({
    AlfredItem? addToBeginning,
    AlfredItem? addToEnd,
  }) async {
    final AlfredItems items =
        AlfredItems(
            [...(await getItems()).items],
            exactOrder: disableAlfredSmartResultOrdering,
            skipKnowledge: skipKnowledge,
            cache: automaticCache,
          )
          ..insertAll(0, [if (addToBeginning != null) addToBeginning])
          ..addAll([if (addToEnd != null) addToEnd]);

    return jsonEncode(items.toJson());
  }

  /// Use this convenience method to print the AlfredItems in JSON format to stdout.
  Future<void> run({
    AlfredItem? addToBeginning,
    AlfredItem? addToEnd,
    bool toStdout = true,
  }) async {
    final String json = await toJsonString(
      addToBeginning: addToBeginning,
      addToEnd: addToEnd,
    );

    if (toStdout) {
      stdout.write(json);
    } else {
      // ignore: avoid_print
      print(json);
    }
  }
}
