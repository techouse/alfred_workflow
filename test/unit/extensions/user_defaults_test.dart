import 'package:alfred_workflow/alfred_workflow.dart';
import 'package:alfred_workflow/src/models/alfred_user_configuration_config_number_slider.dart';
import 'package:test/test.dart';

import '../../fixtures/alfred_workflow_fixture.dart';

void main() {
  group('user_defaults', () {
    late AlfredWorkflow workflow;

    setUp(() {
      workflow = AlfredWorkflowFixture.factory.makeSingle();
    });

    test('getDefaults', () async {
      final Map<String, AlfredUserConfiguration>? defaults =
          await workflow.getDefaults(
        'test/fixtures/data/info.plist',
      );
      expect(defaults, isA<Map<String, AlfredUserConfiguration>>());
      expect(defaults, isNotEmpty);

      defaults?.forEach((String key, AlfredUserConfiguration defaultItem) {
        if (defaultItem is AlfredUserConfigurationTextArea) {
          expect(
            defaultItem.type,
            equals(AlfredUserConfigurationType.textArea),
          );
          expect(defaultItem.variable, equals('textarea_variable'));
          expect(
            defaultItem.config,
            isA<AlfredUserConfigurationConfigTextArea>(),
          );
          expect(defaultItem.config.defaultValue, equals('textarea default'));
          expect(defaultItem.defaultValue,
              equals(defaultItem.config.defaultValue));
          expect(defaultItem.config.required, isTrue);
          expect(defaultItem.config.trim, isFalse);
          expect(defaultItem.config.verticalSize, equals(3));
          expect(defaultItem.description, equals('textarea description'));
          expect(defaultItem.label, equals('textarea label'));
        }

        if (defaultItem is AlfredUserConfigurationTextField) {
          expect(
              defaultItem.type, equals(AlfredUserConfigurationType.textField));
          expect(defaultItem.variable, equals('textfield_variable'));
          expect(
            defaultItem.config,
            isA<AlfredUserConfigurationConfigTextField>(),
          );
          expect(defaultItem.config.defaultValue, equals('textfield default'));
          expect(defaultItem.defaultValue,
              equals(defaultItem.config.defaultValue));
          expect(
            defaultItem.config.placeholder,
            equals('textfield placeholder'),
          );
          expect(defaultItem.config.required, isTrue);
          expect(defaultItem.config.trim, isFalse);
          expect(defaultItem.description, equals('textfield description'));
          expect(defaultItem.label, equals('textfield label'));
        }

        if (defaultItem is AlfredUserConfigurationCheckBox) {
          expect(
            defaultItem.type,
            equals(AlfredUserConfigurationType.checkBox),
          );
          expect(defaultItem.variable, equals('checkbox_variable'));
          expect(
            defaultItem.config,
            isA<AlfredUserConfigurationConfigCheckBox>(),
          );
          expect(defaultItem.config.defaultValue, isFalse);
          expect(defaultItem.defaultValue,
              equals(defaultItem.config.defaultValue));
          expect(defaultItem.config.required, isTrue);
          expect(defaultItem.config.text, equals('checkbox text'));
          expect(defaultItem.description, equals('checkbox description'));
          expect(defaultItem.label, equals('checkbox label'));
        }

        if (defaultItem is AlfredUserConfigurationSelect) {
          expect(
            defaultItem.type,
            equals(AlfredUserConfigurationType.select),
          );
          expect(defaultItem.variable, equals('popupbutton_variable'));
          expect(
            defaultItem.config,
            isA<AlfredUserConfigurationConfigSelect>(),
          );
          expect(defaultItem.config.defaultValue, equals('baz value'));
          expect(defaultItem.defaultValue,
              equals(defaultItem.config.defaultValue));
          expect(defaultItem.config.pairs,
              isA<List<AlfredUserConfigurationConfigSelectPair>>());
          expect(defaultItem.config.pairs, isNotEmpty);
          expect(defaultItem.config.pairs, hasLength(4));
          expect(
            defaultItem.config.pairs,
            equals(
              <AlfredUserConfigurationConfigSelectPair>[
                (label: 'foo label', value: 'foo value'),
                (label: 'bar label', value: 'bar value'),
                (label: 'baz label', value: 'baz value'),
                (label: 'qux label', value: 'qux value'),
              ],
            ),
          );
          expect(defaultItem.description, equals('popupbutton description'));
          expect(defaultItem.label, equals('popupbutton label'));
        }

        if (defaultItem is AlfredUserConfigurationFilePicker) {
          expect(
            defaultItem.type,
            equals(AlfredUserConfigurationType.filePicker),
          );
          expect(defaultItem.variable, equals('filepicker_variable'));
          expect(defaultItem.config,
              isA<AlfredUserConfigurationConfigFilePicker>());
          expect(defaultItem.config.defaultValue, isEmpty);
          expect(defaultItem.defaultValue,
              equals(defaultItem.config.defaultValue));
          expect(defaultItem.config.required, isTrue);
          expect(defaultItem.config.placeholder, isEmpty);
          expect(defaultItem.config.filterMode, equals(0));
          expect(defaultItem.description, equals('filepicker description'));
          expect(defaultItem.label, equals('filepicker label'));
        }
      });
    });

    test('getDefaultsSync', () {
      final Map<String, AlfredUserConfiguration>? defaults =
          workflow.getDefaultsSync(
        'test/fixtures/data/info.plist',
      );
      expect(defaults, isA<Map<String, AlfredUserConfiguration>>());
      expect(defaults, isNotEmpty);

      defaults?.forEach((String key, AlfredUserConfiguration defaultItem) {
        if (defaultItem is AlfredUserConfigurationTextArea) {
          expect(
            defaultItem.type,
            equals(AlfredUserConfigurationType.textArea),
          );
          expect(defaultItem.variable, equals('textarea_variable'));
          expect(
            defaultItem.config,
            isA<AlfredUserConfigurationConfigTextArea>(),
          );
          expect(defaultItem.config.defaultValue, equals('textarea default'));
          expect(defaultItem.defaultValue,
              equals(defaultItem.config.defaultValue));
          expect(defaultItem.config.required, isTrue);
          expect(defaultItem.config.trim, isFalse);
          expect(defaultItem.config.verticalSize, equals(3));
          expect(defaultItem.description, equals('textarea description'));
          expect(defaultItem.label, equals('textarea label'));
        }

        if (defaultItem is AlfredUserConfigurationTextField) {
          expect(
              defaultItem.type, equals(AlfredUserConfigurationType.textField));
          expect(defaultItem.variable, equals('textfield_variable'));
          expect(
            defaultItem.config,
            isA<AlfredUserConfigurationConfigTextField>(),
          );
          expect(defaultItem.config.defaultValue, equals('textfield default'));
          expect(defaultItem.defaultValue,
              equals(defaultItem.config.defaultValue));
          expect(
            defaultItem.config.placeholder,
            equals('textfield placeholder'),
          );
          expect(defaultItem.config.required, isTrue);
          expect(defaultItem.config.trim, isFalse);
          expect(defaultItem.description, equals('textfield description'));
          expect(defaultItem.label, equals('textfield label'));
        }

        if (defaultItem is AlfredUserConfigurationCheckBox) {
          expect(
            defaultItem.type,
            equals(AlfredUserConfigurationType.checkBox),
          );
          expect(defaultItem.variable, equals('checkbox_variable'));
          expect(
            defaultItem.config,
            isA<AlfredUserConfigurationConfigCheckBox>(),
          );
          expect(defaultItem.config.defaultValue, isFalse);
          expect(defaultItem.defaultValue,
              equals(defaultItem.config.defaultValue));
          expect(defaultItem.config.required, isTrue);
          expect(defaultItem.config.text, equals('checkbox text'));
          expect(defaultItem.description, equals('checkbox description'));
          expect(defaultItem.label, equals('checkbox label'));
        }

        if (defaultItem is AlfredUserConfigurationSelect) {
          expect(
            defaultItem.type,
            equals(AlfredUserConfigurationType.select),
          );
          expect(defaultItem.variable, equals('popupbutton_variable'));
          expect(
            defaultItem.config,
            isA<AlfredUserConfigurationConfigSelect>(),
          );
          expect(defaultItem.config.defaultValue, equals('baz value'));
          expect(defaultItem.defaultValue,
              equals(defaultItem.config.defaultValue));
          expect(defaultItem.config.pairs,
              isA<List<AlfredUserConfigurationConfigSelectPair>>());
          expect(defaultItem.config.pairs, isNotEmpty);
          expect(defaultItem.config.pairs, hasLength(4));
          expect(
            defaultItem.config.pairs,
            equals(
              <AlfredUserConfigurationConfigSelectPair>[
                (label: 'foo label', value: 'foo value'),
                (label: 'bar label', value: 'bar value'),
                (label: 'baz label', value: 'baz value'),
                (label: 'qux label', value: 'qux value'),
              ],
            ),
          );
          expect(defaultItem.description, equals('popupbutton description'));
          expect(defaultItem.label, equals('popupbutton label'));
        }

        if (defaultItem is AlfredUserConfigurationFilePicker) {
          expect(
            defaultItem.type,
            equals(AlfredUserConfigurationType.filePicker),
          );
          expect(defaultItem.variable, equals('filepicker_variable'));
          expect(defaultItem.config,
              isA<AlfredUserConfigurationConfigFilePicker>());
          expect(defaultItem.config.defaultValue, isEmpty);
          expect(defaultItem.defaultValue,
              equals(defaultItem.config.defaultValue));
          expect(defaultItem.config.required, isTrue);
          expect(defaultItem.config.placeholder, isEmpty);
          expect(defaultItem.config.filterMode, equals(0));
          expect(defaultItem.description, equals('filepicker description'));
          expect(defaultItem.label, equals('filepicker label'));
        }

        if (defaultItem is AlfredUserConfigurationNumberSlider) {
          expect(
            defaultItem.type,
            equals(AlfredUserConfigurationType.slider),
          );
          expect(defaultItem.variable, equals('number_slider_variable'));
          expect(
            defaultItem.config,
            isA<AlfredUserConfigurationConfigNumberSlider>(),
          );
          expect(defaultItem.config.defaultValue, equals(50));
          expect(defaultItem.defaultValue,
              equals(defaultItem.config.defaultValue));
          expect(defaultItem.config.min, equals(0));
          expect(defaultItem.config.max, equals(100));
          expect(defaultItem.config.markerCount, equals(10));
          expect(defaultItem.config.onlyStopOnMarkers, isTrue);
          expect(defaultItem.config.showMarkers, isTrue);
          expect(defaultItem.description, equals('number slider description'));
          expect(defaultItem.label, equals('number slider label'));
        }
      });
    });

    test('not existing getDefaults', () async {
      final Map<String, dynamic>? userDefaults = await workflow.getUserDefaults(
        infoPath: 'foo.plist',
        prefsPath: 'bar.plist',
      );
      expect(userDefaults, isA<Map<String, AlfredUserConfiguration>>());
      expect(userDefaults, isEmpty);
    });

    test('not existing getDefaultsSync', () {
      final Map<String, dynamic>? userDefaults = workflow.getUserDefaultsSync(
          infoPath: 'foo.plist', prefsPath: 'bar.plist');
      expect(userDefaults, isA<Map<String, AlfredUserConfiguration>>());
      expect(userDefaults, isEmpty);
    });

    test('getUserDefaults', () async {
      final Map<String, AlfredUserConfiguration>? userDefaults =
          await workflow.getUserDefaults(
        prefsPath: 'test/fixtures/data/prefs.plist',
        infoPath: 'test/fixtures/data/info.plist',
      );
      expect(userDefaults, isA<Map<String, AlfredUserConfiguration>>());
      expect(userDefaults, isNotEmpty);

      userDefaults?.forEach((String key, AlfredUserConfiguration defaultItem) {
        if (defaultItem is AlfredUserConfigurationTextArea) {
          expect(
            defaultItem.type,
            equals(AlfredUserConfigurationType.textArea),
          );
          expect(defaultItem.variable, equals('textarea_variable'));
          expect(
            defaultItem.config,
            isA<AlfredUserConfigurationConfigTextArea>(),
          );
          expect(defaultItem.config.value, 'lorem ipsum dolor sit amet');
          expect(defaultItem.config.defaultValue, equals('textarea default'));
          expect(defaultItem.defaultValue,
              equals(defaultItem.config.defaultValue));
          expect(defaultItem.config.required, isTrue);
          expect(defaultItem.config.trim, isFalse);
          expect(defaultItem.config.verticalSize, equals(3));
          expect(defaultItem.description, equals('textarea description'));
          expect(defaultItem.label, equals('textarea label'));
        }

        if (defaultItem is AlfredUserConfigurationTextField) {
          expect(
              defaultItem.type, equals(AlfredUserConfigurationType.textField));
          expect(defaultItem.variable, equals('textfield_variable'));
          expect(
            defaultItem.config,
            isA<AlfredUserConfigurationConfigTextField>(),
          );
          expect(defaultItem.config.value, 'lorem ipsum dolor');
          expect(defaultItem.config.defaultValue, equals('textfield default'));
          expect(defaultItem.defaultValue,
              equals(defaultItem.config.defaultValue));
          expect(
            defaultItem.config.placeholder,
            equals('textfield placeholder'),
          );
          expect(defaultItem.config.required, isTrue);
          expect(defaultItem.config.trim, isFalse);
          expect(defaultItem.description, equals('textfield description'));
          expect(defaultItem.label, equals('textfield label'));
        }

        if (defaultItem is AlfredUserConfigurationCheckBox) {
          expect(
            defaultItem.type,
            equals(AlfredUserConfigurationType.checkBox),
          );
          expect(defaultItem.variable, equals('checkbox_variable'));
          expect(
            defaultItem.config,
            isA<AlfredUserConfigurationConfigCheckBox>(),
          );
          expect(defaultItem.config.value, isTrue);
          expect(defaultItem.config.defaultValue, isFalse);
          expect(defaultItem.defaultValue,
              equals(defaultItem.config.defaultValue));
          expect(defaultItem.config.required, isTrue);
          expect(defaultItem.config.text, equals('checkbox text'));
          expect(defaultItem.description, equals('checkbox description'));
          expect(defaultItem.label, equals('checkbox label'));
        }

        if (defaultItem is AlfredUserConfigurationSelect) {
          expect(
            defaultItem.type,
            equals(AlfredUserConfigurationType.select),
          );
          expect(defaultItem.variable, equals('popupbutton_variable'));
          expect(
            defaultItem.config,
            isA<AlfredUserConfigurationConfigSelect>(),
          );
          expect(defaultItem.config.value, equals('foo value'));
          expect(defaultItem.config.defaultValue, equals('baz value'));
          expect(defaultItem.defaultValue,
              equals(defaultItem.config.defaultValue));
          expect(defaultItem.config.pairs,
              isA<List<AlfredUserConfigurationConfigSelectPair>>());
          expect(defaultItem.config.pairs, isNotEmpty);
          expect(defaultItem.config.pairs, hasLength(4));
          expect(
            defaultItem.config.pairs,
            equals(
              <AlfredUserConfigurationConfigSelectPair>[
                (label: 'foo label', value: 'foo value'),
                (label: 'bar label', value: 'bar value'),
                (label: 'baz label', value: 'baz value'),
                (label: 'qux label', value: 'qux value'),
              ],
            ),
          );
          expect(defaultItem.description, equals('popupbutton description'));
          expect(defaultItem.label, equals('popupbutton label'));
        }

        if (defaultItem is AlfredUserConfigurationFilePicker) {
          expect(
            defaultItem.type,
            equals(AlfredUserConfigurationType.filePicker),
          );
          expect(defaultItem.variable, equals('filepicker_variable'));
          expect(defaultItem.config,
              isA<AlfredUserConfigurationConfigFilePicker>());
          expect(defaultItem.config.value,
              equals('/home/user/Desktop/document.pdf'));
          expect(defaultItem.config.defaultValue, isEmpty);
          expect(defaultItem.defaultValue,
              equals(defaultItem.config.defaultValue));
          expect(defaultItem.config.required, isTrue);
          expect(defaultItem.config.placeholder, isEmpty);
          expect(defaultItem.config.filterMode, equals(0));
          expect(defaultItem.description, equals('filepicker description'));
          expect(defaultItem.label, equals('filepicker label'));
        }

        if (defaultItem is AlfredUserConfigurationNumberSlider) {
          expect(
            defaultItem.type,
            equals(AlfredUserConfigurationType.slider),
          );
          expect(defaultItem.variable, equals('number_slider_variable'));
          expect(
            defaultItem.config,
            isA<AlfredUserConfigurationConfigNumberSlider>(),
          );
          expect(defaultItem.config.value, equals(69));
          expect(defaultItem.value, equals(defaultItem.config.value));
          expect(defaultItem.config.defaultValue, equals(50));
          expect(defaultItem.defaultValue,
              equals(defaultItem.config.defaultValue));
          expect(defaultItem.config.min, equals(0));
          expect(defaultItem.config.max, equals(100));
          expect(defaultItem.config.markerCount, equals(10));
          expect(defaultItem.config.onlyStopOnMarkers, isTrue);
          expect(defaultItem.config.showMarkers, isTrue);
          expect(defaultItem.description, equals('number slider description'));
          expect(defaultItem.label, equals('number slider label'));
        }
      });
    });

    test('not existing getUserDefaults', () async {
      final Map<String, dynamic>? userDefaults = await workflow.getUserDefaults(
        infoPath: 'foo.plist',
        prefsPath: 'bar.plist',
      );
      expect(userDefaults, isA<Map<String, dynamic>>());
      expect(userDefaults, isEmpty);
    });

    test('getUserDefaultsSync', () {
      final Map<String, AlfredUserConfiguration>? userDefaults =
          workflow.getUserDefaultsSync(
        prefsPath: 'test/fixtures/data/prefs.plist',
        infoPath: 'test/fixtures/data/info.plist',
      );
      expect(userDefaults, isA<Map<String, AlfredUserConfiguration>>());
      expect(userDefaults, isNotEmpty);

      userDefaults?.forEach((String key, AlfredUserConfiguration defaultItem) {
        if (defaultItem is AlfredUserConfigurationTextArea) {
          expect(
            defaultItem.type,
            equals(AlfredUserConfigurationType.textArea),
          );
          expect(defaultItem.variable, equals('textarea_variable'));
          expect(
            defaultItem.config,
            isA<AlfredUserConfigurationConfigTextArea>(),
          );
          expect(defaultItem.config.value, 'lorem ipsum dolor sit amet');
          expect(defaultItem.config.defaultValue, equals('textarea default'));
          expect(defaultItem.defaultValue,
              equals(defaultItem.config.defaultValue));
          expect(defaultItem.config.required, isTrue);
          expect(defaultItem.config.trim, isFalse);
          expect(defaultItem.config.verticalSize, equals(3));
          expect(defaultItem.description, equals('textarea description'));
          expect(defaultItem.label, equals('textarea label'));
        }

        if (defaultItem is AlfredUserConfigurationTextField) {
          expect(
              defaultItem.type, equals(AlfredUserConfigurationType.textField));
          expect(defaultItem.variable, equals('textfield_variable'));
          expect(
            defaultItem.config,
            isA<AlfredUserConfigurationConfigTextField>(),
          );
          expect(defaultItem.config.value, 'lorem ipsum dolor');
          expect(defaultItem.config.defaultValue, equals('textfield default'));
          expect(defaultItem.defaultValue,
              equals(defaultItem.config.defaultValue));
          expect(
            defaultItem.config.placeholder,
            equals('textfield placeholder'),
          );
          expect(defaultItem.config.required, isTrue);
          expect(defaultItem.config.trim, isFalse);
          expect(defaultItem.description, equals('textfield description'));
          expect(defaultItem.label, equals('textfield label'));
        }

        if (defaultItem is AlfredUserConfigurationCheckBox) {
          expect(
            defaultItem.type,
            equals(AlfredUserConfigurationType.checkBox),
          );
          expect(defaultItem.variable, equals('checkbox_variable'));
          expect(
            defaultItem.config,
            isA<AlfredUserConfigurationConfigCheckBox>(),
          );
          expect(defaultItem.config.value, isTrue);
          expect(defaultItem.config.defaultValue, isFalse);
          expect(defaultItem.defaultValue,
              equals(defaultItem.config.defaultValue));
          expect(defaultItem.config.required, isTrue);
          expect(defaultItem.config.text, equals('checkbox text'));
          expect(defaultItem.description, equals('checkbox description'));
          expect(defaultItem.label, equals('checkbox label'));
        }

        if (defaultItem is AlfredUserConfigurationSelect) {
          expect(
            defaultItem.type,
            equals(AlfredUserConfigurationType.select),
          );
          expect(defaultItem.variable, equals('popupbutton_variable'));
          expect(
            defaultItem.config,
            isA<AlfredUserConfigurationConfigSelect>(),
          );
          expect(defaultItem.config.value, equals('foo value'));
          expect(defaultItem.config.defaultValue, equals('baz value'));
          expect(defaultItem.defaultValue,
              equals(defaultItem.config.defaultValue));
          expect(defaultItem.config.pairs,
              isA<List<AlfredUserConfigurationConfigSelectPair>>());
          expect(defaultItem.config.pairs, isNotEmpty);
          expect(defaultItem.config.pairs, hasLength(4));
          expect(
            defaultItem.config.pairs,
            equals(
              <AlfredUserConfigurationConfigSelectPair>[
                (label: 'foo label', value: 'foo value'),
                (label: 'bar label', value: 'bar value'),
                (label: 'baz label', value: 'baz value'),
                (label: 'qux label', value: 'qux value'),
              ],
            ),
          );
          expect(defaultItem.description, equals('popupbutton description'));
          expect(defaultItem.label, equals('popupbutton label'));
        }

        if (defaultItem is AlfredUserConfigurationFilePicker) {
          expect(
            defaultItem.type,
            equals(AlfredUserConfigurationType.filePicker),
          );
          expect(defaultItem.variable, equals('filepicker_variable'));
          expect(defaultItem.config,
              isA<AlfredUserConfigurationConfigFilePicker>());
          expect(defaultItem.config.value,
              equals('/home/user/Desktop/document.pdf'));
          expect(defaultItem.config.defaultValue, isEmpty);
          expect(defaultItem.defaultValue,
              equals(defaultItem.config.defaultValue));
          expect(defaultItem.config.required, isTrue);
          expect(defaultItem.config.placeholder, isEmpty);
          expect(defaultItem.config.filterMode, equals(0));
          expect(defaultItem.description, equals('filepicker description'));
          expect(defaultItem.label, equals('filepicker label'));
        }

        if (defaultItem is AlfredUserConfigurationNumberSlider) {
          expect(
            defaultItem.type,
            equals(AlfredUserConfigurationType.slider),
          );
          expect(defaultItem.variable, equals('number_slider_variable'));
          expect(
            defaultItem.config,
            isA<AlfredUserConfigurationConfigNumberSlider>(),
          );
          expect(defaultItem.config.value, equals(69));
          expect(defaultItem.value, equals(defaultItem.config.value));
          expect(defaultItem.config.defaultValue, equals(50));
          expect(defaultItem.defaultValue,
              equals(defaultItem.config.defaultValue));
          expect(defaultItem.config.min, equals(0));
          expect(defaultItem.config.max, equals(100));
          expect(defaultItem.config.markerCount, equals(10));
          expect(defaultItem.config.onlyStopOnMarkers, isTrue);
          expect(defaultItem.config.showMarkers, isTrue);
          expect(defaultItem.description, equals('number slider description'));
          expect(defaultItem.label, equals('number slider label'));
        }
      });
    });
  });

  group('equatable', () {
    test('AlfredUserConfigurationTextArea', () {
      final AlfredUserConfigurationTextArea textArea =
          const AlfredUserConfigurationTextArea(
        type: AlfredUserConfigurationType.textArea,
        variable: 'textarea_variable',
        config: AlfredUserConfigurationConfigTextArea(
          defaultValue: 'textarea default',
          value: 'textarea value',
          required: true,
          trim: false,
          verticalSize: 3,
        ),
      );

      final AlfredUserConfigurationTextArea textAreaCopy = textArea.copyWith();
      expect(textArea, equals(textAreaCopy));
    });
  });
}
