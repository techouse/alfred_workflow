import 'package:alfred_workflow/alfred_workflow.dart';
import 'package:plist_parser/plist_parser.dart';

extension UserDefaults on AlfredWorkflow {
  /// Returns a `Map` of user defaults from the workflow's `prefs.plist` file.
  Future<Map?> getUserDefaults([String path = 'prefs.plist']) async {
    try {
      return await PlistParser().parseFile(path);
    } on NotFoundException {
      return null;
    }
  }

  /// Synchronously returns a `Map` of user defaults from the workflow's `prefs.plist` file.
  Map? getUserDefaultsSync([String path = 'prefs.plist']) {
    try {
      return PlistParser().parseFileSync(path);
    } on NotFoundException {
      return null;
    }
  }
}
