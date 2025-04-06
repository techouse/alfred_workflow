import 'package:json_annotation/json_annotation.dart' show JsonConverter;
import 'package:pub_semver/pub_semver.dart' show Version;

final class VersionConverter implements JsonConverter<Version, String> {
  const VersionConverter();

  static const VersionConverter instance = VersionConverter();

  static final RegExp _versionMatcher = RegExp(r'(\d+\.\d+\.\d+)');

  @override
  Version fromJson(String string) => _versionMatcher.hasMatch(string)
      ? Version.parse(_versionMatcher.stringMatch(string).toString())
      : Version.parse(string);

  @override
  String toJson(Version version) => version.toString();
}
