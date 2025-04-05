import 'package:alfred_workflow/alfred_workflow.dart';
import 'package:plist_parser/plist_parser.dart';

extension UserDefaults on AlfredWorkflow {
  static const String _userConfigurationConfigKey = 'userconfigurationconfig';
  static const String _typeKey = 'type';

  /// Returns a `Map` of user defaults from the workflow's `info.plist` file.
  Future<Map<String, AlfredUserConfiguration>?> getDefaults([
    String path = 'info.plist',
  ]) async {
    try {
      return _mapDefaults(await PlistParser().parseFile(path));
    } on NotFoundException {
      return null;
    }
  }

  /// Synchronously returns a `Map` of user defaults from the workflow's `info.plist` file.
  Map<String, AlfredUserConfiguration>? getDefaultsSync([
    String path = 'info.plist',
  ]) {
    try {
      return _mapDefaults(PlistParser().parseFileSync(path));
    } on NotFoundException {
      return null;
    }
  }

  /// Returns a `Map` of user defaults from the workflow's `prefs.plist` file.
  Future<Map<String, dynamic>?> getUserPreferences([
    String path = 'prefs.plist',
  ]) async {
    try {
      return _mapUserDefaults(await PlistParser().parseFile(path));
    } on NotFoundException {
      return null;
    }
  }

  /// Synchronously returns a `Map` of user defaults from the workflow's `prefs.plist` file.
  Map<String, dynamic>? getUserPreferencesSync([String path = 'prefs.plist']) {
    try {
      return _mapUserDefaults(PlistParser().parseFileSync(path));
    } on NotFoundException {
      return null;
    }
  }

  /// Returns a `Map` of the user defaults from the workflow's `info.plist` merged with `prefs.plist` file.
  Future<Map<String, AlfredUserConfiguration>?> getUserDefaults({
    String prefsPath = 'prefs.plist',
    String infoPath = 'info.plist',
  }) async {
    try {
      final Map<String, dynamic> userDefaults =
          await getUserPreferences(prefsPath) ?? {};
      final Map<String, AlfredUserConfiguration> defaults =
          await getDefaults(infoPath) ?? {};

      return <String, AlfredUserConfiguration>{
        for (final MapEntry<String, AlfredUserConfiguration> defaultItem
            in defaults.entries)
          defaultItem.key: defaultItem.value.copyWithConfig(
            defaultItem.value.config.copyWithValue(
              userDefaults[defaultItem.key],
            ),
          )
      };
    } on NotFoundException {
      return null;
    }
  }

  /// Synchronously returns a `Map` of user defaults from the workflow's `info.plist` merged with `prefs.plist` file.
  Map<String, AlfredUserConfiguration>? getUserDefaultsSync({
    String prefsPath = 'prefs.plist',
    String infoPath = 'info.plist',
  }) {
    try {
      final Map<String, dynamic> userDefaults =
          getUserPreferencesSync(prefsPath) ?? {};
      final Map<String, AlfredUserConfiguration> defaults =
          getDefaultsSync(infoPath) ?? {};

      return <String, AlfredUserConfiguration>{
        for (final MapEntry<String, AlfredUserConfiguration> defaultItem
            in defaults.entries)
          defaultItem.key: defaultItem.value.copyWithConfig(
            defaultItem.value.config.copyWithValue(
              userDefaults[defaultItem.key],
            ),
          )
      };
    } on NotFoundException {
      return null;
    }
  }

  static Map<String, AlfredUserConfiguration> _mapDefaults(Map info) =>
      <String, AlfredUserConfiguration>{
        for (AlfredUserConfiguration item in <AlfredUserConfiguration>[
          for (final Map config in info[_userConfigurationConfigKey] as List)
            if (config[_typeKey] ==
                AlfredUserConfigurationType.textField.jsonValue)
              AlfredUserConfigurationTextField.fromJson(config)
            else if (config[_typeKey] ==
                AlfredUserConfigurationType.textArea.jsonValue)
              AlfredUserConfigurationTextArea.fromJson(config)
            else if (config[_typeKey] ==
                AlfredUserConfigurationType.checkBox.jsonValue)
              AlfredUserConfigurationCheckBox.fromJson(config)
            else if (config[_typeKey] ==
                AlfredUserConfigurationType.select.jsonValue)
              AlfredUserConfigurationSelect.fromJson(config)
            else if (config[_typeKey] ==
                AlfredUserConfigurationType.filePicker.jsonValue)
              AlfredUserConfigurationFilePicker.fromJson(config)
            else if (config[_typeKey] ==
                AlfredUserConfigurationType.slider.jsonValue)
              AlfredUserConfigurationNumberSlider.fromJson(config)
        ])
          item.variable: item,
      };

  static Map<String, dynamic> _mapUserDefaults(Map prefs) => <String, dynamic>{
        for (final MapEntry pref in prefs.entries)
          pref.key.toString(): pref.value,
      };
}
