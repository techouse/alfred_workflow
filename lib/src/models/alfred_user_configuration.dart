import 'package:alfred_workflow/src/models/alfred_user_configuration_config.dart';
import 'package:alfred_workflow/src/models/alfred_user_configuration_type.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'alfred_user_configuration.g.dart';

/// Alfred user configuration generic class
abstract class AlfredUserConfiguration<
  T,
  Q extends AlfredUserConfigurationConfig<T>
>
    with EquatableMixin {
  const AlfredUserConfiguration({
    required this.type,
    required this.variable,
    this.description,
    this.label,
  });

  /// Type of configuration
  final AlfredUserConfigurationType type;

  /// Variable name
  final String variable;

  /// Description
  final String? description;

  /// Label
  final String? label;

  /// [AlfredUserConfigurationConfig] configuration
  abstract final Q config;

  /// Default value
  T get defaultValue => config.defaultValue;

  /// User set value
  T get value => config.value;

  @internal
  AlfredUserConfiguration<T, Q> copyWithConfig(Q config);

  @override
  List<Object?> get props => _$props;
}
