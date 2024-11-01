import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:stadata_flutter_sdk/src/core/core.dart';
import 'package:stadata_flutter_sdk/src/features/features.dart';
import 'package:stadata_flutter_sdk/src/shared/shared.dart';

import '../../../../../fixtures/fixtures.dart';
import '../../../../../helpers/test_injection.dart';

class MockNewsRemoteDataSource extends Mock implements NewsRemoteDataSource {}

void main() {
  late NewsRemoteDataSource mockRemoteDataSource;
  late NewsRepository repository;

  setUpAll(
    () {
      mockRemoteDataSource = MockNewsRemoteDataSource();
      registerTestLazySingleton<NewsRemoteDataSource>(mockRemoteDataSource);
      repository = NewsRepositoryImpl();
    },
  );

  tearDownAll(unregisterTestInjection);

  const domain = '7315';

  group(
    'NewsRepositoryImpl',
    () {
      late ApiResponseModel<List<NewsModel>?> response;
      late ApiResponse<List<News>> data;

      setUp(
        () {
          final json = jsonFromFixture(Fixture.news);
          response = ApiResponseModel<List<NewsModel>?>.fromJson(
            json,
            (json) {
              if (json == null || json is! List) {
                return null;
              }

              return json.map((e) => NewsModel.fromJson(e as JSON)).toList();
            },
          );

          final responseData = response.data?.map((e) => e).toList();

          data = ApiResponse<List<News>>(
            data: responseData,
            status: response.status,
            message: response.message,
            pagination: response.pagination,
            dataAvailability: response.dataAvailability,
          );
        },
      );

      test(
        'should return List of News if success',
        () async {
          // arrange
          when(
            () => mockRemoteDataSource.get(
              domain: domain,
            ),
          ).thenAnswer((_) async => response);

          // act
          final result = await repository.get(domain: domain);

          // assert
          expect(
            result,
            equals(
              Result.success<Failure, ApiResponse<List<News>>>(
                data,
              ),
            ),
          );
          verify(
            () => mockRemoteDataSource.get(
              domain: domain,
            ),
          ).called(1);
        },
      );

      test(
        'should return Failure if exception occured',
        () async {
          // arrange
          when(
            () => mockRemoteDataSource.get(
              domain: domain,
            ),
          ).thenThrow(const NewsNotAvailableException());

          // act
          final result = await repository.get(domain: domain);

          // assert
          expect(
            result,
            equals(
              Result.failure<Failure, ApiResponse<List<News>>>(
                const NewsFailure(
                    message: 'StadataException - News not available!'),
              ),
            ),
          );
          verify(
            () => mockRemoteDataSource.get(
              domain: domain,
            ),
          ).called(1);
        },
      );

      group(
        'detail()',
        () {
          const id = 13;
          late ApiResponseModel<NewsModel?> response;
          late ApiResponse<News> data;
          setUp(
            () {
              final jsonDetail = jsonFromFixture(
                Fixture.newsDetail,
              );

              response = ApiResponseModel<NewsModel?>.fromJson(
                jsonDetail,
                (json) {
                  if (json == null) {
                    return null;
                  }

                  return NewsModel.fromJson(json as JSON);
                },
              );

              data = ApiResponse<News>(
                status: response.status,
                dataAvailability: response.dataAvailability,
                data: response.data,
                pagination: response.pagination,
                message: response.message,
              );
            },
          );
          test(
            'should return an instance of News if success',
            () async {
              // arrange
              when(
                () => mockRemoteDataSource.detail(
                  id: id,
                  domain: domain,
                ),
              ).thenAnswer((_) async => response);

              // act
              final result = await repository.detail(
                id: id,
                domain: domain,
              );

              // assert
              expect(
                result,
                equals(
                  Result.success<Failure, ApiResponse<News>>(data),
                ),
              );
              verify(
                () => mockRemoteDataSource.detail(
                  id: id,
                  domain: domain,
                ),
              ).called(1);
            },
          );

          test(
            'should return Failure if exception occured',
            () async {
              // arrange
              when(
                () => mockRemoteDataSource.detail(
                  id: id,
                  domain: domain,
                ),
              ).thenThrow(const NewsNotAvailableException());

              // act
              final result = await repository.detail(id: id, domain: domain);

              // assert
              expect(
                result,
                equals(
                  Result.failure<Failure, ApiResponse<News>>(
                    const NewsFailure(
                      message: 'StadataException - News not available!',
                    ),
                  ),
                ),
              );
              verify(
                () => mockRemoteDataSource.detail(
                  id: id,
                  domain: domain,
                ),
              ).called(1);
            },
          );
        },
      );
    },
  );
}
