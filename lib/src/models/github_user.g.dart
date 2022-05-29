// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'github_user.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$GithubUserCWProxy {
  GithubUser avatarUrl(Uri avatarUrl);

  GithubUser gravatarId(String gravatarId);

  GithubUser htmlUrl(Uri htmlUrl);

  GithubUser id(int id);

  GithubUser login(String login);

  GithubUser nodeId(String nodeId);

  GithubUser reposUrl(Uri reposUrl);

  GithubUser siteAdmin(bool siteAdmin);

  GithubUser type(String type);

  GithubUser url(Uri url);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `GithubUser(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// GithubUser(...).copyWith(id: 12, name: "My name")
  /// ````
  GithubUser call({
    Uri? avatarUrl,
    String? gravatarId,
    Uri? htmlUrl,
    int? id,
    String? login,
    String? nodeId,
    Uri? reposUrl,
    bool? siteAdmin,
    String? type,
    Uri? url,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfGithubUser.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfGithubUser.copyWith.fieldName(...)`
class _$GithubUserCWProxyImpl implements _$GithubUserCWProxy {
  final GithubUser _value;

  const _$GithubUserCWProxyImpl(this._value);

  @override
  GithubUser avatarUrl(Uri avatarUrl) => this(avatarUrl: avatarUrl);

  @override
  GithubUser gravatarId(String gravatarId) => this(gravatarId: gravatarId);

  @override
  GithubUser htmlUrl(Uri htmlUrl) => this(htmlUrl: htmlUrl);

  @override
  GithubUser id(int id) => this(id: id);

  @override
  GithubUser login(String login) => this(login: login);

  @override
  GithubUser nodeId(String nodeId) => this(nodeId: nodeId);

  @override
  GithubUser reposUrl(Uri reposUrl) => this(reposUrl: reposUrl);

  @override
  GithubUser siteAdmin(bool siteAdmin) => this(siteAdmin: siteAdmin);

  @override
  GithubUser type(String type) => this(type: type);

  @override
  GithubUser url(Uri url) => this(url: url);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `GithubUser(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// GithubUser(...).copyWith(id: 12, name: "My name")
  /// ````
  GithubUser call({
    Object? avatarUrl = const $CopyWithPlaceholder(),
    Object? gravatarId = const $CopyWithPlaceholder(),
    Object? htmlUrl = const $CopyWithPlaceholder(),
    Object? id = const $CopyWithPlaceholder(),
    Object? login = const $CopyWithPlaceholder(),
    Object? nodeId = const $CopyWithPlaceholder(),
    Object? reposUrl = const $CopyWithPlaceholder(),
    Object? siteAdmin = const $CopyWithPlaceholder(),
    Object? type = const $CopyWithPlaceholder(),
    Object? url = const $CopyWithPlaceholder(),
  }) {
    return GithubUser(
      avatarUrl: avatarUrl == const $CopyWithPlaceholder() || avatarUrl == null
          ? _value.avatarUrl
          // ignore: cast_nullable_to_non_nullable
          : avatarUrl as Uri,
      gravatarId:
          gravatarId == const $CopyWithPlaceholder() || gravatarId == null
              ? _value.gravatarId
              // ignore: cast_nullable_to_non_nullable
              : gravatarId as String,
      htmlUrl: htmlUrl == const $CopyWithPlaceholder() || htmlUrl == null
          ? _value.htmlUrl
          // ignore: cast_nullable_to_non_nullable
          : htmlUrl as Uri,
      id: id == const $CopyWithPlaceholder() || id == null
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as int,
      login: login == const $CopyWithPlaceholder() || login == null
          ? _value.login
          // ignore: cast_nullable_to_non_nullable
          : login as String,
      nodeId: nodeId == const $CopyWithPlaceholder() || nodeId == null
          ? _value.nodeId
          // ignore: cast_nullable_to_non_nullable
          : nodeId as String,
      reposUrl: reposUrl == const $CopyWithPlaceholder() || reposUrl == null
          ? _value.reposUrl
          // ignore: cast_nullable_to_non_nullable
          : reposUrl as Uri,
      siteAdmin: siteAdmin == const $CopyWithPlaceholder() || siteAdmin == null
          ? _value.siteAdmin
          // ignore: cast_nullable_to_non_nullable
          : siteAdmin as bool,
      type: type == const $CopyWithPlaceholder() || type == null
          ? _value.type
          // ignore: cast_nullable_to_non_nullable
          : type as String,
      url: url == const $CopyWithPlaceholder() || url == null
          ? _value.url
          // ignore: cast_nullable_to_non_nullable
          : url as Uri,
    );
  }
}

extension $GithubUserCopyWith on GithubUser {
  /// Returns a callable class that can be used as follows: `instanceOfGithubUser.copyWith(...)` or like so:`instanceOfGithubUser.copyWith.fieldName(...)`.
  _$GithubUserCWProxy get copyWith => _$GithubUserCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GithubUser _$GithubUserFromJson(Map<String, dynamic> json) => GithubUser(
      login: json['login'] as String,
      id: json['id'] as int,
      nodeId: json['node_id'] as String,
      avatarUrl: Uri.parse(json['avatar_url'] as String),
      gravatarId: json['gravatar_id'] as String,
      url: Uri.parse(json['url'] as String),
      htmlUrl: Uri.parse(json['html_url'] as String),
      reposUrl: Uri.parse(json['repos_url'] as String),
      type: json['type'] as String,
      siteAdmin: json['site_admin'] as bool,
    );

Map<String, dynamic> _$GithubUserToJson(GithubUser instance) =>
    <String, dynamic>{
      'login': instance.login,
      'id': instance.id,
      'node_id': instance.nodeId,
      'avatar_url': instance.avatarUrl.toString(),
      'gravatar_id': instance.gravatarId,
      'url': instance.url.toString(),
      'html_url': instance.htmlUrl.toString(),
      'repos_url': instance.reposUrl.toString(),
      'type': instance.type,
      'site_admin': instance.siteAdmin,
    };
