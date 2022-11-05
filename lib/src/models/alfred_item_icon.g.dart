// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'alfred_item_icon.dart';

// **************************************************************************
// AutoequalGenerator
// **************************************************************************

mixin _$AlfredItemIconAutoequalMixin on EquatableMixin {
  @override
  List<Object?> get props =>
      _$AlfredItemIconAutoequal(this as AlfredItemIcon)._$props;
}

extension _$AlfredItemIconAutoequal on AlfredItemIcon {
  List<Object?> get _$props => [path, type];
}

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
    String? path,
    AlfredItemIconType? type,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfAlfredItemIcon.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfAlfredItemIcon.copyWith.fieldName(...)`
class _$AlfredItemIconCWProxyImpl implements _$AlfredItemIconCWProxy {
  final AlfredItemIcon _value;

  const _$AlfredItemIconCWProxyImpl(this._value);

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
      path: path == const $CopyWithPlaceholder() || path == null
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
