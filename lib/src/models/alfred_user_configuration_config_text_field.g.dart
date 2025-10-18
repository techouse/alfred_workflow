// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'alfred_user_configuration_config_text_field.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$AlfredUserConfigurationConfigTextFieldCWProxy {
  AlfredUserConfigurationConfigTextField defaultValue(String defaultValue);

  AlfredUserConfigurationConfigTextField required(bool required);

  AlfredUserConfigurationConfigTextField trim(bool trim);

  AlfredUserConfigurationConfigTextField value(String? value);

  AlfredUserConfigurationConfigTextField placeholder(String? placeholder);

  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored. To update a single field use `AlfredUserConfigurationConfigTextField(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// AlfredUserConfigurationConfigTextField(...).copyWith(id: 12, name: "My name")
  /// ```
  AlfredUserConfigurationConfigTextField call({
    String defaultValue,
    bool required,
    bool trim,
    String? value,
    String? placeholder,
  });
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfAlfredUserConfigurationConfigTextField.copyWith(...)` or call `instanceOfAlfredUserConfigurationConfigTextField.copyWith.fieldName(value)` for a single field.
class _$AlfredUserConfigurationConfigTextFieldCWProxyImpl
    implements _$AlfredUserConfigurationConfigTextFieldCWProxy {
  const _$AlfredUserConfigurationConfigTextFieldCWProxyImpl(this._value);

  final AlfredUserConfigurationConfigTextField _value;

  @override
  AlfredUserConfigurationConfigTextField defaultValue(String defaultValue) =>
      call(defaultValue: defaultValue);

  @override
  AlfredUserConfigurationConfigTextField required(bool required) =>
      call(required: required);

  @override
  AlfredUserConfigurationConfigTextField trim(bool trim) => call(trim: trim);

  @override
  AlfredUserConfigurationConfigTextField value(String? value) =>
      call(value: value);

  @override
  AlfredUserConfigurationConfigTextField placeholder(String? placeholder) =>
      call(placeholder: placeholder);

  @override
  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored. To update a single field use `AlfredUserConfigurationConfigTextField(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// AlfredUserConfigurationConfigTextField(...).copyWith(id: 12, name: "My name")
  /// ```
  AlfredUserConfigurationConfigTextField call({
    Object? defaultValue = const $CopyWithPlaceholder(),
    Object? required = const $CopyWithPlaceholder(),
    Object? trim = const $CopyWithPlaceholder(),
    Object? value = const $CopyWithPlaceholder(),
    Object? placeholder = const $CopyWithPlaceholder(),
  }) {
    return AlfredUserConfigurationConfigTextField(
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
      value: value == const $CopyWithPlaceholder()
          ? _value.value
          // ignore: cast_nullable_to_non_nullable
          : value as String?,
      placeholder: placeholder == const $CopyWithPlaceholder()
          ? _value.placeholder
          // ignore: cast_nullable_to_non_nullable
          : placeholder as String?,
    );
  }
}

extension $AlfredUserConfigurationConfigTextFieldCopyWith
    on AlfredUserConfigurationConfigTextField {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfAlfredUserConfigurationConfigTextField.copyWith(...)` or `instanceOfAlfredUserConfigurationConfigTextField.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$AlfredUserConfigurationConfigTextFieldCWProxy get copyWith =>
      _$AlfredUserConfigurationConfigTextFieldCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AlfredUserConfigurationConfigTextField
_$AlfredUserConfigurationConfigTextFieldFromJson(Map<String, dynamic> json) =>
    AlfredUserConfigurationConfigTextField(
      defaultValue:
          AlfredUserConfigurationConfig.fromJsonDefaultValue(json, 'default')
              as String,
      required: json['required'] as bool,
      trim: json['trim'] as bool,
      placeholder: json['placeholder'] as String?,
    );
