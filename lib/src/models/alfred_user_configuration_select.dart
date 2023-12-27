import 'package:alfred_workflow/src/models/alfred_user_configuration.dart';
import 'package:alfred_workflow/src/models/alfred_user_configuration_config_select.dart';
import 'package:alfred_workflow/src/models/alfred_user_configuration_type.dart';
import 'package:autoequal/autoequal.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'alfred_user_configuration_select.g.dart';

@autoequalMixin
@CopyWith()
@JsonSerializable(explicitToJson: true, createToJson: false)
final class AlfredUserConfigurationSelect
    extends AlfredUserConfiguration<AlfredUserConfigurationConfigSelect>
    with EquatableMixin, _$AlfredUserConfigurationSelectAutoequalMixin {
  const AlfredUserConfigurationSelect({
    required super.type,
    required super.variable,
    required this.config,
    super.description,
    super.label,
  });

  @override
  @JsonKey(fromJson: _configFromJson)
  final AlfredUserConfigurationConfigSelect config;

  @override
  AlfredUserConfiguration<AlfredUserConfigurationConfigSelect> copyWithConfig(
          AlfredUserConfigurationConfigSelect? config) =>
      copyWith(config: config);

  static AlfredUserConfigurationConfigSelect _configFromJson(Map json) {
    return AlfredUserConfigurationConfigSelect.fromJson(
      json.map((k, v) => MapEntry(k.toString(), v)),
    );
  }

  factory AlfredUserConfigurationSelect.fromJson(Map json) =>
      _$AlfredUserConfigurationSelectFromJson(
        json.map((k, v) => MapEntry(k.toString(), v)),
      );
}
