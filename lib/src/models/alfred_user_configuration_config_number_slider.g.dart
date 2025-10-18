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
    bool onlyStopOnMarkers,
  );

  AlfredUserConfigurationConfigNumberSlider showMarkers(bool showMarkers);

  AlfredUserConfigurationConfigNumberSlider markerCount(int? markerCount);

  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored. To update a single field use `AlfredUserConfigurationConfigNumberSlider(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// AlfredUserConfigurationConfigNumberSlider(...).copyWith(id: 12, name: "My name")
  /// ```
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

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfAlfredUserConfigurationConfigNumberSlider.copyWith(...)` or call `instanceOfAlfredUserConfigurationConfigNumberSlider.copyWith.fieldName(value)` for a single field.
class _$AlfredUserConfigurationConfigNumberSliderCWProxyImpl
    implements _$AlfredUserConfigurationConfigNumberSliderCWProxy {
  const _$AlfredUserConfigurationConfigNumberSliderCWProxyImpl(this._value);

  final AlfredUserConfigurationConfigNumberSlider _value;

  @override
  AlfredUserConfigurationConfigNumberSlider defaultValue(int defaultValue) =>
      call(defaultValue: defaultValue);

  @override
  AlfredUserConfigurationConfigNumberSlider value(int? value) =>
      call(value: value);

  @override
  AlfredUserConfigurationConfigNumberSlider min(int min) => call(min: min);

  @override
  AlfredUserConfigurationConfigNumberSlider max(int max) => call(max: max);

  @override
  AlfredUserConfigurationConfigNumberSlider onlyStopOnMarkers(
    bool onlyStopOnMarkers,
  ) => call(onlyStopOnMarkers: onlyStopOnMarkers);

  @override
  AlfredUserConfigurationConfigNumberSlider showMarkers(bool showMarkers) =>
      call(showMarkers: showMarkers);

  @override
  AlfredUserConfigurationConfigNumberSlider markerCount(int? markerCount) =>
      call(markerCount: markerCount);

  @override
  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored. To update a single field use `AlfredUserConfigurationConfigNumberSlider(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// AlfredUserConfigurationConfigNumberSlider(...).copyWith(id: 12, name: "My name")
  /// ```
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
      defaultValue:
          defaultValue == const $CopyWithPlaceholder() || defaultValue == null
          ? _value.defaultValue
          // ignore: cast_nullable_to_non_nullable
          : defaultValue as int,
      value: value == const $CopyWithPlaceholder()
          ? _value.value
          // ignore: cast_nullable_to_non_nullable
          : value as int?,
      min: min == const $CopyWithPlaceholder() || min == null
          ? _value.min
          // ignore: cast_nullable_to_non_nullable
          : min as int,
      max: max == const $CopyWithPlaceholder() || max == null
          ? _value.max
          // ignore: cast_nullable_to_non_nullable
          : max as int,
      onlyStopOnMarkers:
          onlyStopOnMarkers == const $CopyWithPlaceholder() ||
              onlyStopOnMarkers == null
          ? _value.onlyStopOnMarkers
          // ignore: cast_nullable_to_non_nullable
          : onlyStopOnMarkers as bool,
      showMarkers:
          showMarkers == const $CopyWithPlaceholder() || showMarkers == null
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
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfAlfredUserConfigurationConfigNumberSlider.copyWith(...)` or `instanceOfAlfredUserConfigurationConfigNumberSlider.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$AlfredUserConfigurationConfigNumberSliderCWProxy get copyWith =>
      _$AlfredUserConfigurationConfigNumberSliderCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AlfredUserConfigurationConfigNumberSlider
_$AlfredUserConfigurationConfigNumberSliderFromJson(
  Map<String, dynamic> json,
) => AlfredUserConfigurationConfigNumberSlider(
  defaultValue:
      (AlfredUserConfigurationConfig.fromJsonDefaultValue(json, 'default')
              as num)
          .toInt(),
  min: (json['minvalue'] as num).toInt(),
  max: (json['maxvalue'] as num).toInt(),
  onlyStopOnMarkers: json['onlystoponmarkers'] as bool? ?? false,
  showMarkers: json['showmarkers'] as bool? ?? false,
  markerCount: (json['markercount'] as num?)?.toInt(),
);
