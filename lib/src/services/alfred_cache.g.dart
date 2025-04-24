// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'alfred_cache.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$AlfredCacheCWProxy<T> {
  AlfredCache<T> fromEncodable(T Function(Map<String, dynamic>) fromEncodable);

  AlfredCache<T> path(String? path);

  AlfredCache<T> maxEntries(int maxEntries);

  AlfredCache<T> name(String name);

  AlfredCache<T> evictionPolicy(EvictionPolicy evictionPolicy);

  AlfredCache<T> expiryPolicy(ExpiryPolicy expiryPolicy);

  AlfredCache<T> verbose(bool verbose);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `AlfredCache<T>(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// AlfredCache<T>(...).copyWith(id: 12, name: "My name")
  /// ````
  AlfredCache<T> call({
    T Function(Map<String, dynamic>) fromEncodable,
    String? path,
    int maxEntries,
    String name,
    EvictionPolicy evictionPolicy,
    ExpiryPolicy expiryPolicy,
    bool verbose,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfAlfredCache.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfAlfredCache.copyWith.fieldName(...)`
class _$AlfredCacheCWProxyImpl<T> implements _$AlfredCacheCWProxy<T> {
  const _$AlfredCacheCWProxyImpl(this._value);

  final AlfredCache<T> _value;

  @override
  AlfredCache<T> fromEncodable(
          T Function(Map<String, dynamic>) fromEncodable) =>
      this(fromEncodable: fromEncodable);

  @override
  AlfredCache<T> path(String? path) => this(path: path);

  @override
  AlfredCache<T> maxEntries(int maxEntries) => this(maxEntries: maxEntries);

  @override
  AlfredCache<T> name(String name) => this(name: name);

  @override
  AlfredCache<T> evictionPolicy(EvictionPolicy evictionPolicy) =>
      this(evictionPolicy: evictionPolicy);

  @override
  AlfredCache<T> expiryPolicy(ExpiryPolicy expiryPolicy) =>
      this(expiryPolicy: expiryPolicy);

  @override
  AlfredCache<T> verbose(bool verbose) => this(verbose: verbose);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `AlfredCache<T>(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// AlfredCache<T>(...).copyWith(id: 12, name: "My name")
  /// ````
  AlfredCache<T> call({
    Object? fromEncodable = const $CopyWithPlaceholder(),
    Object? path = const $CopyWithPlaceholder(),
    Object? maxEntries = const $CopyWithPlaceholder(),
    Object? name = const $CopyWithPlaceholder(),
    Object? evictionPolicy = const $CopyWithPlaceholder(),
    Object? expiryPolicy = const $CopyWithPlaceholder(),
    Object? verbose = const $CopyWithPlaceholder(),
  }) {
    return AlfredCache<T>(
      fromEncodable: fromEncodable == const $CopyWithPlaceholder()
          ? _value.fromEncodable
          // ignore: cast_nullable_to_non_nullable
          : fromEncodable as T Function(Map<String, dynamic>),
      path: path == const $CopyWithPlaceholder()
          ? _value.path
          // ignore: cast_nullable_to_non_nullable
          : path as String?,
      maxEntries: maxEntries == const $CopyWithPlaceholder()
          ? _value.maxEntries
          // ignore: cast_nullable_to_non_nullable
          : maxEntries as int,
      name: name == const $CopyWithPlaceholder()
          ? _value.name
          // ignore: cast_nullable_to_non_nullable
          : name as String,
      evictionPolicy: evictionPolicy == const $CopyWithPlaceholder()
          ? _value.evictionPolicy
          // ignore: cast_nullable_to_non_nullable
          : evictionPolicy as EvictionPolicy,
      expiryPolicy: expiryPolicy == const $CopyWithPlaceholder()
          ? _value.expiryPolicy
          // ignore: cast_nullable_to_non_nullable
          : expiryPolicy as ExpiryPolicy,
      verbose: verbose == const $CopyWithPlaceholder()
          ? _value.verbose
          // ignore: cast_nullable_to_non_nullable
          : verbose as bool,
    );
  }
}

extension $AlfredCacheCopyWith<T> on AlfredCache<T> {
  /// Returns a callable class that can be used as follows: `instanceOfAlfredCache.copyWith(...)` or like so:`instanceOfAlfredCache.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$AlfredCacheCWProxy<T> get copyWith => _$AlfredCacheCWProxyImpl<T>(this);
}

// **************************************************************************
// EquatableGenerator
// **************************************************************************

extension _$AlfredCacheequatable_annotations on AlfredCache {
  List<Object?> get _$props => [
        fromEncodable,
        path,
        maxEntries,
        name,
        evictionPolicy,
        expiryPolicy,
        verbose,
      ];
}
