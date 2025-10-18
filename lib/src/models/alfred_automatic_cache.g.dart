// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'alfred_automatic_cache.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$AlfredAutomaticCacheCWProxy {
  AlfredAutomaticCache seconds(int seconds);

  AlfredAutomaticCache looseReload(bool? looseReload);

  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored. To update a single field use `AlfredAutomaticCache(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// AlfredAutomaticCache(...).copyWith(id: 12, name: "My name")
  /// ```
  AlfredAutomaticCache call({int seconds, bool? looseReload});
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfAlfredAutomaticCache.copyWith(...)` or call `instanceOfAlfredAutomaticCache.copyWith.fieldName(value)` for a single field.
class _$AlfredAutomaticCacheCWProxyImpl
    implements _$AlfredAutomaticCacheCWProxy {
  const _$AlfredAutomaticCacheCWProxyImpl(this._value);

  final AlfredAutomaticCache _value;

  @override
  AlfredAutomaticCache seconds(int seconds) => call(seconds: seconds);

  @override
  AlfredAutomaticCache looseReload(bool? looseReload) =>
      call(looseReload: looseReload);

  @override
  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored. To update a single field use `AlfredAutomaticCache(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// AlfredAutomaticCache(...).copyWith(id: 12, name: "My name")
  /// ```
  AlfredAutomaticCache call({
    Object? seconds = const $CopyWithPlaceholder(),
    Object? looseReload = const $CopyWithPlaceholder(),
  }) {
    return AlfredAutomaticCache(
      seconds: seconds == const $CopyWithPlaceholder() || seconds == null
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
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfAlfredAutomaticCache.copyWith(...)` or `instanceOfAlfredAutomaticCache.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$AlfredAutomaticCacheCWProxy get copyWith =>
      _$AlfredAutomaticCacheCWProxyImpl(this);
}

// **************************************************************************
// EquatableGenerator
// **************************************************************************

extension _$AlfredAutomaticCacheEquatableAnnotations on AlfredAutomaticCache {
  List<Object?> get _$props => [seconds, looseReload];
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Map<String, dynamic> _$AlfredAutomaticCacheToJson(
  AlfredAutomaticCache instance,
) => <String, dynamic>{
  'seconds': instance.seconds,
  'loosereload': ?instance.looseReload,
};
