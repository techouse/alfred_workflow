import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart' show EquatableMixin;
import 'package:json_annotation/json_annotation.dart';
import 'package:pub_semver/pub_semver.dart' show Version;

import '../converters/version_converter.dart';
import 'github_asset.dart';
import 'github_user.dart';

part 'github_release.g.dart';

/// [GithubRelease] implements all the properties of the [Github Releases API](https://docs.github.com/en/rest/reference/releases)

@CopyWith()
@JsonSerializable(explicitToJson: true)
@VersionConverter.instance
final class GithubRelease with EquatableMixin {
  const GithubRelease({
    required this.url,
    required this.assetsUrl,
    required this.uploadUrl,
    required this.htmlUrl,
    required this.id,
    required this.author,
    required this.nodeId,
    required this.tagName,
    required this.targetCommitish,
    required this.name,
    required this.draft,
    required this.prerelease,
    required this.createdAt,
    required this.publishedAt,
    required this.assets,
    required this.tarballUrl,
    required this.zipballUrl,
    required this.body,
  });

  final Uri url;
  final Uri assetsUrl;
  final Uri uploadUrl;
  final Uri htmlUrl;
  final int id;
  @JsonKey(fromJson: _githubUserFromJson)
  final GithubUser author;
  final String nodeId;
  final Version tagName;
  final String targetCommitish;
  final String name;
  final bool draft;
  final bool prerelease;
  final DateTime createdAt;
  final DateTime publishedAt;
  @JsonKey(fromJson: _githubAssetsFromJson)
  final List<GithubAsset> assets;
  final Uri tarballUrl;
  final Uri zipballUrl;
  final String body;

  static GithubUser _githubUserFromJson(dynamic json) =>
      GithubUser.fromJson((Map<String, dynamic>.from(json)));

  static List<GithubAsset> _githubAssetsFromJson(List<dynamic> items) => items
      .map((e) => GithubAsset.fromJson(Map<String, dynamic>.from(e)))
      .toList();

  factory GithubRelease.fromJson(Map<String, dynamic> json) =>
      _$GithubReleaseFromJson(json);

  Map<String, dynamic> toJson() => _$GithubReleaseToJson(this);

  @override
  List<Object?> get props => _$props;
}
