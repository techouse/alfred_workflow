// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'alfred_item.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$AlfredItemCWProxy {
  AlfredItem title(String title);

  AlfredItem type(AlfredItemType type);

  AlfredItem valid(bool valid);

  AlfredItem subtitle(String? subtitle);

  AlfredItem arg(String? arg);

  AlfredItem autocomplete(String? autocomplete);

  AlfredItem uid(String? uid);

  AlfredItem icon(AlfredItemIcon? icon);

  AlfredItem text(AlfredItemText? text);

  AlfredItem quickLookUrl(String? quickLookUrl);

  AlfredItem match(String? match);

  AlfredItem mods(Map<Set<AlfredItemModKey>, AlfredItemMod>? mods);

  AlfredItem action(dynamic action);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `AlfredItem(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// AlfredItem(...).copyWith(id: 12, name: "My name")
  /// ````
  AlfredItem call({
    String title,
    AlfredItemType type,
    bool valid,
    String? subtitle,
    String? arg,
    String? autocomplete,
    String? uid,
    AlfredItemIcon? icon,
    AlfredItemText? text,
    String? quickLookUrl,
    String? match,
    Map<Set<AlfredItemModKey>, AlfredItemMod>? mods,
    dynamic action,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfAlfredItem.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfAlfredItem.copyWith.fieldName(...)`
class _$AlfredItemCWProxyImpl implements _$AlfredItemCWProxy {
  const _$AlfredItemCWProxyImpl(this._value);

  final AlfredItem _value;

  @override
  AlfredItem title(String title) => this(title: title);

  @override
  AlfredItem type(AlfredItemType type) => this(type: type);

  @override
  AlfredItem valid(bool valid) => this(valid: valid);

  @override
  AlfredItem subtitle(String? subtitle) => this(subtitle: subtitle);

  @override
  AlfredItem arg(String? arg) => this(arg: arg);

  @override
  AlfredItem autocomplete(String? autocomplete) =>
      this(autocomplete: autocomplete);

  @override
  AlfredItem uid(String? uid) => this(uid: uid);

  @override
  AlfredItem icon(AlfredItemIcon? icon) => this(icon: icon);

  @override
  AlfredItem text(AlfredItemText? text) => this(text: text);

  @override
  AlfredItem quickLookUrl(String? quickLookUrl) =>
      this(quickLookUrl: quickLookUrl);

  @override
  AlfredItem match(String? match) => this(match: match);

  @override
  AlfredItem mods(Map<Set<AlfredItemModKey>, AlfredItemMod>? mods) =>
      this(mods: mods);

  @override
  AlfredItem action(dynamic action) => this(action: action);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `AlfredItem(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// AlfredItem(...).copyWith(id: 12, name: "My name")
  /// ````
  AlfredItem call({
    Object? title = const $CopyWithPlaceholder(),
    Object? type = const $CopyWithPlaceholder(),
    Object? valid = const $CopyWithPlaceholder(),
    Object? subtitle = const $CopyWithPlaceholder(),
    Object? arg = const $CopyWithPlaceholder(),
    Object? autocomplete = const $CopyWithPlaceholder(),
    Object? uid = const $CopyWithPlaceholder(),
    Object? icon = const $CopyWithPlaceholder(),
    Object? text = const $CopyWithPlaceholder(),
    Object? quickLookUrl = const $CopyWithPlaceholder(),
    Object? match = const $CopyWithPlaceholder(),
    Object? mods = const $CopyWithPlaceholder(),
    Object? action = const $CopyWithPlaceholder(),
  }) {
    return AlfredItem(
      title: title == const $CopyWithPlaceholder()
          ? _value.title
          // ignore: cast_nullable_to_non_nullable
          : title as String,
      type: type == const $CopyWithPlaceholder()
          ? _value.type
          // ignore: cast_nullable_to_non_nullable
          : type as AlfredItemType,
      valid: valid == const $CopyWithPlaceholder()
          ? _value.valid
          // ignore: cast_nullable_to_non_nullable
          : valid as bool,
      subtitle: subtitle == const $CopyWithPlaceholder()
          ? _value.subtitle
          // ignore: cast_nullable_to_non_nullable
          : subtitle as String?,
      arg: arg == const $CopyWithPlaceholder()
          ? _value.arg
          // ignore: cast_nullable_to_non_nullable
          : arg as String?,
      autocomplete: autocomplete == const $CopyWithPlaceholder()
          ? _value.autocomplete
          // ignore: cast_nullable_to_non_nullable
          : autocomplete as String?,
      uid: uid == const $CopyWithPlaceholder()
          ? _value.uid
          // ignore: cast_nullable_to_non_nullable
          : uid as String?,
      icon: icon == const $CopyWithPlaceholder()
          ? _value.icon
          // ignore: cast_nullable_to_non_nullable
          : icon as AlfredItemIcon?,
      text: text == const $CopyWithPlaceholder()
          ? _value.text
          // ignore: cast_nullable_to_non_nullable
          : text as AlfredItemText?,
      quickLookUrl: quickLookUrl == const $CopyWithPlaceholder()
          ? _value.quickLookUrl
          // ignore: cast_nullable_to_non_nullable
          : quickLookUrl as String?,
      match: match == const $CopyWithPlaceholder()
          ? _value.match
          // ignore: cast_nullable_to_non_nullable
          : match as String?,
      mods: mods == const $CopyWithPlaceholder()
          ? _value.mods
          // ignore: cast_nullable_to_non_nullable
          : mods as Map<Set<AlfredItemModKey>, AlfredItemMod>?,
      action: action == const $CopyWithPlaceholder()
          ? _value.action
          // ignore: cast_nullable_to_non_nullable
          : action as dynamic,
    );
  }
}

extension $AlfredItemCopyWith on AlfredItem {
  /// Returns a callable class that can be used as follows: `instanceOfAlfredItem.copyWith(...)` or like so:`instanceOfAlfredItem.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$AlfredItemCWProxy get copyWith => _$AlfredItemCWProxyImpl(this);
}

// **************************************************************************
// EquatableGenerator
// **************************************************************************

extension _$AlfredItemEquatableAnnotations on AlfredItem {
  List<Object?> get _$props => [
        title,
        type,
        valid,
        subtitle,
        arg,
        autocomplete,
        uid,
        icon,
        text,
        quickLookUrl,
        match,
        action,
      ];
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
    type: $enumDecodeNullable(_$AlfredItemTypeEnumMap, json['type']) ??
        AlfredItemType.Default,
    valid: json['valid'] as bool? ?? false,
    subtitle: json['subtitle'] as String?,
    arg: json['arg'] as String?,
    autocomplete: json['autocomplete'] as String?,
    uid: json['uid'] as String?,
    icon: AlfredItem._iconFromJson(json['icon']),
    text: AlfredItem._textFromJson(json['text']),
    quickLookUrl: json['quicklookurl'] as String?,
    match: json['match'] as String?,
    mods: AlfredItem._modsFromJson(json['mods'] as Map?),
    action: AlfredItem._actionFromJson(json['action']),
  );
}

Map<String, dynamic> _$AlfredItemToJson(AlfredItem instance) =>
    <String, dynamic>{
      'title': instance.title,
      'type': _$AlfredItemTypeEnumMap[instance.type]!,
      'valid': instance.valid,
      if (instance.subtitle case final value?) 'subtitle': value,
      if (instance.arg case final value?) 'arg': value,
      if (instance.autocomplete case final value?) 'autocomplete': value,
      if (instance.uid case final value?) 'uid': value,
      if (instance.icon?.toJson() case final value?) 'icon': value,
      if (instance.text?.toJson() case final value?) 'text': value,
      if (instance.quickLookUrl case final value?) 'quicklookurl': value,
      if (instance.match case final value?) 'match': value,
      if (AlfredItem._modsToJson(instance.mods) case final value?)
        'mods': value,
      if (AlfredItem._actionToJson(instance.action) case final value?)
        'action': value,
    };

const _$AlfredItemTypeEnumMap = {
  AlfredItemType.Default: 'default',
  AlfredItemType.File: 'file',
  AlfredItemType.FileSkipcheck: 'file:skipcheck',
};
