// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'alfred_item_icon.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AlfredItemIcon _$AlfredItemIconFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['path'],
  );
  return AlfredItemIcon(
    path: json['path'] as String,
    type: $enumDecodeNullable(_$AlfredItemIconTypeEnumMap, json['type']),
  );
}

Map<String, dynamic> _$AlfredItemIconToJson(AlfredItemIcon instance) {
  final val = <String, dynamic>{
    'path': instance.path,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('type', _$AlfredItemIconTypeEnumMap[instance.type]);
  return val;
}

const _$AlfredItemIconTypeEnumMap = {
  AlfredItemIconType.fileicon: 'fileicon',
  AlfredItemIconType.filetype: 'filetype',
};
