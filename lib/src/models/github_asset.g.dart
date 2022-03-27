// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'github_asset.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$GithubAssetCWProxy {
  GithubAsset browserDownloadUrl(Uri browserDownloadUrl);

  GithubAsset contentType(String contentType);

  GithubAsset createdAt(DateTime createdAt);

  GithubAsset downloadCount(int downloadCount);

  GithubAsset id(int id);

  GithubAsset label(String? label);

  GithubAsset name(String name);

  GithubAsset nodeId(String nodeId);

  GithubAsset size(int size);

  GithubAsset state(String state);

  GithubAsset updatedAt(DateTime updatedAt);

  GithubAsset uploader(GithubUser uploader);

  GithubAsset url(Uri url);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `GithubAsset(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// GithubAsset(...).copyWith(id: 12, name: "My name")
  /// ````
  GithubAsset call({
    Uri? browserDownloadUrl,
    String? contentType,
    DateTime? createdAt,
    int? downloadCount,
    int? id,
    String? label,
    String? name,
    String? nodeId,
    int? size,
    String? state,
    DateTime? updatedAt,
    GithubUser? uploader,
    Uri? url,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfGithubAsset.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfGithubAsset.copyWith.fieldName(...)`
class _$GithubAssetCWProxyImpl implements _$GithubAssetCWProxy {
  final GithubAsset _value;

  const _$GithubAssetCWProxyImpl(this._value);

  @override
  GithubAsset browserDownloadUrl(Uri browserDownloadUrl) =>
      this(browserDownloadUrl: browserDownloadUrl);

  @override
  GithubAsset contentType(String contentType) => this(contentType: contentType);

  @override
  GithubAsset createdAt(DateTime createdAt) => this(createdAt: createdAt);

  @override
  GithubAsset downloadCount(int downloadCount) =>
      this(downloadCount: downloadCount);

  @override
  GithubAsset id(int id) => this(id: id);

  @override
  GithubAsset label(String? label) => this(label: label);

  @override
  GithubAsset name(String name) => this(name: name);

  @override
  GithubAsset nodeId(String nodeId) => this(nodeId: nodeId);

  @override
  GithubAsset size(int size) => this(size: size);

  @override
  GithubAsset state(String state) => this(state: state);

  @override
  GithubAsset updatedAt(DateTime updatedAt) => this(updatedAt: updatedAt);

  @override
  GithubAsset uploader(GithubUser uploader) => this(uploader: uploader);

  @override
  GithubAsset url(Uri url) => this(url: url);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `GithubAsset(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// GithubAsset(...).copyWith(id: 12, name: "My name")
  /// ````
  GithubAsset call({
    Object? browserDownloadUrl = const $CopyWithPlaceholder(),
    Object? contentType = const $CopyWithPlaceholder(),
    Object? createdAt = const $CopyWithPlaceholder(),
    Object? downloadCount = const $CopyWithPlaceholder(),
    Object? id = const $CopyWithPlaceholder(),
    Object? label = const $CopyWithPlaceholder(),
    Object? name = const $CopyWithPlaceholder(),
    Object? nodeId = const $CopyWithPlaceholder(),
    Object? size = const $CopyWithPlaceholder(),
    Object? state = const $CopyWithPlaceholder(),
    Object? updatedAt = const $CopyWithPlaceholder(),
    Object? uploader = const $CopyWithPlaceholder(),
    Object? url = const $CopyWithPlaceholder(),
  }) {
    return GithubAsset(
      browserDownloadUrl: browserDownloadUrl == const $CopyWithPlaceholder() ||
              browserDownloadUrl == null
          ? _value.browserDownloadUrl
          // ignore: cast_nullable_to_non_nullable
          : browserDownloadUrl as Uri,
      contentType:
          contentType == const $CopyWithPlaceholder() || contentType == null
              ? _value.contentType
              // ignore: cast_nullable_to_non_nullable
              : contentType as String,
      createdAt: createdAt == const $CopyWithPlaceholder() || createdAt == null
          ? _value.createdAt
          // ignore: cast_nullable_to_non_nullable
          : createdAt as DateTime,
      downloadCount:
          downloadCount == const $CopyWithPlaceholder() || downloadCount == null
              ? _value.downloadCount
              // ignore: cast_nullable_to_non_nullable
              : downloadCount as int,
      id: id == const $CopyWithPlaceholder() || id == null
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as int,
      label: label == const $CopyWithPlaceholder()
          ? _value.label
          // ignore: cast_nullable_to_non_nullable
          : label as String?,
      name: name == const $CopyWithPlaceholder() || name == null
          ? _value.name
          // ignore: cast_nullable_to_non_nullable
          : name as String,
      nodeId: nodeId == const $CopyWithPlaceholder() || nodeId == null
          ? _value.nodeId
          // ignore: cast_nullable_to_non_nullable
          : nodeId as String,
      size: size == const $CopyWithPlaceholder() || size == null
          ? _value.size
          // ignore: cast_nullable_to_non_nullable
          : size as int,
      state: state == const $CopyWithPlaceholder() || state == null
          ? _value.state
          // ignore: cast_nullable_to_non_nullable
          : state as String,
      updatedAt: updatedAt == const $CopyWithPlaceholder() || updatedAt == null
          ? _value.updatedAt
          // ignore: cast_nullable_to_non_nullable
          : updatedAt as DateTime,
      uploader: uploader == const $CopyWithPlaceholder() || uploader == null
          ? _value.uploader
          // ignore: cast_nullable_to_non_nullable
          : uploader as GithubUser,
      url: url == const $CopyWithPlaceholder() || url == null
          ? _value.url
          // ignore: cast_nullable_to_non_nullable
          : url as Uri,
    );
  }
}

extension $GithubAssetCopyWith on GithubAsset {
  /// Returns a callable class that can be used as follows: `instanceOfclass GithubAsset with EquatableMixin.name.copyWith(...)` or like so:`instanceOfclass GithubAsset with EquatableMixin.name.copyWith.fieldName(...)`.
  _$GithubAssetCWProxy get copyWith => _$GithubAssetCWProxyImpl(this);
}

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
