// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'github_asset.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GithubAsset _$GithubAssetFromJson(Map<String, dynamic> json) => GithubAsset(
      url: Uri.parse(json['url'] as String),
      id: json['id'] as int,
      nodeId: json['node_id'] as String,
      name: json['name'] as String,
      label: json['label'] as String?,
      uploader: GithubAsset._githubUserFromJson(json['uploader']),
      contentType: json['content_type'] as String,
      state: json['state'] as String,
      size: json['size'] as int,
      downloadCount: json['download_count'] as int,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
      browserDownloadUrl: Uri.parse(json['browser_download_url'] as String),
    );

Map<String, dynamic> _$GithubAssetToJson(GithubAsset instance) =>
    <String, dynamic>{
      'url': instance.url.toString(),
      'id': instance.id,
      'node_id': instance.nodeId,
      'name': instance.name,
      'label': instance.label,
      'uploader': instance.uploader.toJson(),
      'content_type': instance.contentType,
      'state': instance.state,
      'size': instance.size,
      'download_count': instance.downloadCount,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
      'browser_download_url': instance.browserDownloadUrl.toString(),
    };
