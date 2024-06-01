import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:stadata_flutter_sdk/src/core/failures/failures.dart';
import 'package:stadata_flutter_sdk/src/core/typedef/typedef.dart';
import 'package:stadata_flutter_sdk/src/features/strategic_indicators/strategic_indicators.dart';
import 'package:stadata_flutter_sdk/src/shared/data/models/api_response_model.dart';
import 'package:stadata_flutter_sdk/src/shared/data/models/pagination_model.dart';
import 'package:stadata_flutter_sdk/src/shared/domain/entities/api_response.dart';

import '../../../../../fixtures/fixtures.dart';
import '../../../../../helpers/test_injection.dart';

class MockStrategicIndicatorRepository extends Mock
    implements StrategicIndicatorRepository {}

void main() {
  late StrategicIndicatorRepository mockRepository;
  late GetAllStrategicIndicators usecase;
  late ApiResponse<List<StrategicIndicator>> data;

  setUpAll(
    () {
      mockRepository = MockStrategicIndicatorRepository();
      registerTestLazySingleton<StrategicIndicatorRepository>(mockRepository);
      usecase = GetAllStrategicIndicators();

      final json = jsonFromFixture(Fixture.strategicIndicators);
      final response =
          ApiResponseModel<List<StrategicIndicatorModel>?>.fromJson(
        json,
        (json) {
          if (json == null || json is! List) {
            return null;
          }

          return json
              .map((e) => StrategicIndicatorModel.fromJson(e as JSON))
              .toList();
        },
      );

      final dataResponse =
          response.data?.map((e) => e.toEntity()).toList() ?? [];
      data = ApiResponse<List<StrategicIndicator>>(
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
    'GetAllStrategicIndicators',
    () {
      test(
        'should return list of strategic indicators if call success',
        () async {
          // arrange
          when(
            () => mockRepository.get(
              domain: domain,
            ),
          ).thenAnswer((_) async => Right(data));

          // act
          final result = await usecase.call(
            const GetAllStrategicIndicatorsParam(
              domain: domain,
            ),
          );

          // assert
          expect(
            result,
            equals(
              Right<Failure, ApiResponse<List<StrategicIndicator>>>(data),
            ),
          );
          verify(
            () => mockRepository.get(
              domain: domain,
            ),
          ).called(1);
        },
      );

      test(
        'should return failure if exception occured or fetch failed',
        () async {
          // arrange
          when(
            () => mockRepository.get(domain: domain),
          ).thenAnswer(
            (_) async => const Left(
              StrategicIndicatorFailure(),
            ),
          );

          // act
          final result = await usecase.call(
            const GetAllStrategicIndicatorsParam(
              domain: domain,
            ),
          );

          // assert
          expect(
            result,
            equals(
              const Left<Failure, ApiResponse<List<StrategicIndicator>>>(
                StrategicIndicatorFailure(),
              ),
            ),
          );
          verify(
            () => mockRepository.get(domain: domain),
          ).called(1);
        },
      );
    },
  );
}
