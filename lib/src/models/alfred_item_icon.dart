import 'package:json_annotation/json_annotation.dart';

part 'alfred_item_icon.g.dart';

enum AlfredItemIconType {
  @JsonValue('fileicon')
  fileicon,
  @JsonValue('filetype')
  filetype,
}

@JsonSerializable()
class AlfredItemIcon {
  const AlfredItemIcon({
    required this.path,
    this.type,
  });

  final String path;
  final AlfredItemIconType? type;

  factory AlfredItemIcon.fromJson(Map<String, dynamic> json) =>
      _$AlfredItemIconFromJson(json);

  Map<String, dynamic> toJson() => _$AlfredItemIconToJson(this);
}
