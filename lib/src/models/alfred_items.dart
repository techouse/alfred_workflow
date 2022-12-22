import 'package:equatable/equatable.dart' show EquatableMixin;

import 'alfred_item.dart';

class AlfredItems with EquatableMixin {
  const AlfredItems(this.items, {this.skipKnowledge, this.exactOrder});

  /// A list of zero or more [AlfredItem]s.
  ///
  /// Each [AlfredItem] describes a result row displayed in Alfred.
  final List<AlfredItem> items;

  /// Alfred learns to prioritise item results like he learns any other, meaning
  /// the order in which your workflow results are presented will be based on Alfred's
  /// knowledge (using the item UID) and not the order your script returns the items.
  ///
  /// To have Alfred present the items in the exact sequence you define, exclude the UID attribute.
  final bool? exactOrder;

  /// This preserves the given item order while allowing Alfred to retain
  /// knowledge of your items, like your current selection during a re-run.
  ///
  /// Only available in Alfred 5
  final bool? skipKnowledge;

  factory AlfredItems.fromJson(Map<String, dynamic> json) => AlfredItems(
        (json['items'] as List)
            .map((e) => AlfredItem.fromJson(Map<String, dynamic>.from(e)))
            .toList(),
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        if (skipKnowledge != null) 'skipknowledge': skipKnowledge,
        'items': items
            .map((AlfredItem item) => exactOrder ?? false
                ? (item.toJson()..remove('uid'))
                : item.toJson())
            .toList(),
      };

  @override
  List<Object?> get props => [items];
}
