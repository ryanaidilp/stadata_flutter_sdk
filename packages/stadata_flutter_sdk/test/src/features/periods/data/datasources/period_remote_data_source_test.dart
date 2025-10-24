import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:stadata_flutter_sdk/src/core/core.dart';
import 'package:stadata_flutter_sdk/src/features/features.dart';
import 'package:stadata_flutter_sdk/src/shared/shared.dart';

import '../../../../../fixtures/fixtures.dart';
import '../../../../../helpers/test_injection.dart';

class MockNetworkClient extends Mock implements NetworkClient {}

void main() {
  late NetworkClient mockListClient;
  late PeriodRemoteDataSource dataSource;
  late ApiResponseModel<List<PeriodModel>?> periods;
  late JSON response;
  late JSON unavailableResponse;

  setUpAll(() {
    mockListClient = MockNetworkClient();
    registerTestFactory<NetworkClient>(
      mockListClient,
      instanceName: 'listClient',
    );
    dataSource = PeriodRemoteDataSourceImpl();

    response = jsonFromFixture(Fixture.periods);
    unavailableResponse = jsonFromFixture(Fixture.listUnavailable);

    periods = ApiResponseModel<List<PeriodModel>?>.fromJson(response, (json) {
      if (json == null || json is! List) {
        return null;
      }

      return json.map((e) => PeriodModel.fromJson(e as JSON)).toList();
    });
  });

  tearDownAll(unregisterTestInjection);

  setUp(() {
    reset(mockListClient);
  });

  const domain = '0000';

  group('PeriodRemoteDataSource', () {
    group('get()', () {
      test('should return list of periods when call is successful', () async {
        // arrange
        final queryParams = {
          QueryParamConstant.page: 1,
          QueryParamConstant.domain: domain,
          QueryParamConstant.lang: DataLanguage.id.value,
        };

        when(
          () => mockListClient.get<JSON>(
            ApiEndpoint.period,
            queryParams: queryParams,
          ),
        ).thenAnswer((_) async => response);

        // act
        final result = await dataSource.get(domain: domain);

        // assert
        expect(result, equals(periods));
        expect(result.data, isNotNull);
        expect(result.data, isA<List<PeriodModel>>());
        expect(result.data!.length, equals(10));
        verify(
          () => mockListClient.get<JSON>(
            ApiEndpoint.period,
            queryParams: queryParams,
          ),
        ).called(1);
      });

      test('should return list of periods with custom page', () async {
        // arrange
        const page = 2;
        final queryParams = {
          QueryParamConstant.page: page,
          QueryParamConstant.domain: domain,
          QueryParamConstant.lang: DataLanguage.id.value,
        };

        when(
          () => mockListClient.get<JSON>(
            ApiEndpoint.period,
            queryParams: queryParams,
          ),
        ).thenAnswer((_) async => response);

        // act
        final result = await dataSource.get(domain: domain, page: page);

        // assert
        expect(result, equals(periods));
        verify(
          () => mockListClient.get<JSON>(
            ApiEndpoint.period,
            queryParams: queryParams,
          ),
        ).called(1);
      });

      test('should return list of periods with English language', () async {
        // arrange
        final queryParams = {
          QueryParamConstant.page: 1,
          QueryParamConstant.domain: domain,
          QueryParamConstant.lang: DataLanguage.en.value,
        };

        when(
          () => mockListClient.get<JSON>(
            ApiEndpoint.period,
            queryParams: queryParams,
          ),
        ).thenAnswer((_) async => response);

        // act
        final result = await dataSource.get(
          domain: domain,
          lang: DataLanguage.en,
        );

        // assert
        expect(result, equals(periods));
        verify(
          () => mockListClient.get<JSON>(
            ApiEndpoint.period,
            queryParams: queryParams,
          ),
        ).called(1);
      });

      test('should return list of periods with variableID filter', () async {
        // arrange
        const variableID = 145;
        final queryParams = {
          QueryParamConstant.page: 1,
          QueryParamConstant.domain: domain,
          QueryParamConstant.lang: DataLanguage.id.value,
          QueryParamConstant.variable: variableID,
        };

        when(
          () => mockListClient.get<JSON>(
            ApiEndpoint.period,
            queryParams: queryParams,
          ),
        ).thenAnswer((_) async => response);

        // act
        final result = await dataSource.get(
          domain: domain,
          variableID: variableID,
        );

        // assert
        expect(result, equals(periods));
        verify(
          () => mockListClient.get<JSON>(
            ApiEndpoint.period,
            queryParams: queryParams,
          ),
        ).called(1);
      });

      test('should not include variableID when null', () async {
        // arrange
        final queryParams = {
          QueryParamConstant.page: 1,
          QueryParamConstant.domain: domain,
          QueryParamConstant.lang: DataLanguage.id.value,
        };

        when(
          () => mockListClient.get<JSON>(
            ApiEndpoint.period,
            queryParams: queryParams,
          ),
        ).thenAnswer((_) async => response);

        // act
        final result = await dataSource.get(domain: domain);

        // assert
        expect(result, equals(periods));
        verify(
          () => mockListClient.get<JSON>(
            ApiEndpoint.period,
            queryParams: queryParams,
          ),
        ).called(1);
      });

      test('should return correct pagination info', () async {
        // arrange
        final queryParams = {
          QueryParamConstant.page: 1,
          QueryParamConstant.domain: domain,
          QueryParamConstant.lang: DataLanguage.id.value,
        };

        when(
          () => mockListClient.get<JSON>(
            ApiEndpoint.period,
            queryParams: queryParams,
          ),
        ).thenAnswer((_) async => response);

        // act
        final result = await dataSource.get(domain: domain);

        // assert
        expect(result.pagination, isNotNull);
        expect(result.pagination?.page, equals(1));
        expect(result.pagination?.pages, equals(2));
        expect(result.pagination?.total, equals(15));
      });

      test('should throw PeriodNotAvailableException when '
          'list-not-available', () async {
        // arrange
        final queryParams = {
          QueryParamConstant.page: 1,
          QueryParamConstant.domain: domain,
          QueryParamConstant.lang: DataLanguage.id.value,
        };

        when(
          () => mockListClient.get<JSON>(
            ApiEndpoint.period,
            queryParams: queryParams,
          ),
        ).thenAnswer((_) async => unavailableResponse);

        // act
        final result = dataSource.get(domain: domain);

        // assert
        await expectLater(result, throwsA(const PeriodNotAvailableException()));
        verify(
          () => mockListClient.get<JSON>(
            ApiEndpoint.period,
            queryParams: queryParams,
          ),
        ).called(1);
      });

      test('should throw ApiException when API returns error status', () async {
        // arrange
        final errorResponse = {
          'status': 'Error',
          'message': 'Invalid domain',
        };
        final queryParams = {
          QueryParamConstant.page: 1,
          QueryParamConstant.domain: domain,
          QueryParamConstant.lang: DataLanguage.id.value,
        };

        when(
          () => mockListClient.get<JSON>(
            ApiEndpoint.period,
            queryParams: queryParams,
          ),
        ).thenAnswer((_) async => errorResponse);

        // act
        final result = dataSource.get(domain: domain);

        // assert
        await expectLater(
          result,
          throwsA(
            isA<ApiException>().having(
              (e) => e.message,
              'message',
              'Invalid domain',
            ),
          ),
        );
        verify(
          () => mockListClient.get<JSON>(
            ApiEndpoint.period,
            queryParams: queryParams,
          ),
        ).called(1);
      });
    });
  });
}
