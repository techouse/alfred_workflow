import 'package:json_annotation/json_annotation.dart';

part 'alfred_item_text.g.dart';

@JsonSerializable()
class AlfredItemText {
  const AlfredItemText({
    required this.copy,
    this.largeType,
  });

  final String copy;
  @JsonKey(name: 'largetype')
  final String? largeType;

  factory AlfredItemText.fromJson(Map<String, dynamic> json) =>
      _$AlfredItemTextFromJson(json);

  Map<String, dynamic> toJson() => _$AlfredItemTextToJson(this);
}
