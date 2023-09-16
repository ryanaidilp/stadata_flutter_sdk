import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:stadata_flutter_sdk/src/core/exceptions/exceptions.dart';
import 'package:stadata_flutter_sdk/src/core/failures/failures.dart';
import 'package:stadata_flutter_sdk/src/core/typedef/typedef.dart';
import 'package:stadata_flutter_sdk/src/features/news/data/datasources/news_remote_data_source.dart';
import 'package:stadata_flutter_sdk/src/features/news/data/models/news_model.dart';
import 'package:stadata_flutter_sdk/src/features/news/data/repositories/news_repository_impl.dart';
import 'package:stadata_flutter_sdk/src/features/news/domain/entities/news.dart';
import 'package:stadata_flutter_sdk/src/features/news/domain/repositories/news_repository.dart';
import 'package:stadata_flutter_sdk/src/shared/data/models/api_response_model.dart';
import 'package:stadata_flutter_sdk/src/shared/data/models/pagination_model.dart';
import 'package:stadata_flutter_sdk/src/shared/domain/entities/api_response.dart';

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
          final json = jsonFromFixture(Fixture.news.value);
          response = ApiResponseModel<List<NewsModel>?>.fromJson(
            json,
            (json) {
              if (json == null || json is! List) {
                return null;
              }

              return json.map((e) => NewsModel.fromJson(e as JSON)).toList();
            },
          );

          final responseData = response.data?.map((e) => e.toEntity()).toList();

          data = ApiResponse<List<News>>(
            data: responseData,
            status: response.status,
            message: response.message,
            pagination: response.pagination?.toEntity(),
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
              Right<Failure, ApiResponse<List<News>>>(
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
              const Left<Failure, ApiResponse<List<News>>>(
                NewsFailure(message: 'StadataException - News not available!'),
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
                Fixture.newsDetail.value,
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
                data: response.data?.toEntity(),
                pagination: response.pagination?.toEntity(),
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
                  Right<Failure, ApiResponse<News>>(data),
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
                  const Left<Failure, ApiResponse<News>>(
                    NewsFailure(
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
