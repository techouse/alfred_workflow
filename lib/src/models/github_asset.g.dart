// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'github_asset.dart';

// **************************************************************************
// AutoequalGenerator
// **************************************************************************

mixin _$GithubAssetAutoequalMixin on EquatableMixin {
  @override
  List<Object?> get props =>
      _$GithubAssetAutoequal(this as GithubAsset)._$props;
}

extension _$GithubAssetAutoequal on GithubAsset {
  List<Object?> get _$props => [
        url,
        id,
        nodeId,
        name,
        label,
        uploader,
        contentType,
        state,
        size,
        downloadCount,
        createdAt,
        updatedAt,
        browserDownloadUrl
      ];
}

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$GithubAssetCWProxy {
  GithubAsset url(Uri url);

  GithubAsset id(int id);

  GithubAsset nodeId(String nodeId);

  GithubAsset name(String name);

  GithubAsset label(String? label);

  GithubAsset uploader(GithubUser uploader);

  GithubAsset contentType(String contentType);

  GithubAsset state(String state);

  GithubAsset size(int size);

  GithubAsset downloadCount(int downloadCount);

  GithubAsset createdAt(DateTime createdAt);

  GithubAsset updatedAt(DateTime updatedAt);

  GithubAsset browserDownloadUrl(Uri browserDownloadUrl);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `GithubAsset(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// GithubAsset(...).copyWith(id: 12, name: "My name")
  /// ````
  GithubAsset call({
    Uri? url,
    int? id,
    String? nodeId,
    String? name,
    String? label,
    GithubUser? uploader,
    String? contentType,
    String? state,
    int? size,
    int? downloadCount,
    DateTime? createdAt,
    DateTime? updatedAt,
    Uri? browserDownloadUrl,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfGithubAsset.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfGithubAsset.copyWith.fieldName(...)`
class _$GithubAssetCWProxyImpl implements _$GithubAssetCWProxy {
  const _$GithubAssetCWProxyImpl(this._value);

  final GithubAsset _value;

  @override
  GithubAsset url(Uri url) => this(url: url);

  @override
  GithubAsset id(int id) => this(id: id);

  @override
  GithubAsset nodeId(String nodeId) => this(nodeId: nodeId);

  @override
  GithubAsset name(String name) => this(name: name);

  @override
  GithubAsset label(String? label) => this(label: label);

  @override
  GithubAsset uploader(GithubUser uploader) => this(uploader: uploader);

  @override
  GithubAsset contentType(String contentType) => this(contentType: contentType);

  @override
  GithubAsset state(String state) => this(state: state);

  @override
  GithubAsset size(int size) => this(size: size);

  @override
  GithubAsset downloadCount(int downloadCount) =>
      this(downloadCount: downloadCount);

  @override
  GithubAsset createdAt(DateTime createdAt) => this(createdAt: createdAt);

  @override
  GithubAsset updatedAt(DateTime updatedAt) => this(updatedAt: updatedAt);

  @override
  GithubAsset browserDownloadUrl(Uri browserDownloadUrl) =>
      this(browserDownloadUrl: browserDownloadUrl);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `GithubAsset(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// GithubAsset(...).copyWith(id: 12, name: "My name")
  /// ````
  GithubAsset call({
    Object? url = const $CopyWithPlaceholder(),
    Object? id = const $CopyWithPlaceholder(),
    Object? nodeId = const $CopyWithPlaceholder(),
    Object? name = const $CopyWithPlaceholder(),
    Object? label = const $CopyWithPlaceholder(),
    Object? uploader = const $CopyWithPlaceholder(),
    Object? contentType = const $CopyWithPlaceholder(),
    Object? state = const $CopyWithPlaceholder(),
    Object? size = const $CopyWithPlaceholder(),
    Object? downloadCount = const $CopyWithPlaceholder(),
    Object? createdAt = const $CopyWithPlaceholder(),
    Object? updatedAt = const $CopyWithPlaceholder(),
    Object? browserDownloadUrl = const $CopyWithPlaceholder(),
  }) {
    return GithubAsset(
      url: url == const $CopyWithPlaceholder() || url == null
          ? _value.url
          // ignore: cast_nullable_to_non_nullable
          : url as Uri,
      id: id == const $CopyWithPlaceholder() || id == null
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as int,
      nodeId: nodeId == const $CopyWithPlaceholder() || nodeId == null
          ? _value.nodeId
          // ignore: cast_nullable_to_non_nullable
          : nodeId as String,
      name: name == const $CopyWithPlaceholder() || name == null
          ? _value.name
          // ignore: cast_nullable_to_non_nullable
          : name as String,
      label: label == const $CopyWithPlaceholder()
          ? _value.label
          // ignore: cast_nullable_to_non_nullable
          : label as String?,
      uploader: uploader == const $CopyWithPlaceholder() || uploader == null
          ? _value.uploader
          // ignore: cast_nullable_to_non_nullable
          : uploader as GithubUser,
      contentType:
          contentType == const $CopyWithPlaceholder() || contentType == null
              ? _value.contentType
              // ignore: cast_nullable_to_non_nullable
              : contentType as String,
      state: state == const $CopyWithPlaceholder() || state == null
          ? _value.state
          // ignore: cast_nullable_to_non_nullable
          : state as String,
      size: size == const $CopyWithPlaceholder() || size == null
          ? _value.size
          // ignore: cast_nullable_to_non_nullable
          : size as int,
      downloadCount:
          downloadCount == const $CopyWithPlaceholder() || downloadCount == null
              ? _value.downloadCount
              // ignore: cast_nullable_to_non_nullable
              : downloadCount as int,
      createdAt: createdAt == const $CopyWithPlaceholder() || createdAt == null
          ? _value.createdAt
          // ignore: cast_nullable_to_non_nullable
          : createdAt as DateTime,
      updatedAt: updatedAt == const $CopyWithPlaceholder() || updatedAt == null
          ? _value.updatedAt
          // ignore: cast_nullable_to_non_nullable
          : updatedAt as DateTime,
      browserDownloadUrl: browserDownloadUrl == const $CopyWithPlaceholder() ||
              browserDownloadUrl == null
          ? _value.browserDownloadUrl
          // ignore: cast_nullable_to_non_nullable
          : browserDownloadUrl as Uri,
    );
  }
}

extension $GithubAssetCopyWith on GithubAsset {
  /// Returns a callable class that can be used as follows: `instanceOfGithubAsset.copyWith(...)` or like so:`instanceOfGithubAsset.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
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
