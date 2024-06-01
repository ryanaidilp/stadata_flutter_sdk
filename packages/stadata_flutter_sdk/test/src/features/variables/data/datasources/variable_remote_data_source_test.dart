import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:stadata_flutter_sdk/src/core/network/api_endpoint.dart';
import 'package:stadata_flutter_sdk/src/core/network/http/modules/stadata_list_http_module.dart';
import 'package:stadata_flutter_sdk/src/core/typedef/typedef.dart';
import 'package:stadata_flutter_sdk/src/features/variables/data/datasources/variable_remote_data_source.dart';
import 'package:stadata_flutter_sdk/src/features/variables/data/models/variable_model.dart';
import 'package:stadata_flutter_sdk/src/shared/shared.dart';
import 'package:stadata_flutter_sdk/stadata_flutter_sdk.dart';

import '../../../../../fixtures/fixtures.dart';
import '../../../../../helpers/test_injection.dart';

class MockStadataListHttpModule extends Mock implements StadataListHttpModule {}

void main() {
  late StadataListHttpModule mockListHttpModule;
  late VariableRemoteDataSource dataSource;
  late ApiResponseModel<List<VariableModel>?> variables;
  late JSON response;
  late JSON unavailableResponse;

  setUpAll(
    () {
      mockListHttpModule = MockStadataListHttpModule();
      registerTestLazySingleton<StadataListHttpModule>(mockListHttpModule);
      dataSource = VariableRemoteDataSourceImpl();

      response = jsonFromFixture(Fixture.variables);
      unavailableResponse = jsonFromFixture(Fixture.listUnavailable);

      variables = ApiResponseModel<List<VariableModel>?>.fromJson(
        response,
        (json) {
          if (json == null || json is! List) {
            return null;
          }

          return json.map((e) => VariableModel.fromJson(e as JSON)).toList();
        },
      );
    },
  );

  tearDownAll(unregisterTestInjection);

  const domain = '7200';

  group(
    'VariableRemoteDataSource',
    () {
      group(
        'get()',
        () {
          test(
            'should return List of variables if success',
            () async {
              when(
                () => mockListHttpModule.get(
                  ApiEndpoint.variables(domain: domain),
                ),
              ).thenAnswer(
                (_) async => response,
              );

              final result = await dataSource.get(domain: domain);

              expect(result, equals(variables));
              verify(
                () => mockListHttpModule.get(
                  ApiEndpoint.variables(domain: domain),
                ),
              ).called(1);
            },
          );

          test(
            'should throw VariableNotAvailableException when '
            'list-not-available',
            () async {
              when(
                () => mockListHttpModule.get(
                  ApiEndpoint.variables(
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
                  const VariableNotAvailableException(),
                ),
              );
              verify(
                () => mockListHttpModule.get(
                  ApiEndpoint.variables(
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
