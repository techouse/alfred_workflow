import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'alfred_item_text.g.dart';

@JsonSerializable()
@CopyWith()
class AlfredItemText with EquatableMixin {
  const AlfredItemText({
    required this.copy,
    this.largeType,
  });

  @JsonKey(required: true)
  final String copy;
  @JsonKey(name: 'largetype', includeIfNull: false)
  final String? largeType;

  factory AlfredItemText.fromJson(Map<String, dynamic> json) =>
      _$AlfredItemTextFromJson(json);

  Map<String, dynamic> toJson() => _$AlfredItemTextToJson(this);

  @override
  List<Object?> get props => [
        copy,
        largeType,
      ];
}
