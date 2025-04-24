import 'dart:convert' show jsonDecode;
import 'dart:io' show Process, stderr, stdout;

import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:equatable_annotations/equatable_annotations.dart';
import 'package:file/file.dart' show Directory, File, FileSystem;
import 'package:file/local.dart' show LocalFileSystem;
import 'package:http/http.dart' show Client, Response, get;
import 'package:meta/meta.dart' show visibleForTesting;
import 'package:pub_semver/pub_semver.dart' show Version;
import 'package:stash/stash_api.dart'
    show Cache, CreatedExpiryPolicy, FifoEvictionPolicy, Store;

import '../extensions/string_helpers.dart';
import '../models/github_asset.dart';
import '../models/github_release.dart';
import 'alfred_cache.dart';

part 'alfred_updater.g.dart';

@CopyWith()
final class AlfredUpdater with EquatableMixin {
  /// Builds an [AlfredUpdater]
  ///
  /// * [githubRepositoryUrl] : The [Uri] of the workflow's Github repository
  /// * [currentVersion] : The workflow's semver version
  /// * [updateInterval] : Optionally customize how often to automatically check for updates
  /// * [cache] : Optionally customize the [AlfredCache] providing a [Cache] backed by a [Store]
  /// * [client] : Optionally customize the http [Client]
  AlfredUpdater({
    required this.githubRepositoryUrl,
    required String currentVersion,
    this.updateInterval = Duration.zero,
    this.cache,
    this.client,
  })  : assert(githubRepositoryUrl.host == 'github.com'),
        _currentVersion = Version.parse(currentVersion);

  /// The cache key under which the cached [GithubRelease] is stored
  static const String updateKey = 'update';

  /// The [Uri] of the workflow's Github repository
  final Uri githubRepositoryUrl;

  /// How often to automatically check for updates
  final Duration updateInterval;

  /// Optionally customize the [AlfredCache] providing a [Cache]
  final AlfredCache<GithubRelease>? cache;

  /// Optionally customize the [Client]
  final Client? client;

  @ignore
  @visibleForTesting
  late final Future<Cache<GithubRelease>> fileCache = switch (cache) {
    // coverage:ignore-start
    null => AlfredCache<GithubRelease>(
        fromEncodable: GithubRelease.fromJson,
        maxEntries: 1,
        name: 'update_cache',
        evictionPolicy: const FifoEvictionPolicy(),
        expiryPolicy: CreatedExpiryPolicy(updateInterval),
      ).cache,
    // coverage:ignore-end
    _ => cache!.cache,
  };

  /// The workflow's semver [Version]
  late final Version _currentVersion;

  /// Get a [String] representation of the [_currentVersion].
  @ignore
  String get currentVersion => _currentVersion.toString();

  /// Check if an update is available .
  ///
  /// Checking the workflow's Github repository URL and version.
  Future<bool> updateAvailable() async {
    final Cache<GithubRelease> cache = await fileCache;

    final GithubRelease? cachedRelease = await cache.get(updateKey.md5hex);

    if (cachedRelease != null) {
      return cachedRelease.tagName > _currentVersion;
    } else {
      final GithubRelease? release = await fetchLatestRelease();

      if (release != null) {
        await cache.put(updateKey.md5hex, release);

        return release.tagName > _currentVersion;
      }
    }

    return false;
  }

  /// Convenience method to update the workflow.
  ///
  /// - First, check if [updateAvailable] returns true.
  /// - Second, check if any [GithubRelease] is cached; if not [fetchLatestRelease] from Github.
  /// - Third, compare the [_currentVersion] and the [GithubRelease] version; if it's greater than the current version.
  /// - Lastly, [findAlfredWorkflowAsset] in the [GithubRelease] and [downloadAsset] and [openAssetFile].
  // coverage:ignore-start
  Future<void> update() async {
    if (!await updateAvailable()) return;

    final GithubRelease? release =
        await (await fileCache).get(updateKey.md5hex) ??
            await fetchLatestRelease();
    if (release != null) {
      if (release.tagName > _currentVersion) {
        final GithubAsset? asset = findAlfredWorkflowAsset(release);
        if (asset != null) {
          final File? assetFile = await downloadAsset(asset);
          if (assetFile != null) {
            await openAssetFile(assetFile);
          }
        }
      }
    }
  } // coverage:ignore-end

  /// Fetch latest release from the [Github Releases API](https://docs.github.com/en/rest/reference/releases#get-the-latest-release).
  @visibleForTesting
  Future<GithubRelease?> fetchLatestRelease() async {
    final Uri url = Uri.https(
      'api.github.com',
      '/repos/${githubRepositoryUrl.path.substring(1)}/releases/latest',
    );
    final Response response =
        client != null ? await client!.get(url) : await get(url);

    if (response.statusCode < 400) {
      return GithubRelease.fromJson(jsonDecode(response.body));
    }

    return null;
  }

  /// Find the first [GithubAsset] ending in '.alfredworkflow' file in the [GithubRelease] assets list.
  @visibleForTesting
  GithubAsset? findAlfredWorkflowAsset(GithubRelease release) {
    for (final GithubAsset asset in release.assets) {
      if (asset.name.endsWith('.alfredworkflow')) {
        return asset;
      }
    }

    return null;
  }

  /// Download the '*.alfredworkflow' [GithubAsset] to the system temp and return a [File]
  @visibleForTesting
  Future<File?> downloadAsset(
    GithubAsset asset, {
    FileSystem? fileSystem,
    Directory? directory,
  }) async {
    final Response response = client != null
        ? await client!.get(asset.browserDownloadUrl)
        : await get(asset.browserDownloadUrl); // coverage:ignore-line

    if (response.statusCode < 400) {
      // coverage:ignore-start
      fileSystem ??= const LocalFileSystem();
      directory ??= await fileSystem.systemTempDirectory.createTemp(
        'alfred_workflow_update',
      );
      // coverage:ignore-end
      final File file =
          await fileSystem.file('${directory.path}/${asset.name}').create();
      file.writeAsBytes(response.bodyBytes);

      return file;
    }

    return null;
  }

  /// Execute the downloaded '*.alfredworkflow' [GithubAsset] using the macOS open Command
  // coverage:ignore-start
  @visibleForTesting
  Future<void> openAssetFile(File assetFile) async {
    final result = await Process.run('open', [assetFile.absolute.path]);
    stdout.write(result.stdout);
    stderr.write(result.stderr);
  } // coverage:ignore-end

  @override
  List<Object?> get props => _$props;
}
