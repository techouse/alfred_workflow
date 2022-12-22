import 'package:autoequal/autoequal.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'alfred_action.g.dart';

@autoequalMixin
@CopyWith()
@JsonSerializable()
class AlfredAction with EquatableMixin, _$AlfredActionAutoequalMixin {
  const AlfredAction({
    this.text,
    this.url,
    this.file,
    this.auto,
  })  : assert(
          !(text == null && url == null && file == null && auto == null),
          'At least one of text, url, file or auto must be provided.',
        ),
        assert(
          text == null || (text is String || text is Iterable),
          'Text must be a String or Iterable.',
        );

  final Object? text;
  final Uri? url;
  final String? file;
  final String? auto;

  factory AlfredAction.fromJson(Map<String, dynamic> json) =>
      _$AlfredActionFromJson(json);

  Map<String, dynamic> toJson() => _$AlfredActionToJson(this);
}
