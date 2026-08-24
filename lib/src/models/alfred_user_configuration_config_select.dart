import 'package:alfred_workflow/src/models/alfred_user_configuration_config.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'alfred_user_configuration_config_select.g.dart';

/// Alfred user configuration select pair record
typedef AlfredUserConfigurationConfigSelectPair = ({
  String label,
  String value,
});

/// Alfred user configuration select class

@CopyWith(constructor: '_copyWith')
@JsonSerializable(explicitToJson: true, createToJson: false)
final class AlfredUserConfigurationConfigSelect
    extends AlfredUserConfigurationConfig<String> {
  const AlfredUserConfigurationConfigSelect({
    required super.defaultValue,
    required this.pairs,
    super.value,
  });

  const AlfredUserConfigurationConfigSelect._copyWith({
    required super.defaultValue,
    required this.pairs,
    required super.value,
  }) : super.copyWith();

  /// The pairs of labels and values
  @JsonKey(fromJson: _pairsFromJson)
  final List<AlfredUserConfigurationConfigSelectPair> pairs;

  @internal
  @override
  AlfredUserConfigurationConfig<String> copyWithValue(String? value) =>
      copyWith(value: value ?? defaultValue);

  static List<AlfredUserConfigurationConfigSelectPair> _pairsFromJson(
    List json,
  ) {
    return [
      for (final List pair in json)
        (label: pair.first.toString(), value: pair.last.toString()),
    ];
  }

  factory AlfredUserConfigurationConfigSelect.fromJson(Map json) =>
      _$AlfredUserConfigurationConfigSelectFromJson(
        json.map((k, v) => MapEntry(k.toString(), v)),
      );
}
