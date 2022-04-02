import 'dart:io' show exitCode;

import 'package:alfred_workflow/alfred_workflow.dart';
import 'package:args/args.dart';

void main(List<String> arguments) async {
  /// Instantiate an AlfredWorkflow
  final workflow = AlfredWorkflow();

  try {
    exitCode = 0;

    /// Define an ArgParser that uses -q/--query to listen to search queries
    final ArgParser parser = ArgParser()
      ..addOption('query', abbr: 'q', defaultsTo: '');

    /// Parse the args
    final ArgResults args = parser.parse(arguments);

    /// Sanitize the query string obtained from the args
    final String query = args['query'].replaceAll(RegExp(r'\s+'), ' ').trim();

    if (query.isEmpty) {
      /// In case of an empty query display a placeholder in the Alfred feedback
      workflow.addItem(
        const AlfredItem(
          title: 'Search for some particular stuff ...',
          icon: AlfredItemIcon(path: 'icon.png'),
        ),
      );
    } else {
      /// When there is a query do something fancy

      /// In this case we'll search Google with our query.
      final Uri url = Uri.https('www.google.com', '/search', {'q': query});

      /// Add an item to the Alfred feedback
      workflow.addItem(
        AlfredItem(
          title: 'Sorry I can\'t help you with that query.',
          subtitle: 'Shall I try and search Google?',
          arg: url.toString(),
          text: AlfredItemText(
            copy: url.toString(),
          ),
          quickLookUrl: url.toString(),
          icon: AlfredItemIcon(path: 'google.png'),
          valid: true,
        ),
      );
    }
  } catch (err) {
    /// Set exit code to a non-zero number
    exitCode = 1;

    /// In case of errors you can simply output the message in the Alfred feedback
    workflow.addItem(
      AlfredItem(title: err.toString()),
    );
  } finally {
    /// This will always print JSON to the stdout and send that to Alfred.
    workflow.run();
  }
}
