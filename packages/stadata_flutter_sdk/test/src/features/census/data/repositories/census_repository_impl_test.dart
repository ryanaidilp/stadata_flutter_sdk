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
  late CensusRemoteDataSource mockDataSource;

  setUpAll(() {
    mockLog = MockLog();
    mockDataSource = MockCensusRemoteDataSouce();
    registerFallbackValue(LogType.error);

    repository = CensusRepositoryImpl(
      logger: mockLog,
      remoteDataSource: mockDataSource,
    );
  });

  group('CensusRepositoryImpl', () {
    group('get()', () {
      late ApiResponse<List<CensusEvent>> censusEvents;
      late ApiResponseModel<List<CensusEventModel>> successResponse;

      setUp(() {
        final json = jsonFromFixture(Fixture.census);

        successResponse = ApiResponseModel<List<CensusEventModel>>.fromJson(json, (
          json,
        ) {
          if (json is! List) {
            return [];
          }

          return json.map((e) => CensusEventModel.fromJson(e as JSON)).toList();
        });

        final data = successResponse.data?.map((e) => e).toList();

        censusEvents = ApiResponse(
          status: successResponse.status,
          data: data,
          dataAvailability: successResponse.dataAvailability,
          message: successResponse.message,
          pagination: successResponse.pagination,
        );
      });

      test('should return list of censusEvents if success', () async {
        // arrange
        when(
          () => mockDataSource.get(),
        ).thenAnswer((_) async => successResponse);

        // act
        final result = await repository.get();

        // assert
        expect(
          result,
          equals(Result.success<Failure, ApiResponse<List<CensusEvent>>>(censusEvents)),
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
            Result.failure<Failure, ApiResponse<List<CensusEvent>>>(
              const CensusDataFailure(
                message: 'StadataException - Census Data not available!',
              ),
            ),
          ),
        );
        verify(() => mockDataSource.get()).called(1);
      });
    });

    group('getCensusTopics()', () {
      const censusID = 'sp2020';
      late ApiResponse<List<CensusTopic>> censusTopics;
      late ApiResponseModel<List<CensusTopicModel>> successResponse;

      setUp(() {
        final json = jsonFromFixture(Fixture.censusTopic);

        successResponse = ApiResponseModel<List<CensusTopicModel>>.fromJson(
          json,
          (json) {
            if (json is! List) {
              return [];
            }

            return json
                .map((e) => CensusTopicModel.fromJson(e as JSON))
                .toList();
          },
        );

        final data = successResponse.data?.map((e) => e).toList();

        censusTopics = ApiResponse(
          status: successResponse.status,
          data: data,
          dataAvailability: successResponse.dataAvailability,
          message: successResponse.message,
          pagination: successResponse.pagination,
        );
      });

      test('should return list of census topics if success', () async {
        // arrange
        when(
          () =>
              mockDataSource.getCensusTopics(censusID: any(named: 'censusID')),
        ).thenAnswer((_) async => successResponse);

        // act
        final result = await repository.getCensusTopics(censusID: censusID);

        // assert
        expect(
          result,
          equals(
            Result.success<Failure, ApiResponse<List<CensusTopic>>>(
              censusTopics,
            ),
          ),
        );
        verify(
          () => mockDataSource.getCensusTopics(censusID: censusID),
        ).called(1);
      });

      test('should return Failure if failed', () async {
        // arrange
        when(
          () =>
              mockDataSource.getCensusTopics(censusID: any(named: 'censusID')),
        ).thenThrow(const CensusTopicNotAvailableException());

        when(
          () => mockLog.console(
            any(),
            error: any<dynamic>(named: 'error'),
            stackTrace: any(named: 'stackTrace'),
            type: any(named: 'type'),
          ),
        ).thenAnswer((_) async => Future.value());

        // act
        final result = await repository.getCensusTopics(censusID: censusID);

        // assert
        expect(
          result,
          equals(
            Result.failure<Failure, ApiResponse<List<CensusTopic>>>(
              const CensusTopicFailure(
                message: 'StadataException - Census Topic not available!',
              ),
            ),
          ),
        );
        verify(
          () => mockDataSource.getCensusTopics(censusID: censusID),
        ).called(1);
      });
    });

    group('getCensusArea()', () {
      const censusID = 'sp2020';
      late ApiResponse<List<CensusArea>> censusAreas;
      late ApiResponseModel<List<CensusAreaModel>> successResponse;

      setUp(() {
        final json = jsonFromFixture(Fixture.censusArea);

        successResponse = ApiResponseModel<List<CensusAreaModel>>.fromJson(
          json,
          (json) {
            if (json is! List) {
              return [];
            }

            return json
                .map((e) => CensusAreaModel.fromJson(e as JSON))
                .toList();
          },
        );

        final data = successResponse.data?.map((e) => e).toList();

        censusAreas = ApiResponse(
          status: successResponse.status,
          data: data,
          dataAvailability: successResponse.dataAvailability,
          message: successResponse.message,
          pagination: successResponse.pagination,
        );
      });

      test('should return list of census areas if success', () async {
        // arrange
        when(
          () => mockDataSource.getCensusArea(censusID: any(named: 'censusID')),
        ).thenAnswer((_) async => successResponse);

        // act
        final result = await repository.getCensusArea(censusID: censusID);

        // assert
        expect(
          result,
          equals(
            Result.success<Failure, ApiResponse<List<CensusArea>>>(
              censusAreas,
            ),
          ),
        );
        verify(
          () => mockDataSource.getCensusArea(censusID: censusID),
        ).called(1);
      });

      test('should return Failure if failed', () async {
        // arrange
        when(
          () => mockDataSource.getCensusArea(censusID: any(named: 'censusID')),
        ).thenThrow(const CensusAreaNotAvailableException());

        when(
          () => mockLog.console(
            any(),
            error: any<dynamic>(named: 'error'),
            stackTrace: any(named: 'stackTrace'),
            type: any(named: 'type'),
          ),
        ).thenAnswer((_) async => Future.value());

        // act
        final result = await repository.getCensusArea(censusID: censusID);

        // assert
        expect(
          result,
          equals(
            Result.failure<Failure, ApiResponse<List<CensusArea>>>(
              const CensusAreaFailure(
                message: 'StadataException - Census Area not available!',
              ),
            ),
          ),
        );
        verify(
          () => mockDataSource.getCensusArea(censusID: censusID),
        ).called(1);
      });
    });

    group('getCensusDatasets()', () {
      const censusID = 'sp2020';
      const topicID = 20;
      late ApiResponse<List<CensusDataset>> censusDatasets;
      late ApiResponseModel<List<CensusDatasetModel>> successResponse;

      setUp(() {
        final json = jsonFromFixture(Fixture.censusDatasets);

        successResponse = ApiResponseModel<List<CensusDatasetModel>>.fromJson(
          json,
          (json) {
            if (json is! List) {
              return [];
            }

            return json
                .map((e) => CensusDatasetModel.fromJson(e as JSON))
                .toList();
          },
        );

        final data = successResponse.data?.map((e) => e).toList();

        censusDatasets = ApiResponse(
          status: successResponse.status,
          data: data,
          dataAvailability: successResponse.dataAvailability,
          message: successResponse.message,
          pagination: successResponse.pagination,
        );
      });

      test('should return list of census datasets if success', () async {
        // arrange
        when(
          () => mockDataSource.getCensusDatasets(
            censusID: any(named: 'censusID'),
            topicID: any(named: 'topicID'),
          ),
        ).thenAnswer((_) async => successResponse);

        // act
        final result = await repository.getCensusDatasets(
          censusID: censusID,
          topicID: topicID,
        );

        // assert
        expect(
          result,
          equals(
            Result.success<Failure, ApiResponse<List<CensusDataset>>>(
              censusDatasets,
            ),
          ),
        );
        verify(
          () => mockDataSource.getCensusDatasets(
            censusID: censusID,
            topicID: topicID,
          ),
        ).called(1);
      });

      test('should return Failure if failed', () async {
        // arrange
        when(
          () => mockDataSource.getCensusDatasets(
            censusID: any(named: 'censusID'),
            topicID: any(named: 'topicID'),
          ),
        ).thenThrow(const CensusDatasetNotAvailableException());

        when(
          () => mockLog.console(
            any(),
            error: any<dynamic>(named: 'error'),
            stackTrace: any(named: 'stackTrace'),
            type: any(named: 'type'),
          ),
        ).thenAnswer((_) async => Future.value());

        // act
        final result = await repository.getCensusDatasets(
          censusID: censusID,
          topicID: topicID,
        );

        // assert
        expect(
          result,
          equals(
            Result.failure<Failure, ApiResponse<List<CensusDataset>>>(
              const CensusDatasetFailure(
                message: 'StadataException - Census Dataset not available!',
              ),
            ),
          ),
        );
        verify(
          () => mockDataSource.getCensusDatasets(
            censusID: censusID,
            topicID: topicID,
          ),
        ).called(1);
      });
    });

    group('getCensusData()', () {
      const censusID = 'sp2020';
      const censusAreaID = '1667';
      const datasetID = '1';

      late ApiResponse<List<CensusData>> censusData;
      late ApiResponseModel<List<CensusDataModel>> successResponse;

      setUpAll(() {
        final json = jsonFromFixture(Fixture.censusData);

        successResponse = ApiResponseModel<List<CensusDataModel>>.fromJson(
          json,
          (json) {
            if (json == null) {
              return [];
            }

            // Handle the special nested structure for census data
            if (json is Map<String, dynamic>) {
              final wrapper = CensusDataWrapper.fromJson(json);
              return wrapper.data;
            }

            // Fallback for unexpected structure
            if (json is List) {
              return json
                  .map((e) => CensusDataModel.fromJson(e as JSON))
                  .toList();
            }

            return [];
          },
        );

        final data = successResponse.data?.map((e) => e).toList();

        censusData = ApiResponse(
          status: successResponse.status,
          data: data,
          dataAvailability: successResponse.dataAvailability,
          message: successResponse.message,
          pagination: successResponse.pagination,
        );
      });

      test('should return list of census data if success', () async {
        // arrange
        when(
          () => mockDataSource.getCensusData(
            censusID: any(named: 'censusID'),
            censusAreaID: any(named: 'censusAreaID'),
            datasetID: any(named: 'datasetID'),
          ),
        ).thenAnswer((_) async => successResponse);

        // act
        final result = await repository.getCensusData(
          censusID: censusID,
          censusAreaID: censusAreaID,
          datasetID: datasetID,
        );

        // assert
        expect(
          result,
          equals(
            Result.success<Failure, ApiResponse<List<CensusData>>>(
              censusData,
            ),
          ),
        );
        verify(
          () => mockDataSource.getCensusData(
            censusID: censusID,
            censusAreaID: censusAreaID,
            datasetID: datasetID,
          ),
        ).called(1);
      });

      test('should return Failure if failed', () async {
        // arrange
        when(
          () => mockDataSource.getCensusData(
            censusID: any(named: 'censusID'),
            censusAreaID: any(named: 'censusAreaID'),
            datasetID: any(named: 'datasetID'),
          ),
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
        final result = await repository.getCensusData(
          censusID: censusID,
          censusAreaID: censusAreaID,
          datasetID: datasetID,
        );

        // assert
        expect(
          result,
          equals(
            Result.failure<Failure, ApiResponse<List<CensusData>>>(
              const CensusDataFailure(
                message: 'StadataException - Census Data not available!',
              ),
            ),
          ),
        );
        verify(
          () => mockDataSource.getCensusData(
            censusID: censusID,
            censusAreaID: censusAreaID,
            datasetID: datasetID,
          ),
        ).called(1);
      });
    });
  });
}
