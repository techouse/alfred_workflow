// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'alfred_updater.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$AlfredUpdaterCWProxy {
  AlfredUpdater cache(AlfredCache<GithubRelease>? cache);

  AlfredUpdater client(Client? client);

  AlfredUpdater currentVersion(String currentVersion);

  AlfredUpdater githubRepositoryUrl(Uri githubRepositoryUrl);

  AlfredUpdater updateInterval(Duration updateInterval);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `AlfredUpdater(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// AlfredUpdater(...).copyWith(id: 12, name: "My name")
  /// ````
  AlfredUpdater call({
    AlfredCache<GithubRelease>? cache,
    Client? client,
    String? currentVersion,
    Uri? githubRepositoryUrl,
    Duration? updateInterval,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfAlfredUpdater.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfAlfredUpdater.copyWith.fieldName(...)`
class _$AlfredUpdaterCWProxyImpl implements _$AlfredUpdaterCWProxy {
  final AlfredUpdater _value;

  const _$AlfredUpdaterCWProxyImpl(this._value);

  @override
  AlfredUpdater cache(AlfredCache<GithubRelease>? cache) => this(cache: cache);

  @override
  AlfredUpdater client(Client? client) => this(client: client);

  @override
  AlfredUpdater currentVersion(String currentVersion) =>
      this(currentVersion: currentVersion);

  @override
  AlfredUpdater githubRepositoryUrl(Uri githubRepositoryUrl) =>
      this(githubRepositoryUrl: githubRepositoryUrl);

  @override
  AlfredUpdater updateInterval(Duration updateInterval) =>
      this(updateInterval: updateInterval);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `AlfredUpdater(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// AlfredUpdater(...).copyWith(id: 12, name: "My name")
  /// ````
  AlfredUpdater call({
    Object? cache = const $CopyWithPlaceholder(),
    Object? client = const $CopyWithPlaceholder(),
    Object? currentVersion = const $CopyWithPlaceholder(),
    Object? githubRepositoryUrl = const $CopyWithPlaceholder(),
    Object? updateInterval = const $CopyWithPlaceholder(),
  }) {
    return AlfredUpdater(
      cache: cache == const $CopyWithPlaceholder()
          ? _value.cache
          // ignore: cast_nullable_to_non_nullable
          : cache as AlfredCache<GithubRelease>?,
      client: client == const $CopyWithPlaceholder()
          ? _value.client
          // ignore: cast_nullable_to_non_nullable
          : client as Client?,
      currentVersion: currentVersion == const $CopyWithPlaceholder() ||
              currentVersion == null
          ? _value.currentVersion
          // ignore: cast_nullable_to_non_nullable
          : currentVersion as String,
      githubRepositoryUrl:
          githubRepositoryUrl == const $CopyWithPlaceholder() ||
                  githubRepositoryUrl == null
              ? _value.githubRepositoryUrl
              // ignore: cast_nullable_to_non_nullable
              : githubRepositoryUrl as Uri,
      updateInterval: updateInterval == const $CopyWithPlaceholder() ||
              updateInterval == null
          ? _value.updateInterval
          // ignore: cast_nullable_to_non_nullable
          : updateInterval as Duration,
    );
  }
}

extension $AlfredUpdaterCopyWith on AlfredUpdater {
  /// Returns a callable class that can be used as follows: `instanceOfAlfredUpdater.copyWith(...)` or like so:`instanceOfAlfredUpdater.copyWith.fieldName(...)`.
  _$AlfredUpdaterCWProxy get copyWith => _$AlfredUpdaterCWProxyImpl(this);
}
