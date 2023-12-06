import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:stadata_flutter_sdk/src/core/failures/failures.dart';
import 'package:stadata_flutter_sdk/src/core/typedef/typedef.dart';
import 'package:stadata_flutter_sdk/src/features/subject_categories/data/models/subject_category_model.dart';
import 'package:stadata_flutter_sdk/src/features/subject_categories/domain/repositories/subject_category_repository.dart';
import 'package:stadata_flutter_sdk/src/features/subject_categories/domain/usecases/get_all_subject_categories.dart';
import 'package:stadata_flutter_sdk/src/shared/data/models/api_response_model.dart';
import 'package:stadata_flutter_sdk/src/shared/data/models/pagination_model.dart';
import 'package:stadata_flutter_sdk/src/shared/domain/entities/api_response.dart';
import 'package:stadata_flutter_sdk/stadata_flutter_sdk.dart';

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

      final dataResponse =
          response.data?.map((e) => e.toEntity()).toList() ?? [];
      data = ApiResponse<List<SubjectCategory>>(
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
