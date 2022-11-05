import 'package:autoequal/autoequal.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart' show EquatableMixin;
import 'package:json_annotation/json_annotation.dart';

part 'alfred_item_text.g.dart';

/// The text element defines the text the user will get when copying the selected result row with ⌘C or displaying large type with ⌘L.
///
/// If these are not defined, you will inherit Alfred's standard behaviour where the arg is copied to the Clipboard or used for Large Type.
@autoequalMixin
@CopyWith()
@JsonSerializable()
class AlfredItemText with EquatableMixin, _$AlfredItemTextAutoequalMixin {
  const AlfredItemText({
    required this.copy,
    this.largeType,
  });

  /// The text to copy
  @JsonKey(required: true)
  final String copy;

  /// The text for large type
  @JsonKey(name: 'largetype', includeIfNull: false)
  final String? largeType;

  factory AlfredItemText.fromJson(Map<String, dynamic> json) =>
      _$AlfredItemTextFromJson(json);

  Map<String, dynamic> toJson() => _$AlfredItemTextToJson(this);
}
