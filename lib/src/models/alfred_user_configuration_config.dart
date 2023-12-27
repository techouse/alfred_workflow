import 'package:autoequal/autoequal.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'alfred_user_configuration_config.g.dart';

@autoequalMixin
abstract class AlfredUserConfigurationConfig<T>
    with EquatableMixin, _$AlfredUserConfigurationConfigAutoequalMixin {
  const AlfredUserConfigurationConfig({
    required this.defaultValue,
    T? value,
  }) : value = value ?? defaultValue;

  @JsonKey(name: 'default')
  final T defaultValue;
  @JsonKey(includeFromJson: false, includeToJson: false)
  final T value;

  AlfredUserConfigurationConfig<T> copyWithValue(T? value);
}
