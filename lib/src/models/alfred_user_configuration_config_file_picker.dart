import 'package:alfred_workflow/src/models/alfred_user_configuration_config.dart';
import 'package:autoequal/autoequal.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'alfred_user_configuration_config_file_picker.g.dart';

/// Alfred file picker user configuration config
@autoequal
@CopyWith()
@JsonSerializable(explicitToJson: true, createToJson: false)
final class AlfredUserConfigurationConfigFilePicker
    extends AlfredUserConfigurationConfig<String> with EquatableMixin {
  const AlfredUserConfigurationConfigFilePicker({
    required super.defaultValue,
    required this.required,
    required this.filterMode,
    super.value,
    this.placeholder,
  });

  /// Whether the file picker is required
  final bool required;

  /// The placeholder text to display
  final String? placeholder;

  /// The filter mode
  @JsonKey(name: 'filtermode')
  final int filterMode;

  @internal
  @override
  AlfredUserConfigurationConfig<String> copyWithValue(String? value) =>
      copyWith(value: value);

  factory AlfredUserConfigurationConfigFilePicker.fromJson(Map json) =>
      _$AlfredUserConfigurationConfigFilePickerFromJson(
        json.map((k, v) => MapEntry(k.toString(), v)),
      );
}
