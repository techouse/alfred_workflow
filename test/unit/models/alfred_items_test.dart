import 'package:alfred_workflow/alfred_workflow.dart';
import 'package:faker/faker.dart';
import 'package:test/test.dart';

import '../../fixtures/models/alfred_item_fixture.dart';

void main() {
  final Faker faker = Faker();
  late List<AlfredItem> itemsList;
  late AlfredItems items;

  setUp(() {
    itemsList = AlfredItemFixture.factory
        .redefine(AlfredItemFixture.factory.uid(faker.guid.guid()))
        .makeMany(10);
  });

  group('toJson', () {
    test(
      'by default the JSON includes UID and is without skipknowledge',
      () {
        items = AlfredItems(itemsList);
        final Map<String, dynamic> json = items.toJson();

        expect(json['skipknowledge'], isNull);
        for (final Map<String, dynamic> item in json['items'] as List) {
          expect(item['uid'], isNotNull);
        }
      },
    );

    test(
      'skipKnowledge = true includes skipknowledge',
      () {
        items = AlfredItems(itemsList, skipKnowledge: true);
        final Map<String, dynamic> json = items.toJson();

        expect(json['skipknowledge'], isTrue);
        for (final Map<String, dynamic> item in json['items'] as List) {
          expect(item['uid'], isNotNull);
        }
      },
    );

    test(
      'skipKnowledge = false includes skipknowledge',
      () {
        items = AlfredItems(itemsList, skipKnowledge: false);
        final Map<String, dynamic> json = items.toJson();

        expect(json['skipknowledge'], isFalse);
        for (final Map<String, dynamic> item in json['items'] as List) {
          expect(item['uid'], isNotNull);
        }
      },
    );

    test(
      'exactOrder = true removes UIDs',
      () {
        items = AlfredItems(itemsList, exactOrder: true);
        final Map<String, dynamic> json = items.toJson();

        expect(json['skipknowledge'], isNull);
        for (final Map<String, dynamic> item in json['items'] as List) {
          expect(item['uid'], isNull);
        }
      },
    );

    test(
      'exactOrder = true && skipKnowledge = true removes UIDs and includes skipknowledge',
      () {
        items = AlfredItems(itemsList, skipKnowledge: true, exactOrder: true);
        final Map<String, dynamic> json = items.toJson();

        expect(json['skipknowledge'], isTrue);
        for (final Map<String, dynamic> item in json['items'] as List) {
          expect(item['uid'], isNull);
        }
      },
    );

    test(
      'exactOrder = true && skipKnowledge = false removes UIDs and includes skipknowledge',
      () {
        items = AlfredItems(itemsList, skipKnowledge: false, exactOrder: true);
        final Map<String, dynamic> json = items.toJson();

        expect(json['skipknowledge'], isFalse);
        for (final Map<String, dynamic> item in json['items'] as List) {
          expect(item['uid'], isNull);
        }
      },
    );
  });

  group('copyWith', () {
    test('copyWith returns copy', () {
      items = AlfredItems(itemsList);
      final AlfredItems copy = items.copyWith();

      expect(copy, equals(items));
    });

    test('copyWith copies all items', () {
      items = AlfredItems(itemsList);
      final AlfredItems copy = items.copyWith();

      expect(copy.items, equals(items.items));
    });

    test('copyWith copies skipKnowledge', () {
      items = AlfredItems(itemsList, skipKnowledge: true);
      final AlfredItems copy = items.copyWith();

      expect(copy.skipKnowledge, equals(items.skipKnowledge));
    });

    test('copyWith copies exactOrder', () {
      items = AlfredItems(itemsList, exactOrder: true);
      final AlfredItems copy = items.copyWith();

      expect(copy.exactOrder, equals(items.exactOrder));
    });

    test('change skipKnowledge', () {
      items = AlfredItems(itemsList, skipKnowledge: true);
      final AlfredItems copy = items.copyWith(skipKnowledge: false);

      expect(copy.skipKnowledge, isFalse);
    });

    test('change exactOrder', () {
      items = AlfredItems(itemsList, exactOrder: true);
      final AlfredItems copy = items.copyWith(exactOrder: false);

      expect(copy.exactOrder, isFalse);
    });

    test('change items', () {
      items = AlfredItems(itemsList);
      final AlfredItems copy = items.copyWith(items: []);

      expect(copy.items, isEmpty);
    });

    test('assign new items', () {
      items = AlfredItems(itemsList);
      final newItems = AlfredItemFixture.factory.makeMany(10);
      final AlfredItems copy = items.copyWith(items: newItems);

      expect(copy.items, equals(newItems));
    });

    test('changing copy.items does not change items.items', () {
      items = AlfredItems(itemsList);
      final AlfredItems copy = items.copyWith();
      final newItem = AlfredItemFixture.factory.makeSingle();
      copy.items.add(newItem);

      expect(items.items, isNot(contains(newItem)));
      expect(items.items, isNot(equals(copy.items)));
    });
  });
}
