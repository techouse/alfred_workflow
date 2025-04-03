// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'alfred_updater.dart';

// **************************************************************************
// AutoequalGenerator
// **************************************************************************

extension _$AlfredUpdaterAutoequal on AlfredUpdater {
  List<Object?> get _$props => [
        githubRepositoryUrl,
        updateInterval,
        cache,
        client,
        _currentVersion,
      ];
}

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$AlfredUpdaterCWProxy {
  AlfredUpdater githubRepositoryUrl(Uri githubRepositoryUrl);

  AlfredUpdater currentVersion(String currentVersion);

  AlfredUpdater updateInterval(Duration updateInterval);

  AlfredUpdater cache(AlfredCache<GithubRelease>? cache);

  AlfredUpdater client(Client? client);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `AlfredUpdater(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// AlfredUpdater(...).copyWith(id: 12, name: "My name")
  /// ````
  AlfredUpdater call({
    Uri githubRepositoryUrl,
    String currentVersion,
    Duration updateInterval,
    AlfredCache<GithubRelease>? cache,
    Client? client,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfAlfredUpdater.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfAlfredUpdater.copyWith.fieldName(...)`
class _$AlfredUpdaterCWProxyImpl implements _$AlfredUpdaterCWProxy {
  const _$AlfredUpdaterCWProxyImpl(this._value);

  final AlfredUpdater _value;

  @override
  AlfredUpdater githubRepositoryUrl(Uri githubRepositoryUrl) =>
      this(githubRepositoryUrl: githubRepositoryUrl);

  @override
  AlfredUpdater currentVersion(String currentVersion) =>
      this(currentVersion: currentVersion);

  @override
  AlfredUpdater updateInterval(Duration updateInterval) =>
      this(updateInterval: updateInterval);

  @override
  AlfredUpdater cache(AlfredCache<GithubRelease>? cache) => this(cache: cache);

  @override
  AlfredUpdater client(Client? client) => this(client: client);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `AlfredUpdater(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// AlfredUpdater(...).copyWith(id: 12, name: "My name")
  /// ````
  AlfredUpdater call({
    Object? githubRepositoryUrl = const $CopyWithPlaceholder(),
    Object? currentVersion = const $CopyWithPlaceholder(),
    Object? updateInterval = const $CopyWithPlaceholder(),
    Object? cache = const $CopyWithPlaceholder(),
    Object? client = const $CopyWithPlaceholder(),
  }) {
    return AlfredUpdater(
      githubRepositoryUrl: githubRepositoryUrl == const $CopyWithPlaceholder()
          ? _value.githubRepositoryUrl
          // ignore: cast_nullable_to_non_nullable
          : githubRepositoryUrl as Uri,
      currentVersion: currentVersion == const $CopyWithPlaceholder()
          ? _value.currentVersion
          // ignore: cast_nullable_to_non_nullable
          : currentVersion as String,
      updateInterval: updateInterval == const $CopyWithPlaceholder()
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
  /// Returns a callable class that can be used as follows: `instanceOfAlfredUpdater.copyWith(...)` or like so:`instanceOfAlfredUpdater.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$AlfredUpdaterCWProxy get copyWith => _$AlfredUpdaterCWProxyImpl(this);
}
