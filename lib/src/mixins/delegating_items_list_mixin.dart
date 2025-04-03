import 'dart:math' as math;

/// A mixin that delegates common list operations to an underlying [List].
///
/// Classes that mix in [DelegatingItemsListMixin] must provide an implementation
/// for the abstract [items] getter. The mixin exposes standard list operations
/// (such as indexing, addition, removal, range operations, sorting, etc.) by delegating
/// them to the underlying [items]. This enables code reuse for any class that manages a list.
///
/// Example:
/// ```dart
/// class MyList<E> with DelegatingItemsListMixin<E> {
///   @override
///   final List<E> items = [];
/// }
/// ```
mixin DelegatingItemsListMixin<E> {
  abstract final List<E> items;

  E operator [](int index) => items[index];

  void operator []=(int index, E value) {
    items[index] = value;
  }

  List<E> operator +(List<E> other) => items + other;

  void add(E value) {
    items.add(value);
  }

  void addAll(Iterable<E> iterable) {
    items.addAll(iterable);
  }

  Map<int, E> asMap() => items.asMap();

  List<T> cast<T>() => items.cast<T>();

  void clear() {
    items.clear();
  }

  void fillRange(int start, int end, [E? fillValue]) {
    items.fillRange(start, end, fillValue);
  }

  set first(E value) {
    if (items.isEmpty) throw RangeError.index(0, this);
    this[0] = value;
  }

  Iterable<E> getRange(int start, int end) => items.getRange(start, end);

  int indexOf(E element, [int start = 0]) => items.indexOf(element, start);

  int indexWhere(bool Function(E) test, [int start = 0]) =>
      items.indexWhere(test, start);

  void insert(int index, E element) {
    items.insert(index, element);
  }

  void insertAll(int index, Iterable<E> iterable) {
    items.insertAll(index, iterable);
  }

  set last(E value) {
    if (items.isEmpty) throw RangeError.index(0, this);
    this[items.length - 1] = value;
  }

  int lastIndexOf(E element, [int? start]) => items.lastIndexOf(element, start);

  int lastIndexWhere(bool Function(E) test, [int? start]) =>
      items.lastIndexWhere(test, start);

  set length(int newLength) {
    items.length = newLength;
  }

  bool remove(Object? value) => items.remove(value);

  E removeAt(int index) => items.removeAt(index);

  E removeLast() => items.removeLast();

  void removeRange(int start, int end) {
    items.removeRange(start, end);
  }

  void removeWhere(bool Function(E) test) {
    items.removeWhere(test);
  }

  void replaceRange(int start, int end, Iterable<E> iterable) {
    items.replaceRange(start, end, iterable);
  }

  void retainWhere(bool Function(E) test) {
    items.retainWhere(test);
  }

  Iterable<E> get reversed => items.reversed;

  void setAll(int index, Iterable<E> iterable) {
    items.setAll(index, iterable);
  }

  void setRange(int start, int end, Iterable<E> iterable, [int skipCount = 0]) {
    items.setRange(start, end, iterable, skipCount);
  }

  void shuffle([math.Random? random]) {
    items.shuffle(random);
  }

  void sort([int Function(E, E)? compare]) {
    items.sort(compare);
  }

  List<E> sublist(int start, [int? end]) => items.sublist(start, end);

  bool any(bool Function(E) test) => items.any(test);

  bool contains(Object? element) => items.contains(element);

  E elementAt(int index) => items.elementAt(index);

  bool every(bool Function(E) test) => items.every(test);

  Iterable<T> expand<T>(Iterable<T> Function(E) f) => items.expand(f);

  E get first => items.first;

  E firstWhere(bool Function(E) test, {E Function()? orElse}) =>
      items.firstWhere(test, orElse: orElse);

  T fold<T>(T initialValue, T Function(T previousValue, E element) combine) =>
      items.fold(initialValue, combine);

  Iterable<E> followedBy(Iterable<E> other) => items.followedBy(other);

  void forEach(void Function(E) f) => items.forEach(f);

  bool get isEmpty => items.isEmpty;

  bool get isNotEmpty => items.isNotEmpty;

  Iterator<E> get iterator => items.iterator;

  String join([String separator = '']) => items.join(separator);

  E get last => items.last;

  E lastWhere(bool Function(E) test, {E Function()? orElse}) =>
      items.lastWhere(test, orElse: orElse);

  int get length => items.length;

  Iterable<T> map<T>(T Function(E) f) => items.map(f);

  E reduce(E Function(E value, E element) combine) => items.reduce(combine);

  E get single => items.single;

  E singleWhere(bool Function(E) test, {E Function()? orElse}) {
    return items.singleWhere(test, orElse: orElse);
  }

  Iterable<E> skip(int n) => items.skip(n);

  Iterable<E> skipWhile(bool Function(E) test) => items.skipWhile(test);

  Iterable<E> take(int n) => items.take(n);

  Iterable<E> takeWhile(bool Function(E) test) => items.takeWhile(test);

  List<E> toList({bool growable = true}) => items.toList(growable: growable);

  Set<E> toSet() => items.toSet();

  Iterable<E> where(bool Function(E) test) => items.where(test);

  Iterable<T> whereType<T>() => items.whereType<T>();
}
