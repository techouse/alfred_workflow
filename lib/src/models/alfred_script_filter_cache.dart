import 'package:autoequal/autoequal.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'alfred_script_filter_cache.g.dart';

/// https://www.alfredapp.com/help/workflows/inputs/script-filter/json/#cache
@autoequal
@CopyWith()
@JsonSerializable()
class AlfredScriptFilterCache with EquatableMixin {
  const AlfredScriptFilterCache({
    required this.seconds,
    this.looseReload,
  }) : assert(
          seconds >= 5 && seconds <= 86400,
          'Time to live for cached data must be between 5 and 86400 seconds (24 hours).',
        );

  /// Time to live for cached data is defined as a number of seconds between 5 and 86400 (i.e. 24 hours).
  final int seconds;

  /// The optional loosereload key asks the Script Filter to try to show any cached data first.
  /// If it's determined to be stale, the script runs in the background and replaces results
  /// with the new data when it becomes available.
  @JsonKey(name: 'loosereload')
  final bool? looseReload;

  factory AlfredScriptFilterCache.fromJson(Map<String, dynamic> json) =>
      _$AlfredScriptFilterCacheFromJson(json);

  Map<String, dynamic> toJson() => _$AlfredScriptFilterCacheToJson(this);

  @override
  List<Object?> get props => _$props;
}
