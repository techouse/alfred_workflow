## 1.0.0

- Chore: update dependencies

## 0.6.1

- Chore: Update dependencies

## 0.6.0

- **BREAKING:** User Defaults are now combined with the default prefs.plist
  file. This means that if you have a prefs.plist file in your workflow, it will
  be merged with the User Defaults when you call `AlfredWorkflow.run()`.
  This is to ensure that the workflow is always in a consistent state.

## 0.5.1

- Chore: Update dependencies
- Chore: Update Dart SDK to '>=3.2.0 <4.0.0'

## 0.5.0

- Feat: Add ability to read User Defaults from prefs.plist
- Chore: Update dependencies

## 0.4.2

- Chore: Add pub topics to package metadata
- Chore: Update dependencies

## 0.4.1

- Chore: Add Dart 3 class modifiers
- Chore: Add GitHub Release step to publishing GitHub Action

## 0.4.0

- Chore: Update Dart SDK to '>=3.0.5 <4.0.0'
- Chore: Update dependencies
- Chore: Remove Dart Code Metrics because it's being
  deprecated https://dcm.dev/blog/2023/06/06/announcing-dcm-free-version-sunset/

## 0.3.3

- Chore: Update dependencies

## 0.3.2+1

- Chore: Update dependencies
- Chore: Automate publishing via GitHub Actions

## 0.3.2

- Chore: Update Dart SDK to '>=2.17.0 <4.0.0'

## 0.3.1

- Chore: Update copy_with_extension to 5.0.2
- Chore: Replace all Object? with dynamic in models

## 0.3.0+1

- Fix result ordering

## 0.3.0

- **BREAKING:** Change AlfredItem.type from String to AlfredItemType enum
- Add support for Universal Action
- Add support result ordering

## 0.2.12

- Add support for mods field in AlfredItem

## 0.2.11

- Updated dependencies
- Rebuilt generated files

## 0.2.10

- Add support custom version tags

## 0.2.9

- Updated examples
- Updated dependencies

## 0.2.8

- Updated dependencies
- Rebuilt generated files

## 0.2.7

- AlfredItems now has a const constructor
- Added build_verify test to ensure all generated files get pushed correctly
- Added EquatableMixin to AlfredCache and AlfredUpdater
- Updated dependencies

## 0.2.6

- Now using autoequal to auto-generate Equatable props

## 0.2.5

- Updated development dependencies

## 0.2.4

- Updated dependencies

## 0.2.3

- Updated dependencies and rebuilt generated files

## 0.2.2

- Stricter code linting

## 0.2.1

- Upgraded stash to 4.3.0

## 0.2.0

- Upgraded stash to 4.1.0
- BREAKING: Changed minimum SDK version to 2.17.0

## 0.1.6

- Pin stash to 4.0.x

## 0.1.5

- Fix typo in changelog

## 0.1.4

- Use a copy of AlfredItems when adding to beginning or end of JSON string
- Update dependencies
- Rebuild generated files
- Add more tests

## 0.1.3

- Add more documentation
- Refactor exports

## 0.1.2

- Limit library to macOS only as Alfred is a macOS only app.

## 0.1.1

- Add more documentation

## 0.1.0

- Add coverage

## 0.0.8

- Bug fixes

## 0.0.7

- Add more unit tests

## 0.0.6

- Add unit tests
- Fix some minor bugs

## 0.0.5

- Add updater

## 0.0.4

- Do not JSON serialize nullable null fields

## 0.0.3

- Add basic file caching
- BREAKING: AlfredItems now accepts only a single positional item

## 0.0.2

- Use json_serializable to automate json serialization
- BREAKING: Change Iterable<AlfredItem> for List<AlfredItem>

## 0.0.1

- Initial version.
