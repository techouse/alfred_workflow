import 'package:alfred_workflow/src/models/alfred_item_text.dart';
import 'package:data_fixture_dart/data_fixture_dart.dart';

extension AlfredItemTextFixture on AlfredItemText {
  static _AlfredItemTextFactory get factory => _AlfredItemTextFactory();
}

class _AlfredItemTextFactory extends FixtureFactory<AlfredItemText> {
  @override
  FixtureDefinition<AlfredItemText> definition() => define(
        (Faker faker) => AlfredItemText(
          copy: faker.lorem.sentence(),
          largeType:
              faker.randomGenerator.boolean() ? faker.lorem.sentence() : null,
        ),
      );

  FixtureRedefinitionBuilder<AlfredItemText> copy(String value) =>
      (AlfredItemText alfredItemText) => alfredItemText.copyWith(copy: value);

  FixtureRedefinitionBuilder<AlfredItemText> largeType(String value) =>
      (AlfredItemText alfredItemText) =>
          alfredItemText.copyWith(largeType: value);
}
