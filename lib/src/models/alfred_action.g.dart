// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'alfred_action.dart';

// **************************************************************************
// AutoequalGenerator
// **************************************************************************

mixin _$AlfredActionAutoequalMixin on EquatableMixin {
  @override
  List<Object?> get props =>
      _$AlfredActionAutoequal(this as AlfredAction)._$props;
}

extension _$AlfredActionAutoequal on AlfredAction {
  List<Object?> get _$props => [text, url, file, auto];
}

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$AlfredActionCWProxy {
  AlfredAction text(Object? text);

  AlfredAction url(Uri? url);

  AlfredAction file(String? file);

  AlfredAction auto(String? auto);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `AlfredAction(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// AlfredAction(...).copyWith(id: 12, name: "My name")
  /// ````
  AlfredAction call({
    Object? text,
    Uri? url,
    String? file,
    String? auto,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfAlfredAction.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfAlfredAction.copyWith.fieldName(...)`
class _$AlfredActionCWProxyImpl implements _$AlfredActionCWProxy {
  const _$AlfredActionCWProxyImpl(this._value);

  final AlfredAction _value;

  @override
  AlfredAction text(Object? text) => this(text: text);

  @override
  AlfredAction url(Uri? url) => this(url: url);

  @override
  AlfredAction file(String? file) => this(file: file);

  @override
  AlfredAction auto(String? auto) => this(auto: auto);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `AlfredAction(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// AlfredAction(...).copyWith(id: 12, name: "My name")
  /// ````
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
          : text as Object?,
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
  /// Returns a callable class that can be used as follows: `instanceOfAlfredAction.copyWith(...)` or like so:`instanceOfAlfredAction.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$AlfredActionCWProxy get copyWith => _$AlfredActionCWProxyImpl(this);
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
