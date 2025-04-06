import 'package:alfred_workflow/alfred_workflow.dart';
import 'package:data_fixture_dart/data_fixture_dart.dart';
import 'package:meta/meta.dart';

import '../helpers/mock_alfred_cache.dart';
import 'models/alfred_automatic_cache_fixture.dart';

extension AlfredWorkflowFixture on AlfredWorkflow {
  static AlfredWorkflowFactory get factory => AlfredWorkflowFactory();
}

@internal
final class AlfredWorkflowFactory extends FixtureFactory<AlfredWorkflow> {
  @override
  FixtureDefinition<AlfredWorkflow> definition() =>
      define((Faker faker) => AlfredWorkflow());

  FixtureRedefinitionBuilder<AlfredWorkflow> withAutomaticCache(
    AlfredAutomaticCache? automaticCache,
  ) =>
      (_) => AlfredWorkflow(
            automaticCache: automaticCache ??
                AlfredAutomaticCacheFixture.factory.makeSingle(),
          );

  FixtureRedefinitionBuilder<AlfredWorkflow> withFileCache(
    AlfredCache<AlfredItems>? fileCache,
  ) =>
      (_) => AlfredWorkflow(
            fileCache: fileCache ??
                MockAlfredCache<AlfredItems>(
                  fromEncodable: (Map<String, dynamic> json) =>
                      AlfredItems.fromJson(json),
                ),
          );

  FixtureRedefinitionBuilder<AlfredWorkflow>
      withoutAlfredSmartResultOrdering() => (AlfredWorkflow workflow) =>
          workflow..disableAlfredSmartResultOrdering = true;
}
