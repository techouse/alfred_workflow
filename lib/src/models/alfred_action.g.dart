// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'alfred_action.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$AlfredActionCWProxy {
  AlfredAction text(dynamic text);

  AlfredAction url(Uri? url);

  AlfredAction file(String? file);

  AlfredAction auto(String? auto);

  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored. To update a single field use `AlfredAction(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// AlfredAction(...).copyWith(id: 12, name: "My name")
  /// ```
  AlfredAction call({dynamic text, Uri? url, String? file, String? auto});
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfAlfredAction.copyWith(...)` or call `instanceOfAlfredAction.copyWith.fieldName(value)` for a single field.
class _$AlfredActionCWProxyImpl implements _$AlfredActionCWProxy {
  const _$AlfredActionCWProxyImpl(this._value);

  final AlfredAction _value;

  @override
  AlfredAction text(dynamic text) => call(text: text);

  @override
  AlfredAction url(Uri? url) => call(url: url);

  @override
  AlfredAction file(String? file) => call(file: file);

  @override
  AlfredAction auto(String? auto) => call(auto: auto);

  @override
  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored. To update a single field use `AlfredAction(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// AlfredAction(...).copyWith(id: 12, name: "My name")
  /// ```
  AlfredAction call({
    Object? text = const $CopyWithPlaceholder(),
    Object? url = const $CopyWithPlaceholder(),
    Object? file = const $CopyWithPlaceholder(),
    Object? auto = const $CopyWithPlaceholder(),
  }) {
    return AlfredAction(
      text: text == const $CopyWithPlaceholder()
          ? _value.text
          // ignore: cast_nullable_to_non_nullable
          : text as dynamic,
      url: url == const $CopyWithPlaceholder()
          ? _value.url
          // ignore: cast_nullable_to_non_nullable
          : url as Uri?,
      file: file == const $CopyWithPlaceholder()
          ? _value.file
          // ignore: cast_nullable_to_non_nullable
          : file as String?,
      auto: auto == const $CopyWithPlaceholder()
          ? _value.auto
          // ignore: cast_nullable_to_non_nullable
          : auto as String?,
    );
  }
}

extension $AlfredActionCopyWith on AlfredAction {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfAlfredAction.copyWith(...)` or `instanceOfAlfredAction.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$AlfredActionCWProxy get copyWith => _$AlfredActionCWProxyImpl(this);
}

// **************************************************************************
// EquatableGenerator
// **************************************************************************

extension _$AlfredActionEquatableAnnotations on AlfredAction {
  List<Object?> get _$props => [text, url, file, auto];
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AlfredAction _$AlfredActionFromJson(Map<String, dynamic> json) => AlfredAction(
  text: json['text'],
  url: json['url'] == null ? null : Uri.parse(json['url'] as String),
  file: json['file'] as String?,
  auto: json['auto'] as String?,
);

Map<String, dynamic> _$AlfredActionToJson(AlfredAction instance) =>
    <String, dynamic>{
      'text': instance.text,
      'url': instance.url?.toString(),
      'file': instance.file,
      'auto': instance.auto,
    };
