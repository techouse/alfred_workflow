// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'alfred_user_configuration_config_text_field.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$AlfredUserConfigurationConfigTextFieldCWProxy {
  AlfredUserConfigurationConfigTextField defaultValue(String defaultValue);

  AlfredUserConfigurationConfigTextField required(bool required);

  AlfredUserConfigurationConfigTextField trim(bool trim);

  AlfredUserConfigurationConfigTextField value(String? value);

  AlfredUserConfigurationConfigTextField placeholder(String? placeholder);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `AlfredUserConfigurationConfigTextField(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// AlfredUserConfigurationConfigTextField(...).copyWith(id: 12, name: "My name")
  /// ````
  AlfredUserConfigurationConfigTextField call({
    String defaultValue,
    bool required,
    bool trim,
    String? value,
    String? placeholder,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfAlfredUserConfigurationConfigTextField.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfAlfredUserConfigurationConfigTextField.copyWith.fieldName(...)`
class _$AlfredUserConfigurationConfigTextFieldCWProxyImpl
    implements _$AlfredUserConfigurationConfigTextFieldCWProxy {
  const _$AlfredUserConfigurationConfigTextFieldCWProxyImpl(this._value);

  final AlfredUserConfigurationConfigTextField _value;

  @override
  AlfredUserConfigurationConfigTextField defaultValue(String defaultValue) =>
      this(defaultValue: defaultValue);

  @override
  AlfredUserConfigurationConfigTextField required(bool required) =>
      this(required: required);

  @override
  AlfredUserConfigurationConfigTextField trim(bool trim) => this(trim: trim);

  @override
  AlfredUserConfigurationConfigTextField value(String? value) =>
      this(value: value);

  @override
  AlfredUserConfigurationConfigTextField placeholder(String? placeholder) =>
      this(placeholder: placeholder);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `AlfredUserConfigurationConfigTextField(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// AlfredUserConfigurationConfigTextField(...).copyWith(id: 12, name: "My name")
  /// ````
  AlfredUserConfigurationConfigTextField call({
    Object? defaultValue = const $CopyWithPlaceholder(),
    Object? required = const $CopyWithPlaceholder(),
    Object? trim = const $CopyWithPlaceholder(),
    Object? value = const $CopyWithPlaceholder(),
    Object? placeholder = const $CopyWithPlaceholder(),
  }) {
    return AlfredUserConfigurationConfigTextField(
      defaultValue: defaultValue == const $CopyWithPlaceholder()
          ? _value.defaultValue
          // ignore: cast_nullable_to_non_nullable
          : defaultValue as String,
      required: required == const $CopyWithPlaceholder()
          ? _value.required
          // ignore: cast_nullable_to_non_nullable
          : required as bool,
      trim: trim == const $CopyWithPlaceholder()
          ? _value.trim
          // ignore: cast_nullable_to_non_nullable
          : trim as bool,
      value: value == const $CopyWithPlaceholder()
          ? _value.value
          // ignore: cast_nullable_to_non_nullable
          : value as String?,
      placeholder: placeholder == const $CopyWithPlaceholder()
          ? _value.placeholder
          // ignore: cast_nullable_to_non_nullable
          : placeholder as String?,
    );
  }
}

extension $AlfredUserConfigurationConfigTextFieldCopyWith
    on AlfredUserConfigurationConfigTextField {
  /// Returns a callable class that can be used as follows: `instanceOfAlfredUserConfigurationConfigTextField.copyWith(...)` or like so:`instanceOfAlfredUserConfigurationConfigTextField.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$AlfredUserConfigurationConfigTextFieldCWProxy get copyWith =>
      _$AlfredUserConfigurationConfigTextFieldCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AlfredUserConfigurationConfigTextField
    _$AlfredUserConfigurationConfigTextFieldFromJson(
            Map<String, dynamic> json) =>
        AlfredUserConfigurationConfigTextField(
          defaultValue: AlfredUserConfigurationConfig.fromJsonDefaultValue(
              json, 'default') as String,
          required: json['required'] as bool,
          trim: json['trim'] as bool,
          placeholder: json['placeholder'] as String?,
        );
