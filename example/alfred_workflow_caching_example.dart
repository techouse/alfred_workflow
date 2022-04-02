import 'dart:io' show exitCode;

import 'package:alfred_workflow/alfred_workflow.dart';
import 'package:args/args.dart';

void main(List<String> arguments) async {
  final workflow = AlfredWorkflow();

  try {
    exitCode = 0;

    final ArgParser parser = ArgParser()
      ..addOption('query', abbr: 'q', defaultsTo: '');

    final ArgResults args = parser.parse(arguments);

    final String query = args['query'].replaceAll(RegExp(r'\s+'), ' ').trim();

    if (query.isEmpty) {
      workflow.addItem(
        const AlfredItem(
          title: 'Search for some particular stuff ...',
          icon: AlfredItemIcon(path: 'icon.png'),
        ),
      );
    } else {
      /// Define a cacheKey. In this case you can just use the query.
      workflow.cacheKey = query;

      /// Check if anything using that cacheKey is already in the cache.
      /// This will automatically add the cached items to the Alfred feedback.
      final AlfredItems? cachedItems = await workflow.getItems();

      /// If noting was cached simply do as before
      if (cachedItems == null) {
        final Uri url = Uri.https('www.google.com', '/search', {'q': query});

        /// This will now automatically add the AlfredItem to the cache.
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
    }
  } catch (err) {
    exitCode = 1;
    workflow.addItem(
      AlfredItem(title: err.toString()),
    );
  } finally {
    workflow.run();
  }
}
