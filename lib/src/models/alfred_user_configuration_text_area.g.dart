// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'alfred_user_configuration_text_area.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$AlfredUserConfigurationTextAreaCWProxy {
  AlfredUserConfigurationTextArea type(AlfredUserConfigurationType type);

  AlfredUserConfigurationTextArea variable(String variable);

  AlfredUserConfigurationTextArea config(
      AlfredUserConfigurationConfigTextArea config);

  AlfredUserConfigurationTextArea description(String? description);

  AlfredUserConfigurationTextArea label(String? label);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `AlfredUserConfigurationTextArea(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// AlfredUserConfigurationTextArea(...).copyWith(id: 12, name: "My name")
  /// ````
  AlfredUserConfigurationTextArea call({
    AlfredUserConfigurationType? type,
    String? variable,
    AlfredUserConfigurationConfigTextArea? config,
    String? description,
    String? label,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfAlfredUserConfigurationTextArea.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfAlfredUserConfigurationTextArea.copyWith.fieldName(...)`
class _$AlfredUserConfigurationTextAreaCWProxyImpl
    implements _$AlfredUserConfigurationTextAreaCWProxy {
  const _$AlfredUserConfigurationTextAreaCWProxyImpl(this._value);

  final AlfredUserConfigurationTextArea _value;

  @override
  AlfredUserConfigurationTextArea type(AlfredUserConfigurationType type) =>
      this(type: type);

  @override
  AlfredUserConfigurationTextArea variable(String variable) =>
      this(variable: variable);

  @override
  AlfredUserConfigurationTextArea config(
          AlfredUserConfigurationConfigTextArea config) =>
      this(config: config);

  @override
  AlfredUserConfigurationTextArea description(String? description) =>
      this(description: description);

  @override
  AlfredUserConfigurationTextArea label(String? label) => this(label: label);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `AlfredUserConfigurationTextArea(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// AlfredUserConfigurationTextArea(...).copyWith(id: 12, name: "My name")
  /// ````
  AlfredUserConfigurationTextArea call({
    Object? type = const $CopyWithPlaceholder(),
    Object? variable = const $CopyWithPlaceholder(),
    Object? config = const $CopyWithPlaceholder(),
    Object? description = const $CopyWithPlaceholder(),
    Object? label = const $CopyWithPlaceholder(),
  }) {
    return AlfredUserConfigurationTextArea(
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
          : config as AlfredUserConfigurationConfigTextArea,
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

extension $AlfredUserConfigurationTextAreaCopyWith
    on AlfredUserConfigurationTextArea {
  /// Returns a callable class that can be used as follows: `instanceOfAlfredUserConfigurationTextArea.copyWith(...)` or like so:`instanceOfAlfredUserConfigurationTextArea.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$AlfredUserConfigurationTextAreaCWProxy get copyWith =>
      _$AlfredUserConfigurationTextAreaCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AlfredUserConfigurationTextArea _$AlfredUserConfigurationTextAreaFromJson(
        Map<String, dynamic> json) =>
    AlfredUserConfigurationTextArea(
      type: $enumDecode(_$AlfredUserConfigurationTypeEnumMap, json['type']),
      variable: json['variable'] as String,
      config: AlfredUserConfigurationTextArea._configFromJson(
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
