import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:stadata_flutter_sdk/src/core/failures/failures.dart';
import 'package:stadata_flutter_sdk/src/core/typedef/typedef.dart';
import 'package:stadata_flutter_sdk/src/features/variables/data/models/variable_model.dart';
import 'package:stadata_flutter_sdk/src/features/variables/domain/entities/variable.dart';
import 'package:stadata_flutter_sdk/src/features/variables/domain/repositories/variable_repository.dart';
import 'package:stadata_flutter_sdk/src/features/variables/domain/usecases/get_all_variables.dart';
import 'package:stadata_flutter_sdk/src/shared/data/models/api_response_model.dart';
import 'package:stadata_flutter_sdk/src/shared/data/models/pagination_model.dart';
import 'package:stadata_flutter_sdk/src/shared/domain/entities/api_response.dart';

import '../../../../../fixtures/fixtures.dart';
import '../../../../../helpers/test_injection.dart';

class MockVariableRepository extends Mock implements VariableRepository {}

void main() {
  late VariableRepository mockRepository;
  late GetAllVariables usecase;
  late ApiResponse<List<Variable>> data;

  setUpAll(
    () {
      mockRepository = MockVariableRepository();
      registerTestLazySingleton<VariableRepository>(mockRepository);
      usecase = GetAllVariables();

      final json = jsonFromFixture(Fixture.variables);
      final response = ApiResponseModel<List<VariableModel>?>.fromJson(
        json,
        (json) {
          if (json == null || json is! List) {
            return null;
          }

          return json.map((e) => VariableModel.fromJson(e as JSON)).toList();
        },
      );

      final dataResponse =
          response.data?.map((e) => e.toEntity()).toList() ?? [];
      data = ApiResponse<List<Variable>>(
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
    'GetAllVariables',
    () {
      test(
        'should return list of variables if call success',
        () async {
          // arrange
          when(
            () => mockRepository.get(domain: domain),
          ).thenAnswer((_) async => Right(data));

          // act
          final result = await usecase(
            const GetAllVariablesParam(
              domain: domain,
            ),
          );

          // assert
          expect(
            result,
            equals(
              Right<Failure, ApiResponse<List<Variable>>>(data),
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
            const GetAllVariablesParam(
              domain: domain,
            ),
          );

          // assert
          expect(
            result,
            equals(
              const Left<Failure, ApiResponse<List<Variable>>>(
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
