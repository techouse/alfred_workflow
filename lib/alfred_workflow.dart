library alfred_workflow;

import 'dart:convert' show jsonEncode;
import 'dart:io' show stdout;

import 'package:alfred_workflow/src/services/alfred_cache.dart'
    show AlfredCache;
import 'package:stash/stash_api.dart' show Cache;

import 'src/extensions/string_helpers.dart' show StringHelpers;
import 'src/models/alfred_item.dart' show AlfredItem;
import 'src/models/alfred_items.dart' show AlfredItems;

export 'src/models/alfred_item.dart' show AlfredItem;
export 'src/models/alfred_item_icon.dart'
    show AlfredItemIcon, AlfredItemIconType;
export 'src/models/alfred_item_text.dart' show AlfredItemText;
export 'src/models/alfred_items.dart' show AlfredItems;
export 'src/services/alfred_cache.dart' show AlfredCache;

class AlfredWorkflow {
  AlfredWorkflow({
    AlfredCache? cache,
  }) : _alfredCache = cache;

  final AlfredItems _items = AlfredItems([]);

  final AlfredCache? _alfredCache;

  late final Cache _cache = (_alfredCache ?? AlfredCache()).cache;

  String? _cacheKey;

  String? get cacheKey => _cacheKey;

  /// To cache the results set a cache key
  set cacheKey(String? value) => _cacheKey = value;

  Future<AlfredItems?> getItems() async =>
      cacheKey == null ? _items : await _cache.get(cacheKey!.md5hex);

  void addItems(List<AlfredItem> items) async {
    _items.items..addAll(items);
    if (cacheKey != null) {
      await _cache.put(cacheKey!.md5hex, AlfredItems(items));
    }
  }

  void addItem(AlfredItem item) async {
    _items.items.add(item);
    if (cacheKey != null) {
      AlfredItems? cachedItems = await _cache.get(cacheKey!.md5hex);
      if (cachedItems != null) {
        await _cache.put(
          cacheKey!.md5hex,
          AlfredItems([...cachedItems.items, item]),
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

  Future<void> run() async {
    final AlfredItems? items = await getItems();
    stdout.write(jsonEncode(items?.toJson() ?? _items.toJson()));
  }
}
