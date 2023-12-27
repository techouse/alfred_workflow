import 'package:alfred_workflow/src/models/alfred_user_configuration_config.dart';
import 'package:alfred_workflow/src/models/alfred_user_configuration_type.dart';
import 'package:autoequal/autoequal.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'alfred_user_configuration.g.dart';

/// Alfred user configuration generic class
@autoequalMixin
abstract class AlfredUserConfiguration<T extends AlfredUserConfigurationConfig>
    with EquatableMixin, _$AlfredUserConfigurationAutoequalMixin {
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
  abstract final T config;

  @internal
  AlfredUserConfiguration<T> copyWithConfig(T? config);
}
