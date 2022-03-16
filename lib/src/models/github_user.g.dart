// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'github_user.dart';

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
