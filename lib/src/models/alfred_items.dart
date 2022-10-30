import 'package:equatable/equatable.dart' show EquatableMixin;

import 'alfred_item.dart';

class AlfredItems with EquatableMixin {
  const AlfredItems(this.items);

  /// A list of zero or more [AlfredItem]s.
  ///
  /// Each [AlfredItem] describes a result row displayed in Alfred.
  final List<AlfredItem> items;

  factory AlfredItems.fromJson(Map<String, dynamic> json) => AlfredItems(
        (json['items'] as List)
            .map((e) => AlfredItem.fromJson(Map<String, dynamic>.from(e)))
            .toList(),
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'items': items.map((AlfredItem item) => item.toJson()).toList(),
      };

  @override
  List<Object?> get props => [items];
}
