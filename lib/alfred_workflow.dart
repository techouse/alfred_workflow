library alfred_workflow;

import 'dart:convert' show jsonEncode;
import 'dart:io' show stdout;

import 'src/models/alfred_item.dart' show AlfredItem;
import 'src/models/alfred_items.dart' show AlfredItems;

export 'src/models/alfred_item.dart' show AlfredItem;
export 'src/models/alfred_item_icon.dart'
    show AlfredItemIcon, AlfredItemIconType;
export 'src/models/alfred_item_text.dart' show AlfredItemText;
export 'src/models/alfred_items.dart' show AlfredItems;

class AlfredWorkflow {
  AlfredWorkflow._();

  factory AlfredWorkflow() => _instance;

  static final AlfredWorkflow _instance = AlfredWorkflow._();

  final AlfredItems _items = AlfredItems(items: []);

  List<AlfredItem> get items => [..._items.items];

  set items(List<AlfredItem> items) => _items.items
    ..clear()
    ..addAll(items);

  void addItems(List<AlfredItem> items) => _items.items..addAll(items);

  void addItem(AlfredItem item) => _items.items.add(item);

  void clearItems() => _items.items..clear();

  void run() => stdout.write(jsonEncode(_items.toJson()));
}
