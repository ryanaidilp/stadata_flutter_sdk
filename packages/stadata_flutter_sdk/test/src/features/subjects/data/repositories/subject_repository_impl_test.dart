import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:stadata_flutter_sdk/src/core/core.dart';
import 'package:stadata_flutter_sdk/src/features/features.dart';
import 'package:stadata_flutter_sdk/src/shared/shared.dart';

import '../../../../../fixtures/fixtures.dart';
import '../../../../../helpers/test_injection.dart';

class MockSubjectRemoteDataSource extends Mock
    implements SubjectRemoteDataSource {}

void main() {
  late SubjectRemoteDataSource mockRemoteDataSource;
  late SubjectRepository repository;
  late ApiResponseModel<List<SubjectModel>?> successResponse;
  late ApiResponse<List<Subject>> subjects;

  setUpAll(
    () {
      mockRemoteDataSource = MockSubjectRemoteDataSource();
      registerTestLazySingleton<SubjectRemoteDataSource>(
        mockRemoteDataSource,
      );
      repository = SubjectRepositoryImpl();
      final json = jsonFromFixture(Fixture.subjects);
      successResponse = ApiResponseModel<List<SubjectModel>?>.fromJson(
        json,
        (json) {
          if (json == null || json is! List) {
            return null;
          }

          return json.map((e) => SubjectModel.fromJson(e as JSON)).toList();
        },
      );

      final data = successResponse.data?.map((e) => e.toEntity()).toList();

      subjects = ApiResponse(
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
    'SubjectRepositoryImpl',
    () {
      group(
        'get()',
        () {
          test(
            'should return list of subjects if success',
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
                  Right<Failure, ApiResponse<List<Subject>>>(
                    subjects,
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
              ).thenThrow(const SubjectNotAvailableException());

              // act
              final result = await repository.get(domain: domain);

              // assert
              expect(
                result,
                equals(
                  const Left<Failure, ApiResponse<List<Subject>>>(
                    SubjectFailure(
                      message: 'StadataException - Subject not available!',
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
