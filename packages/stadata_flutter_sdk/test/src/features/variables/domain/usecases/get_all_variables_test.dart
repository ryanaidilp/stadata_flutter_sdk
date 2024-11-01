import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:stadata_flutter_sdk/src/core/core.dart';
import 'package:stadata_flutter_sdk/src/features/features.dart';
import 'package:stadata_flutter_sdk/src/shared/shared.dart';

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

      final dataResponse = response.data ?? [];
      data = ApiResponse<List<Variable>>(
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
    'GetAllVariables',
    () {
      test(
        'should return list of variables if call success',
        () async {
          // arrange
          when(
            () => mockRepository.get(domain: domain),
          ).thenAnswer((_) async => Result.success(data));

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
              Result.success<Failure, ApiResponse<List<Variable>>>(data),
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
            (_) async => Result.failure(
              const VariableFailure(),
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
              Result.failure<Failure, ApiResponse<List<Variable>>>(
                const VariableFailure(),
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
