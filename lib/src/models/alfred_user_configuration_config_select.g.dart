// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'alfred_user_configuration_config_select.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$AlfredUserConfigurationConfigSelectCWProxy {
  AlfredUserConfigurationConfigSelect defaultValue(String defaultValue);

  AlfredUserConfigurationConfigSelect pairs(
    List<AlfredUserConfigurationConfigSelectPair> pairs,
  );

  AlfredUserConfigurationConfigSelect value(String? value);

  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored. To update a single field use `AlfredUserConfigurationConfigSelect(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// AlfredUserConfigurationConfigSelect(...).copyWith(id: 12, name: "My name")
  /// ```
  AlfredUserConfigurationConfigSelect call({
    String defaultValue,
    List<AlfredUserConfigurationConfigSelectPair> pairs,
    String? value,
  });
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfAlfredUserConfigurationConfigSelect.copyWith(...)` or call `instanceOfAlfredUserConfigurationConfigSelect.copyWith.fieldName(value)` for a single field.
class _$AlfredUserConfigurationConfigSelectCWProxyImpl
    implements _$AlfredUserConfigurationConfigSelectCWProxy {
  const _$AlfredUserConfigurationConfigSelectCWProxyImpl(this._value);

  final AlfredUserConfigurationConfigSelect _value;

  @override
  AlfredUserConfigurationConfigSelect defaultValue(String defaultValue) =>
      call(defaultValue: defaultValue);

  @override
  AlfredUserConfigurationConfigSelect pairs(
    List<AlfredUserConfigurationConfigSelectPair> pairs,
  ) => call(pairs: pairs);

  @override
  AlfredUserConfigurationConfigSelect value(String? value) =>
      call(value: value);

  @override
  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored. To update a single field use `AlfredUserConfigurationConfigSelect(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// AlfredUserConfigurationConfigSelect(...).copyWith(id: 12, name: "My name")
  /// ```
  AlfredUserConfigurationConfigSelect call({
    Object? defaultValue = const $CopyWithPlaceholder(),
    Object? pairs = const $CopyWithPlaceholder(),
    Object? value = const $CopyWithPlaceholder(),
  }) {
    return AlfredUserConfigurationConfigSelect(
      defaultValue:
          defaultValue == const $CopyWithPlaceholder() || defaultValue == null
          ? _value.defaultValue
          // ignore: cast_nullable_to_non_nullable
          : defaultValue as String,
      pairs: pairs == const $CopyWithPlaceholder() || pairs == null
          ? _value.pairs
          // ignore: cast_nullable_to_non_nullable
          : pairs as List<AlfredUserConfigurationConfigSelectPair>,
      value: value == const $CopyWithPlaceholder()
          ? _value.value
          // ignore: cast_nullable_to_non_nullable
          : value as String?,
    );
  }
}

extension $AlfredUserConfigurationConfigSelectCopyWith
    on AlfredUserConfigurationConfigSelect {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfAlfredUserConfigurationConfigSelect.copyWith(...)` or `instanceOfAlfredUserConfigurationConfigSelect.copyWith.fieldName(...)`.
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
      defaultValue:
          AlfredUserConfigurationConfig.fromJsonDefaultValue(json, 'default')
              as String,
      pairs: AlfredUserConfigurationConfigSelect._pairsFromJson(
        json['pairs'] as List,
      ),
    );
