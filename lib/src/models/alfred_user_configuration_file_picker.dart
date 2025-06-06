import 'package:alfred_workflow/src/models/alfred_user_configuration.dart';
import 'package:alfred_workflow/src/models/alfred_user_configuration_config_file_picker.dart';
import 'package:alfred_workflow/src/models/alfred_user_configuration_type.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'alfred_user_configuration_file_picker.g.dart';

/// A file picker configuration

@CopyWith()
@JsonSerializable(explicitToJson: true, createToJson: false)
final class AlfredUserConfigurationFilePicker extends AlfredUserConfiguration<
    String, AlfredUserConfigurationConfigFilePicker> with EquatableMixin {
  const AlfredUserConfigurationFilePicker({
    required super.type,
    required super.variable,
    required this.config,
    super.description,
    super.label,
  });

  /// The configuration for the file picker
  @override
  @JsonKey(fromJson: _configFromJson)
  final AlfredUserConfigurationConfigFilePicker config;

  @internal
  @override
  AlfredUserConfiguration<String, AlfredUserConfigurationConfigFilePicker>
      copyWithConfig(AlfredUserConfigurationConfigFilePicker config) =>
          copyWith(config: config);

  static AlfredUserConfigurationConfigFilePicker _configFromJson(Map json) =>
      AlfredUserConfigurationConfigFilePicker.fromJson(
        json.map((k, v) => MapEntry(k.toString(), v)),
      );

  factory AlfredUserConfigurationFilePicker.fromJson(Map json) =>
      _$AlfredUserConfigurationFilePickerFromJson(
        json.map((k, v) => MapEntry(k.toString(), v)),
      );
}
