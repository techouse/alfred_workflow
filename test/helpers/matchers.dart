import 'package:test/expect.dart';

Matcher containsSubstring(String substring, [bool caseSensitive = true]) =>
    predicate(
      (String expected) =>
          expected.contains(RegExp(substring, caseSensitive: caseSensitive)),
    );
