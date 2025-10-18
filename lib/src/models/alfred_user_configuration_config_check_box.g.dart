// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'alfred_user_configuration_config_check_box.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$AlfredUserConfigurationConfigCheckBoxCWProxy {
  AlfredUserConfigurationConfigCheckBox defaultValue(bool defaultValue);

  AlfredUserConfigurationConfigCheckBox required(bool required);

  AlfredUserConfigurationConfigCheckBox value(bool? value);

  AlfredUserConfigurationConfigCheckBox text(String? text);

  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored. To update a single field use `AlfredUserConfigurationConfigCheckBox(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// AlfredUserConfigurationConfigCheckBox(...).copyWith(id: 12, name: "My name")
  /// ```
  AlfredUserConfigurationConfigCheckBox call({
    bool defaultValue,
    bool required,
    bool? value,
    String? text,
  });
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfAlfredUserConfigurationConfigCheckBox.copyWith(...)` or call `instanceOfAlfredUserConfigurationConfigCheckBox.copyWith.fieldName(value)` for a single field.
class _$AlfredUserConfigurationConfigCheckBoxCWProxyImpl
    implements _$AlfredUserConfigurationConfigCheckBoxCWProxy {
  const _$AlfredUserConfigurationConfigCheckBoxCWProxyImpl(this._value);

  final AlfredUserConfigurationConfigCheckBox _value;

  @override
  AlfredUserConfigurationConfigCheckBox defaultValue(bool defaultValue) =>
      call(defaultValue: defaultValue);

  @override
  AlfredUserConfigurationConfigCheckBox required(bool required) =>
      call(required: required);

  @override
  AlfredUserConfigurationConfigCheckBox value(bool? value) =>
      call(value: value);

  @override
  AlfredUserConfigurationConfigCheckBox text(String? text) => call(text: text);

  @override
  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored. To update a single field use `AlfredUserConfigurationConfigCheckBox(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// AlfredUserConfigurationConfigCheckBox(...).copyWith(id: 12, name: "My name")
  /// ```
  AlfredUserConfigurationConfigCheckBox call({
    Object? defaultValue = const $CopyWithPlaceholder(),
    Object? required = const $CopyWithPlaceholder(),
    Object? value = const $CopyWithPlaceholder(),
    Object? text = const $CopyWithPlaceholder(),
  }) {
    return AlfredUserConfigurationConfigCheckBox(
      defaultValue:
          defaultValue == const $CopyWithPlaceholder() || defaultValue == null
          ? _value.defaultValue
          // ignore: cast_nullable_to_non_nullable
          : defaultValue as bool,
      required: required == const $CopyWithPlaceholder() || required == null
          ? _value.required
          // ignore: cast_nullable_to_non_nullable
          : required as bool,
      value: value == const $CopyWithPlaceholder()
          ? _value.value
          // ignore: cast_nullable_to_non_nullable
          : value as bool?,
      text: text == const $CopyWithPlaceholder()
          ? _value.text
          // ignore: cast_nullable_to_non_nullable
          : text as String?,
    );
  }
}

extension $AlfredUserConfigurationConfigCheckBoxCopyWith
    on AlfredUserConfigurationConfigCheckBox {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfAlfredUserConfigurationConfigCheckBox.copyWith(...)` or `instanceOfAlfredUserConfigurationConfigCheckBox.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$AlfredUserConfigurationConfigCheckBoxCWProxy get copyWith =>
      _$AlfredUserConfigurationConfigCheckBoxCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AlfredUserConfigurationConfigCheckBox
_$AlfredUserConfigurationConfigCheckBoxFromJson(Map<String, dynamic> json) =>
    AlfredUserConfigurationConfigCheckBox(
      defaultValue:
          AlfredUserConfigurationConfig.fromJsonDefaultValue(json, 'default')
              as bool,
      required: json['required'] as bool,
      text: json['text'] as String?,
    );
