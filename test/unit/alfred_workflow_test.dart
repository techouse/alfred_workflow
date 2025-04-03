import 'dart:convert' show jsonEncode;

import 'package:alfred_workflow/alfred_workflow.dart';
import 'package:faker/faker.dart';
import 'package:test/test.dart';

import '../fixtures/alfred_workflow_fixture.dart';
import '../fixtures/models/alfred_item_fixture.dart';
import '../fixtures/models/alfred_items_fixture.dart';
import '../helpers/matchers.dart';

void main() async {
  final Faker faker = Faker();
  late AlfredItem item;
  late List<AlfredItem> itemsList;
  late AlfredItems items;

  setUp(() {
    item = AlfredItemFixture.factory.makeSingle();
    itemsList = AlfredItemFixture.factory.makeMany(10);
    items = AlfredItemsFixture.factory.makeSingle();
  });

  group('AlfredWorkflow without cache', () {
    late AlfredWorkflow workflow;

    setUp(() {
      workflow = AlfredWorkflowFixture.factory.makeSingle();
    });

    test('getItems without adding anything is empty', () async {
      expect(await workflow.getItems(), const AlfredItems([]));
    });

    test('addItem adds single item', () async {
      await workflow.addItem(item);
      expect(await workflow.getItems(), AlfredItems([item]));
    });

    test('addItems adds multiple items', () async {
      await workflow.addItems(itemsList);
      expect(await workflow.getItems(), AlfredItems(itemsList));
    });

    test(
      'addItem with toBeginning=false adds single item to end of items',
      () async {
        await workflow.addItems(AlfredItemFixture.factory.makeMany(10));
        expect((await workflow.getItems())?.items.length, 10);

        await workflow.addItem(item);
        expect((await workflow.getItems())?.items.length, 11);
        expect((await workflow.getItems())?.items.last, item);
      },
    );

    test(
      'addItem with toBeginning=true adds single item to beginning of items',
      () async {
        await workflow.addItems(AlfredItemFixture.factory.makeMany(10));
        expect((await workflow.getItems())?.items.length, 10);

        await workflow.addItem(item, toBeginning: true);
        expect((await workflow.getItems())?.items.length, 11);
        expect((await workflow.getItems())?.items.first, item);
        expect((await workflow.getItems())?.items.last == item, false);
      },
    );

    test('clearItems removes items', () async {
      await workflow.addItems(itemsList);
      expect(await workflow.getItems(), AlfredItems(itemsList));

      await workflow.clearItems();
      expect(await workflow.getItems(), const AlfredItems([]));
    });

    test('toJsonString returns a JSON string', () async {
      await workflow.addItems(items.items);
      expect(await workflow.toJsonString(), jsonEncode(items.toJson()));
    });

    test('toJsonString addToBeginning adds item to beginning', () async {
      await workflow.addItems(items.items);
      final String json = await workflow.toJsonString(addToBeginning: item);
      expect(json != jsonEncode(items.toJson()), true);
      expect(json, containsSubstring(item.title));
    });

    test('toJsonString addToEnd adds item to end', () async {
      await workflow.addItems(items.items);
      final String json = await workflow.toJsonString(addToEnd: item);
      expect(json != jsonEncode(items.toJson()), true);
      expect(json, containsSubstring(item.title));
    });
  });

  group('AlfredWorkflow with cache', () {
    late AlfredWorkflow workflow;

    setUp(() {
      workflow = AlfredWorkflowFixture.factory.makeSingle()
        ..cacheKey = faker.guid.guid();
    });

    test('getItems without adding anything is null', () async {
      expect(await workflow.getItems(), null);
    });

    test('addItem adds single item', () async {
      await workflow.addItem(item);
      expect(await workflow.getItems(), AlfredItems([item]));
    });

    test('addItems adds multiple items', () async {
      await workflow.addItems(itemsList);
      expect(await workflow.getItems(), AlfredItems(itemsList));
    });

    test(
      'addItem with toBeginning=false adds single item to end of items',
      () async {
        await workflow.addItems(AlfredItemFixture.factory.makeMany(10));
        expect((await workflow.getItems())?.items.length, 10);

        await workflow.addItem(item);
        expect((await workflow.getItems())?.items.length, 11);
        expect((await workflow.getItems())?.items.last, item);
      },
    );

    test(
      'addItem with toBeginning=true adds single item to beginning of items',
      () async {
        await workflow.addItems(AlfredItemFixture.factory.makeMany(10));
        expect((await workflow.getItems())?.items.length, 10);

        await workflow.addItem(item, toBeginning: true);
        expect((await workflow.getItems())?.items.length, 11);
        expect((await workflow.getItems())?.items.first, item);
        expect((await workflow.getItems())?.items.last == item, false);
      },
    );

    test('clearItems removes items', () async {
      await workflow.addItems(itemsList);
      expect(await workflow.getItems(), AlfredItems(itemsList));

      await workflow.clearItems();
      expect(await workflow.getItems(), null);
    });

    test('toJsonString returns a JSON string', () async {
      await workflow.addItems(items.items);
      expect(await workflow.toJsonString(), jsonEncode(items.toJson()));
    });

    test('toJsonString addToBeginning adds item to beginning', () async {
      await workflow.addItems(items.items);
      final String json = await workflow.toJsonString(addToBeginning: item);
      expect(json != jsonEncode(items.toJson()), true);
      expect(json, containsSubstring(item.title));
    });

    test('toJsonString addToEnd adds item to end', () async {
      await workflow.addItems(items.items);
      final String json = await workflow.toJsonString(addToEnd: item);
      expect(json != jsonEncode(items.toJson()), true);
      expect(json, containsSubstring(item.title));
    });
  });

  group('AlfredWorkflow stdout', () {
    late AlfredWorkflow workflow;

    late AlfredItem itemBefore;
    late AlfredItem itemAfter;

    setUp(() {
      workflow = AlfredWorkflowFixture.factory.makeSingle();
      itemBefore = AlfredItemFixture.factory
          .redefine(AlfredItemFixture.factory.title('the one before'))
          .makeSingle();
      itemAfter = AlfredItemFixture.factory
          .redefine(AlfredItemFixture.factory.title('the one after'))
          .makeSingle();
    });

    test('single item gets printed to stdout', () async {
      await workflow.addItem(item);
      final String json = await workflow.toJsonString();
      expect(
        () async => await workflow.run(toStdout: false),
        prints('$json\n'),
      );
    });

    test(
      'run with addToBeginning adds single item to beginning of items',
      () async {
        await workflow.addItem(item);
        final String json = await workflow.toJsonString(
          addToBeginning: itemBefore,
        );
        expect(
          () async => await workflow.run(
            addToBeginning: itemBefore,
            toStdout: false,
          ),
          prints('$json\n'),
        );
      },
    );

    test('run with addToEnd adds single item to end of items', () async {
      await workflow.addItem(item);
      final String json = await workflow.toJsonString(
        addToEnd: itemAfter,
      );
      expect(
        () async => await workflow.run(
          addToEnd: itemAfter,
          toStdout: false,
        ),
        prints('$json\n'),
      );
    });
  });

  group('AlfredWorkflow with disableAlfredSmartResultOrdering', () {
    late AlfredWorkflow workflow;

    setUp(() {
      workflow = AlfredWorkflowFixture.factory
          .redefine(
            AlfredWorkflowFixture.factory.withoutAlfredSmartResultOrdering(),
          )
          .makeSingle();
    });

    test('toJsonString returns a JSON string', () async {
      await workflow.addItems(items.items);
      expect(await workflow.toJsonString(), isNot(containsSubstring('uid')));
    });
  });
}
