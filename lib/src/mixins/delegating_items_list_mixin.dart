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
}
