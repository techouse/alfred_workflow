import 'dart:convert' show jsonDecode;
import 'dart:io' show Process, stderr, stdout;

import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:file/file.dart' show Directory, File, FileSystem;
import 'package:file/local.dart' show LocalFileSystem;
import 'package:http/http.dart' show Client, Response, get;
import 'package:meta/meta.dart' show visibleForTesting;
import 'package:pub_semver/pub_semver.dart' show Version;
import 'package:stash/stash_api.dart'
    show Cache, CreatedExpiryPolicy, FifoEvictionPolicy;

import '../extensions/string_helpers.dart';
import '../models/github_asset.dart';
import '../models/github_release.dart';
import 'alfred_cache.dart';

part 'alfred_updater.g.dart';

@CopyWith()
class AlfredUpdater {
  AlfredUpdater({
    required this.githubRepositoryUrl,
    required String currentVersion,
    this.updateInterval = Duration.zero,
    AlfredCache<GithubRelease>? this.cache,
    this.client,
  })  : assert(githubRepositoryUrl.host == 'github.com'),
        _currentVersion = Version.parse(currentVersion);

  static const String updateKey = 'update';

  final Uri githubRepositoryUrl;
  final Duration updateInterval;
  final AlfredCache<GithubRelease>? cache;
  final Client? client;
  late final Cache<GithubRelease> _cache = (cache ??
          AlfredCache<GithubRelease>(
            fromEncodable: (Map<String, dynamic> json) =>
                GithubRelease.fromJson(json),
            maxEntries: 1,
            name: 'update_cache',
            evictionPolicy: const FifoEvictionPolicy(),
            expiryPolicy: CreatedExpiryPolicy(updateInterval),
          ))
      .cache;
  late final Version _currentVersion;

  String get currentVersion => _currentVersion.toString();

  Future<bool> updateAvailable() async {
    final GithubRelease? cachedRelease = await _cache.get(updateKey.md5hex);

    if (cachedRelease != null) {
      return cachedRelease.tagName > _currentVersion;
    } else {
      final GithubRelease? release = await fetchLatestRelease();

      if (release != null) {
        await _cache.put(updateKey.md5hex, release);

        return release.tagName > _currentVersion;
      }
    }

    return false;
  }

  Future<void> update() async {
    if (!await updateAvailable()) return;

    final GithubRelease? release =
        await _cache.get(updateKey.md5hex) ?? await fetchLatestRelease();
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
  }

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

  @visibleForTesting
  GithubAsset? findAlfredWorkflowAsset(GithubRelease release) {
    for (final GithubAsset asset in release.assets) {
      if (asset.name.endsWith('.alfredworkflow')) {
        return asset;
      }
    }

    return null;
  }

  @visibleForTesting
  Future<File?> downloadAsset(
    GithubAsset asset, {
    FileSystem? fileSystem,
    Directory? directory,
  }) async {
    final Response response = client != null
        ? await client!.get(asset.browserDownloadUrl)
        : await get(asset.browserDownloadUrl);

    if (response.statusCode < 400) {
      fileSystem ??= LocalFileSystem();
      directory ??= await fileSystem.systemTempDirectory.createTemp(
        'alfred_workflow_update',
      );
      final File file =
          await fileSystem.file('${directory.path}/${asset.name}').create();
      file.writeAsBytes(response.bodyBytes);

      return file;
    }

    return null;
  }

  @visibleForTesting
  Future<void> openAssetFile(File assetFile) async {
    final result = await Process.run('open', [assetFile.absolute.path]);
    stdout.write(result.stdout);
    stderr.write(result.stderr);
  }
}
