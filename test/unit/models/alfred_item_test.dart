import 'package:alfred_workflow/alfred_workflow.dart';
import 'package:test/test.dart';

void main() {
  group('AlfredItem', () {
    test('Constructor throws AssertionError for invalid action type', () {
      // Create an invalid action type (not String, Iterable, or AlfredAction)
      const int invalidAction = 123; // Integer is not a valid action type

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
      const Map<String, dynamic> invalidJson = {
        'title': 'Test Item',
        'valid': true,
        'action': 123, // Integer is not a valid action type
      };

      expect(
        () => AlfredItem.fromJson(invalidJson),
        throwsA(isA<ArgumentError>()),
      );
    });

    test('_actionToJson throws ArgumentError for invalid action type', () {
      // Create a valid AlfredItem
      const AlfredItem item = AlfredItem(
        title: 'Test Item',
        action: 'valid-action', // String is a valid action type
        valid: true,
      );

      // Get its JSON representation
      final Map<String, dynamic> json = item.toJson();

      // Modify the action to be an invalid type
      json['action'] = 123; // Integer is not a valid action type

      // Now try to create a new AlfredItem from this modified JSON
      // This should throw an ArgumentError when _actionFromJson tries to process the invalid action
      expect(
        () => AlfredItem.fromJson(json),
        throwsA(isA<ArgumentError>()),
      );
    });
  });
}
