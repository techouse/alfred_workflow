import 'package:alfred_workflow/src/models/alfred_user_configuration_config.dart';
import 'package:autoequal/autoequal.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'alfred_user_configuration_config_number_slider.g.dart';

/// Alfred integer slider user configuration config
@autoequal
@CopyWith()
@JsonSerializable(explicitToJson: true, createToJson: false)
final class AlfredUserConfigurationConfigNumberSlider
    extends AlfredUserConfigurationConfig<int> with EquatableMixin {
  const AlfredUserConfigurationConfigNumberSlider({
    required super.defaultValue,
    super.value,
    required this.min,
    required this.max,
    this.onlyStopOnMarkers = false,
    this.showMarkers = false,
    this.markerCount,
  })  : assert(min < max, 'min must be less than max'),
        assert(
          defaultValue >= min && defaultValue <= max,
          'defaultValue must be between min and max',
        ),
        assert(
          value == null || (value >= min && value <= max),
          'value must be between min and max',
        ),
        assert(
          showMarkers == false || markerCount != null,
          'markerCount must be provided if showMarkers is true',
        ),
        assert(
          showMarkers == false || markerCount != 0,
          'markerCount must be greater than 0 if showMarkers is true',
        ),
        assert(
          onlyStopOnMarkers == false || markerCount != null,
          'markerCount must be provided if onlyStopOnMarkers is true',
        ),
        assert(
          onlyStopOnMarkers == false || markerCount != 0,
          'markerCount must be greater than 0 if onlyStopOnMarkers is true',
        ),
        assert(
          markerCount == null || markerCount > 0,
          'markerCount must be greater than 0 if provided',
        );

  @JsonKey(name: 'minvalue')
  final int min;
  @JsonKey(name: 'maxvalue')
  final int max;
  @JsonKey(name: 'showmarkers')
  final bool showMarkers;
  @JsonKey(name: 'onlystoponmarkers')
  final bool onlyStopOnMarkers;
  @JsonKey(name: 'markercount')
  final int? markerCount;

  @internal
  @override
  AlfredUserConfigurationConfig<int> copyWithValue(int? value) =>
      copyWith(value: value);

  factory AlfredUserConfigurationConfigNumberSlider.fromJson(Map json) =>
      _$AlfredUserConfigurationConfigNumberSliderFromJson(
        json.map((k, v) => MapEntry(k.toString(), v)),
      );
}
