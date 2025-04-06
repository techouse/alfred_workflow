import 'package:autoequal/autoequal.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'alfred_automatic_cache.g.dart';

/// https://www.alfredapp.com/help/workflows/inputs/script-filter/json/#cache
@autoequal
@CopyWith()
@JsonSerializable(
  createFactory: false,
  includeIfNull: false,
  ignoreUnannotated: true,
)
class AlfredAutomaticCache with EquatableMixin {
  const AlfredAutomaticCache({
    required this.seconds,
    this.looseReload,
  }) : assert(
          seconds >= minSeconds && seconds <= maxSeconds,
          'Time to live for cached data must be between $minSeconds and $maxSeconds seconds (24 hours).',
        );

  /// Time to live for cached data is defined as a number of seconds between 5 and 86400 (i.e. 24 hours).
  @JsonKey(name: 'seconds')
  final int seconds;

  /// The optional loosereload key asks the Script Filter to try to show any cached data first.
  /// If it's determined to be stale, the script runs in the background and replaces results
  /// with the new data when it becomes available.
  @JsonKey(name: 'loosereload')
  final bool? looseReload;

  /// The minimum value for the cache duration.
  static const int minSeconds = 5;

  /// The maximum value for the cache duration.
  static const int maxSeconds = 86400;

  Map<String, dynamic> toJson() => _$AlfredAutomaticCacheToJson(this);

  @override
  List<Object?> get props => _$props;
}
