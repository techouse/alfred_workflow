import 'package:alfred_workflow/src/models/alfred_item_icon.dart';
import 'package:autoequal/autoequal.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'alfred_item_mod.g.dart';

enum AlfredItemModKey {
  @JsonValue('cmd')
  cmd,
  @JsonValue('ctrl')
  ctrl,
  @JsonValue('alt')
  alt,
  @JsonValue('shift')
  shift,
  @JsonValue('fn')
  fn,
}

/// The [AlfredItemMod] gives you control over how the modifier keys react.
///
/// It can alter the looks of a result (e.g. [subtitle], [icon]) and output a different [arg].
@autoequalMixin
@CopyWith()
@JsonSerializable(explicitToJson: true)
final class AlfredItemMod with EquatableMixin, _$AlfredItemModAutoequalMixin {
  const AlfredItemMod({
    this.arg,
    this.subtitle,
    this.icon,
    this.valid = true,
  });

  /// The argument which is passed through the workflow to the connected output action.
  @JsonKey(includeIfNull: false)
  final String? arg;

  /// The [subtitle] displayed in the result row. This element is optional.
  @JsonKey(includeIfNull: false)
  final String? subtitle;

  /// The [icon] displayed in the result row.
  @JsonKey(fromJson: _iconFromJson, includeIfNull: false)
  final AlfredItemIcon? icon;

  /// [valid] : true | false (optional, default = false)
  final bool valid;

  factory AlfredItemMod.fromJson(Map<String, dynamic> json) =>
      _$AlfredItemModFromJson(json);

  Map<String, dynamic> toJson() => _$AlfredItemModToJson(this);

  static AlfredItemIcon? _iconFromJson(dynamic icon) => icon == null
      ? null
      : AlfredItemIcon.fromJson(Map<String, dynamic>.from(icon));
}
