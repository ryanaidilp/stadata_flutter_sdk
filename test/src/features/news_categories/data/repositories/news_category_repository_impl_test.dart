import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:stadata_flutter_sdk/src/core/failures/failures.dart';
import 'package:stadata_flutter_sdk/src/core/typedef/typedef.dart';
import 'package:stadata_flutter_sdk/src/features/news_categories/data/datasources/news_category_remote_data_source.dart';
import 'package:stadata_flutter_sdk/src/features/news_categories/data/models/news_category_model.dart';
import 'package:stadata_flutter_sdk/src/features/news_categories/data/repositories/news_category_repository_impl.dart';
import 'package:stadata_flutter_sdk/src/features/news_categories/domain/entities/news_category.dart';
import 'package:stadata_flutter_sdk/src/features/news_categories/domain/respositories/news_category_repository.dart';
import 'package:stadata_flutter_sdk/src/shared/data/models/api_response_model.dart';
import 'package:stadata_flutter_sdk/src/shared/data/models/pagination_model.dart';
import 'package:stadata_flutter_sdk/src/shared/domain/entities/api_response.dart';
import 'package:stadata_flutter_sdk/stadata_flutter_sdk.dart';

import '../../../../../fixtures/fixtures.dart';
import '../../../../../helpers/test_injection.dart';

class MockNewsCategoryRemoteDataSource extends Mock
    implements NewsCategoryRemoteDataSource {}

void main() {
  late NewsCategoryRemoteDataSource mockRemoteDataSource;
  late NewsCategoryRepository repository;

  setUpAll(
    () {
      mockRemoteDataSource = MockNewsCategoryRemoteDataSource();
      registerTestLazySingleton<NewsCategoryRemoteDataSource>(
        mockRemoteDataSource,
      );
      repository = NewsCategoryRepositoryImpl();
    },
  );

  tearDownAll(() => unregisterTestInjection);

  const domain = '7315';

  group(
    'NewsCategoryRepositoryImpl',
    () {
      group(
        'get()',
        () {
          late ApiResponseModel<List<NewsCategoryModel>?> response;
          late ApiResponse<List<NewsCategory>> data;

          setUp(
            () {
              final json = jsonFromFixture(Fixture.newsCategory.value);
              response = ApiResponseModel<List<NewsCategoryModel>?>.fromJson(
                json,
                (json) {
                  if (json == null || json is! List) {
                    return null;
                  }

                  return json
                      .map((e) => NewsCategoryModel.fromJson(e as JSON))
                      .toList();
                },
              );

              final responseData =
                  response.data?.map((e) => e.toEntity()).toList() ?? [];

              data = ApiResponse<List<NewsCategory>>(
                data: responseData,
                status: response.status,
                message: response.message,
                pagination: response.pagination?.toEntity(),
                dataAvailability: response.dataAvailability,
              );
            },
          );

          test(
            'should return list of news categories if success',
            () async {
              // arrange
              when(
                () => mockRemoteDataSource.get(domain: domain),
              ).thenAnswer((_) async => response);

              // act
              final result = await repository.get(domain: domain);

              // assert
              expect(
                result,
                equals(
                  Right<Failure, ApiResponse<List<NewsCategory>>>(data),
                ),
              );
              verify(
                () => mockRemoteDataSource.get(domain: domain),
              ).called(1);
            },
          );

          test(
            'should return Failure if failed.',
            () async {
              // arrange
              when(
                () => mockRemoteDataSource.get(domain: domain),
              ).thenThrow(const NewsCategoryNotAvailableException());

              // act
              final result = await repository.get(domain: domain);

              // assert
              expect(
                result,
                equals(
                  const Left<Failure, ApiResponse<List<DomainEntity>>>(
                    NewsCategoryFailure(
                      message:
                          'StadataException - News Category not available!',
                    ),
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
        },
      );
    },
  );
}
