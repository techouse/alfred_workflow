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

  String? get cacheKey => _cacheKey;

  /// To cache the results set a cache key
  set cacheKey(String? value) => _cacheKey = value;

  Future<AlfredItems?> getItems() async =>
      cacheKey != null ? await _cache.get(cacheKey!.md5hex) : _items;

  Future<void> addItems(List<AlfredItem> items) async {
    _items.items..addAll(items);
    if (cacheKey != null) {
      await _cache.put(cacheKey!.md5hex, AlfredItems(items));
    }
  }

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

  Future<void> clearItems() async {
    _items.items..clear();
    if (cacheKey != null) {
      await _cache.remove(cacheKey!.md5hex);
    }
  }

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

  Future<void> run({
    AlfredItem? addToBeginning,
    AlfredItem? addToEnd,
  }) async {
    stdout.write(
      await toJsonString(
        addToBeginning: addToBeginning,
        addToEnd: addToEnd,
      ),
    );
  }
}
