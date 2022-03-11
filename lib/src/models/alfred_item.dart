import 'package:json_annotation/json_annotation.dart';

import 'alfred_item_icon.dart';
import 'alfred_item_text.dart';

part 'alfred_item.g.dart';

@JsonSerializable(explicitToJson: true)
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

  final String title;
  final String type;
  final bool valid;
  final String? subtitle;
  final String? arg;
  final String? autocomplete;
  final String? uid;
  @JsonKey(fromJson: _iconFromJson)
  final AlfredItemIcon? icon;
  @JsonKey(fromJson: _textFromJson)
  final AlfredItemText? text;
  @JsonKey(name: 'quicklookurl')
  final String? quickLookUrl;
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
