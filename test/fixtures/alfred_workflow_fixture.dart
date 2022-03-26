import 'package:alfred_workflow/alfred_workflow.dart';
import 'package:data_fixture_dart/data_fixture_dart.dart';

import 'services/alfred_cache_fixture.dart';

extension AlfredWorkflowFixture on AlfredWorkflow {
  static _AlfredWorkflowFactory get factory => _AlfredWorkflowFactory();
}

class _AlfredWorkflowFactory extends FixtureFactory<AlfredWorkflow> {
  @override
  FixtureDefinition<AlfredWorkflow> definition() => define(
        (Faker faker) => AlfredWorkflow(
          cache: AlfredCacheFixture.factory.makeSingle(),
        ),
      );
}
