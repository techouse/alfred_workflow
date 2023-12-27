import 'package:alfred_workflow/src/models/alfred_user_configuration_config.dart';
import 'package:autoequal/autoequal.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'alfred_user_configuration_config_check_box.g.dart';

/// Alfred check box user configuration config
@autoequalMixin
@CopyWith()
@JsonSerializable(explicitToJson: true, createToJson: false)
final class AlfredUserConfigurationConfigCheckBox
    extends AlfredUserConfigurationConfig<bool>
    with EquatableMixin, _$AlfredUserConfigurationConfigCheckBoxAutoequalMixin {
  const AlfredUserConfigurationConfigCheckBox({
    required super.defaultValue,
    required this.required,
    super.value,
    this.text,
  });

  /// Whether the checkbox is required
  final bool required;

  /// The text to display next to the checkbox
  final String? text;

  @internal
  @override
  AlfredUserConfigurationConfig<bool> copyWithValue(bool? value) =>
      copyWith(value: value);

  factory AlfredUserConfigurationConfigCheckBox.fromJson(Map json) =>
      _$AlfredUserConfigurationConfigCheckBoxFromJson(
        json.map((k, v) => MapEntry(k.toString(), v)),
      );
}
