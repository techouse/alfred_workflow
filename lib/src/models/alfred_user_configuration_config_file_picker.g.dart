// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'alfred_user_configuration_config_file_picker.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$AlfredUserConfigurationConfigFilePickerCWProxy {
  AlfredUserConfigurationConfigFilePicker defaultValue(String defaultValue);

  AlfredUserConfigurationConfigFilePicker required(bool required);

  AlfredUserConfigurationConfigFilePicker filterMode(int filterMode);

  AlfredUserConfigurationConfigFilePicker value(String? value);

  AlfredUserConfigurationConfigFilePicker placeholder(String? placeholder);

  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored. To update a single field use `AlfredUserConfigurationConfigFilePicker(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// AlfredUserConfigurationConfigFilePicker(...).copyWith(id: 12, name: "My name")
  /// ```
  AlfredUserConfigurationConfigFilePicker call({
    String defaultValue,
    bool required,
    int filterMode,
    String? value,
    String? placeholder,
  });
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfAlfredUserConfigurationConfigFilePicker.copyWith(...)` or call `instanceOfAlfredUserConfigurationConfigFilePicker.copyWith.fieldName(value)` for a single field.
class _$AlfredUserConfigurationConfigFilePickerCWProxyImpl
    implements _$AlfredUserConfigurationConfigFilePickerCWProxy {
  const _$AlfredUserConfigurationConfigFilePickerCWProxyImpl(this._value);

  final AlfredUserConfigurationConfigFilePicker _value;

  @override
  AlfredUserConfigurationConfigFilePicker defaultValue(String defaultValue) =>
      call(defaultValue: defaultValue);

  @override
  AlfredUserConfigurationConfigFilePicker required(bool required) =>
      call(required: required);

  @override
  AlfredUserConfigurationConfigFilePicker filterMode(int filterMode) =>
      call(filterMode: filterMode);

  @override
  AlfredUserConfigurationConfigFilePicker value(String? value) =>
      call(value: value);

  @override
  AlfredUserConfigurationConfigFilePicker placeholder(String? placeholder) =>
      call(placeholder: placeholder);

  @override
  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored. To update a single field use `AlfredUserConfigurationConfigFilePicker(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// AlfredUserConfigurationConfigFilePicker(...).copyWith(id: 12, name: "My name")
  /// ```
  AlfredUserConfigurationConfigFilePicker call({
    Object? defaultValue = const $CopyWithPlaceholder(),
    Object? required = const $CopyWithPlaceholder(),
    Object? filterMode = const $CopyWithPlaceholder(),
    Object? value = const $CopyWithPlaceholder(),
    Object? placeholder = const $CopyWithPlaceholder(),
  }) {
    return AlfredUserConfigurationConfigFilePicker(
      defaultValue:
          defaultValue == const $CopyWithPlaceholder() || defaultValue == null
          ? _value.defaultValue
          // ignore: cast_nullable_to_non_nullable
          : defaultValue as String,
      required: required == const $CopyWithPlaceholder() || required == null
          ? _value.required
          // ignore: cast_nullable_to_non_nullable
          : required as bool,
      filterMode:
          filterMode == const $CopyWithPlaceholder() || filterMode == null
          ? _value.filterMode
          // ignore: cast_nullable_to_non_nullable
          : filterMode as int,
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

extension $AlfredUserConfigurationConfigFilePickerCopyWith
    on AlfredUserConfigurationConfigFilePicker {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfAlfredUserConfigurationConfigFilePicker.copyWith(...)` or `instanceOfAlfredUserConfigurationConfigFilePicker.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$AlfredUserConfigurationConfigFilePickerCWProxy get copyWith =>
      _$AlfredUserConfigurationConfigFilePickerCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AlfredUserConfigurationConfigFilePicker
_$AlfredUserConfigurationConfigFilePickerFromJson(Map<String, dynamic> json) =>
    AlfredUserConfigurationConfigFilePicker(
      defaultValue:
          AlfredUserConfigurationConfig.fromJsonDefaultValue(json, 'default')
              as String,
      required: json['required'] as bool,
      filterMode: (json['filtermode'] as num).toInt(),
      placeholder: json['placeholder'] as String?,
    );
