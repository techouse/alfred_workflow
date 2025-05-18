import 'dart:convert' show Encoding, utf8;
import 'dart:io' show Stdout, IOSink;

/// A mock implementation of stdout that captures output for testing.
class MockStdout implements Stdout {
  final StringBuffer _buffer = StringBuffer();
  String get output => _buffer.toString();

  @override
  void write(Object? object) {
    _buffer.write(object);
  }

  @override
  void writeln([Object? object = '']) {
    _buffer.writeln(object);
  }

  @override
  void writeAll(Iterable objects, [String separator = '']) {
    _buffer.writeAll(objects, separator);
  }

  @override
  void writeCharCode(int charCode) {
    _buffer.writeCharCode(charCode);
  }

  @override
  void add(List<int> bytes) {
    _buffer.write(utf8.decode(bytes));
  }

  @override
  void addError(Object error, [StackTrace? stackTrace]) {
    throw UnimplementedError();
  }

  @override
  Future<void> addStream(Stream<List<int>> stream) {
    throw UnimplementedError();
  }

  @override
  Future<void> close() {
    throw UnimplementedError();
  }

  @override
  Future<void> get done => throw UnimplementedError();

  @override
  Encoding get encoding => utf8;

  @override
  set encoding(Encoding encoding) {}

  @override
  bool get hasTerminal => false;

  @override
  IOSink get nonBlocking => throw UnimplementedError();

  @override
  bool get supportsAnsiEscapes => false;

  @override
  int get terminalColumns => 80;

  @override
  int get terminalLines => 24;

  @override
  Future<void> flush() async {}

  @override
  String get lineTerminator => '\n';

  @override
  set lineTerminator(String lineTerminator) {}

  void clear() {
    _buffer.clear();
  }
}
