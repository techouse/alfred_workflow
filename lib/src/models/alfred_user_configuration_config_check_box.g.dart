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

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `AlfredUserConfigurationConfigCheckBox(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// AlfredUserConfigurationConfigCheckBox(...).copyWith(id: 12, name: "My name")
  /// ````
  AlfredUserConfigurationConfigCheckBox call({
    bool defaultValue,
    bool required,
    bool? value,
    String? text,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfAlfredUserConfigurationConfigCheckBox.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfAlfredUserConfigurationConfigCheckBox.copyWith.fieldName(...)`
class _$AlfredUserConfigurationConfigCheckBoxCWProxyImpl
    implements _$AlfredUserConfigurationConfigCheckBoxCWProxy {
  const _$AlfredUserConfigurationConfigCheckBoxCWProxyImpl(this._value);

  final AlfredUserConfigurationConfigCheckBox _value;

  @override
  AlfredUserConfigurationConfigCheckBox defaultValue(bool defaultValue) =>
      this(defaultValue: defaultValue);

  @override
  AlfredUserConfigurationConfigCheckBox required(bool required) =>
      this(required: required);

  @override
  AlfredUserConfigurationConfigCheckBox value(bool? value) =>
      this(value: value);

  @override
  AlfredUserConfigurationConfigCheckBox text(String? text) => this(text: text);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `AlfredUserConfigurationConfigCheckBox(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// AlfredUserConfigurationConfigCheckBox(...).copyWith(id: 12, name: "My name")
  /// ````
  AlfredUserConfigurationConfigCheckBox call({
    Object? defaultValue = const $CopyWithPlaceholder(),
    Object? required = const $CopyWithPlaceholder(),
    Object? value = const $CopyWithPlaceholder(),
    Object? text = const $CopyWithPlaceholder(),
  }) {
    return AlfredUserConfigurationConfigCheckBox(
      defaultValue: defaultValue == const $CopyWithPlaceholder()
          ? _value.defaultValue
          // ignore: cast_nullable_to_non_nullable
          : defaultValue as bool,
      required: required == const $CopyWithPlaceholder()
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
  /// Returns a callable class that can be used as follows: `instanceOfAlfredUserConfigurationConfigCheckBox.copyWith(...)` or like so:`instanceOfAlfredUserConfigurationConfigCheckBox.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$AlfredUserConfigurationConfigCheckBoxCWProxy get copyWith =>
      _$AlfredUserConfigurationConfigCheckBoxCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AlfredUserConfigurationConfigCheckBox
    _$AlfredUserConfigurationConfigCheckBoxFromJson(
            Map<String, dynamic> json) =>
        AlfredUserConfigurationConfigCheckBox(
          defaultValue: AlfredUserConfigurationConfig.fromJsonDefaultValue(
              json, 'default') as bool,
          required: json['required'] as bool,
          text: json['text'] as String?,
        );
