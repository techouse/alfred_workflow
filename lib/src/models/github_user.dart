import 'package:json_annotation/json_annotation.dart';

part 'github_user.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class GithubUser {
  const GithubUser({
    required this.login,
    required this.id,
    required this.nodeId,
    required this.avatarUrl,
    required this.gravatarId,
    required this.url,
    required this.htmlUrl,
    required this.reposUrl,
    required this.type,
    required this.siteAdmin,
  });

  final String login;
  final int id;
  final String nodeId;
  final Uri avatarUrl;
  final String gravatarId;
  final Uri url;
  final Uri htmlUrl;
  final Uri reposUrl;
  final String type;
  final bool siteAdmin;

  factory GithubUser.fromJson(Map<String, dynamic> json) =>
      _$GithubUserFromJson(json);

  Map<String, dynamic> toJson() => _$GithubUserToJson(this);
}
