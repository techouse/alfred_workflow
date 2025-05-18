import 'package:alfred_workflow/alfred_workflow.dart';
import 'package:test/test.dart';

void main() {
  group('AlfredItem', () {
    test('Constructor throws AssertionError for invalid action type', () {
      // Create an invalid action type (not String, Iterable, or AlfredAction)
      final int invalidAction = 123; // Integer is not a valid action type

      // Call the constructor with an invalid action type
      expect(
        () => AlfredItem(
          title: 'Test Item',
          action: invalidAction,
          valid: true,
        ),
        throwsA(isA<AssertionError>()),
      );
    });

    test('_actionFromJson throws ArgumentError for invalid action type', () {
      // This test is a bit tricky since _actionFromJson is only called during JSON deserialization
      // We can't directly test it, but we can test that the factory method throws when given invalid data
      final Map<String, dynamic> invalidJson = {
        'title': 'Test Item',
        'valid': true,
        'action': 123, // Integer is not a valid action type
      };

      expect(
        () => AlfredItem.fromJson(invalidJson),
        throwsA(isA<ArgumentError>()),
      );
    });
  });
}
