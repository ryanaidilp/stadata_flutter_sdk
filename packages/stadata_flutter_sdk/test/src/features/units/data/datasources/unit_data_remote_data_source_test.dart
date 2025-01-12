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
  late UnitDataRemoteDataSource dataSource;
  late ApiResponseModel<List<UnitDataModel>?> units;
  late JSON response;
  late JSON unavailableResponse;

  setUpAll(
    () {
      mockListClient = MockNetworkClient();
      registerTestFactory<NetworkClient>(
        mockListClient,
        instanceName: 'listClient',
      );
      dataSource = UnitDataRemoteDataSourceImpl();

      response = jsonFromFixture(Fixture.units);
      unavailableResponse = jsonFromFixture(Fixture.listUnavailable);

      units = ApiResponseModel<List<UnitDataModel>?>.fromJson(
        response,
        (json) {
          if (json == null || json is! List) {
            return null;
          }

          return json.map((e) => UnitDataModel.fromJson(e as JSON)).toList();
        },
      );
    },
  );

  tearDownAll(unregisterTestInjection);

  const domain = '7200';

  group(
    'UnitDataRemoteDataSource',
    () {
      group(
        'get()',
        () {
          final queryParams = {
            QueryParamConstant.page: 1,
            QueryParamConstant.domain: domain,
            QueryParamConstant.lang: DataLanguage.id.value,
          };
          test(
            'should return List of units if success',
            () async {
              when(
                () => mockListClient.get<JSON>(
                  ApiEndpoint.unit,
                  queryParams: queryParams,
                ),
              ).thenAnswer(
                (_) async => response,
              );

              final result = await dataSource.get(domain: domain);

              expect(result, equals(units));
              verify(
                () => mockListClient.get<JSON>(
                  ApiEndpoint.unit,
                  queryParams: queryParams,
                ),
              ).called(1);
            },
          );

          test(
            'should throw UnitNotAvailableException when '
            'list-not-available',
            () async {
              when(
                () => mockListClient.get<JSON>(
                  ApiEndpoint.unit,
                  queryParams: queryParams,
                ),
              ).thenAnswer(
                (_) async => unavailableResponse,
              );

              final result = dataSource.get(domain: domain);

              await expectLater(
                result,
                throwsA(
                  const UnitNotAvailableException(),
                ),
              );
              verify(
                () => mockListClient.get<JSON>(
                  ApiEndpoint.unit,
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
