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
      late ApiResponseModel<List<CensusModel>> data;

      final queryParams = {QueryParamConstant.id: '37'};

      setUp(() {
        response = jsonFromFixture(Fixture.census);
        unavailableResponse = jsonFromFixture(Fixture.listUnavailable);

        data = ApiResponseModel<List<CensusModel>>.fromJson(response, (json) {
          if (json is! List) {
            return [];
          }

          return json.map((e) => CensusModel.fromJson(e as JSON)).toList();
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
        'should throw DataNotAvailableException when data is not available',
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
        'should returen list of census when response is successful!',
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
        'should throw DataNotAvailableException when data is not available',
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
  });
}
