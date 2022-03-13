import 'package:json_annotation/json_annotation.dart';

import 'alfred_item.dart';

part 'alfred_items.g.dart';

@JsonSerializable(explicitToJson: true)
class AlfredItems {
  AlfredItems(this.items);

  @JsonKey(fromJson: _itemsFromJson)
  List<AlfredItem> items;

  static List<AlfredItem> _itemsFromJson(List<dynamic> items) => items
      .map((e) => AlfredItem.fromJson(Map<String, dynamic>.from(e)))
      .toList();

  factory AlfredItems.fromJson(Map<String, dynamic> json) =>
      _$AlfredItemsFromJson(json);

  Map<String, dynamic> toJson() => _$AlfredItemsToJson(this);
}
