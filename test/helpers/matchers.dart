import 'package:test/expect.dart';

Matcher containsSubstring(String substring, [bool caseSensitive = true]) =>
    predicate(
      (String expected) => expected.contains(
        RegExp(RegExp.escape(substring), caseSensitive: caseSensitive),
      ),
    );
