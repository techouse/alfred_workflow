import 'package:alfred_workflow/src/models/alfred_user_configuration_config.dart';
import 'package:autoequal/autoequal.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'alfred_user_configuration_config_file_picker.g.dart';

@autoequalMixin
@CopyWith()
@JsonSerializable(explicitToJson: true, createToJson: false)
final class AlfredUserConfigurationConfigFilePicker
    extends AlfredUserConfigurationConfig<String>
    with
        EquatableMixin,
        _$AlfredUserConfigurationConfigFilePickerAutoequalMixin {
  const AlfredUserConfigurationConfigFilePicker({
    required super.defaultValue,
    required this.required,
    required this.filterMode,
    super.value,
    this.placeholder,
  });

  final bool required;
  final String? placeholder;
  @JsonKey(name: 'filtermode')
  final int filterMode;

  @override
  AlfredUserConfigurationConfig<String> copyWithValue(String? value) =>
      copyWith(value: value);

  factory AlfredUserConfigurationConfigFilePicker.fromJson(Map json) =>
      _$AlfredUserConfigurationConfigFilePickerFromJson(
        json.map((k, v) => MapEntry(k.toString(), v)),
      );
}
