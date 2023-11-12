import 'package:alfred_workflow/alfred_workflow.dart';
import 'package:test/test.dart';

import '../../fixtures/alfred_workflow_fixture.dart';

void main() {
  group('user_defaults', () {
    late AlfredWorkflow workflow;

    setUp(() {
      workflow = AlfredWorkflowFixture.factory.makeSingle();
    });

    test('getUserDefaults', () async {
      final Map? userDefaults = await workflow.getUserDefaults(
        'test/fixtures/data/prefs.plist',
      );
      expect(userDefaults, isA<Map>());
      expect(userDefaults, isNotEmpty);
      expect(userDefaults, contains('lorem'));
      expect(userDefaults?['lorem'], equals('ipsum'));
      expect(userDefaults, contains('dolor'));
      expect(userDefaults?['dolor'], equals('sit'));
    });

    test('not existing getUserDefaults', () async {
      final Map? userDefaults = await workflow.getUserDefaults('foo.plist');
      expect(userDefaults, isNot(isA<Map>()));
      expect(userDefaults, isNull);
    });

    test('getUserDefaultsSync', () {
      final Map? userDefaults = workflow.getUserDefaultsSync(
        'test/fixtures/data/prefs.plist',
      );
      expect(userDefaults, isA<Map>());
      expect(userDefaults, isNotEmpty);
      expect(userDefaults, contains('lorem'));
      expect(userDefaults?['lorem'], equals('ipsum'));
      expect(userDefaults, contains('dolor'));
      expect(userDefaults?['dolor'], equals('sit'));
    });

    test('not existing getUserDefaultsSync', () {
      final Map? userDefaults = workflow.getUserDefaultsSync('foo.plist');
      expect(userDefaults, isNot(isA<Map>()));
      expect(userDefaults, isNull);
    });
  });
}
