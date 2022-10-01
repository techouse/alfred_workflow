import 'package:autoequal/autoequal.dart';
import 'package:equatable/equatable.dart' show EquatableMixin;
import 'package:json_annotation/json_annotation.dart'
    show JsonSerializable, JsonKey;

import 'alfred_item.dart';

part 'alfred_items.g.dart';

@Autoequal(mixin: true)
@JsonSerializable(explicitToJson: true)
class AlfredItems with EquatableMixin, _$AlfredItemsAutoequalMixin {
  AlfredItems(this.items);

  /// A list of zero or more [AlfredItem]s.
  ///
  /// Each [AlfredItem] describes a result row displayed in Alfred.
  @JsonKey(fromJson: _itemsFromJson)
  List<AlfredItem> items;

  static List<AlfredItem> _itemsFromJson(List<dynamic> items) => items
      .map((e) => AlfredItem.fromJson(Map<String, dynamic>.from(e)))
      .toList();

  factory AlfredItems.fromJson(Map<String, dynamic> json) =>
      _$AlfredItemsFromJson(json);

  Map<String, dynamic> toJson() => _$AlfredItemsToJson(this);
}
