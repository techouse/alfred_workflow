// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'alfred_user_configuration_config_text_area.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$AlfredUserConfigurationConfigTextAreaCWProxy {
  AlfredUserConfigurationConfigTextArea defaultValue(String defaultValue);

  AlfredUserConfigurationConfigTextArea required(bool required);

  AlfredUserConfigurationConfigTextArea trim(bool trim);

  AlfredUserConfigurationConfigTextArea verticalSize(int verticalSize);

  AlfredUserConfigurationConfigTextArea value(String? value);

  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored. To update a single field use `AlfredUserConfigurationConfigTextArea(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// AlfredUserConfigurationConfigTextArea(...).copyWith(id: 12, name: "My name")
  /// ```
  AlfredUserConfigurationConfigTextArea call({
    String defaultValue,
    bool required,
    bool trim,
    int verticalSize,
    String? value,
  });
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfAlfredUserConfigurationConfigTextArea.copyWith(...)` or call `instanceOfAlfredUserConfigurationConfigTextArea.copyWith.fieldName(value)` for a single field.
class _$AlfredUserConfigurationConfigTextAreaCWProxyImpl
    implements _$AlfredUserConfigurationConfigTextAreaCWProxy {
  const _$AlfredUserConfigurationConfigTextAreaCWProxyImpl(this._value);

  final AlfredUserConfigurationConfigTextArea _value;

  @override
  AlfredUserConfigurationConfigTextArea defaultValue(String defaultValue) =>
      call(defaultValue: defaultValue);

  @override
  AlfredUserConfigurationConfigTextArea required(bool required) =>
      call(required: required);

  @override
  AlfredUserConfigurationConfigTextArea trim(bool trim) => call(trim: trim);

  @override
  AlfredUserConfigurationConfigTextArea verticalSize(int verticalSize) =>
      call(verticalSize: verticalSize);

  @override
  AlfredUserConfigurationConfigTextArea value(String? value) =>
      call(value: value);

  @override
  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored. To update a single field use `AlfredUserConfigurationConfigTextArea(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// AlfredUserConfigurationConfigTextArea(...).copyWith(id: 12, name: "My name")
  /// ```
  AlfredUserConfigurationConfigTextArea call({
    Object? defaultValue = const $CopyWithPlaceholder(),
    Object? required = const $CopyWithPlaceholder(),
    Object? trim = const $CopyWithPlaceholder(),
    Object? verticalSize = const $CopyWithPlaceholder(),
    Object? value = const $CopyWithPlaceholder(),
  }) {
    return AlfredUserConfigurationConfigTextArea(
      defaultValue:
          defaultValue == const $CopyWithPlaceholder() || defaultValue == null
          ? _value.defaultValue
          // ignore: cast_nullable_to_non_nullable
          : defaultValue as String,
      required: required == const $CopyWithPlaceholder() || required == null
          ? _value.required
          // ignore: cast_nullable_to_non_nullable
          : required as bool,
      trim: trim == const $CopyWithPlaceholder() || trim == null
          ? _value.trim
          // ignore: cast_nullable_to_non_nullable
          : trim as bool,
      verticalSize:
          verticalSize == const $CopyWithPlaceholder() || verticalSize == null
          ? _value.verticalSize
          // ignore: cast_nullable_to_non_nullable
          : verticalSize as int,
      value: value == const $CopyWithPlaceholder()
          ? _value.value
          // ignore: cast_nullable_to_non_nullable
          : value as String?,
    );
  }
}

extension $AlfredUserConfigurationConfigTextAreaCopyWith
    on AlfredUserConfigurationConfigTextArea {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfAlfredUserConfigurationConfigTextArea.copyWith(...)` or `instanceOfAlfredUserConfigurationConfigTextArea.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$AlfredUserConfigurationConfigTextAreaCWProxy get copyWith =>
      _$AlfredUserConfigurationConfigTextAreaCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AlfredUserConfigurationConfigTextArea
_$AlfredUserConfigurationConfigTextAreaFromJson(Map<String, dynamic> json) =>
    AlfredUserConfigurationConfigTextArea(
      defaultValue:
          AlfredUserConfigurationConfig.fromJsonDefaultValue(json, 'default')
              as String,
      required: json['required'] as bool,
      trim: json['trim'] as bool,
      verticalSize: (json['verticalsize'] as num).toInt(),
    );
