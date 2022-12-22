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
}
