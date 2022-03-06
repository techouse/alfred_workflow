import 'abstract/serializable_model.dart';

class AlfredItemText implements SerializableModel {
  const AlfredItemText({
    required this.copy,
    this.largeType,
  });

  final String copy;
  final String? largeType;

  @override
  Map<String, dynamic> toJson() => {
        'copy': copy,
        if (largeType != null) 'largetype': largeType,
      };
}
