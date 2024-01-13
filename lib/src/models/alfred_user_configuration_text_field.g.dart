// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'alfred_user_configuration_text_field.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$AlfredUserConfigurationTextFieldCWProxy {
  AlfredUserConfigurationTextField type(AlfredUserConfigurationType type);

  AlfredUserConfigurationTextField variable(String variable);

  AlfredUserConfigurationTextField config(
      AlfredUserConfigurationConfigTextField config);

  AlfredUserConfigurationTextField description(String? description);

  AlfredUserConfigurationTextField label(String? label);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `AlfredUserConfigurationTextField(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// AlfredUserConfigurationTextField(...).copyWith(id: 12, name: "My name")
  /// ````
  AlfredUserConfigurationTextField call({
    AlfredUserConfigurationType? type,
    String? variable,
    AlfredUserConfigurationConfigTextField? config,
    String? description,
    String? label,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfAlfredUserConfigurationTextField.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfAlfredUserConfigurationTextField.copyWith.fieldName(...)`
class _$AlfredUserConfigurationTextFieldCWProxyImpl
    implements _$AlfredUserConfigurationTextFieldCWProxy {
  const _$AlfredUserConfigurationTextFieldCWProxyImpl(this._value);

  final AlfredUserConfigurationTextField _value;

  @override
  AlfredUserConfigurationTextField type(AlfredUserConfigurationType type) =>
      this(type: type);

  @override
  AlfredUserConfigurationTextField variable(String variable) =>
      this(variable: variable);

  @override
  AlfredUserConfigurationTextField config(
          AlfredUserConfigurationConfigTextField config) =>
      this(config: config);

  @override
  AlfredUserConfigurationTextField description(String? description) =>
      this(description: description);

  @override
  AlfredUserConfigurationTextField label(String? label) => this(label: label);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `AlfredUserConfigurationTextField(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// AlfredUserConfigurationTextField(...).copyWith(id: 12, name: "My name")
  /// ````
  AlfredUserConfigurationTextField call({
    Object? type = const $CopyWithPlaceholder(),
    Object? variable = const $CopyWithPlaceholder(),
    Object? config = const $CopyWithPlaceholder(),
    Object? description = const $CopyWithPlaceholder(),
    Object? label = const $CopyWithPlaceholder(),
  }) {
    return AlfredUserConfigurationTextField(
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
          : config as AlfredUserConfigurationConfigTextField,
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

extension $AlfredUserConfigurationTextFieldCopyWith
    on AlfredUserConfigurationTextField {
  /// Returns a callable class that can be used as follows: `instanceOfAlfredUserConfigurationTextField.copyWith(...)` or like so:`instanceOfAlfredUserConfigurationTextField.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$AlfredUserConfigurationTextFieldCWProxy get copyWith =>
      _$AlfredUserConfigurationTextFieldCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AlfredUserConfigurationTextField _$AlfredUserConfigurationTextFieldFromJson(
        Map<String, dynamic> json) =>
    AlfredUserConfigurationTextField(
      type: $enumDecode(_$AlfredUserConfigurationTypeEnumMap, json['type']),
      variable: json['variable'] as String,
      config: AlfredUserConfigurationTextField._configFromJson(
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
};
