// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'github_release.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GithubRelease _$GithubReleaseFromJson(Map<String, dynamic> json) =>
    GithubRelease(
      url: Uri.parse(json['url'] as String),
      assetsUrl: Uri.parse(json['assets_url'] as String),
      uploadUrl: Uri.parse(json['upload_url'] as String),
      htmlUrl: Uri.parse(json['html_url'] as String),
      id: json['id'] as int,
      author: GithubRelease._githubUserFromJson(json['author']),
      nodeId: json['node_id'] as String,
      tagName: VersionConverter.instance.fromJson(json['tag_name'] as String),
      targetCommitish: json['target_commitish'] as String,
      name: json['name'] as String,
      draft: json['draft'] as bool,
      prerelease: json['prerelease'] as bool,
      createdAt: DateTime.parse(json['created_at'] as String),
      publishedAt: DateTime.parse(json['published_at'] as String),
      assets: GithubRelease._githubAssetsFromJson(json['assets'] as List),
      tarballUrl: Uri.parse(json['tarball_url'] as String),
      zipballUrl: Uri.parse(json['zipball_url'] as String),
      body: json['body'] as String,
    );

Map<String, dynamic> _$GithubReleaseToJson(GithubRelease instance) =>
    <String, dynamic>{
      'url': instance.url.toString(),
      'assets_url': instance.assetsUrl.toString(),
      'upload_url': instance.uploadUrl.toString(),
      'html_url': instance.htmlUrl.toString(),
      'id': instance.id,
      'author': instance.author.toJson(),
      'node_id': instance.nodeId,
      'tag_name': VersionConverter.instance.toJson(instance.tagName),
      'target_commitish': instance.targetCommitish,
      'name': instance.name,
      'draft': instance.draft,
      'prerelease': instance.prerelease,
      'created_at': instance.createdAt.toIso8601String(),
      'published_at': instance.publishedAt.toIso8601String(),
      'assets': instance.assets.map((e) => e.toJson()).toList(),
      'tarball_url': instance.tarballUrl.toString(),
      'zipball_url': instance.zipballUrl.toString(),
      'body': instance.body,
    };
