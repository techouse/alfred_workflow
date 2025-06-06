// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'alfred_user_configuration_number_slider.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$AlfredUserConfigurationNumberSliderCWProxy {
  AlfredUserConfigurationNumberSlider type(AlfredUserConfigurationType type);

  AlfredUserConfigurationNumberSlider variable(String variable);

  AlfredUserConfigurationNumberSlider config(
      AlfredUserConfigurationConfigNumberSlider config);

  AlfredUserConfigurationNumberSlider description(String? description);

  AlfredUserConfigurationNumberSlider label(String? label);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `AlfredUserConfigurationNumberSlider(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// AlfredUserConfigurationNumberSlider(...).copyWith(id: 12, name: "My name")
  /// ````
  AlfredUserConfigurationNumberSlider call({
    AlfredUserConfigurationType type,
    String variable,
    AlfredUserConfigurationConfigNumberSlider config,
    String? description,
    String? label,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfAlfredUserConfigurationNumberSlider.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfAlfredUserConfigurationNumberSlider.copyWith.fieldName(...)`
class _$AlfredUserConfigurationNumberSliderCWProxyImpl
    implements _$AlfredUserConfigurationNumberSliderCWProxy {
  const _$AlfredUserConfigurationNumberSliderCWProxyImpl(this._value);

  final AlfredUserConfigurationNumberSlider _value;

  @override
  AlfredUserConfigurationNumberSlider type(AlfredUserConfigurationType type) =>
      this(type: type);

  @override
  AlfredUserConfigurationNumberSlider variable(String variable) =>
      this(variable: variable);

  @override
  AlfredUserConfigurationNumberSlider config(
          AlfredUserConfigurationConfigNumberSlider config) =>
      this(config: config);

  @override
  AlfredUserConfigurationNumberSlider description(String? description) =>
      this(description: description);

  @override
  AlfredUserConfigurationNumberSlider label(String? label) =>
      this(label: label);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `AlfredUserConfigurationNumberSlider(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// AlfredUserConfigurationNumberSlider(...).copyWith(id: 12, name: "My name")
  /// ````
  AlfredUserConfigurationNumberSlider call({
    Object? type = const $CopyWithPlaceholder(),
    Object? variable = const $CopyWithPlaceholder(),
    Object? config = const $CopyWithPlaceholder(),
    Object? description = const $CopyWithPlaceholder(),
    Object? label = const $CopyWithPlaceholder(),
  }) {
    return AlfredUserConfigurationNumberSlider(
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
          : config as AlfredUserConfigurationConfigNumberSlider,
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

extension $AlfredUserConfigurationNumberSliderCopyWith
    on AlfredUserConfigurationNumberSlider {
  /// Returns a callable class that can be used as follows: `instanceOfAlfredUserConfigurationNumberSlider.copyWith(...)` or like so:`instanceOfAlfredUserConfigurationNumberSlider.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$AlfredUserConfigurationNumberSliderCWProxy get copyWith =>
      _$AlfredUserConfigurationNumberSliderCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AlfredUserConfigurationNumberSlider
    _$AlfredUserConfigurationNumberSliderFromJson(Map<String, dynamic> json) =>
        AlfredUserConfigurationNumberSlider(
          type: $enumDecode(_$AlfredUserConfigurationTypeEnumMap, json['type']),
          variable: json['variable'] as String,
          config: AlfredUserConfigurationNumberSlider._configFromJson(
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
