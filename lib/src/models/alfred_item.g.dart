// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'alfred_item.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$AlfredItemCWProxy {
  AlfredItem arg(String? arg);

  AlfredItem autocomplete(String? autocomplete);

  AlfredItem icon(AlfredItemIcon? icon);

  AlfredItem match(String? match);

  AlfredItem quickLookUrl(String? quickLookUrl);

  AlfredItem subtitle(String? subtitle);

  AlfredItem text(AlfredItemText? text);

  AlfredItem title(String title);

  AlfredItem type(String type);

  AlfredItem uid(String? uid);

  AlfredItem valid(bool valid);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `AlfredItem(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// AlfredItem(...).copyWith(id: 12, name: "My name")
  /// ````
  AlfredItem call({
    String? arg,
    String? autocomplete,
    AlfredItemIcon? icon,
    String? match,
    String? quickLookUrl,
    String? subtitle,
    AlfredItemText? text,
    String? title,
    String? type,
    String? uid,
    bool? valid,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfAlfredItem.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfAlfredItem.copyWith.fieldName(...)`
class _$AlfredItemCWProxyImpl implements _$AlfredItemCWProxy {
  final AlfredItem _value;

  const _$AlfredItemCWProxyImpl(this._value);

  @override
  AlfredItem arg(String? arg) => this(arg: arg);

  @override
  AlfredItem autocomplete(String? autocomplete) =>
      this(autocomplete: autocomplete);

  @override
  AlfredItem icon(AlfredItemIcon? icon) => this(icon: icon);

  @override
  AlfredItem match(String? match) => this(match: match);

  @override
  AlfredItem quickLookUrl(String? quickLookUrl) =>
      this(quickLookUrl: quickLookUrl);

  @override
  AlfredItem subtitle(String? subtitle) => this(subtitle: subtitle);

  @override
  AlfredItem text(AlfredItemText? text) => this(text: text);

  @override
  AlfredItem title(String title) => this(title: title);

  @override
  AlfredItem type(String type) => this(type: type);

  @override
  AlfredItem uid(String? uid) => this(uid: uid);

  @override
  AlfredItem valid(bool valid) => this(valid: valid);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `AlfredItem(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// AlfredItem(...).copyWith(id: 12, name: "My name")
  /// ````
  AlfredItem call({
    Object? arg = const $CopyWithPlaceholder(),
    Object? autocomplete = const $CopyWithPlaceholder(),
    Object? icon = const $CopyWithPlaceholder(),
    Object? match = const $CopyWithPlaceholder(),
    Object? quickLookUrl = const $CopyWithPlaceholder(),
    Object? subtitle = const $CopyWithPlaceholder(),
    Object? text = const $CopyWithPlaceholder(),
    Object? title = const $CopyWithPlaceholder(),
    Object? type = const $CopyWithPlaceholder(),
    Object? uid = const $CopyWithPlaceholder(),
    Object? valid = const $CopyWithPlaceholder(),
  }) {
    return AlfredItem(
      arg: arg == const $CopyWithPlaceholder()
          ? _value.arg
          // ignore: cast_nullable_to_non_nullable
          : arg as String?,
      autocomplete: autocomplete == const $CopyWithPlaceholder()
          ? _value.autocomplete
          // ignore: cast_nullable_to_non_nullable
          : autocomplete as String?,
      icon: icon == const $CopyWithPlaceholder()
          ? _value.icon
          // ignore: cast_nullable_to_non_nullable
          : icon as AlfredItemIcon?,
      match: match == const $CopyWithPlaceholder()
          ? _value.match
          // ignore: cast_nullable_to_non_nullable
          : match as String?,
      quickLookUrl: quickLookUrl == const $CopyWithPlaceholder()
          ? _value.quickLookUrl
          // ignore: cast_nullable_to_non_nullable
          : quickLookUrl as String?,
      subtitle: subtitle == const $CopyWithPlaceholder()
          ? _value.subtitle
          // ignore: cast_nullable_to_non_nullable
          : subtitle as String?,
      text: text == const $CopyWithPlaceholder()
          ? _value.text
          // ignore: cast_nullable_to_non_nullable
          : text as AlfredItemText?,
      title: title == const $CopyWithPlaceholder() || title == null
          ? _value.title
          // ignore: cast_nullable_to_non_nullable
          : title as String,
      type: type == const $CopyWithPlaceholder() || type == null
          ? _value.type
          // ignore: cast_nullable_to_non_nullable
          : type as String,
      uid: uid == const $CopyWithPlaceholder()
          ? _value.uid
          // ignore: cast_nullable_to_non_nullable
          : uid as String?,
      valid: valid == const $CopyWithPlaceholder() || valid == null
          ? _value.valid
          // ignore: cast_nullable_to_non_nullable
          : valid as bool,
    );
  }
}

extension $AlfredItemCopyWith on AlfredItem {
  /// Returns a callable class that can be used as follows: `instanceOfAlfredItem.copyWith(...)` or like so:`instanceOfAlfredItem.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$AlfredItemCWProxy get copyWith => _$AlfredItemCWProxyImpl(this);
}

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
