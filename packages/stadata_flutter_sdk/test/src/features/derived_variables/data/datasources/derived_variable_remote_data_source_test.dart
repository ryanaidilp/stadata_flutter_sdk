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
  late DerivedVariableRemoteDataSource dataSource;
  late ApiResponseModel<List<DerivedVariableModel>?> derivedVariables;
  late JSON response;
  late JSON unavailableResponse;

  setUpAll(() {
    mockListClient = MockNetworkClient();
    registerTestFactory<NetworkClient>(
      mockListClient,
      instanceName: 'listClient',
    );
    dataSource = DerivedVariableRemoteDataSourceImpl();

    response = jsonFromFixture(Fixture.derivedVariables);
    unavailableResponse = jsonFromFixture(Fixture.listUnavailable);

    derivedVariables = ApiResponseModel<List<DerivedVariableModel>?>.fromJson(
      response,
      (json) {
        if (json == null || json is! List) {
          return null;
        }

        return json
            .map((e) => DerivedVariableModel.fromJson(e as JSON))
            .toList();
      },
    );
  });

  tearDownAll(unregisterTestInjection);

  setUp(() {
    reset(mockListClient);
  });

  const domain = '0000';

  group('DerivedVariableRemoteDataSource', () {
    group('get()', () {
      test(
        'should return list of derived variables when call is successful',
        () async {
          // arrange
          final queryParams = {
            QueryParamConstant.page: 1,
            QueryParamConstant.domain: domain,
            QueryParamConstant.lang: DataLanguage.id.value,
          };

          when(
            () => mockListClient.get<JSON>(
              ApiEndpoint.derivedVariable,
              queryParams: queryParams,
            ),
          ).thenAnswer((_) async => response);

          // act
          final result = await dataSource.get(domain: domain);

          // assert
          expect(result, equals(derivedVariables));
          expect(result.data, isNotNull);
          expect(result.data, isA<List<DerivedVariableModel>>());
          expect(result.data!.length, equals(10));
          verify(
            () => mockListClient.get<JSON>(
              ApiEndpoint.derivedVariable,
              queryParams: queryParams,
            ),
          ).called(1);
        },
      );

      test('should return list with custom page', () async {
        // arrange
        const page = 2;
        final queryParams = {
          QueryParamConstant.page: page,
          QueryParamConstant.domain: domain,
          QueryParamConstant.lang: DataLanguage.id.value,
        };

        when(
          () => mockListClient.get<JSON>(
            ApiEndpoint.derivedVariable,
            queryParams: queryParams,
          ),
        ).thenAnswer((_) async => response);

        // act
        final result = await dataSource.get(domain: domain, page: page);

        // assert
        expect(result, equals(derivedVariables));
        verify(
          () => mockListClient.get<JSON>(
            ApiEndpoint.derivedVariable,
            queryParams: queryParams,
          ),
        ).called(1);
      });

      test('should return list with English language', () async {
        // arrange
        final queryParams = {
          QueryParamConstant.page: 1,
          QueryParamConstant.domain: domain,
          QueryParamConstant.lang: DataLanguage.en.value,
        };

        when(
          () => mockListClient.get<JSON>(
            ApiEndpoint.derivedVariable,
            queryParams: queryParams,
          ),
        ).thenAnswer((_) async => response);

        // act
        final result = await dataSource.get(
          domain: domain,
          lang: DataLanguage.en,
        );

        // assert
        expect(result, equals(derivedVariables));
        verify(
          () => mockListClient.get<JSON>(
            ApiEndpoint.derivedVariable,
            queryParams: queryParams,
          ),
        ).called(1);
      });

      test('should return list with variableID filter', () async {
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
            ApiEndpoint.derivedVariable,
            queryParams: queryParams,
          ),
        ).thenAnswer((_) async => response);

        // act
        final result = await dataSource.get(
          domain: domain,
          variableID: variableID,
        );

        // assert
        expect(result, equals(derivedVariables));
        verify(
          () => mockListClient.get<JSON>(
            ApiEndpoint.derivedVariable,
            queryParams: queryParams,
          ),
        ).called(1);
      });

      test('should return list with verticalGroup filter', () async {
        // arrange
        const verticalGroup = 5;
        final queryParams = {
          QueryParamConstant.page: 1,
          QueryParamConstant.domain: domain,
          QueryParamConstant.lang: DataLanguage.id.value,
          QueryParamConstant.group: verticalGroup,
        };

        when(
          () => mockListClient.get<JSON>(
            ApiEndpoint.derivedVariable,
            queryParams: queryParams,
          ),
        ).thenAnswer((_) async => response);

        // act
        final result = await dataSource.get(
          domain: domain,
          verticalGroup: verticalGroup,
        );

        // assert
        expect(result, equals(derivedVariables));
        verify(
          () => mockListClient.get<JSON>(
            ApiEndpoint.derivedVariable,
            queryParams: queryParams,
          ),
        ).called(1);
      });

      test(
        'should return list with both variableID and verticalGroup filters',
        () async {
          // arrange
          const variableID = 145;
          const verticalGroup = 5;
          final queryParams = {
            QueryParamConstant.page: 1,
            QueryParamConstant.domain: domain,
            QueryParamConstant.lang: DataLanguage.id.value,
            QueryParamConstant.variable: variableID,
            QueryParamConstant.group: verticalGroup,
          };

          when(
            () => mockListClient.get<JSON>(
              ApiEndpoint.derivedVariable,
              queryParams: queryParams,
            ),
          ).thenAnswer((_) async => response);

          // act
          final result = await dataSource.get(
            domain: domain,
            variableID: variableID,
            verticalGroup: verticalGroup,
          );

          // assert
          expect(result, equals(derivedVariables));
          verify(
            () => mockListClient.get<JSON>(
              ApiEndpoint.derivedVariable,
              queryParams: queryParams,
            ),
          ).called(1);
        },
      );

      test('should not include optional filters when null', () async {
        // arrange
        final queryParams = {
          QueryParamConstant.page: 1,
          QueryParamConstant.domain: domain,
          QueryParamConstant.lang: DataLanguage.id.value,
        };

        when(
          () => mockListClient.get<JSON>(
            ApiEndpoint.derivedVariable,
            queryParams: queryParams,
          ),
        ).thenAnswer((_) async => response);

        // act
        final result = await dataSource.get(domain: domain);

        // assert
        expect(result, equals(derivedVariables));
        verify(
          () => mockListClient.get<JSON>(
            ApiEndpoint.derivedVariable,
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
            ApiEndpoint.derivedVariable,
            queryParams: queryParams,
          ),
        ).thenAnswer((_) async => response);

        // act
        final result = await dataSource.get(domain: domain);

        // assert
        expect(result.pagination, isNotNull);
        expect(result.pagination?.page, equals(1));
        expect(result.pagination?.pages, equals(3));
        expect(result.pagination?.total, equals(25));
      });

      test('should throw DerivedVariableNotAvailableException when '
          'list-not-available', () async {
        // arrange
        final queryParams = {
          QueryParamConstant.page: 1,
          QueryParamConstant.domain: domain,
          QueryParamConstant.lang: DataLanguage.id.value,
        };

        when(
          () => mockListClient.get<JSON>(
            ApiEndpoint.derivedVariable,
            queryParams: queryParams,
          ),
        ).thenAnswer((_) async => unavailableResponse);

        // act
        final result = dataSource.get(domain: domain);

        // assert
        await expectLater(
          result,
          throwsA(const DerivedVariableNotAvailableException()),
        );
        verify(
          () => mockListClient.get<JSON>(
            ApiEndpoint.derivedVariable,
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
            ApiEndpoint.derivedVariable,
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
            ApiEndpoint.derivedVariable,
            queryParams: queryParams,
          ),
        ).called(1);
      });
    });
  });
}
