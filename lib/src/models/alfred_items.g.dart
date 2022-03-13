// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'alfred_items.dart';

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
