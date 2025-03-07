import 'package:alfred_workflow/src/converters/version_converter.dart';
import 'package:faker/faker.dart';
import 'package:pub_semver/pub_semver.dart';
import 'package:test/test.dart';

void main() {
  final Faker faker = Faker();
  late int major;
  late int minor;
  late int patch;
  late String name;

  setUp(() {
    major = faker.randomGenerator.integer(9999, min: 0);
    minor = faker.randomGenerator.integer(9999, min: 0);
    patch = faker.randomGenerator.integer(9999, min: 1);
    name = faker.internet.userName();
  });

  test('fromJson', () {
    expect(
      VersionConverter.instance.fromJson('$major.$minor.$patch'),
      Version(major, minor, patch),
    );
    expect(
      VersionConverter.instance.fromJson('v$major.$minor.$patch'),
      Version(major, minor, patch),
    );
    expect(
      VersionConverter.instance.fromJson('V$major.$minor.$patch'),
      Version(major, minor, patch),
    );

    // custom versioning
    expect(
      VersionConverter.instance.fromJson('x$major.$minor.$patch'),
      Version(major, minor, patch),
    );
    expect(
      VersionConverter.instance.fromJson('$name-$major.$minor.$patch'),
      Version(major, minor, patch),
    );
    expect(
      VersionConverter.instance.fromJson('$name-v$major.$minor.$patch'),
      Version(major, minor, patch),
    );
    expect(
      VersionConverter.instance.fromJson('$major.$minor.$patch-$name'),
      Version(major, minor, patch),
    );
    expect(
      VersionConverter.instance.fromJson('v$major.$minor.$patch-$name'),
      Version(major, minor, patch),
    );
    expect(
      VersionConverter.instance.fromJson('$name-$major.$minor.$patch-$name'),
      Version(major, minor, patch),
    );

    // exceptions
    expect(
      () => VersionConverter.instance.fromJson('$major'),
      throwsA(const TypeMatcher<FormatException>()),
    );
    expect(
      () => VersionConverter.instance.fromJson('$major.$minor'),
      throwsA(const TypeMatcher<FormatException>()),
    );
  });
}
