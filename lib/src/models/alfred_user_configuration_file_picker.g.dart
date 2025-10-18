// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'alfred_user_configuration_file_picker.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$AlfredUserConfigurationFilePickerCWProxy {
  AlfredUserConfigurationFilePicker type(AlfredUserConfigurationType type);

  AlfredUserConfigurationFilePicker variable(String variable);

  AlfredUserConfigurationFilePicker config(
    AlfredUserConfigurationConfigFilePicker config,
  );

  AlfredUserConfigurationFilePicker description(String? description);

  AlfredUserConfigurationFilePicker label(String? label);

  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored. To update a single field use `AlfredUserConfigurationFilePicker(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// AlfredUserConfigurationFilePicker(...).copyWith(id: 12, name: "My name")
  /// ```
  AlfredUserConfigurationFilePicker call({
    AlfredUserConfigurationType type,
    String variable,
    AlfredUserConfigurationConfigFilePicker config,
    String? description,
    String? label,
  });
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfAlfredUserConfigurationFilePicker.copyWith(...)` or call `instanceOfAlfredUserConfigurationFilePicker.copyWith.fieldName(value)` for a single field.
class _$AlfredUserConfigurationFilePickerCWProxyImpl
    implements _$AlfredUserConfigurationFilePickerCWProxy {
  const _$AlfredUserConfigurationFilePickerCWProxyImpl(this._value);

  final AlfredUserConfigurationFilePicker _value;

  @override
  AlfredUserConfigurationFilePicker type(AlfredUserConfigurationType type) =>
      call(type: type);

  @override
  AlfredUserConfigurationFilePicker variable(String variable) =>
      call(variable: variable);

  @override
  AlfredUserConfigurationFilePicker config(
    AlfredUserConfigurationConfigFilePicker config,
  ) => call(config: config);

  @override
  AlfredUserConfigurationFilePicker description(String? description) =>
      call(description: description);

  @override
  AlfredUserConfigurationFilePicker label(String? label) => call(label: label);

  @override
  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored. To update a single field use `AlfredUserConfigurationFilePicker(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// AlfredUserConfigurationFilePicker(...).copyWith(id: 12, name: "My name")
  /// ```
  AlfredUserConfigurationFilePicker call({
    Object? type = const $CopyWithPlaceholder(),
    Object? variable = const $CopyWithPlaceholder(),
    Object? config = const $CopyWithPlaceholder(),
    Object? description = const $CopyWithPlaceholder(),
    Object? label = const $CopyWithPlaceholder(),
  }) {
    return AlfredUserConfigurationFilePicker(
      type: type == const $CopyWithPlaceholder() || type == null
          ? _value.type
          // ignore: cast_nullable_to_non_nullable
          : type as AlfredUserConfigurationType,
      variable: variable == const $CopyWithPlaceholder() || variable == null
          ? _value.variable
          // ignore: cast_nullable_to_non_nullable
          : variable as String,
      config: config == const $CopyWithPlaceholder() || config == null
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
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfAlfredUserConfigurationFilePicker.copyWith(...)` or `instanceOfAlfredUserConfigurationFilePicker.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$AlfredUserConfigurationFilePickerCWProxy get copyWith =>
      _$AlfredUserConfigurationFilePickerCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AlfredUserConfigurationFilePicker _$AlfredUserConfigurationFilePickerFromJson(
  Map<String, dynamic> json,
) => AlfredUserConfigurationFilePicker(
  type: $enumDecode(_$AlfredUserConfigurationTypeEnumMap, json['type']),
  variable: json['variable'] as String,
  config: AlfredUserConfigurationFilePicker._configFromJson(
    json['config'] as Map,
  ),
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
