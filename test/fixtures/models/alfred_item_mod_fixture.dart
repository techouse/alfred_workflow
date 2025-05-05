import 'package:alfred_workflow/src/models/alfred_item_icon.dart';
import 'package:alfred_workflow/src/models/alfred_item_mod.dart';
import 'package:data_fixture_dart/data_fixture_dart.dart';
import 'package:meta/meta.dart';

import 'alfred_item_icon_fixture.dart';

extension AlfredItemModFixture on AlfredItemMod {
  static AlfredItemModFactory get factory => AlfredItemModFactory();
}

@internal
final class AlfredItemModFactory extends FixtureFactory<AlfredItemMod> {
  @override
  FixtureDefinition<AlfredItemMod> definition() => define(
        (Faker faker, [int index = 0]) => AlfredItemMod(
          arg: faker.randomGenerator.boolean() ? faker.lorem.sentence() : null,
          subtitle:
              faker.randomGenerator.boolean() ? faker.lorem.sentence() : null,
          icon: faker.randomGenerator.boolean()
              ? AlfredItemIconFixture.factory.makeSingle()
              : null,
          valid: faker.randomGenerator.boolean(),
        ),
      );

  FixtureRedefinitionBuilder<AlfredItemMod> arg(String value) =>
      (AlfredItemMod item, [int index = 0]) => item.copyWith(arg: value);

  FixtureRedefinitionBuilder<AlfredItemMod> subtitle(String value) =>
      (AlfredItemMod item, [int index = 0]) => item.copyWith(subtitle: value);

  FixtureRedefinitionBuilder<AlfredItemMod> icon(AlfredItemIcon value) =>
      (AlfredItemMod item, [int index = 0]) => item.copyWith(icon: value);

  FixtureRedefinitionBuilder<AlfredItemMod> valid(bool value) =>
      (AlfredItemMod item, [int index = 0]) => item.copyWith(valid: value);
}
