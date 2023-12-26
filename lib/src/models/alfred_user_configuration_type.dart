import 'package:json_annotation/json_annotation.dart';

enum AlfredUserConfigurationType {
  @JsonValue('textfield')
  textField('textfield'),
  @JsonValue('textarea')
  textArea('textarea'),
  @JsonValue('checkbox')
  checkBox('checkbox'),
  @JsonValue('popupbutton')
  select('popupbutton'),
  @JsonValue('filepicker')
  filePicker('filepicker');

  const AlfredUserConfigurationType(this.jsonValue);

  final String jsonValue;

  @override
  String toString() => jsonValue;
}
