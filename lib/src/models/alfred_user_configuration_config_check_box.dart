import 'package:alfred_workflow/src/models/alfred_user_configuration_config.dart';
import 'package:autoequal/autoequal.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'alfred_user_configuration_config_check_box.g.dart';

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

  final bool required;
  final String? text;

  @override
  AlfredUserConfigurationConfig<bool> copyWithValue(bool value) =>
      copyWith(value: value);

  factory AlfredUserConfigurationConfigCheckBox.fromJson(Map json) =>
      _$AlfredUserConfigurationConfigCheckBoxFromJson(
        json.map((k, v) => MapEntry(k.toString(), v)),
      );
}
