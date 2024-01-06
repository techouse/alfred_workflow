# Alfred Workflow

A helper library in Dart for authors of workflows for [Alfred](https://www.alfredapp.com).

[![Pub Version](https://img.shields.io/pub/v/alfred_workflow)](https://pub.dev/packages/alfred_workflow)
[![Pub Publisher](https://img.shields.io/pub/publisher/alfred_workflow)](https://pub.dev/publishers/tusar.dev/packages)
[![Pub Likes](https://img.shields.io/pub/likes/alfred_workflow)](https://pub.dev/packages/alfred_workflow/score)
[![Pub Points](https://img.shields.io/pub/points/alfred_workflow)](https://pub.dev/packages/alfred_workflow/score)
[![Pub Popularity](https://img.shields.io/pub/popularity/alfred_workflow)](https://pub.dev/packages/alfred_workflow/score)
[![Dart CI](https://github.com/techouse/alfred_workflow/actions/workflows/test.yml/badge.svg)](https://github.com/techouse/alfred_workflow/actions/workflows/test.yml)
[![codecov](https://codecov.io/gh/techouse/alfred_workflow/branch/master/graph/badge.svg?token=SkypLLzvM3)](https://codecov.io/gh/techouse/alfred_workflow)
[![Codacy Badge](https://app.codacy.com/project/badge/Grade/8f4453a193c94f6eb4239f95718d1cea)](https://www.codacy.com/gh/techouse/alfred_workflow/dashboard?utm_source=github.com&amp;utm_medium=referral&amp;utm_content=techouse/alfred_workflow&amp;utm_campaign=Badge_Grade)
[![GitHub](https://img.shields.io/github/license/techouse/alfred_workflow)](LICENSE)
[![GitHub Sponsors](https://img.shields.io/github/sponsors/techouse)](https://github.com/sponsors/techouse)
[![GitHub Repo stars](https://img.shields.io/github/stars/techouse/alfred_workflow)](https://github.com/techouse/alfred_workflow/stargazers)

This library is heavily inspired by the excellent Python library [deanishe/alfred-workflow](https://github.com/deanishe/alfred-workflow).

## :children_crossing: Usage

### :tada: Basic example

```dart
import 'dart:io' show exitCode;

import 'package:alfred_workflow/alfred_workflow.dart';
import 'package:args/args.dart';
import 'package:cli_script/cli_script.dart';

void main(List<String> arguments) {
  /// It's recommended that all scripts wrap their main() methods in wrapMain.
  /// It gracefully exits when an error is unhandled, and (if chainStackTraces is true) 
  /// tracks stack traces across asynchronous calls to produce better error stacks.
  wrapMain(() async {
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
  });
}
```

To search for the string "hello" simply execute this on the commandline:

```bash
dart run example.dart --query 'hello'
```

Check out the [basic example here](example/alfred_workflow_example.dart).

### :zap: Speed it up using caching

The library uses [stash_file](https://pub.dev/packages/stash_file) to cache results in the form of `AlfredItems`.
All you need to do to enable it is to define a `cacheKey`.

```dart
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
```

Check out the [caching example here](example/alfred_workflow_caching_example.dart).

### :wrench: Workflow Configuration

This library supports new [Workflow Configuration](https://www.alfredapp.com/help/workflows/workflow-configuration/) added in Alfred 5.

> Workflow Configuration defaults are stored in `info.plist`, but changed values are saved to `prefs.plist`.
> Add the latter to your `.gitignore` so as to not commit your personal configuration to version control.

You can access the user defaults like this:

```dart
final Map<String, AlfredUserConfiguration>? userDefaults = await workflow.getUserDefaults();
```

This will return a `Map` of `AlfredUserConfiguration` objects keyed by the `key` you defined in your `info.plist`.

```dart
final AlfredUserConfiguration? defaultCurrencyConfiguration = userDefaults?['default_currency'];
```

You can then access the user set (or default) `value` of the `AlfredUserConfigurationConfig` object.

```dart
final AlfredUserConfigurationConfig? defaultCurrencyConfigurationConfig = defaultCurrencyConfiguration?.config;
final String? defaultCurrency = defaultCurrencyConfigurationConfig?.value as String?;
```

### :arrow_up: Auto-Update your workflows via GitHub releases

Setting up Auto-Updating will require that you provide your workflow's Github repository URL and version.
Optionally you can set an interval how frequently the workflow should check for updates.

Once an update is found it's downloaded to the temp and opened.

```dart
final AlfredUpdater updater = AlfredUpdater(
  /// Declare your workflow's Github repository URL
  githubRepositoryUrl: Uri.parse('https://github.com/your/repo'),
  /// Declare your workflow's current working version
  currentVersion: '1.0.0',
  /// Optionally set an interval how frequently it should check for updates
  updateInterval: Duration(days: 7),
);

/// Check for updates
if (await updater.updateAvailable()) {
  /// Run the update
  await updater.update();
}
```

To update the workflow simply run this from the commandline:

```bash
dart run example.dart --update
```

Check out the [auto-update example here](example/alfred_workflow_auto_update_example.dart).

## :rocket: Building the workflow for production

Dart scripts can be [easily compiled to standalone executables](https://dart.dev/tools/dart-compile) eliminating the need for any external prerequisites.

To compile the script above simply run this from the commandline:

```bash
dart compile exe example.dart --output example
```

You can then invoke the executable from the commandline:

```bash
./example --query 'hello'
```

### :page_facing_up: Signing and notarizing the compiled binary before distribution

[Signing on macOS](https://dart.dev/tools/dart-compile#signing) became available with [Dart 2.17](https://dart.dev/guides/whats-new#may-11-2022-217-release).

If you want to distribute your compiled Mach-O binary you should **sign** and **notarize** it with Apple.

Use the bash script below as a template to help you with this process.

```bash
#!/usr/bin/env bash

# This script should be a starting point to help you sign and notarise a Mach-O binary app.
# Read it carefully and replace any placeholders with actual data.

# Sign the compiled binary
codesign \
  --sign="XXXX" \                        # replace with hash of "Developer ID Application: Your name (Your Team)"
  --identifier="com.example.test" \      # replace with app's bundle id
  --deep \
  --force \
  --options=runtime \
  --entitlement="./entitlements.plist" \ # must allow com.apple.security.cs.allow-unsigned-executable-memory
  --timestamp \
  --verbose=4 \
  ./path/to/compiled/exe

# Verify the signed binary
codesign -dv --verbose=4 ./path/to/compiled/exe

# ZIP the binary because altool won't accept a raw Mach-O binary
zip -j ./path/to/compiled/exe.zip ./path/to/compiled/exe

# Notarize the binary in ZIP form
# For more info refer to https://developer.apple.com/documentation/security/notarizing_macos_software_before_distribution/customizing_the_notarization_workflow#3087734
xcrun notarytool \
  submit path/to/compiled/exe.zip \
  --keychain-profile "notarytool-password" \  # replace with an app specific password https://support.apple.com/en-us/HT204397
  --wait

# Delete zip file as it's no longer needed at this point
# Apple will notarize the Mach-O binary inside the ZIP
rm ./path/to/compiled/exe.zip

# Wait a while then verify your Mach-O binary
spctl -a -vvv -t install ./path/to/compiled/exe

# In case you encountered an error run and check the output
xcrun altool \
  --notarization-info "XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX" \  # the UUID altool gave you
  --username "john.appleseed@apple.com" \                       # Apple ID username
  --password "@keychain:Developer-altool"                       # same app-specific password
```

Fore more info please refer to [the Apple Code Signing guide](https://developer.apple.com/support/code-signing/) as well 
as to [this exhaustive StackOverflow answer](https://stackoverflow.com/questions/64652704/how-to-notarize-an-macos-command-line-tool-created-outside-of-xcode#answer-64733472).

## :seedling: A couple of my Alfred Workflows built using this library

- [alfred-flutter-docs](https://github.com/techouse/alfred-flutter-docs)
- [alfred-dart-docs](https://github.com/techouse/alfred-dart-docs)
- [alfred-react-docs](https://github.com/techouse/alfred-react-docs)
- [alfred-vue-docs](https://github.com/techouse/alfred-vue-docs)
- [alfred-tailwindcss-docs](https://github.com/techouse/alfred-tailwindcss-docs)
- [alfred-django-docs](https://github.com/techouse/alfred-django-docs)
- [alfred-flask-docs](https://github.com/techouse/alfred-flask-docs)
- [alfred-laravel-docs](https://github.com/techouse/alfred-laravel-docs)
- [alfred-nova-docs](https://github.com/techouse/alfred-nova-docs)
- [alfred-cakephp-docs](https://github.com/techouse/alfred-cakephp-docs)
- [alfred-gitmoji](https://github.com/techouse/alfred-gitmoji)
- [alfred-stackoverflow](https://github.com/techouse/alfred-stackoverflow)
- [alfred-convert](https://github.com/techouse/alfred-convert)
