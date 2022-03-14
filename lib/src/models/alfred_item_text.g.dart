// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'alfred_item_text.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AlfredItemText _$AlfredItemTextFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['copy'],
  );
  return AlfredItemText(
    copy: json['copy'] as String,
    largeType: json['largetype'] as String?,
  );
}

Map<String, dynamic> _$AlfredItemTextToJson(AlfredItemText instance) {
  final val = <String, dynamic>{
    'copy': instance.copy,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('largetype', instance.largeType);
  return val;
}
