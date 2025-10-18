// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'github_user.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$GithubUserCWProxy {
  GithubUser login(String login);

  GithubUser id(int id);

  GithubUser nodeId(String nodeId);

  GithubUser avatarUrl(Uri avatarUrl);

  GithubUser gravatarId(String gravatarId);

  GithubUser url(Uri url);

  GithubUser htmlUrl(Uri htmlUrl);

  GithubUser reposUrl(Uri reposUrl);

  GithubUser type(String type);

  GithubUser siteAdmin(bool siteAdmin);

  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored. To update a single field use `GithubUser(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// GithubUser(...).copyWith(id: 12, name: "My name")
  /// ```
  GithubUser call({
    String login,
    int id,
    String nodeId,
    Uri avatarUrl,
    String gravatarId,
    Uri url,
    Uri htmlUrl,
    Uri reposUrl,
    String type,
    bool siteAdmin,
  });
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfGithubUser.copyWith(...)` or call `instanceOfGithubUser.copyWith.fieldName(value)` for a single field.
class _$GithubUserCWProxyImpl implements _$GithubUserCWProxy {
  const _$GithubUserCWProxyImpl(this._value);

  final GithubUser _value;

  @override
  GithubUser login(String login) => call(login: login);

  @override
  GithubUser id(int id) => call(id: id);

  @override
  GithubUser nodeId(String nodeId) => call(nodeId: nodeId);

  @override
  GithubUser avatarUrl(Uri avatarUrl) => call(avatarUrl: avatarUrl);

  @override
  GithubUser gravatarId(String gravatarId) => call(gravatarId: gravatarId);

  @override
  GithubUser url(Uri url) => call(url: url);

  @override
  GithubUser htmlUrl(Uri htmlUrl) => call(htmlUrl: htmlUrl);

  @override
  GithubUser reposUrl(Uri reposUrl) => call(reposUrl: reposUrl);

  @override
  GithubUser type(String type) => call(type: type);

  @override
  GithubUser siteAdmin(bool siteAdmin) => call(siteAdmin: siteAdmin);

  @override
  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored. To update a single field use `GithubUser(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// GithubUser(...).copyWith(id: 12, name: "My name")
  /// ```
  GithubUser call({
    Object? login = const $CopyWithPlaceholder(),
    Object? id = const $CopyWithPlaceholder(),
    Object? nodeId = const $CopyWithPlaceholder(),
    Object? avatarUrl = const $CopyWithPlaceholder(),
    Object? gravatarId = const $CopyWithPlaceholder(),
    Object? url = const $CopyWithPlaceholder(),
    Object? htmlUrl = const $CopyWithPlaceholder(),
    Object? reposUrl = const $CopyWithPlaceholder(),
    Object? type = const $CopyWithPlaceholder(),
    Object? siteAdmin = const $CopyWithPlaceholder(),
  }) {
    return GithubUser(
      login: login == const $CopyWithPlaceholder() || login == null
          ? _value.login
          // ignore: cast_nullable_to_non_nullable
          : login as String,
      id: id == const $CopyWithPlaceholder() || id == null
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as int,
      nodeId: nodeId == const $CopyWithPlaceholder() || nodeId == null
          ? _value.nodeId
          // ignore: cast_nullable_to_non_nullable
          : nodeId as String,
      avatarUrl: avatarUrl == const $CopyWithPlaceholder() || avatarUrl == null
          ? _value.avatarUrl
          // ignore: cast_nullable_to_non_nullable
          : avatarUrl as Uri,
      gravatarId:
          gravatarId == const $CopyWithPlaceholder() || gravatarId == null
          ? _value.gravatarId
          // ignore: cast_nullable_to_non_nullable
          : gravatarId as String,
      url: url == const $CopyWithPlaceholder() || url == null
          ? _value.url
          // ignore: cast_nullable_to_non_nullable
          : url as Uri,
      htmlUrl: htmlUrl == const $CopyWithPlaceholder() || htmlUrl == null
          ? _value.htmlUrl
          // ignore: cast_nullable_to_non_nullable
          : htmlUrl as Uri,
      reposUrl: reposUrl == const $CopyWithPlaceholder() || reposUrl == null
          ? _value.reposUrl
          // ignore: cast_nullable_to_non_nullable
          : reposUrl as Uri,
      type: type == const $CopyWithPlaceholder() || type == null
          ? _value.type
          // ignore: cast_nullable_to_non_nullable
          : type as String,
      siteAdmin: siteAdmin == const $CopyWithPlaceholder() || siteAdmin == null
          ? _value.siteAdmin
          // ignore: cast_nullable_to_non_nullable
          : siteAdmin as bool,
    );
  }
}

extension $GithubUserCopyWith on GithubUser {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfGithubUser.copyWith(...)` or `instanceOfGithubUser.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$GithubUserCWProxy get copyWith => _$GithubUserCWProxyImpl(this);
}

// **************************************************************************
// EquatableGenerator
// **************************************************************************

extension _$GithubUserEquatableAnnotations on GithubUser {
  List<Object?> get _$props => [
    login,
    id,
    nodeId,
    avatarUrl,
    gravatarId,
    url,
    htmlUrl,
    reposUrl,
    type,
    siteAdmin,
  ];
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GithubUser _$GithubUserFromJson(Map<String, dynamic> json) => GithubUser(
  login: json['login'] as String,
  id: (json['id'] as num).toInt(),
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
