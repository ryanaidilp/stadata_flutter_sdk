import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:stadata_flutter_sdk/src/core/core.dart';
import 'package:stadata_flutter_sdk/src/features/features.dart';
import 'package:stadata_flutter_sdk/src/shared/shared.dart';

import '../../../../../fixtures/fixtures.dart';
import '../../../../../helpers/test_injection.dart';

class MockStrategicIndicatorRemoteDataSource extends Mock
    implements StrategicIndicatorRemoteDataSource {}

class MockLog extends Mock implements Log {}

void main() {
  late Log mockLog;
  late StrategicIndicatorRemoteDataSource mockRemoteDataSource;
  late StrategicIndicatorRepository repository;

  setUpAll(() {
    mockRemoteDataSource = MockStrategicIndicatorRemoteDataSource();
    registerTestLazySingleton<StrategicIndicatorRemoteDataSource>(
      mockRemoteDataSource,
    );
    mockLog = MockLog();
    registerTestFactory<Log>(mockLog);
    registerFallbackValue(LogType.error);
    repository = StrategicIndicatorRepositoryImpl();
  });

  tearDownAll(unregisterTestInjection);

  const domain = '7315';

  group('StrategicIndicatorRepositoryImpl', () {
    group('get()', () {
      late ApiResponseModel<List<StrategicIndicatorModel>> response;
      late ApiResponse<List<StrategicIndicator>> data;

      setUp(() {
        final json = jsonFromFixture(Fixture.strategicIndicators);
        response = ApiResponseModel<List<StrategicIndicatorModel>>.fromJson(
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

        final responseData = response.data;
        data = ApiResponse<List<StrategicIndicator>>(
          data: responseData,
          status: response.status,
          message: response.message,
          dataAvailability: response.dataAvailability,
          pagination: response.pagination,
        );
      });

      test('should return List of Strategic Indicators if success', () async {
        // arrange
        when(
          () => mockRemoteDataSource.get(domain: domain),
        ).thenAnswer((_) async => response);

        // act
        final result = await repository.get(domain: domain);

        // assert
        expect(
          result,
          equals(
            Result.success<Failure, ApiResponse<List<StrategicIndicator>>>(
              data,
            ),
          ),
        );
        verify(() => mockRemoteDataSource.get(domain: domain)).called(1);
      });

      test('should return Failure if exception occured', () async {
        // arrange
        when(
          () => mockRemoteDataSource.get(domain: domain),
        ).thenThrow(const StrategicIndicatorNotAvailableException());
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
            Result.failure<Failure, ApiResponse<List<StrategicIndicator>>>(
              const StrategicIndicatorFailure(
                message:
                    'StadataException - Strategic Indicator'
                    ' not available!',
              ),
            ),
          ),
        );
        verify(() => mockRemoteDataSource.get(domain: domain)).called(1);
      });
    });
  });
}
