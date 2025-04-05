import 'package:json_annotation/json_annotation.dart';

/// The type of user configuration
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
  filePicker('filepicker'),
  @JsonValue('slider')
  slider('slider');

  const AlfredUserConfigurationType(this.jsonValue);

  /// The JSON value of the type
  final String jsonValue;

  @override
  String toString() => jsonValue;
}
