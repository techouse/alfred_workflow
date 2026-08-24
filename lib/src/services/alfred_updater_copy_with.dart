part of 'alfred_updater.dart';

// `currentVersion` is parsed into a private `Version` field by the constructor.
// copy_with_extension_gen 15+ intentionally rejects transformed constructor
// parameters, so this proxy preserves the existing String-based public API.
abstract class _$AlfredUpdaterCWProxy {
  AlfredUpdater githubRepositoryUrl(Uri githubRepositoryUrl);

  AlfredUpdater currentVersion(String currentVersion);

  AlfredUpdater updateInterval(Duration updateInterval);

  AlfredUpdater cache(AlfredCache<GithubRelease>? cache);

  AlfredUpdater client(Client? client);

  AlfredUpdater call({
    Uri githubRepositoryUrl,
    String currentVersion,
    Duration updateInterval,
    AlfredCache<GithubRelease>? cache,
    Client? client,
  });
}

final class _$AlfredUpdaterCWProxyImpl implements _$AlfredUpdaterCWProxy {
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
  AlfredUpdater call({
    Object? githubRepositoryUrl = const $CopyWithPlaceholder(),
    Object? currentVersion = const $CopyWithPlaceholder(),
    Object? updateInterval = const $CopyWithPlaceholder(),
    Object? cache = const $CopyWithPlaceholder(),
    Object? client = const $CopyWithPlaceholder(),
  }) => AlfredUpdater(
    githubRepositoryUrl:
        githubRepositoryUrl == const $CopyWithPlaceholder() ||
            githubRepositoryUrl == null
        ? _value.githubRepositoryUrl
        : githubRepositoryUrl as Uri,
    currentVersion:
        currentVersion == const $CopyWithPlaceholder() || currentVersion == null
        ? _value.currentVersion
        : currentVersion as String,
    updateInterval:
        updateInterval == const $CopyWithPlaceholder() || updateInterval == null
        ? _value.updateInterval
        : updateInterval as Duration,
    cache: cache == const $CopyWithPlaceholder()
        ? _value.cache
        : cache as AlfredCache<GithubRelease>?,
    client: client == const $CopyWithPlaceholder()
        ? _value.client
        : client as Client?,
  );
}

extension $AlfredUpdaterCopyWith on AlfredUpdater {
  /// Returns a callable proxy that creates a copy with selected values changed.
  // ignore: library_private_types_in_public_api
  _$AlfredUpdaterCWProxy get copyWith => _$AlfredUpdaterCWProxyImpl(this);
}
