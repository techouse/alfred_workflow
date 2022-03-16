import 'dart:convert' show jsonDecode;
import 'dart:io' show Directory, File, Process, stderr, stdout;

import 'package:http/http.dart' as http;
import 'package:pub_semver/pub_semver.dart' show Version;
import 'package:stash/stash_api.dart'
    show Cache, CreatedExpiryPolicy, FifoEvictionPolicy;

import '../extensions/string_helpers.dart';
import '../models/github_asset.dart';
import '../models/github_release.dart';
import 'alfred_cache.dart';

class AlfredUpdater {
  AlfredUpdater({
    required this.githubRepositoryUrl,
    required String currentVersion,
    this.updateInterval = Duration.zero,
  })  : assert(githubRepositoryUrl.host == 'github.com'),
        this.currentVersion = Version.parse(currentVersion);

  final Uri githubRepositoryUrl;
  final Duration updateInterval;
  late final Version currentVersion;
  late final Cache<GithubRelease> _cache = AlfredCache<GithubRelease>(
    fromEncodable: (Map<String, dynamic> json) => GithubRelease.fromJson(json),
    maxEntries: 1,
    name: 'update_cache',
    evictionPolicy: const FifoEvictionPolicy(),
    expiryPolicy: CreatedExpiryPolicy(updateInterval),
  ).cache;
  static const String updateKey = 'update';

  Future<bool> updateAvailable() async {
    final GithubRelease? cachedRelease = await _cache.get(updateKey.md5hex);

    if (cachedRelease != null) {
      return cachedRelease.tagName > currentVersion;
    } else {
      final GithubRelease? release = await _fetchLatestRelease();

      if (release != null) {
        await _cache.put(updateKey.md5hex, release);

        return release.tagName > currentVersion;
      }
    }

    return false;
  }

  Future<void> update() async {
    if (!await updateAvailable()) return;

    final GithubRelease? release =
        await _cache.get(updateKey.md5hex) ?? await _fetchLatestRelease();
    if (release != null) {
      if (release.tagName > currentVersion) {
        final GithubAsset? asset = _findAlfredWorkflowAsset(release);
        if (asset != null) {
          final File? assetFile = await _downloadAsset(asset);
          if (assetFile != null) {
            await _openAssetFile(assetFile);
          }
        }
      }
    }
  }

  Future<GithubRelease?> _fetchLatestRelease() async {
    final http.Response response = await http.get(
      Uri.https(
        'api.github.com',
        '/repos/${githubRepositoryUrl.path.substring(1)}/releases/latest',
      ),
    );

    if (response.statusCode < 400) {
      return GithubRelease.fromJson(jsonDecode(response.body));
    }

    return null;
  }

  GithubAsset? _findAlfredWorkflowAsset(GithubRelease release) {
    for (final GithubAsset asset in release.assets) {
      if (asset.name.endsWith('.alfredworkflow')) {
        return asset;
      }
    }

    return null;
  }

  Future<File?> _downloadAsset(GithubAsset asset) async {
    final http.Response response = await http.get(asset.browserDownloadUrl);

    if (response.statusCode < 400) {
      final Directory tempDir = await Directory.systemTemp.createTemp(
        'alfred_workflow_update',
      );
      final File file = await File('${tempDir.path}/${asset.name}').create();
      file.writeAsBytes(response.bodyBytes);

      return file;
    }

    return null;
  }

  Future<void> _openAssetFile(File assetFile) async {
    final result = await Process.run('open', [assetFile.absolute.path]);
    stdout.write(result.stdout);
    stderr.write(result.stderr);
  }
}
