// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'alfred_item_text.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$AlfredItemTextCWProxy {
  AlfredItemText copy(String copy);

  AlfredItemText largeType(String? largeType);

  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored. To update a single field use `AlfredItemText(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// AlfredItemText(...).copyWith(id: 12, name: "My name")
  /// ```
  AlfredItemText call({String copy, String? largeType});
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfAlfredItemText.copyWith(...)` or call `instanceOfAlfredItemText.copyWith.fieldName(value)` for a single field.
class _$AlfredItemTextCWProxyImpl implements _$AlfredItemTextCWProxy {
  const _$AlfredItemTextCWProxyImpl(this._value);

  final AlfredItemText _value;

  @override
  AlfredItemText copy(String copy) => call(copy: copy);

  @override
  AlfredItemText largeType(String? largeType) => call(largeType: largeType);

  @override
  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored. To update a single field use `AlfredItemText(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// AlfredItemText(...).copyWith(id: 12, name: "My name")
  /// ```
  AlfredItemText call({
    Object? copy = const $CopyWithPlaceholder(),
    Object? largeType = const $CopyWithPlaceholder(),
  }) {
    return AlfredItemText(
      copy: copy == const $CopyWithPlaceholder() || copy == null
          ? _value.copy
          // ignore: cast_nullable_to_non_nullable
          : copy as String,
      largeType: largeType == const $CopyWithPlaceholder()
          ? _value.largeType
          // ignore: cast_nullable_to_non_nullable
          : largeType as String?,
    );
  }
}

extension $AlfredItemTextCopyWith on AlfredItemText {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfAlfredItemText.copyWith(...)` or `instanceOfAlfredItemText.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$AlfredItemTextCWProxy get copyWith => _$AlfredItemTextCWProxyImpl(this);
}

// **************************************************************************
// EquatableGenerator
// **************************************************************************

extension _$AlfredItemTextEquatableAnnotations on AlfredItemText {
  List<Object?> get _$props => [copy, largeType];
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AlfredItemText _$AlfredItemTextFromJson(Map<String, dynamic> json) {
  $checkKeys(json, requiredKeys: const ['copy']);
  return AlfredItemText(
    copy: json['copy'] as String,
    largeType: json['largetype'] as String?,
  );
}

Map<String, dynamic> _$AlfredItemTextToJson(AlfredItemText instance) =>
    <String, dynamic>{'copy': instance.copy, 'largetype': ?instance.largeType};
