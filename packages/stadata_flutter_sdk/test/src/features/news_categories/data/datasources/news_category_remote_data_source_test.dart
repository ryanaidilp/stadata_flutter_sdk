import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:stadata_flutter_sdk/src/core/core.dart';
import 'package:stadata_flutter_sdk/src/features/features.dart';
import 'package:stadata_flutter_sdk/src/shared/shared.dart';

import '../../../../../fixtures/fixtures.dart';
import '../../../../../helpers/test_injection.dart';

class MockListNetworkClient extends Mock implements NetworkClient {}

void main() {
  late NetworkClient mockListClient;
  late NewsCategoryRemoteDataSource dataSource;
  late ApiResponseModel<List<NewsCategoryModel>?> data;
  late JSON response;
  late JSON unavailableResponse;

  setUpAll(
    () {
      mockListClient = MockListNetworkClient();
      registerTestFactory<NetworkClient>(
        mockListClient,
        instanceName: 'listClient',
      );
      dataSource = NewsCategoryRemoteDataSourceImpl();

      response = jsonFromFixture(Fixture.newsCategory);
      unavailableResponse = jsonFromFixture(Fixture.listUnavailable);

      data = ApiResponseModel<List<NewsCategoryModel>?>.fromJson(
        response,
        (json) {
          if (json == null || json is! List) {
            return null;
          }
          return json
              .map((e) => NewsCategoryModel.fromJson(e as JSON))
              .toList();
        },
      );
    },
  );

  tearDownAll(unregisterTestInjection);

  const domain = '7315';

  group(
    'NewsCategoryRemoteDataSource',
    () {
      group(
        'get()',
        () {
          final queryParams = {
            QueryParamConstant.domain: domain,
            QueryParamConstant.lang: DataLanguage.id.value,
          };
          test(
            'should return List of news categories if success',
            () async {
              when(
                () => mockListClient.get<JSON>(
                  ApiEndpoint.newsCategory,
                  queryParams: queryParams,
                ),
              ).thenAnswer(
                (_) async => response,
              );

              final result = await dataSource.get(
                domain: domain,
              );

              expect(result, equals(data));
              verify(
                () => mockListClient.get<JSON>(
                  ApiEndpoint.newsCategory,
                  queryParams: queryParams,
                ),
              ).called(1);
            },
          );

          test(
            'should throw NewsCategoryNotAvailableException '
            'when list-not-available',
            () async {
              when(
                () => mockListClient.get<JSON>(
                  ApiEndpoint.newsCategory,
                  queryParams: queryParams,
                ),
              ).thenAnswer(
                (_) async => unavailableResponse,
              );

              final result = dataSource.get(
                domain: domain,
              );

              await expectLater(
                result,
                throwsA(
                  const NewsCategoryNotAvailableException(),
                ),
              );
              verify(
                () => mockListClient.get<JSON>(
                  ApiEndpoint.newsCategory,
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
