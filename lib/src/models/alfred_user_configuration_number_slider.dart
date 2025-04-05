import 'package:alfred_workflow/src/models/alfred_user_configuration.dart';
import 'package:alfred_workflow/src/models/alfred_user_configuration_config_number_slider.dart';
import 'package:alfred_workflow/src/models/alfred_user_configuration_type.dart';
import 'package:autoequal/autoequal.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'alfred_user_configuration_number_slider.g.dart';

/// Alfred text area user configuration
@autoequal
@CopyWith()
@JsonSerializable(explicitToJson: true, createToJson: false)
final class AlfredUserConfigurationNumberSlider
    extends AlfredUserConfiguration<AlfredUserConfigurationConfigNumberSlider>
    with EquatableMixin {
  const AlfredUserConfigurationNumberSlider({
    required super.type,
    required super.variable,
    required this.config,
    super.description,
    super.label,
  });

  /// The configuration for the text area
  @override
  @JsonKey(fromJson: _configFromJson)
  final AlfredUserConfigurationConfigNumberSlider config;

  @internal
  @override
  AlfredUserConfiguration<AlfredUserConfigurationConfigNumberSlider>
      copyWithConfig(AlfredUserConfigurationConfigNumberSlider config) =>
          copyWith(config: config);

  static AlfredUserConfigurationConfigNumberSlider _configFromJson(Map json) =>
      AlfredUserConfigurationConfigNumberSlider.fromJson(
        json.map((k, v) => MapEntry(k.toString(), v)),
      );

  factory AlfredUserConfigurationNumberSlider.fromJson(Map json) =>
      _$AlfredUserConfigurationNumberSliderFromJson(
        json.map((k, v) => MapEntry(k.toString(), v)),
      );
}
