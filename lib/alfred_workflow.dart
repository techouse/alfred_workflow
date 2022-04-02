library alfred_workflow;

import 'dart:convert' show jsonEncode;
import 'dart:io' show stdout;

import 'package:stash/stash_api.dart' show Cache;

import 'src/extensions/string_helpers.dart' show StringHelpers;
import 'src/models/alfred_item.dart' show AlfredItem;
import 'src/models/alfred_items.dart' show AlfredItems;
import 'src/services/alfred_cache.dart' show AlfredCache;

export 'src/models/alfred_item.dart' show AlfredItem;
export 'src/models/alfred_item_icon.dart'
    show AlfredItemIcon, AlfredItemIconType;
export 'src/models/alfred_item_text.dart' show AlfredItemText;
export 'src/models/alfred_items.dart' show AlfredItems;
export 'src/services/alfred_cache.dart' show AlfredCache;
export 'src/services/alfred_updater.dart' show AlfredUpdater;

class AlfredWorkflow {
  AlfredWorkflow({
    AlfredCache<AlfredItems>? cache,
  }) : _alfredCache = cache;

  final AlfredItems _items = AlfredItems([]);

  final AlfredCache<AlfredItems>? _alfredCache;

  late final Cache<AlfredItems> _cache = (_alfredCache ??
          AlfredCache<AlfredItems>(
            fromEncodable: (Map<String, dynamic> json) =>
                AlfredItems.fromJson(json),
          ))
      .cache;

  String? _cacheKey;

  /// Get the cacheKey
  String? get cacheKey => _cacheKey;

  /// To cache the results set a [String] cache key
  set cacheKey(String? value) => _cacheKey = value;

  /// Always use this to check for any AlfredItems.
  Future<AlfredItems?> getItems() async =>
      cacheKey != null ? await _cache.get(cacheKey!.md5hex) : _items;

  /// Add multiple [items]
  ///
  /// If the [cacheKey] is set those [items] will be cached.
  Future<void> addItems(List<AlfredItem> items) async {
    _items.items..addAll(items);
    if (cacheKey != null) {
      await _cache.put(cacheKey!.md5hex, AlfredItems(items));
    }
  }

  /// Add single [item]
  ///
  /// Optionally you can add the [AlfredItem] to the beginning by setting
  /// [toBeginning] to true.
  /// If the [cacheKey] is set that [item] will be cached.
  Future<void> addItem(AlfredItem item, {bool toBeginning = false}) async {
    if (toBeginning) {
      _items.items.insert(0, item);
    } else {
      _items.items.add(item);
    }

    if (cacheKey != null) {
      AlfredItems? cachedItems = await _cache.get(cacheKey!.md5hex);
      if (cachedItems != null) {
        await _cache.put(
          cacheKey!.md5hex,
          toBeginning
              ? AlfredItems([item, ...cachedItems.items])
              : AlfredItems([...cachedItems.items, item]),
        );
      } else {
        await _cache.put(
          cacheKey!.md5hex,
          AlfredItems([item]),
        );
      }
    }
  }

  /// Delete all [AlfredItem].
  Future<void> clearItems() async {
    _items.items..clear();
    if (cacheKey != null) {
      await _cache.remove(cacheKey!.md5hex);
    }
  }

  /// Returns a JSON [String] representation of the [AlfredItem] items.
  ///
  /// Optionally you can add an [AlfredItem] to the beginning by using
  /// [addToBeginning] or to the end by using [addToEnd].
  /// Either item will never be cached!
  Future<String> toJsonString({
    AlfredItem? addToBeginning,
    AlfredItem? addToEnd,
  }) async {
    final AlfredItems items = await getItems() ?? _items;
    if (addToBeginning != null) {
      items.items.insert(0, addToBeginning);
    }
    if (addToEnd != null) {
      items.items.add(addToEnd);
    }

    return jsonEncode(items.toJson());
  }

  /// Use this convenience method to print the AlfredItems in JSON format to
  /// stdout.
  Future<void> run({
    AlfredItem? addToBeginning,
    AlfredItem? addToEnd,
  }) async {
    final String json = await toJsonString(
      addToBeginning: addToBeginning,
      addToEnd: addToEnd,
    );
    stdout.write(json);
  }
}
