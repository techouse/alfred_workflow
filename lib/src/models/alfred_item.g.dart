// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'alfred_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AlfredItem _$AlfredItemFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['title'],
  );
  return AlfredItem(
    title: json['title'] as String,
    type: json['type'] as String? ?? 'default',
    valid: json['valid'] as bool? ?? false,
    subtitle: json['subtitle'] as String?,
    arg: json['arg'] as String?,
    autocomplete: json['autocomplete'] as String?,
    uid: json['uid'] as String?,
    icon: AlfredItem._iconFromJson(json['icon']),
    text: AlfredItem._textFromJson(json['text']),
    quickLookUrl: json['quicklookurl'] as String?,
    match: json['match'] as String?,
  );
}

Map<String, dynamic> _$AlfredItemToJson(AlfredItem instance) {
  final val = <String, dynamic>{
    'title': instance.title,
    'type': instance.type,
    'valid': instance.valid,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('subtitle', instance.subtitle);
  writeNotNull('arg', instance.arg);
  writeNotNull('autocomplete', instance.autocomplete);
  writeNotNull('uid', instance.uid);
  writeNotNull('icon', instance.icon?.toJson());
  writeNotNull('text', instance.text?.toJson());
  writeNotNull('quicklookurl', instance.quickLookUrl);
  writeNotNull('match', instance.match);
  return val;
}
