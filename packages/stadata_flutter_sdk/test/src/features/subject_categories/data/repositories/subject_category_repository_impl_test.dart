import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:stadata_flutter_sdk/src/core/core.dart';
import 'package:stadata_flutter_sdk/src/features/features.dart';
import 'package:stadata_flutter_sdk/src/shared/shared.dart';

import '../../../../../fixtures/fixtures.dart';
import '../../../../../helpers/test_injection.dart';

class MockSubjectCategoryRemoteDataSource extends Mock
    implements SubjectCategoryRemoteDataSource {}

void main() {
  late SubjectCategoryRemoteDataSource mockRemoteDataSource;
  late SubjectCategoryRepository repository;
  late ApiResponseModel<List<SubjectCategoryModel>?> successResponse;
  late ApiResponse<List<SubjectCategory>> subjectCategories;

  setUpAll(
    () {
      mockRemoteDataSource = MockSubjectCategoryRemoteDataSource();
      registerTestLazySingleton<SubjectCategoryRemoteDataSource>(
        mockRemoteDataSource,
      );
      repository = SubjectCategoryRepositoryImpl();
      final json = jsonFromFixture(Fixture.subjectCategories);
      successResponse = ApiResponseModel<List<SubjectCategoryModel>?>.fromJson(
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

      final data = successResponse.data?.map((e) => e.toEntity()).toList();

      subjectCategories = ApiResponse(
        status: successResponse.status,
        dataAvailability: successResponse.dataAvailability,
        data: data,
        message: successResponse.message,
        pagination: successResponse.pagination?.toEntity(),
      );
    },
  );

  tearDownAll(unregisterTestInjection);

  const domain = '7200';

  group(
    'SubjectCategoryRepositoryImpl',
    () {
      group(
        'get()',
        () {
          test(
            'should return list of subject categories if success',
            () async {
              // arrange
              when(
                () => mockRemoteDataSource.get(
                  domain: domain,
                ),
              ).thenAnswer((_) async => successResponse);

              // act
              final result = await repository.get(domain: domain);

              // assert
              expect(
                result,
                equals(
                  Right<Failure, ApiResponse<List<SubjectCategory>>>(
                    subjectCategories,
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
            'should return Failure if failed.',
            () async {
              // arrange
              when(
                () => mockRemoteDataSource.get(
                  domain: domain,
                ),
              ).thenThrow(const SubjectCategoryNotAvailableException());

              // act
              final result = await repository.get(domain: domain);

              // assert
              expect(
                result,
                equals(
                  const Left<Failure, ApiResponse<List<SubjectCategory>>>(
                    SubjectCategoryFailure(
                      message:
                          'StadataException - Subject Category not available!',
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
