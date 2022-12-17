import 'package:alfred_workflow/alfred_workflow.dart';
import 'package:alfred_workflow/src/models/alfred_item.dart';
import 'package:alfred_workflow/src/models/alfred_item_mod.dart';
import 'package:data_fixture_dart/data_fixture_dart.dart';
import 'package:meta/meta.dart';

import 'alfred_item_icon_fixture.dart';
import 'alfred_item_mod_fixture.dart';
import 'alfred_item_text_fixture.dart';

extension AlfredItemFixture on AlfredItem {
  static AlfredItemFactory get factory => AlfredItemFactory();
}

@internal
class AlfredItemFactory extends FixtureFactory<AlfredItem> {
  @override
  FixtureDefinition<AlfredItem> definition() => define(
        (Faker faker) => AlfredItem(
          title: faker.lorem.sentence(),
          type: 'default',
          valid: faker.randomGenerator.boolean(),
          subtitle:
              faker.randomGenerator.boolean() ? faker.lorem.sentence() : null,
          arg: faker.randomGenerator.boolean() ? faker.lorem.sentence() : null,
          autocomplete:
              faker.randomGenerator.boolean() ? faker.lorem.sentence() : null,
          uid: faker.randomGenerator.boolean() ? faker.guid.guid() : null,
          icon: AlfredItemIconFixture.factory.makeSingle(),
          text: AlfredItemTextFixture.factory.makeSingle(),
          quickLookUrl: faker.randomGenerator.boolean()
              ? faker.internet.httpsUrl()
              : null,
          match:
              faker.randomGenerator.boolean() ? faker.lorem.sentence() : null,
          mods: faker.randomGenerator.boolean()
              ? {
                  {AlfredItemModKey.cmd}:
                      AlfredItemModFixture.factory.makeSingle(),
                  {AlfredItemModKey.ctrl, AlfredItemModKey.alt}:
                      AlfredItemModFixture.factory.makeSingle(),
                  {
                    AlfredItemModKey.cmd,
                    AlfredItemModKey.shift,
                    AlfredItemModKey.alt,
                  }: AlfredItemModFixture.factory.makeSingle(),
                }
              : null,
        ),
      );

  FixtureRedefinitionBuilder<AlfredItem> title(String value) =>
      (AlfredItem item) => item.copyWith(title: value);

  FixtureRedefinitionBuilder<AlfredItem> type(String value) =>
      (AlfredItem item) => item.copyWith(type: value);

  FixtureRedefinitionBuilder<AlfredItem> valid(bool value) =>
      (AlfredItem item) => item.copyWith(valid: value);

  FixtureRedefinitionBuilder<AlfredItem> subtitle(String? value) =>
      (AlfredItem item) => item.copyWith(subtitle: value);

  FixtureRedefinitionBuilder<AlfredItem> arg(String? value) =>
      (AlfredItem item) => item.copyWith(arg: value);

  FixtureRedefinitionBuilder<AlfredItem> autocomplete(String? value) =>
      (AlfredItem item) => item.copyWith(autocomplete: value);

  FixtureRedefinitionBuilder<AlfredItem> uid(String? value) =>
      (AlfredItem item) => item.copyWith(uid: value);

  FixtureRedefinitionBuilder<AlfredItem> icon(AlfredItemIcon? value) =>
      (AlfredItem item) => item.copyWith(icon: value);

  FixtureRedefinitionBuilder<AlfredItem> text(AlfredItemText? value) =>
      (AlfredItem item) => item.copyWith(text: value);

  FixtureRedefinitionBuilder<AlfredItem> quickLookUrl(String? value) =>
      (AlfredItem item) => item.copyWith(quickLookUrl: value);

  FixtureRedefinitionBuilder<AlfredItem> match(String? value) =>
      (AlfredItem item) => item.copyWith(match: value);

  FixtureRedefinitionBuilder<AlfredItem> mods(
    Map<Set<AlfredItemModKey>, AlfredItemMod>? value,
  ) =>
      (AlfredItem item) => item.copyWith(mods: value);
}
