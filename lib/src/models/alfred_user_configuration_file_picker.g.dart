// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'alfred_user_configuration_file_picker.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$AlfredUserConfigurationFilePickerCWProxy {
  AlfredUserConfigurationFilePicker type(AlfredUserConfigurationType type);

  AlfredUserConfigurationFilePicker variable(String variable);

  AlfredUserConfigurationFilePicker config(
      AlfredUserConfigurationConfigFilePicker config);

  AlfredUserConfigurationFilePicker description(String? description);

  AlfredUserConfigurationFilePicker label(String? label);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `AlfredUserConfigurationFilePicker(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// AlfredUserConfigurationFilePicker(...).copyWith(id: 12, name: "My name")
  /// ````
  AlfredUserConfigurationFilePicker call({
    AlfredUserConfigurationType type,
    String variable,
    AlfredUserConfigurationConfigFilePicker config,
    String? description,
    String? label,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfAlfredUserConfigurationFilePicker.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfAlfredUserConfigurationFilePicker.copyWith.fieldName(...)`
class _$AlfredUserConfigurationFilePickerCWProxyImpl
    implements _$AlfredUserConfigurationFilePickerCWProxy {
  const _$AlfredUserConfigurationFilePickerCWProxyImpl(this._value);

  final AlfredUserConfigurationFilePicker _value;

  @override
  AlfredUserConfigurationFilePicker type(AlfredUserConfigurationType type) =>
      this(type: type);

  @override
  AlfredUserConfigurationFilePicker variable(String variable) =>
      this(variable: variable);

  @override
  AlfredUserConfigurationFilePicker config(
          AlfredUserConfigurationConfigFilePicker config) =>
      this(config: config);

  @override
  AlfredUserConfigurationFilePicker description(String? description) =>
      this(description: description);

  @override
  AlfredUserConfigurationFilePicker label(String? label) => this(label: label);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `AlfredUserConfigurationFilePicker(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// AlfredUserConfigurationFilePicker(...).copyWith(id: 12, name: "My name")
  /// ````
  AlfredUserConfigurationFilePicker call({
    Object? type = const $CopyWithPlaceholder(),
    Object? variable = const $CopyWithPlaceholder(),
    Object? config = const $CopyWithPlaceholder(),
    Object? description = const $CopyWithPlaceholder(),
    Object? label = const $CopyWithPlaceholder(),
  }) {
    return AlfredUserConfigurationFilePicker(
      type: type == const $CopyWithPlaceholder()
          ? _value.type
          // ignore: cast_nullable_to_non_nullable
          : type as AlfredUserConfigurationType,
      variable: variable == const $CopyWithPlaceholder()
          ? _value.variable
          // ignore: cast_nullable_to_non_nullable
          : variable as String,
      config: config == const $CopyWithPlaceholder()
          ? _value.config
          // ignore: cast_nullable_to_non_nullable
          : config as AlfredUserConfigurationConfigFilePicker,
      description: description == const $CopyWithPlaceholder()
          ? _value.description
          // ignore: cast_nullable_to_non_nullable
          : description as String?,
      label: label == const $CopyWithPlaceholder()
          ? _value.label
          // ignore: cast_nullable_to_non_nullable
          : label as String?,
    );
  }
}

extension $AlfredUserConfigurationFilePickerCopyWith
    on AlfredUserConfigurationFilePicker {
  /// Returns a callable class that can be used as follows: `instanceOfAlfredUserConfigurationFilePicker.copyWith(...)` or like so:`instanceOfAlfredUserConfigurationFilePicker.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$AlfredUserConfigurationFilePickerCWProxy get copyWith =>
      _$AlfredUserConfigurationFilePickerCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AlfredUserConfigurationFilePicker _$AlfredUserConfigurationFilePickerFromJson(
        Map<String, dynamic> json) =>
    AlfredUserConfigurationFilePicker(
      type: $enumDecode(_$AlfredUserConfigurationTypeEnumMap, json['type']),
      variable: json['variable'] as String,
      config: AlfredUserConfigurationFilePicker._configFromJson(
          json['config'] as Map),
      description: json['description'] as String?,
      label: json['label'] as String?,
    );

const _$AlfredUserConfigurationTypeEnumMap = {
  AlfredUserConfigurationType.textField: 'textfield',
  AlfredUserConfigurationType.textArea: 'textarea',
  AlfredUserConfigurationType.checkBox: 'checkbox',
  AlfredUserConfigurationType.select: 'popupbutton',
  AlfredUserConfigurationType.filePicker: 'filepicker',
  AlfredUserConfigurationType.slider: 'slider',
};
