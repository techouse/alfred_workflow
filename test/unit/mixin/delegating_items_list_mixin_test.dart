import 'dart:math' as math;
import 'package:alfred_workflow/src/mixins/delegating_items_list_mixin.dart';
import 'package:test/test.dart';

/// A simple concrete class that uses [DelegatingItemsListMixin].
class _TestList<E> with DelegatingItemsListMixin<E> {
  @override
  final List<E> items;

  _TestList([List<E>? initial]) : items = initial ?? [];
}

void main() {
  group('DelegatingItemsListMixin', () {
    late _TestList<int> testList;

    setUp(() {
      testList = _TestList<int>([1, 2, 3, 4, 5]);
    });

    test('index operator and assignment', () {
      expect(testList[0], 1);
      testList[0] = 10;
      expect(testList[0], 10);
    });

    test('addition operator', () {
      final List<int> result = testList + [6, 7];
      expect(result, equals([1, 2, 3, 4, 5, 6, 7]));
    });

    test('add', () {
      testList.add(6);
      expect(testList.items, contains(6));
    });

    test('addAll', () {
      testList.addAll([7, 8]);
      expect(testList.items, containsAll([7, 8]));
    });

    test('asMap', () {
      final Map<int, int> map = testList.asMap();
      expect(map.keys, contains(0));
      expect(map[1], equals(2));
    });

    test('cast', () {
      final _TestList<num> list = _TestList<num>([1, 2, 3]);
      final List<int> casted = list.cast<int>();
      for (final int element in casted) {
        expect(element, isA<int>());
      }
    });

    test('clear', () {
      testList.clear();
      expect(testList.items, isEmpty);
    });

    test('fillRange', () {
      // Fill indices 1 to 4 with the value 0.
      testList.fillRange(1, 4, 0);
      expect(testList.items, equals([1, 0, 0, 0, 5]));
    });

    test('first setter', () {
      testList.first = 100;
      expect(testList.items.first, equals(100));
    });

    test('getRange', () {
      final Iterable<int> range = testList.getRange(1, 4);
      expect(range, equals([2, 3, 4]));
    });

    test('indexOf', () {
      expect(testList.indexOf(3), equals(2));
      expect(testList.indexOf(999), equals(-1));
    });

    test('indexWhere', () {
      final int index = testList.indexWhere((element) => element > 3);
      expect(index, equals(3));
    });

    test('insert', () {
      testList.insert(2, 99);
      expect(testList.items[2], equals(99));
      expect(testList.items.length, equals(6));
    });

    test('insertAll', () {
      testList.insertAll(3, [77, 88]);
      expect(testList.items[3], equals(77));
      expect(testList.items[4], equals(88));
      expect(testList.items.length, equals(7));
    });

    test('last setter', () {
      testList.last = 500;
      expect(testList.items.last, equals(500));
    });

    test('lastIndexOf', () {
      // Duplicate a value.
      testList.add(3);
      expect(testList.lastIndexOf(3), equals(5));
    });

    test('lastIndexWhere', () {
      // Duplicate a value.
      testList.add(4);
      final int index = testList.lastIndexWhere((element) => element == 4);
      expect(index, equals(testList.items.lastIndexOf(4)));
    });

    test('length setter', () {
      testList.length = 3;
      expect(testList.items, equals([1, 2, 3]));

      // Extending length fills with null. Use a list of non-nullable type.
      // Instead, create a new instance using a nullable type.
      final _TestList<int?> nullableList = _TestList<int?>([1, 2, 3]);
      nullableList.length = 5;
      expect(nullableList.items.length, equals(5));
    });

    test('remove', () {
      final bool removed = testList.remove(3);
      expect(removed, isTrue);
      expect(testList.items.contains(3), isFalse);
    });

    test('removeAt', () {
      final int removed = testList.removeAt(0);
      expect(removed, equals(1));
      expect(testList.items.first, equals(2));
    });

    test('removeLast', () {
      final int removed = testList.removeLast();
      expect(removed, equals(5));
      expect(testList.items.last, equals(4));
    });

    test('removeRange', () {
      testList.removeRange(1, 3);
      expect(testList.items, equals([1, 4, 5]));
    });

    test('removeWhere', () {
      testList.removeWhere((element) => element.isEven);
      expect(testList.items, equals([1, 3, 5]));
    });

    test('replaceRange', () {
      testList.replaceRange(1, 3, [100, 200]);
      expect(testList.items, equals([1, 100, 200, 4, 5]));
    });

    test('retainWhere', () {
      testList.retainWhere((element) => element > 3);
      expect(testList.items, equals([4, 5]));
    });

    test('reversed', () {
      final List<int> reversed = testList.reversed.toList();
      expect(reversed, equals(testList.items.reversed.toList()));
    });

    test('setAll', () {
      testList.setAll(2, [99, 98]);
      expect(testList.items[2], equals(99));
      expect(testList.items[3], equals(98));
    });

    test('setRange', () {
      testList.setRange(1, 4, [9, 8, 7]);
      expect(testList.items.sublist(1, 4), equals([9, 8, 7]));
    });

    test('shuffle', () {
      final List<int> original = List<int>.from(testList.items);
      testList.shuffle(math.Random(42));
      expect(testList.items.toSet(), equals(original.toSet()));
    });

    test('sort', () {
      testList.add(0);
      testList.sort();
      expect(testList.items, equals([0, 1, 2, 3, 4, 5]));
    });

    test('sublist', () {
      final List<int> sub = testList.sublist(1, 4);
      expect(sub, equals([2, 3, 4]));
    });
  });
}
