import 'package:alfred_workflow/src/models/alfred_user_configuration_config.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'alfred_user_configuration_config_text_field.g.dart';

@CopyWith()
@JsonSerializable(explicitToJson: true, createToJson: false)
final class AlfredUserConfigurationConfigTextField
    extends AlfredUserConfigurationConfig<String> with EquatableMixin {
  const AlfredUserConfigurationConfigTextField({
    required super.defaultValue,
    required this.required,
    required this.trim,
    super.value,
    this.placeholder,
  });

  /// Whether the text field is required
  final String? placeholder;

  /// Whether to trim the text
  final bool required;

  /// Whether to trim the text
  final bool trim;

  @internal
  @override
  AlfredUserConfigurationConfig<String> copyWithValue(String? value) =>
      copyWith(value: value);

  factory AlfredUserConfigurationConfigTextField.fromJson(Map json) =>
      _$AlfredUserConfigurationConfigTextFieldFromJson(
        json.map((k, v) => MapEntry(k.toString(), v)),
      );
}
