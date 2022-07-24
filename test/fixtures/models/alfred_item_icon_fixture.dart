import 'package:alfred_workflow/src/models/alfred_item_icon.dart';
import 'package:data_fixture_dart/data_fixture_dart.dart';
import 'package:meta/meta.dart';

extension AlfredItemIconFixture on AlfredItemIcon {
  static AlfredItemIconFactory get factory => AlfredItemIconFactory();
}

@internal
class AlfredItemIconFactory extends FixtureFactory<AlfredItemIcon> {
  @override
  FixtureDefinition<AlfredItemIcon> definition() => define(
        (Faker faker) => AlfredItemIcon(
          path: <String>[
            '/${faker.randomGenerator.string(16)}',
            faker.randomGenerator.string(16),
            '${faker.randomGenerator.string(16)}.png',
          ].join('/'),
          type: faker.randomGenerator.boolean()
              ? faker.randomGenerator.element(AlfredItemIconType.values)
              : null,
        ),
      );

  FixtureRedefinitionBuilder<AlfredItemIcon> path(String value) =>
      (AlfredItemIcon alfredItemIcon) => alfredItemIcon.copyWith(path: value);

  FixtureRedefinitionBuilder<AlfredItemIcon> type(AlfredItemIconType? value) =>
      (AlfredItemIcon alfredItemIcon) => alfredItemIcon.copyWith(type: value);
}
