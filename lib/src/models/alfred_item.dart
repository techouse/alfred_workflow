// ignore_for_file: constant_identifier_names

import 'package:alfred_workflow/src/models/alfred_action.dart';
import 'package:alfred_workflow/src/models/alfred_item_mod.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart' show EquatableMixin;
import 'package:equatable_annotations/equatable_annotations.dart';
import 'package:json_annotation/json_annotation.dart';

import 'alfred_item_icon.dart';
import 'alfred_item_text.dart';

part 'alfred_item.g.dart';

enum AlfredItemType {
  @JsonValue('default')
  Default,
  @JsonValue('file')
  File,
  @JsonValue('file:skipcheck')
  FileSkipcheck,
}

/// [AlfredItem] implements all the properties [Alfred's Script Filter JSON Format](https://www.alfredapp.com/help/workflows/inputs/script-filter/json/)
///
/// Each [AlfredItem] describes a result row displayed in Alfred.
/// The three obvious elements are the ones you see in an Alfred result row - [title], [subtitle] and [icon].
@CopyWith()
@JsonSerializable(explicitToJson: true)
final class AlfredItem with EquatableMixin {
  const AlfredItem({
    required this.title,
    this.type = AlfredItemType.Default,
    this.valid = false,
    this.subtitle,
    this.arg,
    this.autocomplete,
    this.uid,
    this.icon,
    this.text,
    this.quickLookUrl,
    this.match,
    this.mods,
    this.action,
  }) : assert(
         (arg == null && action == null) || ((arg != null) ^ (action != null)),
         'Either arg or action must be provided, but not both.',
       ),
       assert(
         action == null ||
             (action is String || action is Iterable || action is AlfredAction),
         'Action must be a String, Iterable or AlfredAction.',
       );

  /// The [title] displayed in the result row. There are no options for this element and it is essential that this element is populated.
  @JsonKey(required: true)
  final String title;

  /// [type] : [AlfredItemType.Default] | [AlfredItemType.File] | [AlfredItemType.FileSkipcheck] (optional, default = [AlfredItemType.Default])
  ///
  /// By specifying [type] = [AlfredItemType.File], this makes Alfred treat your result as a file on your system.
  /// This allows the user to perform actions on the file like they can with Alfred's standard file filters.
  /// When returning files, Alfred will check if the file exists before presenting that result to the user.
  /// This has a very small performance implication but makes the results as predictable as possible.
  /// If you would like Alfred to skip this check as you are certain that the files you are returning exist, you can use [type]: [AlfredItemType.Default].
  final AlfredItemType type;

  /// [valid] : true | false (optional, default = false)
  ///
  /// If this item is valid or not. If an item is valid then Alfred will action this item when the user presses return.
  /// If the item is not valid, Alfred will do nothing.
  /// This allows you to intelligently prevent Alfred from actioning a result based on the current {query} passed into your script.
  /// If you exclude the valid attribute, Alfred assumes that your item is valid.
  final bool valid;

  /// The [subtitle] displayed in the result row. This element is optional.
  @JsonKey(includeIfNull: false)
  final String? subtitle;

  /// The argument which is passed through the workflow to the connected output action.
  ///
  /// While the [arg] attribute is optional, it's highly recommended that you populate this as it's the string which is passed to your connected output actions.
  /// If excluded, you won't know which result item the user has selected.
  @JsonKey(includeIfNull: false)
  final String? arg;

  /// An optional but recommended string you can provide which is populated into Alfred's search field if the user auto-completes the selected result (⇥ by default).
  ///
  /// If the item is set as [valid] = false, the auto-complete text is populated into Alfred's search field when the user actions the result.
  @JsonKey(includeIfNull: false)
  final String? autocomplete;

  /// This is a unique identifier for the item which allows help Alfred to learn about this item for subsequent sorting and ordering of the user's actioned results.
  ///
  /// It is important that you use the same [uid] throughout subsequent executions of your script to take advantage of Alfred's knowledge and sorting.
  /// If you would like Alfred to always show the results in the order you return them from your script, exclude the [uid] field.
  @JsonKey(includeIfNull: false)
  final String? uid;

  /// The [icon] displayed in the result row.
  ///
  /// Workflows are run from their workflow folder, so you can reference icons stored in your workflow relatively.
  @JsonKey(fromJson: _iconFromJson, includeIfNull: false)
  final AlfredItemIcon? icon;

  /// The [text] element defines the text the user will get when copying the selected result row with ⌘C or displaying large type with ⌘L.
  ///
  /// If these are not defined, you will inherit Alfred's standard behaviour where the arg is copied to the Clipboard or used for Large Type.
  @JsonKey(fromJson: _textFromJson, includeIfNull: false)
  final AlfredItemText? text;

  /// A Quick Look URL which will be visible if the user uses the Quick Look feature within Alfred (tapping shift, or ⌘Y).
  ///
  /// Note that [quickLookUrl] will also accept a file path, both absolute and relative to home using ~/.
  /// If absent, Alfred will attempt to use the [arg] as the [quickLookUrl].
  @JsonKey(name: 'quicklookurl', includeIfNull: false)
  final String? quickLookUrl;

  /// From Alfred 3.5, the [match] field enables you to define what Alfred matches against when the workflow is set to "Alfred Filters Results".
  ///
  /// If [match] is present, it fully replaces matching on the title property.
  /// Note that the [match] field is always treated as case insensitive, and intelligently treated as diacritic insensitive.
  /// If the search query contains a diacritic, the [match] becomes diacritic sensitive.
  /// This option pairs well with the [Alfred Filters Results](https://www.alfredapp.com/help/workflows/inputs/script-filter/#alfred-filters-results) Match Mode option.
  @JsonKey(includeIfNull: false)
  final String? match;

  /// The [mods] give you control over how the modifier keys react.
  ///
  /// It can alter the looks of a result (e.g. [subtitle], [icon]) and output a different arg or session variables.
  @ignore
  @JsonKey(includeIfNull: false, toJson: _modsToJson, fromJson: _modsFromJson)
  final Map<Set<AlfredItemModKey>, AlfredItemMod>? mods;

  /// [action] : [Map<String, dynamic>] | [List<String>] | [String] (optional)
  ///
  /// This element defines the [Universal Action](https://www.alfredapp.com/help/features/universal-actions/)
  /// items used when actioning the result, and overrides the [arg] being used for actioning.
  /// The [action] key can take a [String] or [List<String>] for simple types, and the content
  /// type will automatically be derived by Alfred to file, url, or text.
  ///
  /// ```dart
  ///   # Single Item:
  ///   action: "Alfred is Great"
  ///
  ///   # Multiple Items:
  ///   action: <String>["Alfred is Great", "I use him all day long"]
  ///
  ///   # For control over the content type of the action, you can use an object with typed keys:
  ///   action: <String, dynamic>{
  ///     "text": <String>["one", "two", "three"],
  ///     "url": "https://www.alfredapp.com",
  ///     "file": "~/Desktop",
  ///     "auto": "~/Pictures"
  ///   }
  /// ```
  @JsonKey(
    includeIfNull: false,
    toJson: _actionToJson,
    fromJson: _actionFromJson,
  )
  final dynamic action;

  static AlfredItemIcon? _iconFromJson(dynamic icon) => icon == null
      ? null
      : AlfredItemIcon.fromJson(Map<String, dynamic>.from(icon));

  static AlfredItemText? _textFromJson(dynamic text) => text == null
      ? null
      : AlfredItemText.fromJson(Map<String, dynamic>.from(text));

  static Map<String, Map<String, dynamic>>? _modsToJson(
    Map<Set<AlfredItemModKey>, AlfredItemMod>? mods,
  ) => mods?.map((Set<AlfredItemModKey> keys, AlfredItemMod mod) {
    final List<String> canonicalKey =
        keys.map((AlfredItemModKey k) => k.name).toList()..sort();
    return MapEntry(canonicalKey.join('+'), mod.toJson());
  });

  static Map<Set<AlfredItemModKey>, AlfredItemMod>? _modsFromJson(Map? json) =>
      json != null
      ? Map<String, dynamic>.from(json).map(
          (String key, dynamic value) => MapEntry(
            key
                .split('+')
                .map((String s) => AlfredItemModKey.values.byName(s))
                .toSet(),
            AlfredItemMod.fromJson(Map<String, dynamic>.from(value)),
          ),
        )
      : null;

  /// Canonicalizes the mods by sorting the keys and joining them into a single string.
  static Map<String, AlfredItemMod>? _canonicalMods(
    Map<Set<AlfredItemModKey>, AlfredItemMod>? mods,
  ) => mods?.map((Set<AlfredItemModKey> keySet, AlfredItemMod mod) {
    final List<String> sortedNames =
        keySet.map((AlfredItemModKey k) => k.name).toList()..sort();
    return MapEntry(sortedNames.join('+'), mod);
  });

  static dynamic _actionToJson(Object? action) => switch (action) {
    null => null,
    String _ => action,
    Iterable _ => action.map(_actionToJson).toList(),
    AlfredAction _ => action.toJson(),
    _ => throw ArgumentError.value(
      action,
      'action',
      'Invalid action. Must be a String, Iterable, or AlfredAction.',
    ),
  };

  static Object? _actionFromJson(dynamic action) => switch (action) {
    null => null,
    String _ => action,
    Iterable _ => action.map(_actionFromJson).toList(),
    Map _ => AlfredAction.fromJson(Map<String, dynamic>.from(action)),
    _ => throw ArgumentError.value(
      action,
      'action',
      'Invalid action. Must be a String, Iterable, or Map.',
    ),
  };

  factory AlfredItem.fromJson(Map<String, dynamic> json) =>
      _$AlfredItemFromJson(json);

  Map<String, dynamic> toJson() => _$AlfredItemToJson(this);

  @override
  List<Object?> get props => _$props..add(_canonicalMods(mods));
}
