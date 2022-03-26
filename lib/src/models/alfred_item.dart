import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

import 'alfred_item_icon.dart';
import 'alfred_item_text.dart';

part 'alfred_item.g.dart';

@JsonSerializable(explicitToJson: true)
@CopyWith()
class AlfredItem {
  const AlfredItem({
    required this.title,
    this.type = 'default',
    this.valid = false,
    this.subtitle,
    this.arg,
    this.autocomplete,
    this.uid,
    this.icon,
    this.text,
    this.quickLookUrl,
    this.match,
  });

  @JsonKey(required: true)
  final String title;
  final String type;
  final bool valid;
  @JsonKey(includeIfNull: false)
  final String? subtitle;
  @JsonKey(includeIfNull: false)
  final String? arg;
  @JsonKey(includeIfNull: false)
  final String? autocomplete;
  @JsonKey(includeIfNull: false)
  final String? uid;
  @JsonKey(fromJson: _iconFromJson, includeIfNull: false)
  final AlfredItemIcon? icon;
  @JsonKey(fromJson: _textFromJson, includeIfNull: false)
  final AlfredItemText? text;
  @JsonKey(name: 'quicklookurl', includeIfNull: false)
  final String? quickLookUrl;
  @JsonKey(includeIfNull: false)
  final String? match;

  static AlfredItemIcon? _iconFromJson(dynamic icon) => icon == null
      ? null
      : AlfredItemIcon.fromJson(Map<String, dynamic>.from(icon));

  static AlfredItemText? _textFromJson(dynamic text) => text == null
      ? null
      : AlfredItemText.fromJson(Map<String, dynamic>.from(text));

  factory AlfredItem.fromJson(Map<String, dynamic> json) =>
      _$AlfredItemFromJson(json);

  Map<String, dynamic> toJson() => _$AlfredItemToJson(this);
}
