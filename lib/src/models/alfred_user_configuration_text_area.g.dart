// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'alfred_user_configuration_text_area.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$AlfredUserConfigurationTextAreaCWProxy {
  AlfredUserConfigurationTextArea type(AlfredUserConfigurationType type);

  AlfredUserConfigurationTextArea variable(String variable);

  AlfredUserConfigurationTextArea config(
    AlfredUserConfigurationConfigTextArea config,
  );

  AlfredUserConfigurationTextArea description(String? description);

  AlfredUserConfigurationTextArea label(String? label);

  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored. To update a single field use `AlfredUserConfigurationTextArea(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// AlfredUserConfigurationTextArea(...).copyWith(id: 12, name: "My name")
  /// ```
  AlfredUserConfigurationTextArea call({
    AlfredUserConfigurationType type,
    String variable,
    AlfredUserConfigurationConfigTextArea config,
    String? description,
    String? label,
  });
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfAlfredUserConfigurationTextArea.copyWith(...)` or call `instanceOfAlfredUserConfigurationTextArea.copyWith.fieldName(value)` for a single field.
class _$AlfredUserConfigurationTextAreaCWProxyImpl
    implements _$AlfredUserConfigurationTextAreaCWProxy {
  const _$AlfredUserConfigurationTextAreaCWProxyImpl(this._value);

  final AlfredUserConfigurationTextArea _value;

  @override
  AlfredUserConfigurationTextArea type(AlfredUserConfigurationType type) =>
      call(type: type);

  @override
  AlfredUserConfigurationTextArea variable(String variable) =>
      call(variable: variable);

  @override
  AlfredUserConfigurationTextArea config(
    AlfredUserConfigurationConfigTextArea config,
  ) => call(config: config);

  @override
  AlfredUserConfigurationTextArea description(String? description) =>
      call(description: description);

  @override
  AlfredUserConfigurationTextArea label(String? label) => call(label: label);

  @override
  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored. To update a single field use `AlfredUserConfigurationTextArea(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// AlfredUserConfigurationTextArea(...).copyWith(id: 12, name: "My name")
  /// ```
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
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfAlfredUserConfigurationTextArea.copyWith(...)` or `instanceOfAlfredUserConfigurationTextArea.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$AlfredUserConfigurationTextAreaCWProxy get copyWith =>
      _$AlfredUserConfigurationTextAreaCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AlfredUserConfigurationTextArea _$AlfredUserConfigurationTextAreaFromJson(
  Map<String, dynamic> json,
) => AlfredUserConfigurationTextArea(
  type: $enumDecode(_$AlfredUserConfigurationTypeEnumMap, json['type']),
  variable: json['variable'] as String,
  config: AlfredUserConfigurationTextArea._configFromJson(
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
