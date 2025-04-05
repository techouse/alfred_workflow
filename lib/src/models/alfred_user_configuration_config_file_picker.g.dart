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

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `AlfredUserConfigurationConfigFilePicker(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// AlfredUserConfigurationConfigFilePicker(...).copyWith(id: 12, name: "My name")
  /// ````
  AlfredUserConfigurationConfigFilePicker call({
    String defaultValue,
    bool required,
    int filterMode,
    String? value,
    String? placeholder,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfAlfredUserConfigurationConfigFilePicker.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfAlfredUserConfigurationConfigFilePicker.copyWith.fieldName(...)`
class _$AlfredUserConfigurationConfigFilePickerCWProxyImpl
    implements _$AlfredUserConfigurationConfigFilePickerCWProxy {
  const _$AlfredUserConfigurationConfigFilePickerCWProxyImpl(this._value);

  final AlfredUserConfigurationConfigFilePicker _value;

  @override
  AlfredUserConfigurationConfigFilePicker defaultValue(String defaultValue) =>
      this(defaultValue: defaultValue);

  @override
  AlfredUserConfigurationConfigFilePicker required(bool required) =>
      this(required: required);

  @override
  AlfredUserConfigurationConfigFilePicker filterMode(int filterMode) =>
      this(filterMode: filterMode);

  @override
  AlfredUserConfigurationConfigFilePicker value(String? value) =>
      this(value: value);

  @override
  AlfredUserConfigurationConfigFilePicker placeholder(String? placeholder) =>
      this(placeholder: placeholder);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `AlfredUserConfigurationConfigFilePicker(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// AlfredUserConfigurationConfigFilePicker(...).copyWith(id: 12, name: "My name")
  /// ````
  AlfredUserConfigurationConfigFilePicker call({
    Object? defaultValue = const $CopyWithPlaceholder(),
    Object? required = const $CopyWithPlaceholder(),
    Object? filterMode = const $CopyWithPlaceholder(),
    Object? value = const $CopyWithPlaceholder(),
    Object? placeholder = const $CopyWithPlaceholder(),
  }) {
    return AlfredUserConfigurationConfigFilePicker(
      defaultValue: defaultValue == const $CopyWithPlaceholder()
          ? _value.defaultValue
          // ignore: cast_nullable_to_non_nullable
          : defaultValue as String,
      required: required == const $CopyWithPlaceholder()
          ? _value.required
          // ignore: cast_nullable_to_non_nullable
          : required as bool,
      filterMode: filterMode == const $CopyWithPlaceholder()
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
  /// Returns a callable class that can be used as follows: `instanceOfAlfredUserConfigurationConfigFilePicker.copyWith(...)` or like so:`instanceOfAlfredUserConfigurationConfigFilePicker.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$AlfredUserConfigurationConfigFilePickerCWProxy get copyWith =>
      _$AlfredUserConfigurationConfigFilePickerCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AlfredUserConfigurationConfigFilePicker
    _$AlfredUserConfigurationConfigFilePickerFromJson(
            Map<String, dynamic> json) =>
        AlfredUserConfigurationConfigFilePicker(
          defaultValue: AlfredUserConfigurationConfig.fromJsonDefaultValue(
              json, 'default') as String,
          required: json['required'] as bool,
          filterMode: (json['filtermode'] as num).toInt(),
          placeholder: json['placeholder'] as String?,
        );
