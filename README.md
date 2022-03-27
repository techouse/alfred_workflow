# Alfred Workflow

A helper library in Dart for authors of workflows for Alfred 3 and 4.

[![Dart CI](https://github.com/techouse/alfred_workflow/actions/workflows/test.yml/badge.svg)](https://github.com/techouse/alfred_workflow/actions/workflows/test.yml)
![GitHub](https://img.shields.io/github/license/techouse/alfred_workflow)

This library is heavily inspired by the excellent Python 2 library [deanishe/alfred-workflow](https://github.com/deanishe/alfred-workflow).

In its current state it is very basic and only implements the [Alfred Script Filter JSON API](https://www.alfredapp.com/help/workflows/inputs/script-filter/json/).

## Usage

### Basic example

The example below uses [args](https://pub.dev/packages/args) for argument parsing.

```dart
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
```

To search for the string "hello" simply execute this on the commandline:

```bash
dart run example.dart --query 'hello'
```

### Speed it up using caching

The library uses [stash_file](https://pub.dev/packages/stash_file) to cache results in the form of `AlfredItems`.
All you need to do to enable it is to define a `cacheKey`.

```dart
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
```

### Auto-Update your workflows via GitHub releases

Setting up Auto-Updating will require that you provide your workflow's Github repository URL and version.
Optionally you can set an interval how frequently the workflow should check for updates.

Once an update is found it's downloaded to the temp and opened.

```dart
import 'dart:io' show exitCode;

import 'package:alfred_workflow/alfred_workflow.dart';
import 'package:args/args.dart';

void main(List<String> arguments) async {
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
}
```