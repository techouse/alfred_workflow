import 'dart:convert' show jsonEncode;

import 'package:alfred_workflow/alfred_workflow.dart';
import 'package:faker/faker.dart';
import 'package:test/test.dart';

import '../fixtures/alfred_workflow_fixture.dart';
import '../fixtures/models/alfred_item_fixture.dart';
import '../fixtures/models/alfred_items_fixture.dart';
import '../helpers/matchers.dart';
import '../helpers/mock_alfred_cache.dart';

void main() async {
  final Faker faker = Faker();
  late AlfredItem item;
  late List<AlfredItem> itemsList;
  late AlfredItems items;
  late AlfredWorkflow workflow;

  setUp(() {
    item = AlfredItemFixture.factory.makeSingle();
    itemsList = AlfredItemFixture.factory.makeMany(10);
  });

  group('AlfredWorkflow without cache', () {
    setUp(() {
      workflow = AlfredWorkflowFixture.factory.makeSingle();
      items = AlfredItemsFixture.factory.makeSingle();
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
        expect((await workflow.getItems()).items.length, 10);

        await workflow.addItem(item);
        expect((await workflow.getItems()).items.length, 11);
        expect((await workflow.getItems()).items.last, item);
      },
    );

    test(
      'addItem with toBeginning=true adds single item to beginning of items',
      () async {
        await workflow.addItems(AlfredItemFixture.factory.makeMany(10));
        expect((await workflow.getItems()).items.length, 10);

        await workflow.addItem(item, toBeginning: true);
        expect((await workflow.getItems()).items.length, 11);
        expect((await workflow.getItems()).items.first, item);
        expect((await workflow.getItems()).items.last == item, false);
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

  group('AlfredWorkflow with automatic cache', () {
    late AlfredAutomaticCache automaticCache;

    setUp(() {
      automaticCache = AlfredAutomaticCache(
        seconds: faker.randomGenerator.integer(
          AlfredAutomaticCache.maxSeconds,
          min: AlfredAutomaticCache.minSeconds,
        ),
        looseReload: faker.randomGenerator.boolean(),
      );

      items = AlfredItemsFixture.factory
          .redefine(AlfredItemsFixture.factory.withCache(automaticCache))
          .makeSingle();

      workflow = AlfredWorkflowFixture.factory
          .redefine(
            AlfredWorkflowFixture.factory.withAutomaticCache(automaticCache),
          )
          .makeSingle();
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
        expect((await workflow.getItems()).items.length, 10);

        await workflow.addItem(item);
        expect((await workflow.getItems()).items.length, 11);
        expect((await workflow.getItems()).items.last, item);
      },
    );

    test(
      'addItem with toBeginning=true adds single item to beginning of items',
      () async {
        await workflow.addItems(AlfredItemFixture.factory.makeMany(10));
        expect((await workflow.getItems()).items.length, 10);

        await workflow.addItem(item, toBeginning: true);
        expect((await workflow.getItems()).items.length, 11);
        expect((await workflow.getItems()).items.first, item);
        expect((await workflow.getItems()).items.last == item, false);
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

  group('AlfredWorkflow with file cache', () {
    setUp(() {
      items = AlfredItemsFixture.factory.makeSingle();

      workflow = AlfredWorkflowFixture.factory
          .redefine(
            AlfredWorkflowFixture.factory.withFileCache(),
          )
          .makeSingle()
        ..cacheKey = faker.guid.guid();
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
        expect((await workflow.getItems()).items.length, 10);

        await workflow.addItem(item);
        expect((await workflow.getItems()).items.length, 11);
        expect((await workflow.getItems()).items.last, item);
      },
    );

    test(
      'addItem with toBeginning=true adds single item to beginning of items',
      () async {
        await workflow.addItems(AlfredItemFixture.factory.makeMany(10));
        expect((await workflow.getItems()).items.length, 10);

        await workflow.addItem(item, toBeginning: true);
        expect((await workflow.getItems()).items.length, 11);
        expect((await workflow.getItems()).items.first, item);
        expect((await workflow.getItems()).items.last == item, false);
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

  group('AlfredWorkflow with skipKnowledge', () {
    setUp(() {
      final skipKnowledge = faker.randomGenerator.boolean();
      workflow = AlfredWorkflowFixture.factory.makeSingle()
        ..skipKnowledge = skipKnowledge;
      items = AlfredItemsFixture.factory
          .redefine(
            AlfredItemsFixture.factory.withSkipKnowledge(skipKnowledge),
          )
          .makeSingle();
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
        expect((await workflow.getItems()).items.length, 10);

        await workflow.addItem(item);
        expect((await workflow.getItems()).items.length, 11);
        expect((await workflow.getItems()).items.last, item);
      },
    );

    test(
      'addItem with toBeginning=true adds single item to beginning of items',
      () async {
        await workflow.addItems(AlfredItemFixture.factory.makeMany(10));
        expect((await workflow.getItems()).items.length, 10);

        await workflow.addItem(item, toBeginning: true);
        expect((await workflow.getItems()).items.length, 11);
        expect((await workflow.getItems()).items.first, item);
        expect((await workflow.getItems()).items.last == item, false);
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

  group('AlfredWorkflow stdout', () {
    late AlfredItem itemBefore;
    late AlfredItem itemAfter;

    setUp(() {
      items = AlfredItemsFixture.factory.makeSingle();
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
    setUp(() {
      items = AlfredItemsFixture.factory.makeSingle();

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

  group('AlfredAutomaticCache and AlfredCache are mutually exclusive', () {
    setUp(() {
      workflow = AlfredWorkflowFixture.factory.makeSingle();
    });

    test('AlfredAutomaticCache disables AlfredCache', () {
      final String cacheKey = faker.guid.guid();
      workflow.cacheKey = cacheKey;

      expect(workflow.cacheKey, isNotNull);
      expect(workflow.cacheKey, equals(cacheKey));

      workflow.useAutomaticCache = true;

      expect(workflow.cacheKey, isNull);
      expect(workflow.useAutomaticCache, isNotNull);
      expect(workflow.useAutomaticCache, isTrue);
    });

    test('AlfredCache disables AlfredAutomaticCache', () {
      workflow.useAutomaticCache = true;

      expect(workflow.useAutomaticCache, isNotNull);
      expect(workflow.useAutomaticCache, isTrue);

      final String cacheKey = faker.guid.guid();
      workflow.cacheKey = cacheKey;

      expect(workflow.useAutomaticCache, isFalse);
      expect(workflow.cacheKey, isNotNull);
      expect(workflow.cacheKey, equals(cacheKey));
    });
  });

  group('cache TTL', () {
    late int cacheTtl;

    setUp(() {
      cacheTtl = faker.randomGenerator.integer(
        AlfredAutomaticCache.maxSeconds,
        min: AlfredAutomaticCache.minSeconds,
      );
      workflow = AlfredWorkflowFixture.factory.makeSingle();
    });

    test('automaticCache is null by default', () {
      expect(workflow.automaticCache, isNull);
      expect(workflow.cacheTimeToLive, isNull);
    });

    test('automaticCache.seconds is set to 60 seconds by default', () {
      workflow.useAutomaticCache = true;
      expect(workflow.automaticCache, isNotNull);
      expect(workflow.cacheTimeToLive, isNull);
      expect(workflow.automaticCache?.seconds, equals(60));
    });

    test('fileCache expiry time is set to 60 seconds by default', () {
      expect(workflow.cacheTimeToLive, isNull);
      expect(
        workflow.fileCache.expiryPolicy.getExpiryForCreation().inSeconds,
        equals(60),
      );
    });

    test(
        'cacheTimeToLive can be set to a custom value and affect automaticCache',
        () {
      workflow.cacheTimeToLive = cacheTtl;
      expect(workflow.cacheTimeToLive, equals(cacheTtl));

      workflow.useAutomaticCache = true;
      expect(workflow.automaticCache, isNotNull);
      expect(workflow.automaticCache?.seconds, equals(cacheTtl));
      expect(
        workflow.automaticCache?.seconds,
        equals(workflow.cacheTimeToLive),
      );
    });

    test('cacheTimeToLive can be set to a custom value and affect fileCache',
        () {
      workflow.cacheTimeToLive = cacheTtl;
      expect(workflow.cacheTimeToLive, equals(cacheTtl));
      expect(workflow.automaticCache, isNull);
      expect(workflow.cacheTimeToLive, isNotNull);
      expect(workflow.cacheTimeToLive, equals(cacheTtl));
      expect(workflow.automaticCache?.seconds, isNull);
      expect(
        workflow.fileCache.expiryPolicy.getExpiryForCreation().inSeconds,
        equals(cacheTtl),
      );
    });
  });

  group('AlfredWorkflow.automaticCache', () {
    late AlfredAutomaticCache automaticCache;

    setUp(() {
      automaticCache = AlfredAutomaticCache(
        seconds: faker.randomGenerator.integer(
          AlfredAutomaticCache.maxSeconds,
          min: AlfredAutomaticCache.minSeconds,
        ),
        looseReload: faker.randomGenerator.boolean(),
      );
    });

    test('automaticCache is null if useAutomaticCache is false', () {
      workflow = AlfredWorkflowFixture.factory.makeSingle();
      expect(workflow.useAutomaticCache, isFalse);
      expect(workflow.automaticCache, isNull);
    });

    test('automaticCache is not null if useAutomaticCache is true ', () {
      workflow = AlfredWorkflowFixture.factory.makeSingle()
        ..useAutomaticCache = true;
      expect(workflow.useAutomaticCache, isTrue);
      expect(workflow.automaticCache, isNotNull);
    });

    test('automaticCache equals the set one provided in the constructor', () {
      workflow = AlfredWorkflowFixture.factory
          .redefine(
            AlfredWorkflowFixture.factory.withAutomaticCache(automaticCache),
          )
          .makeSingle();

      expect(workflow.automaticCache, isNotNull);
      expect(workflow.automaticCache, equals(automaticCache));
    });

    test('automaticCache can be set to a custom value', () {
      final AlfredAutomaticCache customAutomaticCache = AlfredAutomaticCache(
        seconds: faker.randomGenerator.integer(
          AlfredAutomaticCache.maxSeconds,
          min: AlfredAutomaticCache.minSeconds,
        ),
        looseReload: faker.randomGenerator.boolean(),
      );

      workflow = AlfredWorkflowFixture.factory
          .redefine(
            AlfredWorkflowFixture.factory
                .withAutomaticCache(customAutomaticCache),
          )
          .makeSingle();

      expect(workflow.automaticCache, isNotNull);
      expect(workflow.automaticCache, equals(customAutomaticCache));
    });
  });

  group('AlfredWorkflow.fileCache', () {
    test('fileCache is not null by default', () {
      workflow = AlfredWorkflowFixture.factory.makeSingle();
      expect(workflow.fileCache, isNotNull);
    });

    test('fileCache equals the set one provided in the constructor', () {
      final AlfredCache<AlfredItems> fileCache = MockAlfredCache<AlfredItems>(
        fromEncodable: (Map<String, dynamic> json) =>
            AlfredItems.fromJson(json),
      );

      workflow = AlfredWorkflowFixture.factory
          .redefine(AlfredWorkflowFixture.factory.withFileCache(fileCache))
          .makeSingle();

      expect(workflow.fileCache, isNotNull);
      expect(workflow.fileCache, equals(fileCache));
    });

    test('fileCache can be set to a custom value', () {
      final MockAlfredCache<AlfredItems> customFileCache =
          MockAlfredCache<AlfredItems>(
        fromEncodable: (Map<String, dynamic> json) =>
            AlfredItems.fromJson(json),
      );

      workflow = AlfredWorkflowFixture.factory
          .redefine(
            AlfredWorkflowFixture.factory.withFileCache(customFileCache),
          )
          .makeSingle();

      expect(workflow.fileCache, equals(customFileCache));
    });
  });

  group('AlfredWorkflow.maxCacheEntries', () {
    late int maxCacheEntries;

    setUp(() {
      maxCacheEntries = faker.randomGenerator.integer(100, min: 1);
      workflow = AlfredWorkflowFixture.factory.makeSingle();
    });

    test('maxCacheEntries is null by default', () {
      expect(workflow.maxCacheEntries, isNull);
    });

    test('maxCacheEntries can be set to a custom value', () {
      workflow.maxCacheEntries = maxCacheEntries;
      expect(workflow.maxCacheEntries, equals(maxCacheEntries));
    });

    test('maxCacheEntries disables automatic cache', () {
      workflow.useAutomaticCache = true;
      expect(workflow.useAutomaticCache, isTrue);

      workflow.maxCacheEntries = maxCacheEntries;
      expect(workflow.useAutomaticCache, isFalse);
    });
  });
}
