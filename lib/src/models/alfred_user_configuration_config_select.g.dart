// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'alfred_user_configuration_config_select.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$AlfredUserConfigurationConfigSelectCWProxy {
  AlfredUserConfigurationConfigSelect defaultValue(String defaultValue);

  AlfredUserConfigurationConfigSelect pairs(
      List<({String label, String value})> pairs);

  AlfredUserConfigurationConfigSelect value(String? value);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `AlfredUserConfigurationConfigSelect(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// AlfredUserConfigurationConfigSelect(...).copyWith(id: 12, name: "My name")
  /// ````
  AlfredUserConfigurationConfigSelect call({
    String defaultValue,
    List<({String label, String value})> pairs,
    String? value,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfAlfredUserConfigurationConfigSelect.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfAlfredUserConfigurationConfigSelect.copyWith.fieldName(...)`
class _$AlfredUserConfigurationConfigSelectCWProxyImpl
    implements _$AlfredUserConfigurationConfigSelectCWProxy {
  const _$AlfredUserConfigurationConfigSelectCWProxyImpl(this._value);

  final AlfredUserConfigurationConfigSelect _value;

  @override
  AlfredUserConfigurationConfigSelect defaultValue(String defaultValue) =>
      this(defaultValue: defaultValue);

  @override
  AlfredUserConfigurationConfigSelect pairs(
          List<({String label, String value})> pairs) =>
      this(pairs: pairs);

  @override
  AlfredUserConfigurationConfigSelect value(String? value) =>
      this(value: value);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `AlfredUserConfigurationConfigSelect(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// AlfredUserConfigurationConfigSelect(...).copyWith(id: 12, name: "My name")
  /// ````
  AlfredUserConfigurationConfigSelect call({
    Object? defaultValue = const $CopyWithPlaceholder(),
    Object? pairs = const $CopyWithPlaceholder(),
    Object? value = const $CopyWithPlaceholder(),
  }) {
    return AlfredUserConfigurationConfigSelect(
      defaultValue: defaultValue == const $CopyWithPlaceholder()
          ? _value.defaultValue
          // ignore: cast_nullable_to_non_nullable
          : defaultValue as String,
      pairs: pairs == const $CopyWithPlaceholder()
          ? _value.pairs
          // ignore: cast_nullable_to_non_nullable
          : pairs as List<({String label, String value})>,
      value: value == const $CopyWithPlaceholder()
          ? _value.value
          // ignore: cast_nullable_to_non_nullable
          : value as String?,
    );
  }
}

extension $AlfredUserConfigurationConfigSelectCopyWith
    on AlfredUserConfigurationConfigSelect {
  /// Returns a callable class that can be used as follows: `instanceOfAlfredUserConfigurationConfigSelect.copyWith(...)` or like so:`instanceOfAlfredUserConfigurationConfigSelect.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$AlfredUserConfigurationConfigSelectCWProxy get copyWith =>
      _$AlfredUserConfigurationConfigSelectCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AlfredUserConfigurationConfigSelect
    _$AlfredUserConfigurationConfigSelectFromJson(Map<String, dynamic> json) =>
        AlfredUserConfigurationConfigSelect(
          defaultValue: AlfredUserConfigurationConfig.fromJsonDefaultValue(
              json, 'default') as String,
          pairs: AlfredUserConfigurationConfigSelect._pairsFromJson(
              json['pairs'] as List),
        );
