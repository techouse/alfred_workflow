import 'package:data_fixture_dart/data_fixture_dart.dart';

extension FixtureFactoryExtension<Model> on FixtureFactory<Model> {
  FixtureDefinition<Model> states(
    Iterable<FixtureRedefinitionBuilder<Model>> definitions,
  ) => redefine(
    (Model model, [int index = 0]) => definitions.fold(
      model,
      (Model previousState, redefinitionBuilder) =>
          redefinitionBuilder(previousState),
    ),
  );
}
