import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:stadata_flutter_sdk/src/core/core.dart';
import 'package:stadata_flutter_sdk/src/features/features.dart';
import 'package:stadata_flutter_sdk/src/shared/shared.dart';

import '../../../../../fixtures/fixtures.dart';
import '../../../../../helpers/test_injection.dart';

class MockListNetworkClient extends Mock implements NetworkClient {}

class MockViewNetworkClient extends Mock implements NetworkClient {}

void main() {
  late NetworkClient mockListClient;
  late NetworkClient mockViewClient;
  late NewsRemoteDataSource dataSource;

  setUpAll(
    () {
      mockListClient = MockListNetworkClient();
      registerTestFactory<NetworkClient>(
        mockListClient,
        instanceName: 'listClient',
      );
      mockViewClient = MockViewNetworkClient();
      registerTestFactory<NetworkClient>(
        mockViewClient,
        instanceName: InjectorConstant.viewClient,
      );
      dataSource = NewsRemoteDataSourceImpl();
    },
  );

  tearDownAll(unregisterTestInjection);

  const domain = '7315';

  group(
    'NewsRemoteDataSource',
    () {
      group(
        'get()',
        () {
          final queryParams = {
            QueryParamConstant.page: 1,
            QueryParamConstant.domain: domain,
            QueryParamConstant.lang: DataLanguage.id.value,
          };

          late ApiResponseModel<List<NewsModel>?> data;
          late JSON response;
          late JSON unavailableResponse;

          setUp(
            () {
              response = jsonFromFixture(Fixture.news);
              unavailableResponse = jsonFromFixture(
                Fixture.listUnavailable,
              );

              data = ApiResponseModel<List<NewsModel>?>.fromJson(
                response,
                (json) {
                  if (json is! List) {
                    return [];
                  }

                  return json
                      .map((e) => NewsModel.fromJson(e as JSON))
                      .toList();
                },
              );
            },
          );

          test(
            'should return list of news if success',
            () async {
              // arrange
              when(
                () => mockListClient.get<JSON>(
                  ApiEndpoint.news,
                  queryParams: queryParams,
                ),
              ).thenAnswer((_) async => response);

              // act
              final result = await dataSource.get(domain: domain);

              // assert
              expect(result, equals(data));
              verify(
                () => mockListClient.get<JSON>(
                  ApiEndpoint.news,
                  queryParams: queryParams,
                ),
              ).called(1);
            },
          );

          test(
            'should throw NewsNotAvailableException when list-not-available',
            () async {
              when(
                () => mockListClient.get<JSON>(
                  ApiEndpoint.news,
                  queryParams: queryParams,
                ),
              ).thenAnswer(
                (_) async => unavailableResponse,
              );

              final result = dataSource.get(domain: domain);

              await expectLater(
                result,
                throwsA(
                  const NewsNotAvailableException(),
                ),
              );
              verify(
                () => mockListClient.get<JSON>(
                  ApiEndpoint.news,
                  queryParams: queryParams,
                ),
              ).called(1);
            },
          );
        },
      );

      group(
        'detail()',
        () {
          const id = 1;

          final queryParams = {
            QueryParamConstant.id: id,
            QueryParamConstant.domain: domain,
            QueryParamConstant.lang: DataLanguage.id.value,
          };

          late JSON response;
          late JSON unavailableResponse;
          late ApiResponseModel<NewsModel?> data;

          setUp(
            () {
              response = jsonFromFixture(Fixture.newsDetail);
              unavailableResponse = jsonFromFixture(Fixture.unavailable);
              data = ApiResponseModel<NewsModel?>.fromJson(
                response,
                (json) {
                  if (json == null) {
                    return null;
                  }

                  return NewsModel.fromJson(json as JSON);
                },
              );
            },
          );

          test(
            'should return an instance of news if success',
            () async {
              // arrange
              when(
                () => mockViewClient.get<JSON>(
                  ApiEndpoint.news,
                  queryParams: queryParams,
                ),
              ).thenAnswer((_) async => response);

              // act
              final result = await dataSource.detail(
                id: id,
                domain: domain,
              );

              // assert
              expect(result, equals(data));
              verify(
                () => mockViewClient.get<JSON>(
                  ApiEndpoint.news,
                  queryParams: queryParams,
                ),
              ).called(1);
            },
          );

          test(
            'should thrown a NewsNotAvailableException when failed',
            () async {
              // arrange
              when(
                () => mockViewClient.get<JSON>(
                  ApiEndpoint.news,
                  queryParams: queryParams,
                ),
              ).thenAnswer((_) async => unavailableResponse);

              // act
              final result = dataSource.detail(
                id: id,
                domain: domain,
              );

              // assert
              await expectLater(
                result,
                throwsA(
                  const NewsNotAvailableException(),
                ),
              );
              verify(
                () => mockViewClient.get<JSON>(
                  ApiEndpoint.news,
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
