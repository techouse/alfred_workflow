import 'package:autoequal/autoequal.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'alfred_user_configuration_config.g.dart';

/// Alfred user configuration config generic class
@autoequal
abstract class AlfredUserConfigurationConfig<T> with EquatableMixin {
  const AlfredUserConfigurationConfig({
    required this.defaultValue,
    T? value,
  }) : value = value ?? defaultValue;

  /// Default value
  @JsonKey(name: 'default', readValue: fromJsonDefaultValue)
  final T defaultValue;

  @internal
  static T fromJsonDefaultValue<T>(Map json, String key) =>
      json['defaultvalue'] as T? ?? json[key] as T;

  /// User set value
  @JsonKey(includeFromJson: false, includeToJson: false)
  final T value;

  @internal
  AlfredUserConfigurationConfig<T> copyWithValue(T? value);

  @override
  List<Object?> get props => _$props;
}
