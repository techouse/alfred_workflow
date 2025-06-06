// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'alfred_item_icon.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$AlfredItemIconCWProxy {
  AlfredItemIcon path(String path);

  AlfredItemIcon type(AlfredItemIconType? type);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `AlfredItemIcon(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// AlfredItemIcon(...).copyWith(id: 12, name: "My name")
  /// ````
  AlfredItemIcon call({
    String path,
    AlfredItemIconType? type,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfAlfredItemIcon.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfAlfredItemIcon.copyWith.fieldName(...)`
class _$AlfredItemIconCWProxyImpl implements _$AlfredItemIconCWProxy {
  const _$AlfredItemIconCWProxyImpl(this._value);

  final AlfredItemIcon _value;

  @override
  AlfredItemIcon path(String path) => this(path: path);

  @override
  AlfredItemIcon type(AlfredItemIconType? type) => this(type: type);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `AlfredItemIcon(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// AlfredItemIcon(...).copyWith(id: 12, name: "My name")
  /// ````
  AlfredItemIcon call({
    Object? path = const $CopyWithPlaceholder(),
    Object? type = const $CopyWithPlaceholder(),
  }) {
    return AlfredItemIcon(
      path: path == const $CopyWithPlaceholder()
          ? _value.path
          // ignore: cast_nullable_to_non_nullable
          : path as String,
      type: type == const $CopyWithPlaceholder()
          ? _value.type
          // ignore: cast_nullable_to_non_nullable
          : type as AlfredItemIconType?,
    );
  }
}

extension $AlfredItemIconCopyWith on AlfredItemIcon {
  /// Returns a callable class that can be used as follows: `instanceOfAlfredItemIcon.copyWith(...)` or like so:`instanceOfAlfredItemIcon.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$AlfredItemIconCWProxy get copyWith => _$AlfredItemIconCWProxyImpl(this);
}

// **************************************************************************
// EquatableGenerator
// **************************************************************************

extension _$AlfredItemIconEquatableAnnotations on AlfredItemIcon {
  List<Object?> get _$props => [path, type];
}

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

Map<String, dynamic> _$AlfredItemIconToJson(AlfredItemIcon instance) =>
    <String, dynamic>{
      'path': instance.path,
      if (_$AlfredItemIconTypeEnumMap[instance.type] case final value?)
        'type': value,
    };

const _$AlfredItemIconTypeEnumMap = {
  AlfredItemIconType.fileicon: 'fileicon',
  AlfredItemIconType.filetype: 'filetype',
};
