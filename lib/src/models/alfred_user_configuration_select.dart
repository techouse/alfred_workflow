import 'package:alfred_workflow/src/models/alfred_user_configuration.dart';
import 'package:alfred_workflow/src/models/alfred_user_configuration_config_select.dart';
import 'package:alfred_workflow/src/models/alfred_user_configuration_type.dart';
import 'package:autoequal/autoequal.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'alfred_user_configuration_select.g.dart';

/// Alfred select user configuration
@autoequal
@CopyWith()
@JsonSerializable(explicitToJson: true, createToJson: false)
final class AlfredUserConfigurationSelect
    extends AlfredUserConfiguration<AlfredUserConfigurationConfigSelect>
    with EquatableMixin {
  const AlfredUserConfigurationSelect({
    required super.type,
    required super.variable,
    required this.config,
    super.description,
    super.label,
  });

  /// The configuration for the select
  @override
  @JsonKey(fromJson: _configFromJson)
  final AlfredUserConfigurationConfigSelect config;

  @internal
  @override
  AlfredUserConfiguration<AlfredUserConfigurationConfigSelect> copyWithConfig(
          AlfredUserConfigurationConfigSelect? config) =>
      copyWith(config: config);

  static AlfredUserConfigurationConfigSelect _configFromJson(Map json) =>
      AlfredUserConfigurationConfigSelect.fromJson(
        json.map((k, v) => MapEntry(k.toString(), v)),
      );

  factory AlfredUserConfigurationSelect.fromJson(Map json) =>
      _$AlfredUserConfigurationSelectFromJson(
        json.map((k, v) => MapEntry(k.toString(), v)),
      );
}
