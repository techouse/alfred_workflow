import 'package:alfred_workflow/alfred_workflow.dart';
import 'package:faker/faker.dart';
import 'package:test/test.dart';

void main() {
  final Faker faker = Faker();

  group('AlfredAutomaticCache', () {
    test('props contains expected properties', () {
      final int seconds = faker.randomGenerator.integer(
        AlfredAutomaticCache.maxSeconds,
        min: AlfredAutomaticCache.minSeconds,
      );
      final bool looseReload = faker.randomGenerator.boolean();

      final AlfredAutomaticCache cache = AlfredAutomaticCache(
        seconds: seconds,
        looseReload: looseReload,
      );

      // Test that props contains all the expected properties
      expect(cache.props, isNotEmpty);
      expect(cache.props, contains(cache.seconds));
      expect(cache.props, contains(cache.looseReload));
    });

    test('instances with different properties are not equal', () {
      final int seconds = faker.randomGenerator.integer(
        AlfredAutomaticCache.maxSeconds,
        min: AlfredAutomaticCache.minSeconds,
      );
      final bool looseReload = faker.randomGenerator.boolean();

      final AlfredAutomaticCache cache1 = AlfredAutomaticCache(
        seconds: seconds,
        looseReload: looseReload,
      );

      final cache2 = AlfredAutomaticCache(
        seconds: seconds,
        looseReload: !looseReload, // Different looseReload
      );

      // They should not be equal because looseReload is different
      expect(cache1.looseReload, isNot(equals(cache2.looseReload)));
      expect(cache1.props, isNot(equals(cache2.props)));
    });
  });
}
