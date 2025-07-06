import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:stadata_flutter_sdk/src/core/core.dart';
import 'package:stadata_flutter_sdk/src/features/features.dart';
import 'package:stadata_flutter_sdk/src/shared/shared.dart';

import '../../../../../fixtures/fixtures.dart';

class MockInteroparibilityNetworkClient extends Mock implements NetworkClient {}

void main() {
  late CensusRemoteDataSource dataSource;
  late NetworkClient mockInteroparibilityClient;

  setUpAll(() {
    mockInteroparibilityClient = MockInteroparibilityNetworkClient();
    dataSource = CensusRemoteDataSourceImpl(client: mockInteroparibilityClient);
  });

  group('CensusRemoteDataSource', () {
    group('get()', () {
      late JSON response;
      late JSON unavailableResponse;
      late ApiResponseModel<List<CensusEventModel>> data;

      final queryParams = {QueryParamConstant.id: '37'};

      setUp(() {
        response = jsonFromFixture(Fixture.census);
        unavailableResponse = jsonFromFixture(Fixture.listUnavailable);

        data = ApiResponseModel<List<CensusEventModel>>.fromJson(response, (
          json,
        ) {
          if (json is! List) {
            return [];
          }

          return json.map((e) => CensusEventModel.fromJson(e as JSON)).toList();
        });
      });

      test(
        'should return list of census when response is successful',
        () async {
          // Arrange
          when(
            () => mockInteroparibilityClient.get<JSON>(
              any(),
              queryParams: any(named: 'queryParams'),
            ),
          ).thenAnswer((_) async => response);

          // Act
          final result = await dataSource.get();

          // Assert
          expect(result, equals(data));
          verify(
            () => mockInteroparibilityClient.get<JSON>(
              ApiEndpoint.census,
              queryParams: queryParams,
            ),
          ).called(1);
        },
      );

      test(
        'should throw CensusDataNotAvailableException when data is not available',
        () async {
          // Arrange
          when(
            () => mockInteroparibilityClient.get<JSON>(
              any(),
              queryParams: any(named: 'queryParams'),
            ),
          ).thenAnswer((_) async => unavailableResponse);

          // Act
          final result = dataSource.get();

          // Assert
          await expectLater(
            result,
            throwsA(const CensusDataNotAvailableException()),
          );
          verify(
            () => mockInteroparibilityClient.get<JSON>(
              ApiEndpoint.census,
              queryParams: queryParams,
            ),
          ).called(1);
        },
      );
    });

    group('getCensusTopics()', () {
      late JSON response;
      late JSON unavailableResponse;
      late ApiResponseModel<List<CensusTopicModel>> data;

      const censusID = 'sp2020';

      final queryParams = {
        QueryParamConstant.id: '38',
        QueryParamConstant.event: censusID,
      };

      setUp(() {
        response = jsonFromFixture(Fixture.censusTopic);
        unavailableResponse = jsonFromFixture(Fixture.listUnavailable);

        data = ApiResponseModel<List<CensusTopicModel>>.fromJson(response, (
          json,
        ) {
          if (json is! List) {
            return [];
          }

          return json.map((e) => CensusTopicModel.fromJson(e as JSON)).toList();
        });
      });

      test(
        'should returen list of census topics when response is successful!',
        () async {
          // Arrange
          when(
            () => mockInteroparibilityClient.get<JSON>(
              any(),
              queryParams: any(named: 'queryParams'),
            ),
          ).thenAnswer((_) async => response);

          // Act
          final result = await dataSource.getCensusTopics(censusID: censusID);

          expect(result, equals(data));
          verify(
            () => mockInteroparibilityClient.get<JSON>(
              ApiEndpoint.census,
              queryParams: queryParams,
            ),
          ).called(1);
        },
      );

      test(
        'should throw CensusTopicNotAvailableException when data is not available',
        () async {
          // Arrange
          when(
            () => mockInteroparibilityClient.get<JSON>(
              any(),
              queryParams: any(named: 'queryParams'),
            ),
          ).thenAnswer((_) async => unavailableResponse);

          // Act
          final result = dataSource.getCensusTopics(censusID: censusID);

          // Assert
          await expectLater(
            result,
            throwsA(const CensusTopicNotAvailableException()),
          );
          verify(
            () => mockInteroparibilityClient.get<JSON>(
              ApiEndpoint.census,
              queryParams: queryParams,
            ),
          ).called(1);
        },
      );
    });

    group('getCensusArea()', () {
      late JSON response;
      late JSON unavailableResponse;
      late ApiResponseModel<List<CensusAreaModel>> data;

      const censusID = 'sp2020';

      final queryParams = {
        QueryParamConstant.id: '39',
        QueryParamConstant.event: censusID,
      };

      setUp(() {
        response = jsonFromFixture(Fixture.censusArea);
        unavailableResponse = jsonFromFixture(Fixture.listUnavailable);

        data = ApiResponseModel<List<CensusAreaModel>>.fromJson(response, (
          json,
        ) {
          if (json is! List) {
            return [];
          }

          return json.map((e) => CensusAreaModel.fromJson(e as JSON)).toList();
        });
      });

      test(
        'should returen list of census area when response is successful!',
        () async {
          // Arrange
          when(
            () => mockInteroparibilityClient.get<JSON>(
              any(),
              queryParams: any(named: 'queryParams'),
            ),
          ).thenAnswer((_) async => response);

          // Act
          final result = await dataSource.getCensusArea(censusID: censusID);

          expect(result, equals(data));
          verify(
            () => mockInteroparibilityClient.get<JSON>(
              ApiEndpoint.census,
              queryParams: queryParams,
            ),
          ).called(1);
        },
      );

      test(
        'should throw CensusAreaNotAvailableException when data is not available',
        () async {
          // Arrange
          when(
            () => mockInteroparibilityClient.get<JSON>(
              any(),
              queryParams: any(named: 'queryParams'),
            ),
          ).thenAnswer((_) async => unavailableResponse);

          // Act
          final result = dataSource.getCensusArea(censusID: censusID);

          // Assert
          await expectLater(
            result,
            throwsA(const CensusAreaNotAvailableException()),
          );
          verify(
            () => mockInteroparibilityClient.get<JSON>(
              ApiEndpoint.census,
              queryParams: queryParams,
            ),
          ).called(1);
        },
      );
    });

    group('getCensusDatasets()', () {
      late JSON response;
      late JSON unavailableResponse;
      late ApiResponseModel<List<CensusDatasetModel>> data;

      const censusID = 'sp2020';
      const topicID = 20;

      final queryParams = {
        QueryParamConstant.id: '40',
        QueryParamConstant.event: censusID,
        QueryParamConstant.topic: topicID.toString(),
      };

      setUp(() {
        response = jsonFromFixture(Fixture.censusDatasets);
        unavailableResponse = jsonFromFixture(Fixture.listUnavailable);

        data = ApiResponseModel<List<CensusDatasetModel>>.fromJson(response, (
          json,
        ) {
          if (json is! List) {
            return [];
          }

          return json
              .map((e) => CensusDatasetModel.fromJson(e as JSON))
              .toList();
        });
      });

      test(
        'should return list of census datasets when response is successful',
        () async {
          // Arrange
          when(
            () => mockInteroparibilityClient.get<JSON>(
              any(),
              queryParams: any(named: 'queryParams'),
            ),
          ).thenAnswer((_) async => response);

          // Act
          final result = await dataSource.getCensusDatasets(
            censusID: censusID,
            topicID: topicID,
          );

          // Assert
          expect(result, equals(data));
          verify(
            () => mockInteroparibilityClient.get<JSON>(
              ApiEndpoint.census,
              queryParams: queryParams,
            ),
          ).called(1);
        },
      );

      test(
        'should throw CensusDatasetNotAvailableException when data is not available',
        () async {
          // Arrange
          when(
            () => mockInteroparibilityClient.get<JSON>(
              any(),
              queryParams: any(named: 'queryParams'),
            ),
          ).thenAnswer((_) async => unavailableResponse);

          // Act
          final result = dataSource.getCensusDatasets(
            censusID: censusID,
            topicID: topicID,
          );

          // Assert
          await expectLater(
            result,
            throwsA(const CensusDatasetNotAvailableException()),
          );
          verify(
            () => mockInteroparibilityClient.get<JSON>(
              ApiEndpoint.census,
              queryParams: queryParams,
            ),
          ).called(1);
        },
      );
    });

    group('getCensusData()', () {
      late JSON response;
      late JSON unavailableResponse;
      late ApiResponseModel<List<CensusDataModel>> data;

      const censusID = 'sp2020';
      const censusAreaID = '1667';
      const datasetID = 'dataset123';

      final queryParams = {
        QueryParamConstant.id: '41',
        QueryParamConstant.event: censusID,
        QueryParamConstant.censusArea: censusAreaID,
        QueryParamConstant.dataset: datasetID,
      };

      setUp(() {
        response = jsonFromFixture(Fixture.censusData);
        unavailableResponse = jsonFromFixture(Fixture.listUnavailable);

        // First, parse the original response as CensusDataWrapper
        final wrapperResponse = ApiResponseModel<CensusDataWrapper>.fromJson(
          response,
          (json) {
            if (json == null) {
              return CensusDataWrapper(
                status: 200,
                dataCount: 0,
                timestamp: DateTime.now(),
                data: const [],
              );
            }

            if (json is Map<String, dynamic>) {
              return CensusDataWrapper.fromJson(json);
            }

            return CensusDataWrapper(
              status: 200,
              dataCount: 0,
              timestamp: DateTime.now(),
              data: const [],
            );
          },
        );

        // Extract the census data from the wrapper and create new response
        final censusDataList =
            wrapperResponse.data?.data ?? <CensusDataModel>[];

        data = ApiResponseModel<List<CensusDataModel>>(
          status: wrapperResponse.status,
          dataAvailability: wrapperResponse.dataAvailability,
          message: wrapperResponse.message,
          pagination: wrapperResponse.pagination,
          data: censusDataList,
        );
      });

      test(
        'should return list of census data when response is successful',
        () async {
          // Arrange
          when(
            () => mockInteroparibilityClient.get<JSON>(
              any(),
              queryParams: any(named: 'queryParams'),
            ),
          ).thenAnswer((_) async => response);

          // Act
          final result = await dataSource.getCensusData(
            censusID: censusID,
            censusAreaID: censusAreaID,
            datasetID: datasetID,
          );

          // Assert
          expect(result, equals(data));
          verify(
            () => mockInteroparibilityClient.get<JSON>(
              ApiEndpoint.census,
              queryParams: queryParams,
            ),
          ).called(1);
        },
      );

      test(
        'should throw CensusDataNotAvailableException when data is not available',
        () async {
          // Arrange
          when(
            () => mockInteroparibilityClient.get<JSON>(
              any(),
              queryParams: any(named: 'queryParams'),
            ),
          ).thenAnswer((_) async => unavailableResponse);

          // Act
          final result = dataSource.getCensusData(
            censusID: censusID,
            censusAreaID: censusAreaID,
            datasetID: datasetID,
          );

          // Assert
          await expectLater(
            result,
            throwsA(const CensusDataNotAvailableException()),
          );
          verify(
            () => mockInteroparibilityClient.get<JSON>(
              ApiEndpoint.census,
              queryParams: queryParams,
            ),
          ).called(1);
        },
      );
    });
  });
}
