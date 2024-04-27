import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:stadata_flutter_sdk/src/core/failures/failures.dart';
import 'package:stadata_flutter_sdk/src/core/typedef/typedef.dart';
import 'package:stadata_flutter_sdk/src/features/features.dart';
import 'package:stadata_flutter_sdk/src/features/strategic_indicators/data/datasources/strategic_indicator_remote_data_source.dart';
import 'package:stadata_flutter_sdk/src/features/strategic_indicators/data/models/strategic_indicator_model.dart';
import 'package:stadata_flutter_sdk/src/features/strategic_indicators/data/repositories/strategic_indicator_repository_impl.dart';
import 'package:stadata_flutter_sdk/src/shared/data/models/api_response_model.dart';
import 'package:stadata_flutter_sdk/src/shared/data/models/pagination_model.dart';
import 'package:stadata_flutter_sdk/src/shared/domain/entities/api_response.dart';
import 'package:stadata_flutter_sdk/stadata_flutter_sdk.dart';

import '../../../../../fixtures/fixtures.dart';
import '../../../../../helpers/test_injection.dart';

class MockStrategicIndicatorRemoteDataSource extends Mock
    implements StrategicIndicatorRemoteDataSource {}

void main() {
  late StrategicIndicatorRemoteDataSource mockRemoteDataSource;
  late StrategicIndicatorRepository repository;

  setUpAll(
    () {
      mockRemoteDataSource = MockStrategicIndicatorRemoteDataSource();
      registerTestLazySingleton<StrategicIndicatorRemoteDataSource>(
        mockRemoteDataSource,
      );
      repository = StrategicIndicatorRepositoryImpl();
    },
  );

  tearDownAll(unregisterTestInjection);

  const domain = '7315';

  group(
    'StrategicIndicatorRepositoryImpl',
    () {
      group(
        'get()',
        () {
          late ApiResponseModel<List<StrategicIndicatorModel>> response;
          late ApiResponse<List<StrategicIndicator>> data;

          setUp(
            () {
              final json = jsonFromFixture(Fixture.strategicIndicators);
              response =
                  ApiResponseModel<List<StrategicIndicatorModel>>.fromJson(
                json,
                (json) {
                  if (json is! List) {
                    return [];
                  }
                  return json
                      .map((e) => StrategicIndicatorModel.fromJson(e as JSON))
                      .toList();
                },
              );

              final responseData = response.data
                  ?.map(
                    (e) => e.toEntity(),
                  )
                  .toList();
              data = ApiResponse<List<StrategicIndicator>>(
                data: responseData,
                status: response.status,
                message: response.message,
                dataAvailability: response.dataAvailability,
                pagination: response.pagination?.toEntity(),
              );
            },
          );

          test(
            'should return List of Strategic Indicators if success',
            () async {
              // arrange
              when(
                () => mockRemoteDataSource.get(
                  domain: domain,
                ),
              ).thenAnswer((_) async => response);

              // act
              final result = await repository.get(domain: domain);

              // assert
              expect(
                result,
                equals(
                  Right<Failure, ApiResponse<List<StrategicIndicator>>>(
                    data,
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
            'should return Failure if exception occured',
            () async {
              // arrange
              when(
                () => mockRemoteDataSource.get(
                  domain: domain,
                ),
              ).thenThrow(const StrategicIndicatorNotAvailableException());

              // act
              final result = await repository.get(domain: domain);

              // assert
              expect(
                result,
                equals(
                  const Left<Failure, ApiResponse<List<StrategicIndicator>>>(
                    StrategicIndicatorFailure(
                      message: 'StadataException - Strategic Indicator'
                          ' not available!',
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
