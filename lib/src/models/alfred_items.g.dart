// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'alfred_items.dart';

// **************************************************************************
// AutoequalGenerator
// **************************************************************************

mixin _$AlfredItemsAutoequalMixin on EquatableMixin {
  @override
  List<Object?> get props =>
      _$AlfredItemsAutoequal(this as AlfredItems)._autoequalProps;
}

extension _$AlfredItemsAutoequal on AlfredItems {
  List<Object?> get _autoequalProps => [items];
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AlfredItems _$AlfredItemsFromJson(Map<String, dynamic> json) => AlfredItems(
      AlfredItems._itemsFromJson(json['items'] as List),
    );

Map<String, dynamic> _$AlfredItemsToJson(AlfredItems instance) =>
    <String, dynamic>{
      'items': instance.items.map((e) => e.toJson()).toList(),
    };
