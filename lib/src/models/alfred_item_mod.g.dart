// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'alfred_item_mod.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$AlfredItemModCWProxy {
  AlfredItemMod arg(String? arg);

  AlfredItemMod subtitle(String? subtitle);

  AlfredItemMod icon(AlfredItemIcon? icon);

  AlfredItemMod valid(bool valid);

  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored. To update a single field use `AlfredItemMod(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// AlfredItemMod(...).copyWith(id: 12, name: "My name")
  /// ```
  AlfredItemMod call({
    String? arg,
    String? subtitle,
    AlfredItemIcon? icon,
    bool valid,
  });
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfAlfredItemMod.copyWith(...)` or call `instanceOfAlfredItemMod.copyWith.fieldName(value)` for a single field.
class _$AlfredItemModCWProxyImpl implements _$AlfredItemModCWProxy {
  const _$AlfredItemModCWProxyImpl(this._value);

  final AlfredItemMod _value;

  @override
  AlfredItemMod arg(String? arg) => call(arg: arg);

  @override
  AlfredItemMod subtitle(String? subtitle) => call(subtitle: subtitle);

  @override
  AlfredItemMod icon(AlfredItemIcon? icon) => call(icon: icon);

  @override
  AlfredItemMod valid(bool valid) => call(valid: valid);

  @override
  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored. To update a single field use `AlfredItemMod(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// AlfredItemMod(...).copyWith(id: 12, name: "My name")
  /// ```
  AlfredItemMod call({
    Object? arg = const $CopyWithPlaceholder(),
    Object? subtitle = const $CopyWithPlaceholder(),
    Object? icon = const $CopyWithPlaceholder(),
    Object? valid = const $CopyWithPlaceholder(),
  }) {
    return AlfredItemMod(
      arg: arg == const $CopyWithPlaceholder()
          ? _value.arg
          // ignore: cast_nullable_to_non_nullable
          : arg as String?,
      subtitle: subtitle == const $CopyWithPlaceholder()
          ? _value.subtitle
          // ignore: cast_nullable_to_non_nullable
          : subtitle as String?,
      icon: icon == const $CopyWithPlaceholder()
          ? _value.icon
          // ignore: cast_nullable_to_non_nullable
          : icon as AlfredItemIcon?,
      valid: valid == const $CopyWithPlaceholder() || valid == null
          ? _value.valid
          // ignore: cast_nullable_to_non_nullable
          : valid as bool,
    );
  }
}

extension $AlfredItemModCopyWith on AlfredItemMod {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfAlfredItemMod.copyWith(...)` or `instanceOfAlfredItemMod.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$AlfredItemModCWProxy get copyWith => _$AlfredItemModCWProxyImpl(this);
}

// **************************************************************************
// EquatableGenerator
// **************************************************************************

extension _$AlfredItemModEquatableAnnotations on AlfredItemMod {
  List<Object?> get _$props => [arg, subtitle, icon, valid];
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AlfredItemMod _$AlfredItemModFromJson(Map<String, dynamic> json) =>
    AlfredItemMod(
      arg: json['arg'] as String?,
      subtitle: json['subtitle'] as String?,
      icon: AlfredItemMod._iconFromJson(json['icon']),
      valid: json['valid'] as bool? ?? true,
    );

Map<String, dynamic> _$AlfredItemModToJson(AlfredItemMod instance) =>
    <String, dynamic>{
      'arg': ?instance.arg,
      'subtitle': ?instance.subtitle,
      'icon': ?instance.icon?.toJson(),
      'valid': instance.valid,
    };
