import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:stadata_flutter_sdk/src/core/core.dart';
import 'package:stadata_flutter_sdk/src/features/features.dart';
import 'package:stadata_flutter_sdk/src/shared/shared.dart';

import '../../../../../fixtures/fixtures.dart';
import '../../../../../helpers/test_injection.dart';

class MockVerticalVariableRemoteDataSource extends Mock
    implements VerticalVariableRemoteDataSource {}

class MockLog extends Mock implements Log {}

void main() {
  late Log mockLog;
  late VerticalVariableRemoteDataSource mockRemoteDataSource;
  late VerticalVariableRepository repository;
  late ApiResponseModel<List<VerticalVariableModel>?> successResponse;
  late ApiResponse<List<VerticalVariable>> verticalVariables;

  setUpAll(
    () {
      mockRemoteDataSource = MockVerticalVariableRemoteDataSource();
      registerTestLazySingleton<VerticalVariableRemoteDataSource>(
        mockRemoteDataSource,
      );
      mockLog = MockLog();
      registerTestFactory<Log>(mockLog);
      registerFallbackValue(LogType.error);
      repository = VerticalVariableRepositoryImpl();
      final json = jsonFromFixture(Fixture.verticalVariables);
      successResponse = ApiResponseModel<List<VerticalVariableModel>?>.fromJson(
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

      final data = successResponse.data;

      verticalVariables = ApiResponse<List<VerticalVariable>>(
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
    'VerticalVariableRepositoryImpl',
    () {
      group(
        'get()',
        () {
          test(
            'should return list of vertical variables if success',
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
                  Result.success<Failure, ApiResponse<List<VerticalVariable>>>(
                    verticalVariables,
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
              ).thenThrow(const VerticalVariableNotAvailableException());
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
                  Result.failure<Failure, ApiResponse<List<VerticalVariable>>>(
                    const VerticalVariableFailure(
                      message:
                          'StadataException - Vertical Variable not available!',
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
