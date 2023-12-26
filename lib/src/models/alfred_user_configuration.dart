import 'package:alfred_workflow/src/models/alfred_user_configuration_config.dart';
import 'package:alfred_workflow/src/models/alfred_user_configuration_type.dart';
import 'package:autoequal/autoequal.dart';
import 'package:equatable/equatable.dart';

part 'alfred_user_configuration.g.dart';

@autoequalMixin
abstract class AlfredUserConfiguration<T extends AlfredUserConfigurationConfig>
    with EquatableMixin, _$AlfredUserConfigurationAutoequalMixin {
  const AlfredUserConfiguration({
    required this.type,
    required this.variable,
    this.description,
    this.label,
  });

  final AlfredUserConfigurationType type;
  final String variable;
  final String? description;
  final String? label;
  abstract final T config;

  AlfredUserConfiguration<T> copyWithConfig(T config);
}
