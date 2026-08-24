import 'package:alfred_workflow/src/models/alfred_user_configuration_config.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'alfred_user_configuration_config_text_area.g.dart';

/// A configuration for a text area

@CopyWith(constructor: '_copyWith')
@JsonSerializable(explicitToJson: true, createToJson: false)
final class AlfredUserConfigurationConfigTextArea
    extends AlfredUserConfigurationConfig<String> {
  const AlfredUserConfigurationConfigTextArea({
    required super.defaultValue,
    required this.required,
    required this.trim,
    required this.verticalSize,
    super.value,
  });

  const AlfredUserConfigurationConfigTextArea._copyWith({
    required super.defaultValue,
    required this.required,
    required this.trim,
    required this.verticalSize,
    required super.value,
  }) : super.copyWith();

  /// Whether the text area is required
  final bool required;

  /// Whether to trim the text
  final bool trim;

  /// The vertical size of the text area
  @JsonKey(name: 'verticalsize')
  final int verticalSize;

  @internal
  @override
  AlfredUserConfigurationConfig<String> copyWithValue(String? value) =>
      copyWith(value: value ?? defaultValue);

  factory AlfredUserConfigurationConfigTextArea.fromJson(Map json) =>
      _$AlfredUserConfigurationConfigTextAreaFromJson(
        json.map((k, v) => MapEntry(k.toString(), v)),
      );
}
