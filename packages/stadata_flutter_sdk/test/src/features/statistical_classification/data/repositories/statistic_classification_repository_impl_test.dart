import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:stadata_flutter_sdk/src/core/core.dart';
import 'package:stadata_flutter_sdk/src/features/features.dart';
import 'package:stadata_flutter_sdk/src/shared/shared.dart';

import '../../../../../fixtures/fixtures.dart';
import '../../../../../helpers/test_injection.dart';

class MockStatisticClassificationRemoteDataSource extends Mock
    implements StatisticClassificationRemoteDataSource {}

void main() {
  late final StatisticClassificationRepository repository;
  late final StatisticClassificationRemoteDataSource mockRemoteDataSource;

  setUpAll(
    () {
      mockRemoteDataSource = MockStatisticClassificationRemoteDataSource();
      registerTestLazySingleton<StatisticClassificationRemoteDataSource>(
        mockRemoteDataSource,
      );
      repository = StatisticClassificationRepositoryImpl();
    },
  );

  tearDownAll(unregisterTestInjection);

  group(
    'StatisticClassificationRepositoryImpl',
    () {
      group(
        'get()',
        () {
          late ApiResponse<List<StatisticClassification>> data;
          late ApiResponseModel<List<StatisticClassificationModel>> response;

          setUp(
            () {
              final json = jsonFromFixture(Fixture.statisticClassification);
              response =
                  ApiResponseModel<List<StatisticClassificationModel>>.fromJson(
                json,
                (json) {
                  if (json is! List) {
                    return [];
                  }

                  final jsonList = json.map((e) => e as Map).toList();

                  final dataList = jsonList
                      .map(
                        JSON.from,
                      )
                      .toList();

                  return dataList
                      .map(
                        (e) => StatisticClassificationModel.fromJson(
                          JSON.from(e['_source'] as Map),
                        ),
                      )
                      .toList();
                },
              );

              data = ApiResponse<List<StatisticClassification>>(
                data: response.data,
                status: response.status,
                message: response.message,
                pagination: response.pagination?.toEntity(),
                dataAvailability: response.dataAvailability,
              );
            },
          );

          test(
            'should return list of statistic classification if success',
            () async {
              // arrange
              when(
                () => mockRemoteDataSource.get(
                  type: KBLIType.y2009,
                ),
              ).thenAnswer(
                (_) async => response,
              );

              // act
              final result = await repository.get(
                type: KBLIType.y2009,
              );

              // assert
              expect(
                result,
                equals(
                  Right<Failure, ApiResponse<List<StatisticClassification>>>(
                    data,
                  ),
                ),
              );
              verify(
                () => mockRemoteDataSource.get(
                  type: KBLIType.y2009,
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
                  type: KBLIType.y2009,
                ),
              ).thenThrow(
                const StatisticClassificationNotAvailableException(),
              );

              // act
              final result = await repository.get(
                type: KBLIType.y2009,
              );

              // assert
              expect(
                result,
                equals(
                  const Left<Failure,
                      ApiResponse<List<StatisticClassification>>>(
                    StatisticClassificationFailure(
                      message:
                          'StadataException - Statistic Classification not available!',
                    ),
                  ),
                ),
              );
              verify(
                () => mockRemoteDataSource.get(
                  type: KBLIType.y2009,
                ),
              ).called(1);
            },
          );
        },
      );

      group(
        'detail()',
        () {
          const id = 'kbli2009_id';
          late ApiResponse<List<StatisticClassification>> data;
          late ApiResponseModel<List<StatisticClassificationModel>> response;

          setUp(
            () {
              final json =
                  jsonFromFixture(Fixture.statisticClassificationDetail);
              response =
                  ApiResponseModel<List<StatisticClassificationModel>>.fromJson(
                json,
                (json) {
                  if (json is! List) {
                    return [];
                  }

                  final jsonList = json.map((e) => e as Map).toList();

                  final dataList = jsonList
                      .map(
                        JSON.from,
                      )
                      .toList();

                  return dataList
                      .map(
                        (e) => StatisticClassificationModel.fromJson(
                          JSON.from(e['_source'] as Map),
                        ),
                      )
                      .toList();
                },
              );

              data = ApiResponse<List<StatisticClassification>>(
                data: response.data,
                status: response.status,
                message: response.message,
                pagination: response.pagination?.toEntity(),
                dataAvailability: response.dataAvailability,
              );
            },
          );

          test(
            'should return list of statistic classification if success',
            () async {
              // arrange
              when(
                () => mockRemoteDataSource.detail(
                  id: id,
                  type: KBLIType.y2009,
                ),
              ).thenAnswer(
                (_) async => response,
              );

              // act
              final result = await repository.detail(
                id: id,
                type: KBLIType.y2009,
              );

              // assert
              expect(
                result,
                equals(
                  Right<Failure, ApiResponse<List<StatisticClassification>>>(
                    data,
                  ),
                ),
              );
              verify(
                () => mockRemoteDataSource.detail(
                  id: id,
                  type: KBLIType.y2009,
                ),
              ).called(1);
            },
          );

          test(
            'should return Failure if exception occured',
            () async {
              // arrange
              when(
                () => mockRemoteDataSource.detail(
                  id: id,
                  type: KBLIType.y2009,
                ),
              ).thenThrow(
                const StatisticClassificationNotAvailableException(),
              );

              // act
              final result = await repository.detail(
                id: id,
                type: KBLIType.y2009,
              );

              // assert
              expect(
                result,
                equals(
                  const Left<Failure,
                      ApiResponse<List<StatisticClassification>>>(
                    StatisticClassificationFailure(
                      message:
                          'StadataException - Statistic Classification not available!',
                    ),
                  ),
                ),
              );
              verify(
                () => mockRemoteDataSource.detail(
                  id: id,
                  type: KBLIType.y2009,
                ),
              ).called(1);
            },
          );
        },
      );
    },
  );
}
