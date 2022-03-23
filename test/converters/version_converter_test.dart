import 'package:alfred_workflow/src/converters/version_converter.dart';
import 'package:faker/faker.dart';
import 'package:pub_semver/pub_semver.dart';
import 'package:test/test.dart';

void main() {
  final Faker faker = Faker();

  test('fromJson', () {
    final int major = faker.randomGenerator.integer(99, min: 0);
    final int minor = faker.randomGenerator.integer(99, min: 0);
    final int patch = faker.randomGenerator.integer(99, min: 1);

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

    // exceptions
    expect(
      () => VersionConverter.instance.fromJson('$major'),
      throwsA(TypeMatcher<FormatException>()),
    );
    expect(
      () => VersionConverter.instance.fromJson('$major.$minor'),
      throwsA(TypeMatcher<FormatException>()),
    );
    expect(
      () => VersionConverter.instance
          .fromJson('x$major.$minor.$patch'),
      throwsA(TypeMatcher<FormatException>()),
    );
  });
}
