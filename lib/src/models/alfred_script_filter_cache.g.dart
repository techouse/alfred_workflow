// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'alfred_script_filter_cache.dart';

// **************************************************************************
// AutoequalGenerator
// **************************************************************************

extension _$AlfredScriptFilterCacheAutoequal on AlfredScriptFilterCache {
  List<Object?> get _$props => [seconds, looseReload];
}

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$AlfredScriptFilterCacheCWProxy {
  AlfredScriptFilterCache seconds(int seconds);

  AlfredScriptFilterCache looseReload(bool? looseReload);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `AlfredScriptFilterCache(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// AlfredScriptFilterCache(...).copyWith(id: 12, name: "My name")
  /// ````
  AlfredScriptFilterCache call({
    int seconds,
    bool? looseReload,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfAlfredScriptFilterCache.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfAlfredScriptFilterCache.copyWith.fieldName(...)`
class _$AlfredScriptFilterCacheCWProxyImpl
    implements _$AlfredScriptFilterCacheCWProxy {
  const _$AlfredScriptFilterCacheCWProxyImpl(this._value);

  final AlfredScriptFilterCache _value;

  @override
  AlfredScriptFilterCache seconds(int seconds) => this(seconds: seconds);

  @override
  AlfredScriptFilterCache looseReload(bool? looseReload) =>
      this(looseReload: looseReload);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `AlfredScriptFilterCache(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// AlfredScriptFilterCache(...).copyWith(id: 12, name: "My name")
  /// ````
  AlfredScriptFilterCache call({
    Object? seconds = const $CopyWithPlaceholder(),
    Object? looseReload = const $CopyWithPlaceholder(),
  }) {
    return AlfredScriptFilterCache(
      seconds: seconds == const $CopyWithPlaceholder()
          ? _value.seconds
          // ignore: cast_nullable_to_non_nullable
          : seconds as int,
      looseReload: looseReload == const $CopyWithPlaceholder()
          ? _value.looseReload
          // ignore: cast_nullable_to_non_nullable
          : looseReload as bool?,
    );
  }
}

extension $AlfredScriptFilterCacheCopyWith on AlfredScriptFilterCache {
  /// Returns a callable class that can be used as follows: `instanceOfAlfredScriptFilterCache.copyWith(...)` or like so:`instanceOfAlfredScriptFilterCache.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$AlfredScriptFilterCacheCWProxy get copyWith =>
      _$AlfredScriptFilterCacheCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AlfredScriptFilterCache _$AlfredScriptFilterCacheFromJson(
        Map<String, dynamic> json) =>
    AlfredScriptFilterCache(
      seconds: (json['seconds'] as num).toInt(),
      looseReload: json['loosereload'] as bool?,
    );

Map<String, dynamic> _$AlfredScriptFilterCacheToJson(
        AlfredScriptFilterCache instance) =>
    <String, dynamic>{
      'seconds': instance.seconds,
      'loosereload': instance.looseReload,
    };
