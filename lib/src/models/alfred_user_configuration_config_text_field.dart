import 'package:alfred_workflow/src/models/alfred_user_configuration_config.dart';
import 'package:autoequal/autoequal.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'alfred_user_configuration_config_text_field.g.dart';

@autoequalMixin
@CopyWith()
@JsonSerializable(explicitToJson: true, createToJson: false)
final class AlfredUserConfigurationConfigTextField
    extends AlfredUserConfigurationConfig<String>
    with
        EquatableMixin,
        _$AlfredUserConfigurationConfigTextFieldAutoequalMixin {
  const AlfredUserConfigurationConfigTextField({
    required super.defaultValue,
    required this.required,
    required this.trim,
    super.value,
    this.placeholder,
  });

  final String? placeholder;
  final bool required;
  final bool trim;

  @override
  AlfredUserConfigurationConfig<String> copyWithValue(String? value) =>
      copyWith(value: value);

  factory AlfredUserConfigurationConfigTextField.fromJson(Map json) =>
      _$AlfredUserConfigurationConfigTextFieldFromJson(
        json.map((k, v) => MapEntry(k.toString(), v)),
      );
}
