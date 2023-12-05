// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'github_release.dart';

// **************************************************************************
// AutoequalGenerator
// **************************************************************************

mixin _$GithubReleaseAutoequalMixin on EquatableMixin {
  @override
  List<Object?> get props =>
      _$GithubReleaseAutoequal((this as GithubRelease))._$props;
}

extension _$GithubReleaseAutoequal on GithubRelease {
  List<Object?> get _autoequalProps => _$props;
  List<Object?> get _$props => [
        url,
        assetsUrl,
        uploadUrl,
        htmlUrl,
        id,
        author,
        nodeId,
        tagName,
        targetCommitish,
        name,
        draft,
        prerelease,
        createdAt,
        publishedAt,
        assets,
        tarballUrl,
        zipballUrl,
        body,
      ];
}

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$GithubReleaseCWProxy {
  GithubRelease url(Uri url);

  GithubRelease assetsUrl(Uri assetsUrl);

  GithubRelease uploadUrl(Uri uploadUrl);

  GithubRelease htmlUrl(Uri htmlUrl);

  GithubRelease id(int id);

  GithubRelease author(GithubUser author);

  GithubRelease nodeId(String nodeId);

  GithubRelease tagName(Version tagName);

  GithubRelease targetCommitish(String targetCommitish);

  GithubRelease name(String name);

  GithubRelease draft(bool draft);

  GithubRelease prerelease(bool prerelease);

  GithubRelease createdAt(DateTime createdAt);

  GithubRelease publishedAt(DateTime publishedAt);

  GithubRelease assets(List<GithubAsset> assets);

  GithubRelease tarballUrl(Uri tarballUrl);

  GithubRelease zipballUrl(Uri zipballUrl);

  GithubRelease body(String body);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `GithubRelease(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// GithubRelease(...).copyWith(id: 12, name: "My name")
  /// ````
  GithubRelease call({
    Uri? url,
    Uri? assetsUrl,
    Uri? uploadUrl,
    Uri? htmlUrl,
    int? id,
    GithubUser? author,
    String? nodeId,
    Version? tagName,
    String? targetCommitish,
    String? name,
    bool? draft,
    bool? prerelease,
    DateTime? createdAt,
    DateTime? publishedAt,
    List<GithubAsset>? assets,
    Uri? tarballUrl,
    Uri? zipballUrl,
    String? body,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfGithubRelease.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfGithubRelease.copyWith.fieldName(...)`
class _$GithubReleaseCWProxyImpl implements _$GithubReleaseCWProxy {
  const _$GithubReleaseCWProxyImpl(this._value);

  final GithubRelease _value;

  @override
  GithubRelease url(Uri url) => this(url: url);

  @override
  GithubRelease assetsUrl(Uri assetsUrl) => this(assetsUrl: assetsUrl);

  @override
  GithubRelease uploadUrl(Uri uploadUrl) => this(uploadUrl: uploadUrl);

  @override
  GithubRelease htmlUrl(Uri htmlUrl) => this(htmlUrl: htmlUrl);

  @override
  GithubRelease id(int id) => this(id: id);

  @override
  GithubRelease author(GithubUser author) => this(author: author);

  @override
  GithubRelease nodeId(String nodeId) => this(nodeId: nodeId);

  @override
  GithubRelease tagName(Version tagName) => this(tagName: tagName);

  @override
  GithubRelease targetCommitish(String targetCommitish) =>
      this(targetCommitish: targetCommitish);

  @override
  GithubRelease name(String name) => this(name: name);

  @override
  GithubRelease draft(bool draft) => this(draft: draft);

  @override
  GithubRelease prerelease(bool prerelease) => this(prerelease: prerelease);

  @override
  GithubRelease createdAt(DateTime createdAt) => this(createdAt: createdAt);

  @override
  GithubRelease publishedAt(DateTime publishedAt) =>
      this(publishedAt: publishedAt);

  @override
  GithubRelease assets(List<GithubAsset> assets) => this(assets: assets);

  @override
  GithubRelease tarballUrl(Uri tarballUrl) => this(tarballUrl: tarballUrl);

  @override
  GithubRelease zipballUrl(Uri zipballUrl) => this(zipballUrl: zipballUrl);

  @override
  GithubRelease body(String body) => this(body: body);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `GithubRelease(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// GithubRelease(...).copyWith(id: 12, name: "My name")
  /// ````
  GithubRelease call({
    Object? url = const $CopyWithPlaceholder(),
    Object? assetsUrl = const $CopyWithPlaceholder(),
    Object? uploadUrl = const $CopyWithPlaceholder(),
    Object? htmlUrl = const $CopyWithPlaceholder(),
    Object? id = const $CopyWithPlaceholder(),
    Object? author = const $CopyWithPlaceholder(),
    Object? nodeId = const $CopyWithPlaceholder(),
    Object? tagName = const $CopyWithPlaceholder(),
    Object? targetCommitish = const $CopyWithPlaceholder(),
    Object? name = const $CopyWithPlaceholder(),
    Object? draft = const $CopyWithPlaceholder(),
    Object? prerelease = const $CopyWithPlaceholder(),
    Object? createdAt = const $CopyWithPlaceholder(),
    Object? publishedAt = const $CopyWithPlaceholder(),
    Object? assets = const $CopyWithPlaceholder(),
    Object? tarballUrl = const $CopyWithPlaceholder(),
    Object? zipballUrl = const $CopyWithPlaceholder(),
    Object? body = const $CopyWithPlaceholder(),
  }) {
    return GithubRelease(
      url: url == const $CopyWithPlaceholder() || url == null
          ? _value.url
          // ignore: cast_nullable_to_non_nullable
          : url as Uri,
      assetsUrl: assetsUrl == const $CopyWithPlaceholder() || assetsUrl == null
          ? _value.assetsUrl
          // ignore: cast_nullable_to_non_nullable
          : assetsUrl as Uri,
      uploadUrl: uploadUrl == const $CopyWithPlaceholder() || uploadUrl == null
          ? _value.uploadUrl
          // ignore: cast_nullable_to_non_nullable
          : uploadUrl as Uri,
      htmlUrl: htmlUrl == const $CopyWithPlaceholder() || htmlUrl == null
          ? _value.htmlUrl
          // ignore: cast_nullable_to_non_nullable
          : htmlUrl as Uri,
      id: id == const $CopyWithPlaceholder() || id == null
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as int,
      author: author == const $CopyWithPlaceholder() || author == null
          ? _value.author
          // ignore: cast_nullable_to_non_nullable
          : author as GithubUser,
      nodeId: nodeId == const $CopyWithPlaceholder() || nodeId == null
          ? _value.nodeId
          // ignore: cast_nullable_to_non_nullable
          : nodeId as String,
      tagName: tagName == const $CopyWithPlaceholder() || tagName == null
          ? _value.tagName
          // ignore: cast_nullable_to_non_nullable
          : tagName as Version,
      targetCommitish: targetCommitish == const $CopyWithPlaceholder() ||
              targetCommitish == null
          ? _value.targetCommitish
          // ignore: cast_nullable_to_non_nullable
          : targetCommitish as String,
      name: name == const $CopyWithPlaceholder() || name == null
          ? _value.name
          // ignore: cast_nullable_to_non_nullable
          : name as String,
      draft: draft == const $CopyWithPlaceholder() || draft == null
          ? _value.draft
          // ignore: cast_nullable_to_non_nullable
          : draft as bool,
      prerelease:
          prerelease == const $CopyWithPlaceholder() || prerelease == null
              ? _value.prerelease
              // ignore: cast_nullable_to_non_nullable
              : prerelease as bool,
      createdAt: createdAt == const $CopyWithPlaceholder() || createdAt == null
          ? _value.createdAt
          // ignore: cast_nullable_to_non_nullable
          : createdAt as DateTime,
      publishedAt:
          publishedAt == const $CopyWithPlaceholder() || publishedAt == null
              ? _value.publishedAt
              // ignore: cast_nullable_to_non_nullable
              : publishedAt as DateTime,
      assets: assets == const $CopyWithPlaceholder() || assets == null
          ? _value.assets
          // ignore: cast_nullable_to_non_nullable
          : assets as List<GithubAsset>,
      tarballUrl:
          tarballUrl == const $CopyWithPlaceholder() || tarballUrl == null
              ? _value.tarballUrl
              // ignore: cast_nullable_to_non_nullable
              : tarballUrl as Uri,
      zipballUrl:
          zipballUrl == const $CopyWithPlaceholder() || zipballUrl == null
              ? _value.zipballUrl
              // ignore: cast_nullable_to_non_nullable
              : zipballUrl as Uri,
      body: body == const $CopyWithPlaceholder() || body == null
          ? _value.body
          // ignore: cast_nullable_to_non_nullable
          : body as String,
    );
  }
}

extension $GithubReleaseCopyWith on GithubRelease {
  /// Returns a callable class that can be used as follows: `instanceOfGithubRelease.copyWith(...)` or like so:`instanceOfGithubRelease.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$GithubReleaseCWProxy get copyWith => _$GithubReleaseCWProxyImpl(this);
}

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
