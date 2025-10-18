// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'alfred_user_configuration_check_box.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$AlfredUserConfigurationCheckBoxCWProxy {
  AlfredUserConfigurationCheckBox type(AlfredUserConfigurationType type);

  AlfredUserConfigurationCheckBox variable(String variable);

  AlfredUserConfigurationCheckBox config(
    AlfredUserConfigurationConfigCheckBox config,
  );

  AlfredUserConfigurationCheckBox description(String? description);

  AlfredUserConfigurationCheckBox label(String? label);

  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored. To update a single field use `AlfredUserConfigurationCheckBox(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// AlfredUserConfigurationCheckBox(...).copyWith(id: 12, name: "My name")
  /// ```
  AlfredUserConfigurationCheckBox call({
    AlfredUserConfigurationType type,
    String variable,
    AlfredUserConfigurationConfigCheckBox config,
    String? description,
    String? label,
  });
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfAlfredUserConfigurationCheckBox.copyWith(...)` or call `instanceOfAlfredUserConfigurationCheckBox.copyWith.fieldName(value)` for a single field.
class _$AlfredUserConfigurationCheckBoxCWProxyImpl
    implements _$AlfredUserConfigurationCheckBoxCWProxy {
  const _$AlfredUserConfigurationCheckBoxCWProxyImpl(this._value);

  final AlfredUserConfigurationCheckBox _value;

  @override
  AlfredUserConfigurationCheckBox type(AlfredUserConfigurationType type) =>
      call(type: type);

  @override
  AlfredUserConfigurationCheckBox variable(String variable) =>
      call(variable: variable);

  @override
  AlfredUserConfigurationCheckBox config(
    AlfredUserConfigurationConfigCheckBox config,
  ) => call(config: config);

  @override
  AlfredUserConfigurationCheckBox description(String? description) =>
      call(description: description);

  @override
  AlfredUserConfigurationCheckBox label(String? label) => call(label: label);

  @override
  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored. To update a single field use `AlfredUserConfigurationCheckBox(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// AlfredUserConfigurationCheckBox(...).copyWith(id: 12, name: "My name")
  /// ```
  AlfredUserConfigurationCheckBox call({
    Object? type = const $CopyWithPlaceholder(),
    Object? variable = const $CopyWithPlaceholder(),
    Object? config = const $CopyWithPlaceholder(),
    Object? description = const $CopyWithPlaceholder(),
    Object? label = const $CopyWithPlaceholder(),
  }) {
    return AlfredUserConfigurationCheckBox(
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
          : config as AlfredUserConfigurationConfigCheckBox,
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

extension $AlfredUserConfigurationCheckBoxCopyWith
    on AlfredUserConfigurationCheckBox {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfAlfredUserConfigurationCheckBox.copyWith(...)` or `instanceOfAlfredUserConfigurationCheckBox.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$AlfredUserConfigurationCheckBoxCWProxy get copyWith =>
      _$AlfredUserConfigurationCheckBoxCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AlfredUserConfigurationCheckBox _$AlfredUserConfigurationCheckBoxFromJson(
  Map<String, dynamic> json,
) => AlfredUserConfigurationCheckBox(
  type: $enumDecode(_$AlfredUserConfigurationTypeEnumMap, json['type']),
  variable: json['variable'] as String,
  config: AlfredUserConfigurationCheckBox._configFromJson(
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
