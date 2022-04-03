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

/// The icon displayed in the result row.
///
/// Workflows are run from their workflow folder, so you can reference icons stored in your workflow relatively.
@JsonSerializable()
@CopyWith()
class AlfredItemIcon with EquatableMixin {
  const AlfredItemIcon({
    required this.path,
    this.type,
  });

  /// The local file path of the icon file.
  ///
  /// Alfred will not display an icon with a URL [path].
  @JsonKey(required: true)
  final String path;

  /// By omitting the [type], Alfred will load the file path itself, for example a png.
  ///
  /// By using [type] = "fileicon", Alfred will get the icon for the specified path.
  /// Finally, by using [type] = "filetype", you can get the icon of a specific file, for example [path] = "public.png"
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
