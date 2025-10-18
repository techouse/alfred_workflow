import 'package:alfred_workflow/src/models/alfred_action.dart';
import 'package:data_fixture_dart/data_fixture_dart.dart';
import 'package:meta/meta.dart';

extension AlfredActionFixture on AlfredAction {
  static AlfredActionFactory get factory => AlfredActionFactory();
}

@internal
final class AlfredActionFactory extends FixtureFactory<AlfredAction> {
  @override
  FixtureDefinition<AlfredAction> definition() => define(
    (Faker faker, [int index = 0]) => AlfredAction(
      text: faker.lorem.words(3),
      url: Uri.parse(faker.internet.httpsUrl()),
      file: '/${faker.lorem.words(3).join('/')}.txt',
      auto: '/${faker.lorem.words(3).join('/')}.txt',
    ),
  );

  FixtureRedefinitionBuilder<AlfredAction> text(Object? value) =>
      (AlfredAction action, [int index = 0]) => action.copyWith(text: value);

  FixtureRedefinitionBuilder<AlfredAction> url(Uri? value) =>
      (AlfredAction action, [int index = 0]) => action.copyWith(url: value);

  FixtureRedefinitionBuilder<AlfredAction> file(String? value) =>
      (AlfredAction action, [int index = 0]) => action.copyWith(file: value);

  FixtureRedefinitionBuilder<AlfredAction> auto(String? value) =>
      (AlfredAction action, [int index = 0]) => action.copyWith(auto: value);
}
