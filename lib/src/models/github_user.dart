import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'github_user.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
@CopyWith()
class GithubUser with EquatableMixin {
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

  @override
  List<Object?> get props => [
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
