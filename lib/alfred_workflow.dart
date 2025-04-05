/// Alfred Workflow library for Dart.
library;

import 'dart:convert' show jsonEncode;
import 'dart:io' show stdout;

import 'package:alfred_workflow/src/models/alfred_automatic_cache.dart';
import 'package:stash/stash_api.dart' show Cache, Store;

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
  /// * [cache] : Optionally customize the [AlfredCache] providing a [Cache] backed by a [Store]
  AlfredWorkflow({
    AlfredCache<AlfredItems>? cache,
  }) : _alfredCache = cache;

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

  final AlfredCache<AlfredItems>? _alfredCache;

  late final Future<Cache<AlfredItems>> _cache = (_alfredCache ??
          AlfredCache<AlfredItems>(fromEncodable: AlfredItems.fromJson))
      .cache;

  /// The cache key is used to identify the cached data.
  String? get cacheKey => _cacheKey;

  String? _cacheKey;

  set cacheKey(String? value) {
    if (value != null) {
      // Prevent double caching
      _automaticCache = null;
    }

    _cacheKey = value;
  }

  /// Scripts which take a while to return can cache results so users see data sooner on subsequent runs.
  /// The Script Filter presents the results from the previous run when caching is active and hasn't expired.
  /// Because the script won't execute when loading cached data, we recommend this option only be used with
  /// "Alfred filters results".
  ///
  /// Time to live for cached data is defined as a number of seconds between 5 and 86400 (i.e. 24 hours).
  AlfredAutomaticCache? get automaticCache => _automaticCache;

  AlfredAutomaticCache? _automaticCache;

  set automaticCache(AlfredAutomaticCache? value) {
    if (value != null) {
      // Prevent double caching
      _cacheKey = null;
    }

    _automaticCache = value;
  }

  /// Always use this to check for any AlfredItems.
  Future<AlfredItems> getItems() async {
    return switch (cacheKey) {
      null => _items,
      _ => await (await _cache).get(cacheKey!.md5hex) ?? _items,
    };
  }

  /// Add multiple [items]
  ///
  /// If the [cacheKey] is set those [items] will be cached.
  Future<void> addItems(List<AlfredItem> items) async {
    _items.addAll(items);
    if (cacheKey != null) {
      await (await _cache).put(cacheKey!.md5hex, _items);
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
      final Cache<AlfredItems> cache = await _cache;

      final AlfredItems? cachedItems = await cache.get(cacheKey!.md5hex);

      if (cachedItems != null) {
        await cache.put(
          cacheKey!.md5hex,
          switch (toBeginning) {
            true => cachedItems..insert(0, item),
            false => cachedItems..add(item),
          },
        );
      } else {
        await cache.put(
          cacheKey!.md5hex,
          AlfredItems([item]),
        );
      }
    }
  }

  /// Delete all [AlfredItem].
  Future<void> clearItems() async {
    _items.clear();
    if (cacheKey != null) {
      await (await _cache).remove(cacheKey!.md5hex);
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
    final AlfredItems items = AlfredItems(
      [...(await getItems()).items],
      exactOrder: disableAlfredSmartResultOrdering,
      skipKnowledge: skipKnowledge,
      cache: automaticCache,
    );

    if (addToBeginning != null) {
      items.insert(0, addToBeginning);
    }

    if (addToEnd != null) {
      items.add(addToEnd);
    }

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
