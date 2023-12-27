import 'package:alfred_workflow/src/models/alfred_user_configuration.dart';
import 'package:alfred_workflow/src/models/alfred_user_configuration_config_file_picker.dart';
import 'package:alfred_workflow/src/models/alfred_user_configuration_type.dart';
import 'package:autoequal/autoequal.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'alfred_user_configuration_file_picker.g.dart';

@autoequalMixin
@CopyWith()
@JsonSerializable(explicitToJson: true, createToJson: false)
final class AlfredUserConfigurationFilePicker
    extends AlfredUserConfiguration<AlfredUserConfigurationConfigFilePicker>
    with EquatableMixin, _$AlfredUserConfigurationFilePickerAutoequalMixin {
  const AlfredUserConfigurationFilePicker({
    required super.type,
    required super.variable,
    required this.config,
    super.description,
    super.label,
  });

  @override
  @JsonKey(fromJson: _configFromJson)
  final AlfredUserConfigurationConfigFilePicker config;

  @override
  AlfredUserConfiguration<AlfredUserConfigurationConfigFilePicker>
      copyWithConfig(AlfredUserConfigurationConfigFilePicker? config) =>
          copyWith(config: config);

  static AlfredUserConfigurationConfigFilePicker _configFromJson(Map json) {
    return AlfredUserConfigurationConfigFilePicker.fromJson(
      json.map((k, v) => MapEntry(k.toString(), v)),
    );
  }

  factory AlfredUserConfigurationFilePicker.fromJson(Map json) =>
      _$AlfredUserConfigurationFilePickerFromJson(
        json.map((k, v) => MapEntry(k.toString(), v)),
      );
}
