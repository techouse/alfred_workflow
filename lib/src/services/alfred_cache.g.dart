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

  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored. To update a single field use `AlfredCache<T>(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// AlfredCache<T>(...).copyWith(id: 12, name: "My name")
  /// ```
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

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfAlfredCache.copyWith(...)` or call `instanceOfAlfredCache.copyWith.fieldName(value)` for a single field.
class _$AlfredCacheCWProxyImpl<T> implements _$AlfredCacheCWProxy<T> {
  const _$AlfredCacheCWProxyImpl(this._value);

  final AlfredCache<T> _value;

  @override
  AlfredCache<T> fromEncodable(
    T Function(Map<String, dynamic>) fromEncodable,
  ) => call(fromEncodable: fromEncodable);

  @override
  AlfredCache<T> path(String? path) => call(path: path);

  @override
  AlfredCache<T> maxEntries(int maxEntries) => call(maxEntries: maxEntries);

  @override
  AlfredCache<T> name(String name) => call(name: name);

  @override
  AlfredCache<T> evictionPolicy(EvictionPolicy evictionPolicy) =>
      call(evictionPolicy: evictionPolicy);

  @override
  AlfredCache<T> expiryPolicy(ExpiryPolicy expiryPolicy) =>
      call(expiryPolicy: expiryPolicy);

  @override
  AlfredCache<T> verbose(bool verbose) => call(verbose: verbose);

  @override
  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored. To update a single field use `AlfredCache<T>(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// AlfredCache<T>(...).copyWith(id: 12, name: "My name")
  /// ```
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
      fromEncodable:
          fromEncodable == const $CopyWithPlaceholder() || fromEncodable == null
          ? _value.fromEncodable
          // ignore: cast_nullable_to_non_nullable
          : fromEncodable as T Function(Map<String, dynamic>),
      path: path == const $CopyWithPlaceholder()
          ? _value.path
          // ignore: cast_nullable_to_non_nullable
          : path as String?,
      maxEntries:
          maxEntries == const $CopyWithPlaceholder() || maxEntries == null
          ? _value.maxEntries
          // ignore: cast_nullable_to_non_nullable
          : maxEntries as int,
      name: name == const $CopyWithPlaceholder() || name == null
          ? _value.name
          // ignore: cast_nullable_to_non_nullable
          : name as String,
      evictionPolicy:
          evictionPolicy == const $CopyWithPlaceholder() ||
              evictionPolicy == null
          ? _value.evictionPolicy
          // ignore: cast_nullable_to_non_nullable
          : evictionPolicy as EvictionPolicy,
      expiryPolicy:
          expiryPolicy == const $CopyWithPlaceholder() || expiryPolicy == null
          ? _value.expiryPolicy
          // ignore: cast_nullable_to_non_nullable
          : expiryPolicy as ExpiryPolicy,
      verbose: verbose == const $CopyWithPlaceholder() || verbose == null
          ? _value.verbose
          // ignore: cast_nullable_to_non_nullable
          : verbose as bool,
    );
  }
}

extension $AlfredCacheCopyWith<T> on AlfredCache<T> {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfAlfredCache.copyWith(...)` or `instanceOfAlfredCache.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$AlfredCacheCWProxy<T> get copyWith => _$AlfredCacheCWProxyImpl<T>(this);
}

// **************************************************************************
// EquatableGenerator
// **************************************************************************

extension _$AlfredCacheEquatableAnnotations on AlfredCache {
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
