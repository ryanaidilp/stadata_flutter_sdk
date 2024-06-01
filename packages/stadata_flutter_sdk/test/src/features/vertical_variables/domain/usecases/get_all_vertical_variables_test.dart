import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:stadata_flutter_sdk/src/core/failures/failures.dart';
import 'package:stadata_flutter_sdk/src/core/typedef/typedef.dart';
import 'package:stadata_flutter_sdk/src/features/vertical_variables/data/models/vertical_variable_model.dart';
import 'package:stadata_flutter_sdk/src/features/vertical_variables/domain/repositories/vertical_variable_repository.dart';
import 'package:stadata_flutter_sdk/src/features/vertical_variables/domain/usecases/get_all_vertical_variables.dart';
import 'package:stadata_flutter_sdk/src/shared/shared.dart';
import 'package:stadata_flutter_sdk/stadata_flutter_sdk.dart';

import '../../../../../fixtures/fixtures.dart';
import '../../../../../helpers/test_injection.dart';

class MockVerticalVariableRepository extends Mock
    implements VerticalVariableRepository {}

void main() {
  late VerticalVariableRepository mockRepository;
  late GetAllVerticalVariables usecase;
  late ApiResponse<List<VerticalVariable>> data;

  setUpAll(
    () {
      mockRepository = MockVerticalVariableRepository();
      registerTestLazySingleton<VerticalVariableRepository>(mockRepository);
      usecase = GetAllVerticalVariables();

      final json = jsonFromFixture(Fixture.verticalVariables);
      final response = ApiResponseModel<List<VerticalVariableModel>?>.fromJson(
        json,
        (json) {
          if (json == null || json is! List) {
            return null;
          }

          return json
              .map((e) => VerticalVariableModel.fromJson(e as JSON))
              .toList();
        },
      );

      final dataResponse =
          response.data?.map((e) => e.toEntity()).toList() ?? [];
      data = ApiResponse<List<VerticalVariable>>(
        data: dataResponse,
        status: response.status,
        message: response.message,
        pagination: response.pagination?.toEntity(),
        dataAvailability: response.dataAvailability,
      );
    },
  );

  tearDownAll(unregisterTestInjection);

  const domain = '7200';

  group(
    'GetAllVerticalVariables',
    () {
      test(
        'should return list of vertical variables if call success',
        () async {
          // arrange
          when(
            () => mockRepository.get(domain: domain),
          ).thenAnswer((_) async => Right(data));

          // act
          final result = await usecase(
            const GetAllVerticalVariablesParam(
              domain: domain,
            ),
          );

          // assert
          expect(
            result,
            equals(
              Right<Failure, ApiResponse<List<VerticalVariable>>>(data),
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
              VerticalVariableFailure(),
            ),
          );

          // act
          final result = await usecase(
            const GetAllVerticalVariablesParam(
              domain: domain,
            ),
          );

          // assert
          expect(
            result,
            equals(
              const Left<Failure, ApiResponse<List<Variable>>>(
                VerticalVariableFailure(),
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
