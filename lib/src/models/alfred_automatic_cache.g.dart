// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'alfred_automatic_cache.dart';

// **************************************************************************
// AutoequalGenerator
// **************************************************************************

extension _$AlfredAutomaticCacheAutoequal on AlfredAutomaticCache {
  List<Object?> get _$props => [seconds, looseReload];
}

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$AlfredAutomaticCacheCWProxy {
  AlfredAutomaticCache seconds(int seconds);

  AlfredAutomaticCache looseReload(bool? looseReload);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `AlfredAutomaticCache(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// AlfredAutomaticCache(...).copyWith(id: 12, name: "My name")
  /// ````
  AlfredAutomaticCache call({
    int seconds,
    bool? looseReload,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfAlfredAutomaticCache.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfAlfredAutomaticCache.copyWith.fieldName(...)`
class _$AlfredAutomaticCacheCWProxyImpl
    implements _$AlfredAutomaticCacheCWProxy {
  const _$AlfredAutomaticCacheCWProxyImpl(this._value);

  final AlfredAutomaticCache _value;

  @override
  AlfredAutomaticCache seconds(int seconds) => this(seconds: seconds);

  @override
  AlfredAutomaticCache looseReload(bool? looseReload) =>
      this(looseReload: looseReload);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `AlfredAutomaticCache(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// AlfredAutomaticCache(...).copyWith(id: 12, name: "My name")
  /// ````
  AlfredAutomaticCache call({
    Object? seconds = const $CopyWithPlaceholder(),
    Object? looseReload = const $CopyWithPlaceholder(),
  }) {
    return AlfredAutomaticCache(
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

extension $AlfredAutomaticCacheCopyWith on AlfredAutomaticCache {
  /// Returns a callable class that can be used as follows: `instanceOfAlfredAutomaticCache.copyWith(...)` or like so:`instanceOfAlfredAutomaticCache.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$AlfredAutomaticCacheCWProxy get copyWith =>
      _$AlfredAutomaticCacheCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Map<String, dynamic> _$AlfredAutomaticCacheToJson(
        AlfredAutomaticCache instance) =>
    <String, dynamic>{
      'stringify': instance.stringify,
      'hash_code': instance.hashCode,
      'seconds': instance.seconds,
      'loosereload': instance.looseReload,
      'props': instance.props,
    };
