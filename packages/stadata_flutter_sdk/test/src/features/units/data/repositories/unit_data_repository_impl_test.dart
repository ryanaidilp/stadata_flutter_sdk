import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:stadata_flutter_sdk/src/core/failures/failures.dart';
import 'package:stadata_flutter_sdk/src/core/typedef/typedef.dart';
import 'package:stadata_flutter_sdk/src/features/units/data/datasources/unit_data_remote_data_source.dart';
import 'package:stadata_flutter_sdk/src/features/units/data/models/unit_data_model.dart';
import 'package:stadata_flutter_sdk/src/features/units/data/repositories/unit_data_repository_impl.dart';
import 'package:stadata_flutter_sdk/src/features/units/domain/repositories/unit_data_repository.dart';
import 'package:stadata_flutter_sdk/src/shared/shared.dart';
import 'package:stadata_flutter_sdk/stadata_flutter_sdk.dart';

import '../../../../../fixtures/fixtures.dart';
import '../../../../../helpers/test_injection.dart';

class MockUnitDataRemoteDataSource extends Mock
    implements UnitDataRemoteDataSource {}

void main() {
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

      final data = successResponse.data?.map((e) => e.toEntity()).toList();

      units = ApiResponse<List<UnitData>>(
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
                  Right<Failure, ApiResponse<List<UnitData>>>(
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

              // act
              final result = await repository.get(domain: domain);

              // assert
              expect(
                result,
                equals(
                  const Left<Failure, ApiResponse<List<UnitData>>>(
                    UnitFailure(
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
