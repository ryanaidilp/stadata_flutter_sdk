import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:stadata_flutter_sdk/src/core/core.dart';
import 'package:stadata_flutter_sdk/src/features/features.dart';
import 'package:stadata_flutter_sdk/src/shared/shared.dart';

import '../../../../../fixtures/fixtures.dart';
import '../../../../../helpers/test_injection.dart';

class MockSubjectCategoryRepository extends Mock
    implements SubjectCategoryRepository {}

void main() {
  late SubjectCategoryRepository mockRepository;
  late GetAllSubjectCategories usecase;
  late ApiResponse<List<SubjectCategory>> data;

  setUpAll(
    () {
      mockRepository = MockSubjectCategoryRepository();
      registerTestLazySingleton<SubjectCategoryRepository>(mockRepository);
      usecase = GetAllSubjectCategories();

      final json = jsonFromFixture(Fixture.subjectCategories);
      final response = ApiResponseModel<List<SubjectCategoryModel>?>.fromJson(
        json,
        (json) {
          if (json == null || json is! List) {
            return null;
          }

          return json
              .map((e) => SubjectCategoryModel.fromJson(e as JSON))
              .toList();
        },
      );

      final dataResponse = response.data?.map((e) => e).toList() ?? [];
      data = ApiResponse<List<SubjectCategory>>(
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
    'GetAllSubjectCategories',
    () {
      test(
        'should return list of subject categories if call success',
        () async {
          // arrange
          when(
            () => mockRepository.get(domain: domain),
          ).thenAnswer((_) async => Right(data));

          // act
          final result = await usecase(
            const GetAllSubjectCategoriesParam(
              domain: domain,
            ),
          );

          // assert
          expect(
            result,
            equals(
              Right<Failure, ApiResponse<List<SubjectCategory>>>(data),
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
              SubjectCategoryFailure(),
            ),
          );

          // act
          final result = await usecase(
            const GetAllSubjectCategoriesParam(
              domain: domain,
            ),
          );

          // assert
          expect(
            result,
            equals(
              const Left<Failure, ApiResponse<List<SubjectCategory>>>(
                SubjectCategoryFailure(),
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
