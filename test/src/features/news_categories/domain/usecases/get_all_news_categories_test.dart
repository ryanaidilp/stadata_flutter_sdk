import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:stadata_flutter_sdk/src/core/failures/failures.dart';
import 'package:stadata_flutter_sdk/src/core/typedef/typedef.dart';
import 'package:stadata_flutter_sdk/src/features/news_categories/data/models/news_category_model.dart';
import 'package:stadata_flutter_sdk/src/features/news_categories/domain/entities/news_category.dart';
import 'package:stadata_flutter_sdk/src/features/news_categories/domain/respositories/news_category_repository.dart';
import 'package:stadata_flutter_sdk/src/features/news_categories/domain/usecases/get_all_news_categories.dart';
import 'package:stadata_flutter_sdk/src/shared/data/models/api_response_model.dart';
import 'package:stadata_flutter_sdk/src/shared/data/models/pagination_model.dart';
import 'package:stadata_flutter_sdk/src/shared/domain/entities/api_response.dart';

import '../../../../../fixtures/fixtures.dart';
import '../../../../../helpers/test_injection.dart';

class MockNewsCategoryRepository extends Mock
    implements NewsCategoryRepository {}

void main() {
  late NewsCategoryRepository mockRepository;
  late GetAllNewsCategories usecase;
  late ApiResponse<List<NewsCategory>> data;
  setUpAll(
    () {
      mockRepository = MockNewsCategoryRepository();
      registerTestLazySingleton<NewsCategoryRepository>(mockRepository);
      usecase = GetAllNewsCategories();

      final json = jsonFromFixture(Fixture.newsCategory.value);
      final response = ApiResponseModel<List<NewsCategoryModel>?>.fromJson(
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

      final dataResponse =
          response.data?.map((e) => e.toEntity()).toList() ?? [];
      data = ApiResponse<List<NewsCategory>>(
        data: dataResponse,
        status: response.status,
        message: response.message,
        pagination: response.pagination?.toEntity(),
        dataAvailability: response.dataAvailability,
      );
    },
  );

  tearDownAll(unregisterTestInjection);

  const domain = '7315';

  group(
    'GetAllNewsCategory',
    () {
      test(
        'should return list of news categories if call success',
        () async {
          // arrange
          when(
            () => mockRepository.get(domain: domain),
          ).thenAnswer((_) async => Right(data));

          // act
          final result = await usecase(
            const GetAllNewsCategoriesParam(
              domain: domain,
            ),
          );

          // assert
          expect(
            result,
            equals(
              Right<Failure, ApiResponse<List<NewsCategory>>>(data),
            ),
          );
          verify(
            () => mockRepository.get(domain: domain),
          ).called(1);
        },
      );

      test(
        'should return failure if exception if failed ',
        () async {
          // arrange
          when(
            () => mockRepository.get(
              domain: domain,
            ),
          ).thenAnswer(
            (_) async => const Left(
              NewsCategoryFailure(),
            ),
          );

          // act
          final result = await usecase(
            const GetAllNewsCategoriesParam(
              domain: domain,
            ),
          );

          // assert
          expect(
            result,
            equals(
              const Left<Failure, ApiResponse<List<NewsCategory>>>(
                NewsCategoryFailure(),
              ),
            ),
          );
          verify(
            () => mockRepository.get(domain: domain),
          );
        },
      );
    },
  );
}
