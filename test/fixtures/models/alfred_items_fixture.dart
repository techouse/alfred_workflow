import 'package:alfred_workflow/src/models/alfred_automatic_cache.dart';
import 'package:alfred_workflow/src/models/alfred_item.dart';
import 'package:alfred_workflow/src/models/alfred_items.dart';
import 'package:data_fixture_dart/data_fixture_dart.dart';
import 'package:meta/meta.dart';

import 'alfred_item_fixture.dart';

extension AlfredItemsFixture on AlfredItems {
  static AlfredItemsFactory get factory => AlfredItemsFactory();
}

@internal
final class AlfredItemsFactory extends FixtureFactory<AlfredItems> {
  @override
  FixtureDefinition<AlfredItems> definition() => define(
        (Faker faker, [int index = 0]) =>
            AlfredItems(AlfredItemFixture.factory.makeMany(20)),
      );

  FixtureRedefinitionBuilder<AlfredItems> items(List<AlfredItem> value) =>
      (AlfredItems items, [int index = 0]) => items.copyWith(items: value);

  FixtureRedefinitionBuilder<AlfredItems> withExactOrder(bool? value) =>
      (AlfredItems items, [int index = 0]) => items.copyWith(exactOrder: value);

  FixtureRedefinitionBuilder<AlfredItems> withSkipKnowledge(bool? value) =>
      (AlfredItems items, [int index = 0]) =>
          items.copyWith(skipKnowledge: value);

  FixtureRedefinitionBuilder<AlfredItems> withCache(
          AlfredAutomaticCache? value) =>
      (AlfredItems items, [int index = 0]) => items.copyWith(cache: value);
}
