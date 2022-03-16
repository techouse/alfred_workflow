import 'package:json_annotation/json_annotation.dart' show JsonConverter;
import 'package:pub_semver/pub_semver.dart' show Version;

class VersionConverter implements JsonConverter<Version, String> {
  const VersionConverter();

  static const instance = VersionConverter();

  @override
  Version fromJson(String string) => string.toLowerCase().startsWith('v')
      ? Version.parse(string.substring(1))
      : Version.parse(string);

  @override
  String toJson(Version version) => version.toString();
}
