import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:stadata_flutter_sdk/src/core/core.dart';
import 'package:stadata_flutter_sdk/src/features/features.dart';
import 'package:stadata_flutter_sdk/src/shared/shared.dart';

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

      final json = jsonFromFixture(Fixture.newsCategory);
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

      final dataResponse = response.data?.map((e) => e).toList() ?? [];
      data = ApiResponse<List<NewsCategory>>(
        data: dataResponse,
        status: response.status,
        message: response.message,
        pagination: response.pagination,
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
