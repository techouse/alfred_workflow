import 'dart:math' as math show Random;

import 'package:autoequal/autoequal.dart';
import 'package:collection/collection.dart';
import 'package:equatable/equatable.dart' show EquatableMixin;

import 'alfred_item.dart';

part 'alfred_items.g.dart';

@autoequal
final class AlfredItems with EquatableMixin {
  const AlfredItems(
    this.items, {
    this.exactOrder,
    this.skipKnowledge,
  });

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

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! AlfredItems) return false;
    return const DeepCollectionEquality().equals(items, other.items) &&
        exactOrder == other.exactOrder &&
        skipKnowledge == other.skipKnowledge;
  }

  @override
  int get hashCode => Object.hash(
        const DeepCollectionEquality().hash(items),
        exactOrder,
        skipKnowledge,
      );

  /// Copy this [AlfredItems] with the given [items], [exactOrder], or [skipKnowledge]
  AlfredItems copyWith({
    List<AlfredItem>? items,
    bool? exactOrder,
    bool? skipKnowledge,
  }) =>
      AlfredItems(
        items ?? [...this.items],
        skipKnowledge: skipKnowledge ?? this.skipKnowledge,
        exactOrder: exactOrder ?? this.exactOrder,
      );

  AlfredItem operator [](int index) => items[index];

  void operator []=(int index, AlfredItem value) {
    items[index] = value;
  }

  List<AlfredItem> operator +(List<AlfredItem> other) => items + other;

  void add(AlfredItem value) {
    items.add(value);
  }

  void addAll(Iterable<AlfredItem> iterable) {
    items.addAll(iterable);
  }

  Map<int, AlfredItem> asMap() => items.asMap();

  List<T> cast<T>() => items.cast<T>();

  void clear() {
    items.clear();
  }

  void fillRange(int start, int end, [AlfredItem? fillValue]) {
    items.fillRange(start, end, fillValue);
  }

  set first(AlfredItem value) {
    if (items.isEmpty) throw RangeError.index(0, this);
    this[0] = value;
  }

  Iterable<AlfredItem> getRange(int start, int end) =>
      items.getRange(start, end);

  int indexOf(AlfredItem element, [int start = 0]) =>
      items.indexOf(element, start);

  int indexWhere(bool Function(AlfredItem) test, [int start = 0]) =>
      items.indexWhere(test, start);

  void insert(int index, AlfredItem element) {
    items.insert(index, element);
  }

  void insertAll(int index, Iterable<AlfredItem> iterable) {
    items.insertAll(index, iterable);
  }

  set last(AlfredItem value) {
    if (items.isEmpty) throw RangeError.index(0, this);
    this[items.length - 1] = value;
  }

  int lastIndexOf(AlfredItem element, [int? start]) =>
      items.lastIndexOf(element, start);

  int lastIndexWhere(bool Function(AlfredItem) test, [int? start]) =>
      items.lastIndexWhere(test, start);

  set length(int newLength) {
    items.length = newLength;
  }

  bool remove(Object? value) => items.remove(value);

  AlfredItem removeAt(int index) => items.removeAt(index);

  AlfredItem removeLast() => items.removeLast();

  void removeRange(int start, int end) {
    items.removeRange(start, end);
  }

  void removeWhere(bool Function(AlfredItem) test) {
    items.removeWhere(test);
  }

  void replaceRange(int start, int end, Iterable<AlfredItem> iterable) {
    items.replaceRange(start, end, iterable);
  }

  void retainWhere(bool Function(AlfredItem) test) {
    items.retainWhere(test);
  }

  @Deprecated('Use cast instead')
  List<T> retype<T>() => cast<T>();

  Iterable<AlfredItem> get reversed => items.reversed;

  void setAll(int index, Iterable<AlfredItem> iterable) {
    items.setAll(index, iterable);
  }

  void setRange(int start, int end, Iterable<AlfredItem> iterable,
      [int skipCount = 0]) {
    items.setRange(start, end, iterable, skipCount);
  }

  void shuffle([math.Random? random]) {
    items.shuffle(random);
  }

  void sort([int Function(AlfredItem, AlfredItem)? compare]) {
    items.sort(compare);
  }

  List<AlfredItem> sublist(int start, [int? end]) => items.sublist(start, end);
}
