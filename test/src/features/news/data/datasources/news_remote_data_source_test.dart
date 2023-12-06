import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:stadata_flutter_sdk/src/core/exceptions/exceptions.dart';
import 'package:stadata_flutter_sdk/src/core/network/api_endpoint.dart';
import 'package:stadata_flutter_sdk/src/core/network/http/modules/stadata_list_http_module.dart';
import 'package:stadata_flutter_sdk/src/core/network/http/modules/stadata_view_http_module.dart';
import 'package:stadata_flutter_sdk/src/core/typedef/typedef.dart';
import 'package:stadata_flutter_sdk/src/features/news/data/datasources/news_remote_data_source.dart';
import 'package:stadata_flutter_sdk/src/features/news/data/models/news_model.dart';
import 'package:stadata_flutter_sdk/src/shared/data/models/api_response_model.dart';

import '../../../../../fixtures/fixtures.dart';
import '../../../../../helpers/test_injection.dart';

class MockStadataListHttpModule extends Mock implements StadataListHttpModule {}

class MockStadataViewHttpModule extends Mock implements StadataViewHttpModule {}

void main() {
  late StadataListHttpModule mockListHttpModule;
  late StadataViewHttpModule mockViewHttpModule;
  late NewsRemoteDataSource dataSource;

  setUpAll(
    () {
      mockListHttpModule = MockStadataListHttpModule();
      registerTestLazySingleton<StadataListHttpModule>(mockListHttpModule);
      mockViewHttpModule = MockStadataViewHttpModule();
      registerTestLazySingleton<StadataViewHttpModule>(mockViewHttpModule);
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
                () => mockListHttpModule.get(ApiEndpoint.news(domain: domain)),
              ).thenAnswer((_) async => response);

              // act
              final result = await dataSource.get(domain: domain);

              // assert
              expect(result, equals(data));
              verify(
                () => mockListHttpModule.get(ApiEndpoint.news(domain: domain)),
              ).called(1);
            },
          );

          test(
            'should throw NewsNotAvailableException when list-not-available',
            () async {
              when(
                () => mockListHttpModule.get(
                  ApiEndpoint.news(
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
                  const NewsNotAvailableException(),
                ),
              );
              verify(
                () => mockListHttpModule.get(
                  ApiEndpoint.news(
                    domain: domain,
                  ),
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
                () => mockViewHttpModule.get(
                  ApiEndpoint.newsDetail(
                    id: id,
                    domain: domain,
                  ),
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
                () => mockViewHttpModule.get(
                  ApiEndpoint.newsDetail(
                    id: id,
                    domain: domain,
                  ),
                ),
              ).called(1);
            },
          );

          test(
            'should thrown a NewsNotAvailableException when failed',
            () async {
              // arrange
              when(
                () => mockViewHttpModule.get(
                  ApiEndpoint.newsDetail(
                    id: id,
                    domain: domain,
                  ),
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
                () => mockViewHttpModule.get(
                  ApiEndpoint.newsDetail(
                    id: id,
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
