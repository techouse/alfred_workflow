// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'alfred_user_configuration_number_slider.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$AlfredUserConfigurationNumberSliderCWProxy {
  AlfredUserConfigurationNumberSlider type(AlfredUserConfigurationType type);

  AlfredUserConfigurationNumberSlider variable(String variable);

  AlfredUserConfigurationNumberSlider config(
    AlfredUserConfigurationConfigNumberSlider config,
  );

  AlfredUserConfigurationNumberSlider description(String? description);

  AlfredUserConfigurationNumberSlider label(String? label);

  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored. To update a single field use `AlfredUserConfigurationNumberSlider(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// AlfredUserConfigurationNumberSlider(...).copyWith(id: 12, name: "My name")
  /// ```
  AlfredUserConfigurationNumberSlider call({
    AlfredUserConfigurationType type,
    String variable,
    AlfredUserConfigurationConfigNumberSlider config,
    String? description,
    String? label,
  });
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfAlfredUserConfigurationNumberSlider.copyWith(...)` or call `instanceOfAlfredUserConfigurationNumberSlider.copyWith.fieldName(value)` for a single field.
class _$AlfredUserConfigurationNumberSliderCWProxyImpl
    implements _$AlfredUserConfigurationNumberSliderCWProxy {
  const _$AlfredUserConfigurationNumberSliderCWProxyImpl(this._value);

  final AlfredUserConfigurationNumberSlider _value;

  @override
  AlfredUserConfigurationNumberSlider type(AlfredUserConfigurationType type) =>
      call(type: type);

  @override
  AlfredUserConfigurationNumberSlider variable(String variable) =>
      call(variable: variable);

  @override
  AlfredUserConfigurationNumberSlider config(
    AlfredUserConfigurationConfigNumberSlider config,
  ) => call(config: config);

  @override
  AlfredUserConfigurationNumberSlider description(String? description) =>
      call(description: description);

  @override
  AlfredUserConfigurationNumberSlider label(String? label) =>
      call(label: label);

  @override
  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored. To update a single field use `AlfredUserConfigurationNumberSlider(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// AlfredUserConfigurationNumberSlider(...).copyWith(id: 12, name: "My name")
  /// ```
  AlfredUserConfigurationNumberSlider call({
    Object? type = const $CopyWithPlaceholder(),
    Object? variable = const $CopyWithPlaceholder(),
    Object? config = const $CopyWithPlaceholder(),
    Object? description = const $CopyWithPlaceholder(),
    Object? label = const $CopyWithPlaceholder(),
  }) {
    return AlfredUserConfigurationNumberSlider(
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
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfAlfredUserConfigurationNumberSlider.copyWith(...)` or `instanceOfAlfredUserConfigurationNumberSlider.copyWith.fieldName(...)`.
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
