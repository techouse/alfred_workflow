import 'package:alfred_workflow/src/models/alfred_item_text.dart';
import 'package:data_fixture_dart/data_fixture_dart.dart';
import 'package:meta/meta.dart';

extension AlfredItemTextFixture on AlfredItemText {
  static AlfredItemTextFactory get factory => AlfredItemTextFactory();
}

@internal
final class AlfredItemTextFactory extends FixtureFactory<AlfredItemText> {
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
