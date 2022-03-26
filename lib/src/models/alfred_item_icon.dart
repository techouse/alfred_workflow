import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'alfred_item_icon.g.dart';

enum AlfredItemIconType {
  @JsonValue('fileicon')
  fileicon,
  @JsonValue('filetype')
  filetype,
}

@JsonSerializable()
@CopyWith()
class AlfredItemIcon with EquatableMixin {
  const AlfredItemIcon({
    required this.path,
    this.type,
  });

  @JsonKey(required: true)
  final String path;
  @JsonKey(includeIfNull: false)
  final AlfredItemIconType? type;

  factory AlfredItemIcon.fromJson(Map<String, dynamic> json) =>
      _$AlfredItemIconFromJson(json);

  Map<String, dynamic> toJson() => _$AlfredItemIconToJson(this);

  @override
  List<Object?> get props => [
        path,
        type,
      ];
}
