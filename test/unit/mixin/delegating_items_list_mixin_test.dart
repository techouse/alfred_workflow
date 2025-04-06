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

    test('any returns true if any element matches', () {
      expect(testList.any((e) => e > 3), isTrue);
      expect(testList.any((e) => e > 10), isFalse);
    });

    test('contains checks for element existence', () {
      expect(testList.contains(3), isTrue);
      expect(testList.contains(99), isFalse);
    });

    test('elementAt returns correct element', () {
      expect(testList.elementAt(2), equals(3));
    });

    test('every checks if all elements match condition', () {
      expect(testList.every((e) => e > 0), isTrue);
      expect(testList.every((e) => e % 2 == 0), isFalse);
    });

    test('expand returns a flattened iterable', () {
      final List<int> expanded = testList.expand((e) => [e, e * 10]).toList();
      expect(expanded, equals([1, 10, 2, 20, 3, 30, 4, 40, 5, 50]));
    });

    test('first getter returns first element', () {
      expect(testList.first, equals(1));
    });

    test('firstWhere returns correct element or uses orElse', () {
      expect(testList.firstWhere((e) => e > 3), equals(4));
      expect(testList.firstWhere((e) => e > 10, orElse: () => -1), equals(-1));
    });

    test('fold aggregates elements', () {
      final int sum = testList.fold(0, (prev, element) => prev + element);
      expect(sum, equals(15));
    });

    test('followedBy concatenates iterables', () {
      final List<int> result = testList.followedBy([6, 7]).toList();
      expect(result, equals([1, 2, 3, 4, 5, 6, 7]));
    });

    test('forEach applies function to each element', () {
      int sum = 0;
      testList.forEach((e) => sum += e);
      expect(sum, equals(15));
    });

    test('isEmpty and isNotEmpty', () {
      expect(testList.isEmpty, isFalse);
      final _TestList<int> emptyList = _TestList<int>([]);
      expect(emptyList.isEmpty, isTrue);
      expect(emptyList.isNotEmpty, isFalse);
    });

    test('join concatenates elements into a string', () {
      final String joined = testList.join(', ');
      expect(joined, equals('1, 2, 3, 4, 5'));
    });

    test('last getter returns last element', () {
      expect(testList.last, equals(5));
    });

    test('lastWhere returns correct element or uses orElse', () {
      expect(testList.lastWhere((e) => e < 4), equals(3));
      expect(testList.lastWhere((e) => e > 10, orElse: () => -1), equals(-1));
    });

    test('length getter returns correct number of elements', () {
      expect(testList.length, equals(5));
    });

    test('map transforms elements', () {
      final List<int> mapped = testList.map((e) => e * 2).toList();
      expect(mapped, equals([2, 4, 6, 8, 10]));
    });

    test('reduce aggregates elements', () {
      final int sum = testList.reduce((a, b) => a + b);
      expect(sum, equals(15));
    });

    test('single returns sole element when list has one element', () {
      final _TestList<int> singleList = _TestList<int>([42]);
      expect(singleList.single, equals(42));
    });

    test('singleWhere returns element matching condition', () {
      final int singleResult =
          _TestList<int>([1, 2, 3, 4, 5, 3]).singleWhere((e) => e == 4);
      expect(singleResult, equals(4));
      expect(() => testList.singleWhere((e) => e % 2 == 0),
          throwsA(isA<StateError>()));
    });

    test('skip returns iterable without first n elements', () {
      final List<int> skipped = testList.skip(2).toList();
      expect(skipped, equals([3, 4, 5]));
    });

    test('skipWhile skips while condition is true', () {
      final List<int> skipped = testList.skipWhile((e) => e < 3).toList();
      expect(skipped, equals([3, 4, 5]));
    });

    test('take returns first n elements', () {
      final List<int> taken = testList.take(3).toList();
      expect(taken, equals([1, 2, 3]));
    });

    test('takeWhile takes while condition is true', () {
      final List<int> taken = testList.takeWhile((e) => e < 4).toList();
      expect(taken, equals([1, 2, 3]));
    });

    test('toList returns a list', () {
      final List<int> newList = testList.toList();
      expect(newList, equals([1, 2, 3, 4, 5]));
    });

    test('toSet returns a set', () {
      final Set<int> set = testList.toSet();
      expect(set, equals({1, 2, 3, 4, 5}));
    });

    test('where filters elements', () {
      final List<int> even = testList.where((e) => e % 2 == 0).toList();
      expect(even, equals([2, 4]));
    });

    test('whereType filters by type', () {
      final _TestList mixedList = _TestList<dynamic>([1, 'two', 3, 'four']);
      final List<int> ints = mixedList.whereType<int>().toList();
      expect(ints, equals([1, 3]));
    });
  });

  group('DelegatingItemsListMixin - Empty List', () {
    late _TestList<int> emptyList;

    setUp(() {
      emptyList = _TestList<int>([]);
    });

    test('index operator should throw RangeError', () {
      expect(() => emptyList[0], throwsRangeError);
    });

    test('first setter should throw RangeError', () {
      expect(() => emptyList.first = 10, throwsRangeError);
    });

    test('last setter should throw RangeError', () {
      expect(() => emptyList.last = 10, throwsRangeError);
    });

    test('removeLast should throw RangeError', () {
      expect(() => emptyList.removeLast(), throwsRangeError);
    });

    test('clear is a no-op for an empty list', () {
      emptyList.clear();
      expect(emptyList.items, isEmpty);
    });

    test('add correctly sets an element in an empty list', () {
      emptyList.add(1);
      expect(emptyList.items, equals([1]));
    });

    test('any returns false for empty list', () {
      expect(emptyList.any((e) => e > 0), isFalse);
    });

    test('contains returns false for any element', () {
      expect(emptyList.contains(1), isFalse);
    });

    test('elementAt throws RangeError', () {
      expect(() => emptyList.elementAt(0), throwsRangeError);
    });

    test('every returns true for empty list', () {
      // Every predicate returns true by definition for empty collections.
      expect(emptyList.every((e) => e > 0), isTrue);
    });

    test('expand returns an empty iterable', () {
      expect(emptyList.expand((e) => [e, e * 10]).isEmpty, isTrue);
    });

    test('first getter throws StateError', () {
      expect(() => emptyList.first, throwsStateError);
    });

    test('firstWhere without orElse throws StateError', () {
      expect(() => emptyList.firstWhere((e) => e > 0), throwsStateError);
    });

    test('firstWhere with orElse uses the provided function', () {
      expect(emptyList.firstWhere((e) => e > 0, orElse: () => -1), equals(-1));
    });

    test('fold returns the initial value', () {
      final int result = emptyList.fold(10, (prev, e) => prev + e);
      expect(result, equals(10));
    });

    test('followedBy returns other iterable when empty', () {
      final List<int> result = emptyList.followedBy([1, 2, 3]).toList();
      expect(result, equals([1, 2, 3]));
    });

    test('forEach does not execute on empty list', () {
      int sum = 0;
      emptyList.forEach((e) => sum += e);
      expect(sum, equals(0));
    });

    test('isEmpty and isNotEmpty', () {
      expect(emptyList.isEmpty, isTrue);
      expect(emptyList.isNotEmpty, isFalse);
    });

    test('iterator on empty list', () {
      final Iterator<int> iterator = emptyList.iterator;
      expect(iterator.moveNext(), isFalse);
    });

    test('iterator on non-empty list', () {
      final _TestList<int> nonEmptyList = _TestList<int>([1, 2, 3]);
      final Iterator<int> iterator = nonEmptyList.iterator;
      expect(iterator.moveNext(), isTrue);
      expect(iterator.current, equals(1));
      expect(iterator.moveNext(), isTrue);
      expect(iterator.current, equals(2));
      expect(iterator.moveNext(), isTrue);
      expect(iterator.current, equals(3));
      expect(iterator.moveNext(), isFalse);
    });

    test('join returns empty string', () {
      expect(emptyList.join(', '), equals(''));
    });

    test('last getter throws StateError', () {
      expect(() => emptyList.last, throwsStateError);
    });

    test('lastWhere without orElse throws StateError', () {
      expect(() => emptyList.lastWhere((e) => e > 0), throwsStateError);
    });

    test('lastWhere with orElse uses the provided function', () {
      expect(emptyList.lastWhere((e) => e > 0, orElse: () => -1), equals(-1));
    });

    test('length returns 0', () {
      expect(emptyList.length, equals(0));
    });

    test('map returns an empty iterable', () {
      final List<int> mapped = emptyList.map((e) => e * 2).toList();
      expect(mapped, isEmpty);
    });

    test('reduce throws StateError', () {
      expect(() => emptyList.reduce((a, b) => a + b), throwsStateError);
    });

    test('single throws StateError', () {
      expect(() => emptyList.single, throwsStateError);
    });

    test('singleWhere throws StateError', () {
      expect(() => emptyList.singleWhere((e) => e > 0), throwsStateError);
    });

    test('skip returns empty iterable', () {
      final List<int> skipped = emptyList.skip(2).toList();
      expect(skipped, isEmpty);
    });

    test('skipWhile returns empty iterable', () {
      final List<int> skipped = emptyList.skipWhile((e) => e < 3).toList();
      expect(skipped, isEmpty);
    });

    test('take returns empty iterable', () {
      final List<int> taken = emptyList.take(3).toList();
      expect(taken, isEmpty);
    });

    test('takeWhile returns empty iterable', () {
      final List<int> taken = emptyList.takeWhile((e) => e < 3).toList();
      expect(taken, isEmpty);
    });

    test('toList returns an empty list', () {
      expect(emptyList.toList(), isEmpty);
    });

    test('toSet returns an empty set', () {
      expect(emptyList.toSet(), isEmpty);
    });

    test('where returns an empty iterable', () {
      expect(emptyList.where((e) => e > 0).isEmpty, isTrue);
    });

    test('whereType returns an empty iterable', () {
      // Using dynamic type list; no int element present returns empty.
      final _TestList mixedList = _TestList<dynamic>([]);
      expect(mixedList.whereType<int>().isEmpty, isTrue);
    });
  });
}
