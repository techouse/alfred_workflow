// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'alfred_user_configuration_select.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$AlfredUserConfigurationSelectCWProxy {
  AlfredUserConfigurationSelect type(AlfredUserConfigurationType type);

  AlfredUserConfigurationSelect variable(String variable);

  AlfredUserConfigurationSelect config(
    AlfredUserConfigurationConfigSelect config,
  );

  AlfredUserConfigurationSelect description(String? description);

  AlfredUserConfigurationSelect label(String? label);

  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored. To update a single field use `AlfredUserConfigurationSelect(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// AlfredUserConfigurationSelect(...).copyWith(id: 12, name: "My name")
  /// ```
  AlfredUserConfigurationSelect call({
    AlfredUserConfigurationType type,
    String variable,
    AlfredUserConfigurationConfigSelect config,
    String? description,
    String? label,
  });
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfAlfredUserConfigurationSelect.copyWith(...)` or call `instanceOfAlfredUserConfigurationSelect.copyWith.fieldName(value)` for a single field.
class _$AlfredUserConfigurationSelectCWProxyImpl
    implements _$AlfredUserConfigurationSelectCWProxy {
  const _$AlfredUserConfigurationSelectCWProxyImpl(this._value);

  final AlfredUserConfigurationSelect _value;

  @override
  AlfredUserConfigurationSelect type(AlfredUserConfigurationType type) =>
      call(type: type);

  @override
  AlfredUserConfigurationSelect variable(String variable) =>
      call(variable: variable);

  @override
  AlfredUserConfigurationSelect config(
    AlfredUserConfigurationConfigSelect config,
  ) => call(config: config);

  @override
  AlfredUserConfigurationSelect description(String? description) =>
      call(description: description);

  @override
  AlfredUserConfigurationSelect label(String? label) => call(label: label);

  @override
  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored. To update a single field use `AlfredUserConfigurationSelect(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// AlfredUserConfigurationSelect(...).copyWith(id: 12, name: "My name")
  /// ```
  AlfredUserConfigurationSelect call({
    Object? type = const $CopyWithPlaceholder(),
    Object? variable = const $CopyWithPlaceholder(),
    Object? config = const $CopyWithPlaceholder(),
    Object? description = const $CopyWithPlaceholder(),
    Object? label = const $CopyWithPlaceholder(),
  }) {
    return AlfredUserConfigurationSelect(
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
          : config as AlfredUserConfigurationConfigSelect,
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

extension $AlfredUserConfigurationSelectCopyWith
    on AlfredUserConfigurationSelect {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfAlfredUserConfigurationSelect.copyWith(...)` or `instanceOfAlfredUserConfigurationSelect.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$AlfredUserConfigurationSelectCWProxy get copyWith =>
      _$AlfredUserConfigurationSelectCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AlfredUserConfigurationSelect _$AlfredUserConfigurationSelectFromJson(
  Map<String, dynamic> json,
) => AlfredUserConfigurationSelect(
  type: $enumDecode(_$AlfredUserConfigurationTypeEnumMap, json['type']),
  variable: json['variable'] as String,
  config: AlfredUserConfigurationSelect._configFromJson(json['config'] as Map),
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
