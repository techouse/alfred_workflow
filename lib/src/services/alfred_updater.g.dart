// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'alfred_updater.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$AlfredUpdaterCWProxy {
  AlfredUpdater githubRepositoryUrl(Uri githubRepositoryUrl);

  AlfredUpdater currentVersion(String currentVersion);

  AlfredUpdater updateInterval(Duration updateInterval);

  AlfredUpdater cache(AlfredCache<GithubRelease>? cache);

  AlfredUpdater client(Client? client);

  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored. To update a single field use `AlfredUpdater(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// AlfredUpdater(...).copyWith(id: 12, name: "My name")
  /// ```
  AlfredUpdater call({
    Uri githubRepositoryUrl,
    String currentVersion,
    Duration updateInterval,
    AlfredCache<GithubRelease>? cache,
    Client? client,
  });
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfAlfredUpdater.copyWith(...)` or call `instanceOfAlfredUpdater.copyWith.fieldName(value)` for a single field.
class _$AlfredUpdaterCWProxyImpl implements _$AlfredUpdaterCWProxy {
  const _$AlfredUpdaterCWProxyImpl(this._value);

  final AlfredUpdater _value;

  @override
  AlfredUpdater githubRepositoryUrl(Uri githubRepositoryUrl) =>
      call(githubRepositoryUrl: githubRepositoryUrl);

  @override
  AlfredUpdater currentVersion(String currentVersion) =>
      call(currentVersion: currentVersion);

  @override
  AlfredUpdater updateInterval(Duration updateInterval) =>
      call(updateInterval: updateInterval);

  @override
  AlfredUpdater cache(AlfredCache<GithubRelease>? cache) => call(cache: cache);

  @override
  AlfredUpdater client(Client? client) => call(client: client);

  @override
  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored. To update a single field use `AlfredUpdater(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// AlfredUpdater(...).copyWith(id: 12, name: "My name")
  /// ```
  AlfredUpdater call({
    Object? githubRepositoryUrl = const $CopyWithPlaceholder(),
    Object? currentVersion = const $CopyWithPlaceholder(),
    Object? updateInterval = const $CopyWithPlaceholder(),
    Object? cache = const $CopyWithPlaceholder(),
    Object? client = const $CopyWithPlaceholder(),
  }) {
    return AlfredUpdater(
      githubRepositoryUrl:
          githubRepositoryUrl == const $CopyWithPlaceholder() ||
              githubRepositoryUrl == null
          ? _value.githubRepositoryUrl
          // ignore: cast_nullable_to_non_nullable
          : githubRepositoryUrl as Uri,
      currentVersion:
          currentVersion == const $CopyWithPlaceholder() ||
              currentVersion == null
          ? _value.currentVersion
          // ignore: cast_nullable_to_non_nullable
          : currentVersion as String,
      updateInterval:
          updateInterval == const $CopyWithPlaceholder() ||
              updateInterval == null
          ? _value.updateInterval
          // ignore: cast_nullable_to_non_nullable
          : updateInterval as Duration,
      cache: cache == const $CopyWithPlaceholder()
          ? _value.cache
          // ignore: cast_nullable_to_non_nullable
          : cache as AlfredCache<GithubRelease>?,
      client: client == const $CopyWithPlaceholder()
          ? _value.client
          // ignore: cast_nullable_to_non_nullable
          : client as Client?,
    );
  }
}

extension $AlfredUpdaterCopyWith on AlfredUpdater {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfAlfredUpdater.copyWith(...)` or `instanceOfAlfredUpdater.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$AlfredUpdaterCWProxy get copyWith => _$AlfredUpdaterCWProxyImpl(this);
}

// **************************************************************************
// EquatableGenerator
// **************************************************************************

extension _$AlfredUpdaterEquatableAnnotations on AlfredUpdater {
  List<Object?> get _$props => [
    githubRepositoryUrl,
    updateInterval,
    cache,
    client,
    _currentVersion,
  ];
}
