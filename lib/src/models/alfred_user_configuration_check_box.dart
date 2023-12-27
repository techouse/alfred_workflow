import 'package:alfred_workflow/src/models/alfred_user_configuration.dart';
import 'package:alfred_workflow/src/models/alfred_user_configuration_config_check_box.dart';
import 'package:alfred_workflow/src/models/alfred_user_configuration_type.dart';
import 'package:autoequal/autoequal.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'alfred_user_configuration_check_box.g.dart';

@autoequalMixin
@CopyWith()
@JsonSerializable(explicitToJson: true, createToJson: false)
final class AlfredUserConfigurationCheckBox
    extends AlfredUserConfiguration<AlfredUserConfigurationConfigCheckBox>
    with EquatableMixin, _$AlfredUserConfigurationCheckBoxAutoequalMixin {
  const AlfredUserConfigurationCheckBox({
    required super.type,
    required super.variable,
    required this.config,
    super.description,
    super.label,
  });

  @override
  @JsonKey(fromJson: _configFromJson)
  final AlfredUserConfigurationConfigCheckBox config;

  @override
  AlfredUserConfiguration<AlfredUserConfigurationConfigCheckBox> copyWithConfig(
          AlfredUserConfigurationConfigCheckBox? config) =>
      copyWith(config: config);

  static AlfredUserConfigurationConfigCheckBox _configFromJson(Map json) {
    return AlfredUserConfigurationConfigCheckBox.fromJson(
      json.map((k, v) => MapEntry(k.toString(), v)),
    );
  }

  factory AlfredUserConfigurationCheckBox.fromJson(Map json) =>
      _$AlfredUserConfigurationCheckBoxFromJson(
        json.map((k, v) => MapEntry(k.toString(), v)),
      );
}
