import 'package:alfred_workflow/src/models/alfred_user_configuration_config.dart';
import 'package:autoequal/autoequal.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'alfred_user_configuration_config_text_area.g.dart';

@autoequalMixin
@CopyWith()
@JsonSerializable(explicitToJson: true, createToJson: false)
final class AlfredUserConfigurationConfigTextArea
    extends AlfredUserConfigurationConfig<String>
    with EquatableMixin, _$AlfredUserConfigurationConfigTextAreaAutoequalMixin {
  const AlfredUserConfigurationConfigTextArea({
    required super.defaultValue,
    required this.required,
    required this.trim,
    required this.verticalSize,
    super.value,
  });

  final bool required;
  final bool trim;
  @JsonKey(name: 'verticalsize')
  final int verticalSize;

  @override
  AlfredUserConfigurationConfig<String> copyWithValue(String value) =>
      copyWith(value: value);

  factory AlfredUserConfigurationConfigTextArea.fromJson(Map json) =>
      _$AlfredUserConfigurationConfigTextAreaFromJson(
        json.map((k, v) => MapEntry(k.toString(), v)),
      );
}
