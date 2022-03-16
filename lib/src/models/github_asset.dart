import 'package:json_annotation/json_annotation.dart';

import 'github_user.dart';

part 'github_asset.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class GithubAsset {
  const GithubAsset({
    required this.url,
    required this.id,
    required this.nodeId,
    required this.name,
    this.label,
    required this.uploader,
    required this.contentType,
    required this.state,
    required this.size,
    required this.downloadCount,
    required this.createdAt,
    required this.updatedAt,
    required this.browserDownloadUrl,
  });

  final Uri url;
  final int id;
  final String nodeId;
  final String name;
  final String? label;
  @JsonKey(fromJson: _githubUserFromJson)
  final GithubUser uploader;
  final String contentType;
  final String state;
  final int size;
  final int downloadCount;
  final DateTime createdAt;
  final DateTime updatedAt;
  final Uri browserDownloadUrl;

  static GithubUser _githubUserFromJson(dynamic json) =>
      GithubUser.fromJson((Map<String, dynamic>.from(json)));

  factory GithubAsset.fromJson(Map<String, dynamic> json) =>
      _$GithubAssetFromJson(json);

  Map<String, dynamic> toJson() => _$GithubAssetToJson(this);
}
