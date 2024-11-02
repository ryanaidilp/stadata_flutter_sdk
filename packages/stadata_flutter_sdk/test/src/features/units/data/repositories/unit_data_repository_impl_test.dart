import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:stadata_flutter_sdk/src/core/core.dart';
import 'package:stadata_flutter_sdk/src/features/features.dart';
import 'package:stadata_flutter_sdk/src/shared/shared.dart';

import '../../../../../fixtures/fixtures.dart';
import '../../../../../helpers/test_injection.dart';

class MockUnitDataRemoteDataSource extends Mock
    implements UnitDataRemoteDataSource {}

class MockLog extends Mock implements Log {}

void main() {
  late Log mockLog;
  late UnitDataRemoteDataSource mockRemoteDataSource;
  late UnitDataRepository repository;
  late ApiResponseModel<List<UnitDataModel>?> successResponse;
  late ApiResponse<List<UnitData>> units;

  setUpAll(
    () {
      mockRemoteDataSource = MockUnitDataRemoteDataSource();
      registerTestLazySingleton<UnitDataRemoteDataSource>(
        mockRemoteDataSource,
      );
      mockLog = MockLog();
      registerTestFactory<Log>(mockLog);
      registerFallbackValue(LogType.error);
      repository = UnitDataRepositoryImpl();
      final json = jsonFromFixture(Fixture.units);
      successResponse = ApiResponseModel<List<UnitDataModel>?>.fromJson(
        json,
        (json) {
          if (json == null || json is! List) {
            return null;
          }

          return json.map((e) => UnitDataModel.fromJson(e as JSON)).toList();
        },
      );

      final data = successResponse.data;

      units = ApiResponse<List<UnitData>>(
        status: successResponse.status,
        dataAvailability: successResponse.dataAvailability,
        data: data,
        message: successResponse.message,
        pagination: successResponse.pagination,
      );
    },
  );

  tearDownAll(unregisterTestInjection);

  const domain = '7200';

  group(
    'UnitDataRepositoryImpl',
    () {
      group(
        'get()',
        () {
          test(
            'should return list of units if success',
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
                  Result.success<Failure, ApiResponse<List<UnitData>>>(
                    units,
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
              ).thenThrow(const UnitNotAvailableException());
              when(
                () => mockLog.console(
                  any(),
                  error: any<dynamic>(named: 'error'),
                  stackTrace: any(named: 'stackTrace'),
                  type: any(named: 'type'),
                ),
              ).thenAnswer((_) async => Future.value());

              // act
              final result = await repository.get(domain: domain);

              // assert
              expect(
                result,
                equals(
                  Result.failure<Failure, ApiResponse<List<UnitData>>>(
                    const UnitFailure(
                      message: 'StadataException - Unit not available!',
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
