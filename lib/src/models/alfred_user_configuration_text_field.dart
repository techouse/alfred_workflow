import 'package:alfred_workflow/src/models/alfred_user_configuration.dart';
import 'package:alfred_workflow/src/models/alfred_user_configuration_config_text_field.dart';
import 'package:alfred_workflow/src/models/alfred_user_configuration_type.dart';
import 'package:autoequal/autoequal.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'alfred_user_configuration_text_field.g.dart';

@autoequalMixin
@CopyWith()
@JsonSerializable(explicitToJson: true, createToJson: false)
final class AlfredUserConfigurationTextField
    extends AlfredUserConfiguration<AlfredUserConfigurationConfigTextField>
    with EquatableMixin, _$AlfredUserConfigurationTextFieldAutoequalMixin {
  const AlfredUserConfigurationTextField({
    required super.type,
    required super.variable,
    required this.config,
    super.description,
    super.label,
  });

  @override
  @JsonKey(fromJson: _configFromJson)
  final AlfredUserConfigurationConfigTextField config;

  @override
  AlfredUserConfiguration<AlfredUserConfigurationConfigTextField>
      copyWithConfig(AlfredUserConfigurationConfigTextField? config) =>
          copyWith(config: config);

  static AlfredUserConfigurationConfigTextField _configFromJson(Map json) {
    return AlfredUserConfigurationConfigTextField.fromJson(
      json.map((k, v) => MapEntry(k.toString(), v)),
    );
  }

  factory AlfredUserConfigurationTextField.fromJson(Map json) {
    return _$AlfredUserConfigurationTextFieldFromJson(
      json.map((k, v) => MapEntry(k.toString(), v)),
    );
  }
}
