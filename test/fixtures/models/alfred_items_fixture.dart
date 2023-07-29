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
        (Faker faker) => AlfredItems(
          AlfredItemFixture.factory.makeMany(20),
        ),
      );
}
