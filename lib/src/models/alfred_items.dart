import 'package:alfred_workflow/src/mixins/delegating_items_list_mixin.dart';
import 'package:alfred_workflow/src/models/alfred_automatic_cache.dart';
import 'package:autoequal/autoequal.dart';
import 'package:equatable/equatable.dart' show EquatableMixin;

import 'alfred_item.dart';

part 'alfred_items.g.dart';

@autoequal
final class AlfredItems
    with EquatableMixin, DelegatingItemsListMixin<AlfredItem> {
  const AlfredItems(
    this.items, {
    this.exactOrder,
    this.skipKnowledge,
    this.cache,
  });

  /// A list of zero or more [AlfredItem]s.
  ///
  /// Each [AlfredItem] describes a result row displayed in Alfred.
  @override
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

  /// Scripts which take a while to return can cache results so users see data sooner on subsequent runs.
  /// The Script Filter presents the results from the previous run when caching is active and hasn't expired.
  /// Because the script won't execute when loading cached data, we recommend this option only be used with
  /// "Alfred filters results".
  ///
  /// Only available in Alfred 5.5
  final AlfredAutomaticCache? cache;

  factory AlfredItems.fromJson(Map<String, dynamic> json) => AlfredItems(
        (json['items'] as List)
            .map((e) => AlfredItem.fromJson(Map<String, dynamic>.from(e)))
            .toList(),
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        if (cache != null) 'cache': cache!.toJson(),
        if (skipKnowledge != null) 'skipknowledge': skipKnowledge,
        'items': <Map<String, dynamic>>[
          for (final AlfredItem item in items)
            if (exactOrder ?? false)
              item.toJson()..remove('uid')
            else
              item.toJson(),
        ],
      };

  @override
  List<Object?> get props => _$props;

  /// Copy this [AlfredItems] with the given [items], [exactOrder], [skipKnowledge], of [cache].
  AlfredItems copyWith({
    List<AlfredItem>? items,
    bool? exactOrder,
    bool? skipKnowledge,
    AlfredAutomaticCache? cache,
  }) =>
      AlfredItems(
        items ?? [...this.items],
        skipKnowledge: skipKnowledge ?? this.skipKnowledge,
        exactOrder: exactOrder ?? this.exactOrder,
        cache: cache ?? this.cache,
      );
}
