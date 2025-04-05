// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'alfred_user_configuration_config_number_slider.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$AlfredUserConfigurationConfigNumberSliderCWProxy {
  AlfredUserConfigurationConfigNumberSlider defaultValue(int defaultValue);

  AlfredUserConfigurationConfigNumberSlider value(int? value);

  AlfredUserConfigurationConfigNumberSlider min(int min);

  AlfredUserConfigurationConfigNumberSlider max(int max);

  AlfredUserConfigurationConfigNumberSlider onlyStopOnMarkers(
      bool onlyStopOnMarkers);

  AlfredUserConfigurationConfigNumberSlider showMarkers(bool showMarkers);

  AlfredUserConfigurationConfigNumberSlider markerCount(int? markerCount);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `AlfredUserConfigurationConfigNumberSlider(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// AlfredUserConfigurationConfigNumberSlider(...).copyWith(id: 12, name: "My name")
  /// ````
  AlfredUserConfigurationConfigNumberSlider call({
    int defaultValue,
    int? value,
    int min,
    int max,
    bool onlyStopOnMarkers,
    bool showMarkers,
    int? markerCount,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfAlfredUserConfigurationConfigNumberSlider.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfAlfredUserConfigurationConfigNumberSlider.copyWith.fieldName(...)`
class _$AlfredUserConfigurationConfigNumberSliderCWProxyImpl
    implements _$AlfredUserConfigurationConfigNumberSliderCWProxy {
  const _$AlfredUserConfigurationConfigNumberSliderCWProxyImpl(this._value);

  final AlfredUserConfigurationConfigNumberSlider _value;

  @override
  AlfredUserConfigurationConfigNumberSlider defaultValue(int defaultValue) =>
      this(defaultValue: defaultValue);

  @override
  AlfredUserConfigurationConfigNumberSlider value(int? value) =>
      this(value: value);

  @override
  AlfredUserConfigurationConfigNumberSlider min(int min) => this(min: min);

  @override
  AlfredUserConfigurationConfigNumberSlider max(int max) => this(max: max);

  @override
  AlfredUserConfigurationConfigNumberSlider onlyStopOnMarkers(
          bool onlyStopOnMarkers) =>
      this(onlyStopOnMarkers: onlyStopOnMarkers);

  @override
  AlfredUserConfigurationConfigNumberSlider showMarkers(bool showMarkers) =>
      this(showMarkers: showMarkers);

  @override
  AlfredUserConfigurationConfigNumberSlider markerCount(int? markerCount) =>
      this(markerCount: markerCount);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `AlfredUserConfigurationConfigNumberSlider(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// AlfredUserConfigurationConfigNumberSlider(...).copyWith(id: 12, name: "My name")
  /// ````
  AlfredUserConfigurationConfigNumberSlider call({
    Object? defaultValue = const $CopyWithPlaceholder(),
    Object? value = const $CopyWithPlaceholder(),
    Object? min = const $CopyWithPlaceholder(),
    Object? max = const $CopyWithPlaceholder(),
    Object? onlyStopOnMarkers = const $CopyWithPlaceholder(),
    Object? showMarkers = const $CopyWithPlaceholder(),
    Object? markerCount = const $CopyWithPlaceholder(),
  }) {
    return AlfredUserConfigurationConfigNumberSlider(
      defaultValue: defaultValue == const $CopyWithPlaceholder()
          ? _value.defaultValue
          // ignore: cast_nullable_to_non_nullable
          : defaultValue as int,
      value: value == const $CopyWithPlaceholder()
          ? _value.value
          // ignore: cast_nullable_to_non_nullable
          : value as int?,
      min: min == const $CopyWithPlaceholder()
          ? _value.min
          // ignore: cast_nullable_to_non_nullable
          : min as int,
      max: max == const $CopyWithPlaceholder()
          ? _value.max
          // ignore: cast_nullable_to_non_nullable
          : max as int,
      onlyStopOnMarkers: onlyStopOnMarkers == const $CopyWithPlaceholder()
          ? _value.onlyStopOnMarkers
          // ignore: cast_nullable_to_non_nullable
          : onlyStopOnMarkers as bool,
      showMarkers: showMarkers == const $CopyWithPlaceholder()
          ? _value.showMarkers
          // ignore: cast_nullable_to_non_nullable
          : showMarkers as bool,
      markerCount: markerCount == const $CopyWithPlaceholder()
          ? _value.markerCount
          // ignore: cast_nullable_to_non_nullable
          : markerCount as int?,
    );
  }
}

extension $AlfredUserConfigurationConfigNumberSliderCopyWith
    on AlfredUserConfigurationConfigNumberSlider {
  /// Returns a callable class that can be used as follows: `instanceOfAlfredUserConfigurationConfigNumberSlider.copyWith(...)` or like so:`instanceOfAlfredUserConfigurationConfigNumberSlider.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$AlfredUserConfigurationConfigNumberSliderCWProxy get copyWith =>
      _$AlfredUserConfigurationConfigNumberSliderCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AlfredUserConfigurationConfigNumberSlider
    _$AlfredUserConfigurationConfigNumberSliderFromJson(
            Map<String, dynamic> json) =>
        AlfredUserConfigurationConfigNumberSlider(
          defaultValue: (AlfredUserConfigurationConfig.fromJsonDefaultValue(
                  json, 'default') as num)
              .toInt(),
          min: (json['minvalue'] as num).toInt(),
          max: (json['maxvalue'] as num).toInt(),
          onlyStopOnMarkers: json['onlystoponmarkers'] as bool? ?? false,
          showMarkers: json['showmarkers'] as bool? ?? false,
          markerCount: (json['markercount'] as num?)?.toInt(),
        );
