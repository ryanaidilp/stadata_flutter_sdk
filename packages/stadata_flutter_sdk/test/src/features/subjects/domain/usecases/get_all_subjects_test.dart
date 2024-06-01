import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:stadata_flutter_sdk/src/core/failures/failures.dart';
import 'package:stadata_flutter_sdk/src/core/typedef/typedef.dart';
import 'package:stadata_flutter_sdk/src/features/subjects/data/models/subject_model.dart';
import 'package:stadata_flutter_sdk/src/features/subjects/domain/repositories/subject_repository.dart';
import 'package:stadata_flutter_sdk/src/features/subjects/domain/usecases/get_all_subjects.dart';
import 'package:stadata_flutter_sdk/src/shared/shared.dart';
import 'package:stadata_flutter_sdk/stadata_flutter_sdk.dart';

import '../../../../../fixtures/fixtures.dart';
import '../../../../../helpers/test_injection.dart';

class MockSubjectRepository extends Mock implements SubjectRepository {}

void main() {
  late SubjectRepository mockRepository;
  late GetAllSubjects usecase;
  late ApiResponse<List<Subject>> data;

  setUpAll(
    () {
      mockRepository = MockSubjectRepository();
      registerTestLazySingleton<SubjectRepository>(mockRepository);
      usecase = GetAllSubjects();

      final json = jsonFromFixture(Fixture.subjects);
      final response = ApiResponseModel<List<SubjectModel>?>.fromJson(
        json,
        (json) {
          if (json == null || json is! List) {
            return null;
          }

          return json.map((e) => SubjectModel.fromJson(e as JSON)).toList();
        },
      );

      final dataResponse =
          response.data?.map((e) => e.toEntity()).toList() ?? [];
      data = ApiResponse<List<Subject>>(
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
    'GetAllSubjects',
    () {
      test(
        'should return list of subjects if call success',
        () async {
          // arrange
          when(
            () => mockRepository.get(domain: domain),
          ).thenAnswer((_) async => Right(data));

          // act
          final result = await usecase(
            const GetAllSubjectsParam(
              domain: domain,
            ),
          );

          // assert
          expect(
            result,
            equals(
              Right<Failure, ApiResponse<List<Subject>>>(data),
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
              SubjectFailure(),
            ),
          );

          // act
          final result = await usecase(
            const GetAllSubjectsParam(
              domain: domain,
            ),
          );

          // assert
          expect(
            result,
            equals(
              const Left<Failure, ApiResponse<List<Subject>>>(
                SubjectFailure(),
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
