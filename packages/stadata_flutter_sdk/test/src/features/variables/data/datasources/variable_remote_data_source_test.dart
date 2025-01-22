import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:stadata_flutter_sdk/src/core/core.dart';
import 'package:stadata_flutter_sdk/src/features/features.dart';
import 'package:stadata_flutter_sdk/src/shared/shared.dart';

import '../../../../../fixtures/fixtures.dart';
import '../../../../../helpers/test_injection.dart';

class MockNetworkClient extends Mock implements NetworkClient {}

void main() {
  late NetworkClient mockListClient;
  late VariableRemoteDataSource dataSource;
  late ApiResponseModel<List<VariableModel>?> variables;
  late JSON response;
  late JSON unavailableResponse;

  setUpAll(
    () {
      mockListClient = MockNetworkClient();
      registerTestFactory<NetworkClient>(
        mockListClient,
        instanceName: 'listClient',
      );
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
          final queryParams = {
            QueryParamConstant.page: 1,
            QueryParamConstant.domain: domain,
            QueryParamConstant.lang: DataLanguage.id.value,
            QueryParamConstant.area: 0,
          };

          test(
            'should return List of variables if success',
            () async {
              when(
                () => mockListClient.get<JSON>(
                  ApiEndpoint.variable,
                  queryParams: queryParams,
                ),
              ).thenAnswer(
                (_) async => response,
              );

              final result = await dataSource.get(domain: domain);

              expect(result, equals(variables));
              verify(
                () => mockListClient.get<JSON>(
                  ApiEndpoint.variable,
                  queryParams: queryParams,
                ),
              ).called(1);
            },
          );

          test(
            'should throw VariableNotAvailableException when '
            'list-not-available',
            () async {
              when(
                () => mockListClient.get<JSON>(
                  ApiEndpoint.variable,
                  queryParams: queryParams,
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
                () => mockListClient.get<JSON>(
                  ApiEndpoint.variable,
                  queryParams: queryParams,
                ),
              ).called(1);
            },
          );
        },
      );
    },
  );
}
