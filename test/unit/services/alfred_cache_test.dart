import 'package:alfred_workflow/alfred_workflow.dart';
import 'package:test/test.dart';

void main() {
  group('AlfredCache', () {
    test('props contains expected properties', () {
      final AlfredCache<String> cache = AlfredCache<String>(
        fromEncodable: (Map<String, dynamic> json) => json['value'] as String,
        maxEntries: 5,
        name: 'test_cache',
        verbose: true,
      );

      // Test that props contains all the expected properties
      expect(cache.props, isNotEmpty);
      expect(cache.props, contains(cache.maxEntries));
      expect(cache.props, contains(cache.name));
      expect(cache.props, contains(cache.verbose));
    });

    test('instances with different properties are not equal', () {
      final AlfredCache<String> cache1 = AlfredCache<String>(
        fromEncodable: (Map<String, dynamic> json) => json['value'] as String,
        maxEntries: 5,
        name: 'test_cache',
        verbose: true,
      );

      final AlfredCache<String> cache2 = AlfredCache<String>(
        fromEncodable: (Map<String, dynamic> json) => json['value'] as String,
        maxEntries: 10, // Different maxEntries
        name: 'test_cache',
        verbose: true,
      );

      // They should not be equal because maxEntries is different
      expect(cache1.maxEntries, isNot(equals(cache2.maxEntries)));
      expect(cache1.props, isNot(equals(cache2.props)));
    });
  });
}
