// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'alfred_item_icon.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$AlfredItemIconCWProxy {
  AlfredItemIcon path(String path);

  AlfredItemIcon type(AlfredItemIconType? type);

  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored. To update a single field use `AlfredItemIcon(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// AlfredItemIcon(...).copyWith(id: 12, name: "My name")
  /// ```
  AlfredItemIcon call({String path, AlfredItemIconType? type});
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfAlfredItemIcon.copyWith(...)` or call `instanceOfAlfredItemIcon.copyWith.fieldName(value)` for a single field.
class _$AlfredItemIconCWProxyImpl implements _$AlfredItemIconCWProxy {
  const _$AlfredItemIconCWProxyImpl(this._value);

  final AlfredItemIcon _value;

  @override
  AlfredItemIcon path(String path) => call(path: path);

  @override
  AlfredItemIcon type(AlfredItemIconType? type) => call(type: type);

  @override
  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored. To update a single field use `AlfredItemIcon(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// AlfredItemIcon(...).copyWith(id: 12, name: "My name")
  /// ```
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
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfAlfredItemIcon.copyWith(...)` or `instanceOfAlfredItemIcon.copyWith.fieldName(...)`.
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
  $checkKeys(json, requiredKeys: const ['path']);
  return AlfredItemIcon(
    path: json['path'] as String,
    type: $enumDecodeNullable(_$AlfredItemIconTypeEnumMap, json['type']),
  );
}

Map<String, dynamic> _$AlfredItemIconToJson(AlfredItemIcon instance) =>
    <String, dynamic>{
      'path': instance.path,
      'type': ?_$AlfredItemIconTypeEnumMap[instance.type],
    };

const _$AlfredItemIconTypeEnumMap = {
  AlfredItemIconType.fileicon: 'fileicon',
  AlfredItemIconType.filetype: 'filetype',
};
