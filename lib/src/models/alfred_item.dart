import 'abstract/serializable_model.dart';
import 'alfred_item_icon.dart';
import 'alfred_item_text.dart';

class AlfredItem implements SerializableModel {
  const AlfredItem({
    required this.title,
    this.type = 'default',
    this.valid = false,
    this.subtitle,
    this.arg,
    this.autocomplete,
    this.uid,
    this.icon,
    this.text,
    this.quickLookUrl,
    this.match,
  });

  final String title;
  final String type;
  final bool valid;
  final String? subtitle;
  final String? arg;
  final String? autocomplete;
  final String? uid;
  final AlfredItemIcon? icon;
  final AlfredItemText? text;
  final String? quickLookUrl;
  final String? match;

  @override
  Map<String, dynamic> toJson() => {
        'type': type,
        'title': title,
        'valid': valid,
        if (uid != null) 'uid': uid,
        if (subtitle != null) 'subtitle': subtitle,
        if (arg != null) 'arg': arg,
        if (icon != null) 'icon': icon!.toJson(),
        if (match != null) 'match': match,
        if (autocomplete != null) 'autocomplete': autocomplete,
        if (text != null) 'text': text!.toJson(),
        if (quickLookUrl != null) 'quicklookurl': quickLookUrl,
      };
}
