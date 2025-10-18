import 'package:alfred_workflow/src/models/alfred_user_configuration.dart';
import 'package:alfred_workflow/src/models/alfred_user_configuration_config_check_box.dart';
import 'package:alfred_workflow/src/models/alfred_user_configuration_type.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'alfred_user_configuration_check_box.g.dart';

/// Alfred check box user configuration
@CopyWith()
@JsonSerializable(explicitToJson: true, createToJson: false)
final class AlfredUserConfigurationCheckBox
    extends AlfredUserConfiguration<bool, AlfredUserConfigurationConfigCheckBox>
    with EquatableMixin {
  const AlfredUserConfigurationCheckBox({
    required super.type,
    required super.variable,
    required this.config,
    super.description,
    super.label,
  });

  /// The configuration for the check box
  @override
  @JsonKey(fromJson: _configFromJson)
  final AlfredUserConfigurationConfigCheckBox config;

  @internal
  @override
  AlfredUserConfiguration<bool, AlfredUserConfigurationConfigCheckBox>
  copyWithConfig(AlfredUserConfigurationConfigCheckBox config) =>
      copyWith(config: config);

  static AlfredUserConfigurationConfigCheckBox _configFromJson(Map json) =>
      AlfredUserConfigurationConfigCheckBox.fromJson(
        json.map((k, v) => MapEntry(k.toString(), v)),
      );

  factory AlfredUserConfigurationCheckBox.fromJson(Map json) =>
      _$AlfredUserConfigurationCheckBoxFromJson(
        json.map((k, v) => MapEntry(k.toString(), v)),
      );
}
