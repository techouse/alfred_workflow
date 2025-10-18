# AI Coding Agent Instructions for `alfred_workflow`

Concise, project-specific guidance to be productive quickly. Focus on existing patterns only.

## Architecture & Public API
- Single Dart library exposing Alfred workflow authoring helpers. Public entrypoint: `lib/alfred_workflow.dart` which re-exports `src/extensions/`, `src/models/`, `src/services/`.
- Core concepts:
  - `AlfredWorkflow`: orchestrates item collection, optional automatic caching (`AlfredAutomaticCache`) and file-backed caching (`AlfredCache<AlfredItems>`), and serializes results to Alfred Script Filter JSON.
  - Data layer built from immutable, JSON-serializable model classes (`AlfredItem`, `AlfredItems`, `AlfredItemIcon`, `AlfredItemText`, `AlfredAction`, etc.) leveraging `json_serializable`, `equatable`, `copy_with_extension`.
  - Caching: two mechanisms—(1) Alfred's automatic cache (time-based via `AlfredAutomaticCache.seconds`) mutually exclusive with (2) file cache keyed by `workflow.cacheKey` (stored using `stash_file`). Setting `cacheKey` disables automatic cache; enabling `useAutomaticCache` clears `cacheKey`.
  - Services (`src/services/`) implement filesystem/cache behaviors. `AlfredCache<T>` wraps `stash_file` store with eviction+expiry policies and verbose debug logging via `dart:developer log`.
- JSON output produced by `AlfredWorkflow.run()` after building up `AlfredItems`; modifiers, actions, knowledge ordering flags handled in models.

## Key Patterns & Conventions
- All public models use `final class` + mixins (`EquatableMixin`) for value equality. Generated code (`*.g.dart`, `*.mocks.dart`) excluded from formatting checks & coverage trimming.
- Strict assertions inside constructors (e.g. `AlfredItem` enforces either `arg` xor `action`). Preserve these when extending.
- Modifier keys for items serialized by canonicalizing sets (sorted join of key names). Reuse `_modsToJson` / `_modsFromJson` approach if adding new modifier handling.
- Caching contract: always call `await workflow.getItems()` instead of accessing internal `_items`. Add items through `addItem`/`addItems` to ensure caching side-effects. Clearing uses `clearItems()`.
- Setting `cacheKey` triggers write-through caching of subsequent additions; retrieval auto-injects cached items. Items added via `addToBeginning` / `addToEnd` in `toJsonString()` are never cached.
- Avoid using `print`; library writes to `stdout` except when `toStdout=false` (tests may override). Follow existing style (`dart format`, recommended lints). Two-space indentation.

## Build & Development Workflow
- Use Make targets: `make install` (pub get), `make analyze` (static analysis with fatal infos), `make check_format`, `make tests` (VM tests), `make sure` (style + tests). `make code_gen` / `code_gen_watcher` for running `build_runner` to refresh generated files.
- Coverage: `make show_test_coverage` generates HTML under `coverage/html/index.html`, stripping generated files (`*.g.dart`, `*.mocks.dart`).
- Prefer editing source then running `make sure` before commits.

## Testing Approach
- Tests mirror source structure under `test/unit/...` and use fixtures under `test/fixtures/`. Mocks use `mockito`; file cache behaviors tested with controlled TTL/entry counts. When adding features, place tests beside domain (e.g. new model in `test/unit/models/`).
- Use `AlfredWorkflow.toJsonString()` for asserting output JSON; avoid inspecting private fields.

## External Dependencies & Their Roles
- `stash`/`stash_file`: persistent caching of `AlfredItems` with TTL & eviction policies. Configure via `AlfredCache` constructor args (`maxEntries`, `expiryPolicy`).
- `json_serializable`, `copy_with_extension_gen`, `equatable_gen`: code generation; always run `make code_gen` after adding annotatated fields/types.
- `pub_semver`: version comparisons (updater logic) and GitHub release auto-update (see example `alfred_workflow_auto_update_example.dart`).
- `plist_parser`: reads Alfred workflow configuration defaults from `info.plist` and user overrides from `prefs.plist`.

## Extending & Adding Functionality
- Add new model: create file in `lib/src/models/`, annotate with `@JsonSerializable(explicitToJson: true)` + `@CopyWith()` + `EquatableMixin`; export via `lib/src/models/index.dart` (ensure re-export through top-level). Run code generation.
- New service: isolate side effects (I/O, network, caching) in `src/services`. Provide narrow API returning plain model objects.
- Maintain mutual exclusivity patterns (e.g. `arg` vs `action`, automatic vs file caching) via assertions or setter interactions.

## Examples & Usage References
- Basic, caching, auto-update examples in `example/` show recommended CLI pattern: wrap `main()` in `wrapMain`, parse args with `args` package, sanitize query, populate workflow, then `workflow.run()`.
- Use `workflow.cacheKey = query` to enable file caching; use `workflow.useAutomaticCache = true` for Alfred's native cache (never set both).

## Common Pitfalls to Avoid
- Forgetting to run code generation after model changes (will cause missing `*.g.dart` errors).
- Accidentally setting both `cacheKey` and `useAutomaticCache` (setters disable the other). Rely on current setter side-effects instead of manual resets.
- Directly mutating internal item lists; always go through public methods.

## Commit & PR Hygiene
- Emoji-prefixed commit messages (e.g. `:sparkles:`) expected. Run `make sure` before pushing; exclude generated artifacts from commits per existing `.gitignore`.

Feedback requested: Are there additional non-obvious workflows (debug, release signing, updater) you want documented or any unclear sections above?
