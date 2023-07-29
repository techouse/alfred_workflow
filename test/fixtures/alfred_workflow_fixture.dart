import 'package:alfred_workflow/alfred_workflow.dart';
import 'package:data_fixture_dart/data_fixture_dart.dart';
import 'package:meta/meta.dart';

import '../helpers/mock_alfred_cache.dart';

extension AlfredWorkflowFixture on AlfredWorkflow {
  static AlfredWorkflowFactory get factory => AlfredWorkflowFactory();
}

@internal
final class AlfredWorkflowFactory extends FixtureFactory<AlfredWorkflow> {
  @override
  FixtureDefinition<AlfredWorkflow> definition() => define(
        (Faker faker) => AlfredWorkflow(
          cache: MockAlfredCache<AlfredItems>(
            fromEncodable: (Map<String, dynamic> json) =>
                AlfredItems.fromJson(json),
          ),
        ),
      );

  FixtureRedefinitionBuilder<AlfredWorkflow>
      withoutAlfredSmartResultOrdering() => (AlfredWorkflow workflow) =>
          workflow..disableAlfredSmartResultOrdering = true;
}
