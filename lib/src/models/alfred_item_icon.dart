import 'abstract/serializable_model.dart';

enum AlfredItemIconType {
  fileicon,
  filetype,
}

class AlfredItemIcon implements SerializableModel {
  const AlfredItemIcon({
    required this.path,
    this.type,
  });

  final String path;
  final AlfredItemIconType? type;

  @override
  Map<String, dynamic> toJson() => {
        if (type != null) 'type': type!.name,
        'path': path,
      };
}
