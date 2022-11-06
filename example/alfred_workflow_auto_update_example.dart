import 'dart:io' show exitCode;

import 'package:alfred_workflow/alfred_workflow.dart';
import 'package:args/args.dart';
import 'package:cli_script/cli_script.dart';

void main(List<String> arguments) {
  wrapMain(() async {
    /// Instantiate the updater
    final AlfredUpdater updater = AlfredUpdater(

      /// Declare your workflow's Github repository URL
      githubRepositoryUrl: Uri.parse('https://github.com/your/repo'),

      /// Declare your workflow's current working version
      currentVersion: '1.0.0',

      /// Optionally set an interval how frequently it should check for updates
      updateInterval: Duration(days: 7),
    );

    /// Declare a control var
    bool update = false;

    final workflow = AlfredWorkflow();

    try {
      exitCode = 0;

      final ArgParser parser = ArgParser()
        ..addOption('query', abbr: 'q', defaultsTo: '')

      /// Add another option to the arg parser
        ..addFlag('update', abbr: 'u', defaultsTo: false);

      final ArgResults args = parser.parse(arguments);

      /// Check if the workflow wants to trigger an update from the CLI
      update = args['update'];
      if (update) {
        /// Run the update
        return await updater.update();
      }

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
      /// Check if the workflow is not in the middle of an update.
      if (!update) {
        /// Periodically check for updates (in this case once every 7 days).
        if (await updater.updateAvailable()) {
          /// If a new version is available let the user know about it in the Alfred feedback.
          workflow.run(
            addToBeginning: AlfredItem(
              title: 'Auto-Update available!',
              subtitle:
              'Press <enter> to auto-update to a new version of this workflow.',
              arg: 'update:workflow',
              match:
              'Auto-Update available! Press <enter> to auto-update to a new version of this workflow.',
              icon: AlfredItemIcon(path: 'alfredhatcog.png'),
              valid: true,
            ),
          );
        } else {
          /// If there's no new version available just print out the results.
          workflow.run();
        }
      }
    }
  });
}
