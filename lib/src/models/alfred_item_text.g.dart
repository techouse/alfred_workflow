// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'alfred_item_text.dart';

// **************************************************************************
// AutoequalGenerator
// **************************************************************************

extension _$AlfredItemTextAutoequal on AlfredItemText {
  List<Object?> get _$props => [
        copy,
        largeType,
      ];
}

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$AlfredItemTextCWProxy {
  AlfredItemText copy(String copy);

  AlfredItemText largeType(String? largeType);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `AlfredItemText(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// AlfredItemText(...).copyWith(id: 12, name: "My name")
  /// ````
  AlfredItemText call({
    String? copy,
    String? largeType,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfAlfredItemText.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfAlfredItemText.copyWith.fieldName(...)`
class _$AlfredItemTextCWProxyImpl implements _$AlfredItemTextCWProxy {
  const _$AlfredItemTextCWProxyImpl(this._value);

  final AlfredItemText _value;

  @override
  AlfredItemText copy(String copy) => this(copy: copy);

  @override
  AlfredItemText largeType(String? largeType) => this(largeType: largeType);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `AlfredItemText(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// AlfredItemText(...).copyWith(id: 12, name: "My name")
  /// ````
  AlfredItemText call({
    Object? copy = const $CopyWithPlaceholder(),
    Object? largeType = const $CopyWithPlaceholder(),
  }) {
    return AlfredItemText(
      copy: copy == const $CopyWithPlaceholder() || copy == null
          ? _value.copy
          // ignore: cast_nullable_to_non_nullable
          : copy as String,
      largeType: largeType == const $CopyWithPlaceholder()
          ? _value.largeType
          // ignore: cast_nullable_to_non_nullable
          : largeType as String?,
    );
  }
}

extension $AlfredItemTextCopyWith on AlfredItemText {
  /// Returns a callable class that can be used as follows: `instanceOfAlfredItemText.copyWith(...)` or like so:`instanceOfAlfredItemText.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$AlfredItemTextCWProxy get copyWith => _$AlfredItemTextCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AlfredItemText _$AlfredItemTextFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['copy'],
  );
  return AlfredItemText(
    copy: json['copy'] as String,
    largeType: json['largetype'] as String?,
  );
}

Map<String, dynamic> _$AlfredItemTextToJson(AlfredItemText instance) {
  final val = <String, dynamic>{
    'copy': instance.copy,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('largetype', instance.largeType);
  return val;
}
