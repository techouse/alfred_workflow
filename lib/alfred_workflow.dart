library alfred_workflow;

import 'dart:convert' show jsonEncode;
import 'dart:io' show stdout;

import 'src/models/alfred_item.dart' show AlfredItem;

export 'src/models/alfred_item.dart' show AlfredItem;
export 'src/models/alfred_item_icon.dart' show AlfredItemIcon, AlfredItemIconType;
export 'src/models/alfred_item_text.dart' show AlfredItemText;

class AlfredWorkflow {
  AlfredWorkflow._();

  factory AlfredWorkflow() => _instance;

  static final AlfredWorkflow _instance = AlfredWorkflow._();

  List<AlfredItem> _items = [];

  List<AlfredItem> get items => [..._items];

  set items(List<AlfredItem> items) => _items = items;

  void addItems(Iterable<AlfredItem> items) => _items..addAll(items);

  void addItem(AlfredItem item) => _items.add(item);

  void clearItems() => _items.clear();

  void run() => stdout.write(
        jsonEncode({'items': items.map((item) => item.toJson()).toList()}),
      );
}
