import 'package:alfred_workflow/src/models/alfred_user_configuration.dart';
import 'package:alfred_workflow/src/models/alfred_user_configuration_config_text_area.dart';
import 'package:alfred_workflow/src/models/alfred_user_configuration_type.dart';
import 'package:autoequal/autoequal.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'alfred_user_configuration_text_area.g.dart';

@autoequalMixin
@CopyWith()
@JsonSerializable(explicitToJson: true, createToJson: false)
final class AlfredUserConfigurationTextArea
    extends AlfredUserConfiguration<AlfredUserConfigurationConfigTextArea>
    with EquatableMixin, _$AlfredUserConfigurationTextAreaAutoequalMixin {
  const AlfredUserConfigurationTextArea({
    required super.type,
    required super.variable,
    required this.config,
    super.description,
    super.label,
  });

  @override
  @JsonKey(fromJson: _configFromJson)
  final AlfredUserConfigurationConfigTextArea config;

  @override
  AlfredUserConfiguration<AlfredUserConfigurationConfigTextArea> copyWithConfig(
          AlfredUserConfigurationConfigTextArea config) =>
      copyWith(config: config);

  static AlfredUserConfigurationConfigTextArea _configFromJson(Map json) {
    return AlfredUserConfigurationConfigTextArea.fromJson(
      json.map((k, v) => MapEntry(k.toString(), v)),
    );
  }

  factory AlfredUserConfigurationTextArea.fromJson(Map json) =>
      _$AlfredUserConfigurationTextAreaFromJson(
        json.map((k, v) => MapEntry(k.toString(), v)),
      );
}
