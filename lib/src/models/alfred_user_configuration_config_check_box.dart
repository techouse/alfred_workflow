import 'package:alfred_workflow/src/models/alfred_user_configuration_config.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'alfred_user_configuration_config_check_box.g.dart';

/// Alfred check box user configuration config
@CopyWith(constructor: '_copyWith')
@JsonSerializable(explicitToJson: true, createToJson: false)
final class AlfredUserConfigurationConfigCheckBox
    extends AlfredUserConfigurationConfig<bool> {
  const AlfredUserConfigurationConfigCheckBox({
    required super.defaultValue,
    required this.required,
    super.value,
    this.text,
  });

  const AlfredUserConfigurationConfigCheckBox._copyWith({
    required super.defaultValue,
    required this.required,
    required super.value,
    this.text,
  }) : super.copyWith();

  /// Whether the checkbox is required
  final bool required;

  /// The text to display next to the checkbox
  final String? text;

  @internal
  @override
  AlfredUserConfigurationConfig<bool> copyWithValue(bool? value) =>
      copyWith(value: value ?? defaultValue);

  factory AlfredUserConfigurationConfigCheckBox.fromJson(Map json) =>
      _$AlfredUserConfigurationConfigCheckBoxFromJson(
        json.map((k, v) => MapEntry(k.toString(), v)),
      );
}
