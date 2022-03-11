// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'alfred_item_icon.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AlfredItemIcon _$AlfredItemIconFromJson(Map<String, dynamic> json) =>
    AlfredItemIcon(
      path: json['path'] as String,
      type: $enumDecodeNullable(_$AlfredItemIconTypeEnumMap, json['type']),
    );

Map<String, dynamic> _$AlfredItemIconToJson(AlfredItemIcon instance) =>
    <String, dynamic>{
      'path': instance.path,
      'type': _$AlfredItemIconTypeEnumMap[instance.type],
    };

const _$AlfredItemIconTypeEnumMap = {
  AlfredItemIconType.fileicon: 'fileicon',
  AlfredItemIconType.filetype: 'filetype',
};
