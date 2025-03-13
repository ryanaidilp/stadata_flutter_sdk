import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:stadata_flutter_sdk/src/core/core.dart';
import 'package:stadata_flutter_sdk/src/features/features.dart';
import 'package:stadata_flutter_sdk/src/shared/shared.dart';

import '../../../../../fixtures/fixtures.dart';

class MockCensusRemoteDataSouce extends Mock
    implements CensusRemoteDataSource {}

class MockLog extends Mock implements Log {}

void main() {
  late Log mockLog;
  late CensusRepository repository;
  late ApiResponse<List<Census>> censuses;
  late CensusRemoteDataSource mockDataSource;
  late ApiResponseModel<List<CensusModel>> successResponse;

  setUpAll(() {
    mockLog = MockLog();
    mockDataSource = MockCensusRemoteDataSouce();
    registerFallbackValue(LogType.error);

    repository = CensusRepositoryImpl(
      logger: mockLog,
      remoteDataSource: mockDataSource,
    );

    final json = jsonFromFixture(Fixture.census);

    successResponse = ApiResponseModel<List<CensusModel>>.fromJson(json, (
      json,
    ) {
      if (json is! List) {
        return [];
      }

      return json.map((e) => CensusModel.fromJson(e as JSON)).toList();
    });

    final data = successResponse.data?.map((e) => e).toList();

    censuses = ApiResponse(
      status: successResponse.status,
      data: data,
      dataAvailability: successResponse.dataAvailability,
      message: successResponse.message,
      pagination: successResponse.pagination,
    );
  });

  group('CensusRepositoryImpl', () {
    group('get()', () {
      test('should return list of censuses if success', () async {
        // arrange
        when(
          () => mockDataSource.get(),
        ).thenAnswer((_) async => successResponse);

        // act
        final result = await repository.get();

        // assert
        expect(
          result,
          equals(Result.success<Failure, ApiResponse<List<Census>>>(censuses)),
        );
        verify(() => mockDataSource.get()).called(1);
      });

      test('should return Failure if failed', () async {
        // arrange
        when(
          () => mockDataSource.get(),
        ).thenThrow(const CensusDataNotAvailableException());
        when(
          () => mockLog.console(
            any(),
            error: any<dynamic>(named: 'error'),
            stackTrace: any(named: 'stackTrace'),
            type: any(named: 'type'),
          ),
        ).thenAnswer((_) async => Future.value());

        // act
        final result = await repository.get();

        // assert
        expect(
          result,
          equals(
            Result.failure<Failure, ApiResponse<List<Census>>>(
              const CensusDataFailure(
                message: 'StadataException - Census Data not available!',
              ),
            ),
          ),
        );
        verify(() => mockDataSource.get()).called(1);
      });
    });
  });
}
