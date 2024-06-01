import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:stadata_flutter_sdk/src/core/network/api_endpoint.dart';
import 'package:stadata_flutter_sdk/src/core/network/http/modules/stadata_list_http_module.dart';
import 'package:stadata_flutter_sdk/src/core/typedef/typedef.dart';
import 'package:stadata_flutter_sdk/src/features/vertical_variables/data/datasources/vertical_variable_remote_data_source.dart';
import 'package:stadata_flutter_sdk/src/features/vertical_variables/data/models/vertical_variable_model.dart';
import 'package:stadata_flutter_sdk/src/shared/shared.dart';
import 'package:stadata_flutter_sdk/stadata_flutter_sdk.dart';

import '../../../../../fixtures/fixtures.dart';
import '../../../../../helpers/test_injection.dart';

class MockStadataListHttpModule extends Mock implements StadataListHttpModule {}

void main() {
  late StadataListHttpModule mockListHttpModule;
  late VerticalVariableRemoteDataSource dataSource;
  late ApiResponseModel<List<VerticalVariableModel>?> verticalVariables;
  late JSON response;
  late JSON unavailableResponse;

  setUpAll(
    () {
      mockListHttpModule = MockStadataListHttpModule();
      registerTestLazySingleton<StadataListHttpModule>(mockListHttpModule);
      dataSource = VerticalVariableRemoteDataSourceImpl();

      response = jsonFromFixture(Fixture.verticalVariables);
      unavailableResponse = jsonFromFixture(Fixture.listUnavailable);

      verticalVariables =
          ApiResponseModel<List<VerticalVariableModel>?>.fromJson(
        response,
        (json) {
          if (json == null || json is! List) {
            return null;
          }

          return json
              .map((e) => VerticalVariableModel.fromJson(e as JSON))
              .toList();
        },
      );
    },
  );

  tearDownAll(unregisterTestInjection);

  const domain = '7200';

  group(
    'VerticalVariableRemoteDataSource',
    () {
      group(
        'get()',
        () {
          test(
            'should return List of vertical variables if success',
            () async {
              when(
                () => mockListHttpModule.get(
                  ApiEndpoint.verticalVariables(domain: domain),
                ),
              ).thenAnswer(
                (_) async => response,
              );

              final result = await dataSource.get(domain: domain);

              expect(result, equals(verticalVariables));
              verify(
                () => mockListHttpModule.get(
                  ApiEndpoint.verticalVariables(domain: domain),
                ),
              ).called(1);
            },
          );

          test(
            'should throw VerticalVariableNotAvailableException when '
            'list-not-available',
            () async {
              when(
                () => mockListHttpModule.get(
                  ApiEndpoint.verticalVariables(
                    domain: domain,
                  ),
                ),
              ).thenAnswer(
                (_) async => unavailableResponse,
              );

              final result = dataSource.get(domain: domain);

              await expectLater(
                result,
                throwsA(
                  const VerticalVariableNotAvailableException(),
                ),
              );
              verify(
                () => mockListHttpModule.get(
                  ApiEndpoint.verticalVariables(
                    domain: domain,
                  ),
                ),
              ).called(1);
            },
          );
        },
      );
    },
  );
}
