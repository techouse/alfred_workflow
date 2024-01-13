// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'alfred_item_mod.dart';

// **************************************************************************
// AutoequalGenerator
// **************************************************************************

extension _$AlfredItemModAutoequal on AlfredItemMod {
  List<Object?> get _$props => [
        arg,
        subtitle,
        icon,
        valid,
      ];
}

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$AlfredItemModCWProxy {
  AlfredItemMod arg(String? arg);

  AlfredItemMod subtitle(String? subtitle);

  AlfredItemMod icon(AlfredItemIcon? icon);

  AlfredItemMod valid(bool valid);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `AlfredItemMod(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// AlfredItemMod(...).copyWith(id: 12, name: "My name")
  /// ````
  AlfredItemMod call({
    String? arg,
    String? subtitle,
    AlfredItemIcon? icon,
    bool? valid,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfAlfredItemMod.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfAlfredItemMod.copyWith.fieldName(...)`
class _$AlfredItemModCWProxyImpl implements _$AlfredItemModCWProxy {
  const _$AlfredItemModCWProxyImpl(this._value);

  final AlfredItemMod _value;

  @override
  AlfredItemMod arg(String? arg) => this(arg: arg);

  @override
  AlfredItemMod subtitle(String? subtitle) => this(subtitle: subtitle);

  @override
  AlfredItemMod icon(AlfredItemIcon? icon) => this(icon: icon);

  @override
  AlfredItemMod valid(bool valid) => this(valid: valid);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `AlfredItemMod(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// AlfredItemMod(...).copyWith(id: 12, name: "My name")
  /// ````
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
  /// Returns a callable class that can be used as follows: `instanceOfAlfredItemMod.copyWith(...)` or like so:`instanceOfAlfredItemMod.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$AlfredItemModCWProxy get copyWith => _$AlfredItemModCWProxyImpl(this);
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

Map<String, dynamic> _$AlfredItemModToJson(AlfredItemMod instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('arg', instance.arg);
  writeNotNull('subtitle', instance.subtitle);
  writeNotNull('icon', instance.icon?.toJson());
  val['valid'] = instance.valid;
  return val;
}
