// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'alfred_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AlfredItem _$AlfredItemFromJson(Map<String, dynamic> json) => AlfredItem(
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

Map<String, dynamic> _$AlfredItemToJson(AlfredItem instance) =>
    <String, dynamic>{
      'title': instance.title,
      'type': instance.type,
      'valid': instance.valid,
      'subtitle': instance.subtitle,
      'arg': instance.arg,
      'autocomplete': instance.autocomplete,
      'uid': instance.uid,
      'icon': instance.icon?.toJson(),
      'text': instance.text?.toJson(),
      'quicklookurl': instance.quickLookUrl,
      'match': instance.match,
    };
