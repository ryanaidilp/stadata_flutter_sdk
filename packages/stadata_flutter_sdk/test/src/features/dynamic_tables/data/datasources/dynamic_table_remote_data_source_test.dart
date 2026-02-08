import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:stadata_flutter_sdk/src/core/core.dart';
import 'package:stadata_flutter_sdk/src/features/features.dart';
import 'package:stadata_flutter_sdk/src/shared/shared.dart';

import '../../../../../fixtures/fixtures.dart';
import '../../../../../helpers/test_injection.dart';

class MockListNetworkClient extends Mock implements NetworkClient {}

void main() {
  late NetworkClient mockListClient;
  late DynamicTableRemoteDataSource dataSource;

  setUpAll(() {
    mockListClient = MockListNetworkClient();
    registerTestFactory<NetworkClient>(
      mockListClient,
      instanceName: 'listClient',
    );
    dataSource = DynamicTableRemoteDataSourceImpl();
  });

  tearDownAll(unregisterTestInjection);

  const domain = '7315';

  group('DynamicTableRemoteDataSource', () {
    group('getAll()', () {
      final queryParams = {
        QueryParamConstant.page: 1,
        QueryParamConstant.domain: domain,
        QueryParamConstant.lang: DataLanguage.id.value,
      };

      late ApiResponseModel<List<DynamicTableModel>?> data;
      late JSON response;
      late JSON unavailableResponse;

      setUp(() {
        response = jsonFromFixture(Fixture.dynamicTables);
        unavailableResponse = jsonFromFixture(Fixture.listUnavailable);
        data = ApiResponseModel<List<DynamicTableModel>?>.fromJson(
          response,
          (json) {
            if (json == null || json is! List) {
              return null;
            }

            return json
                .map((e) => DynamicTableModel.fromJson(e as JSON))
                .toList();
          },
        );
      });

      test('should return list of dynamic tables if success', () async {
        // arrange
        when(
          () => mockListClient.get<JSON>(
            ApiEndpoint.variable,
            queryParams: queryParams,
          ),
        ).thenAnswer((_) async => response);

        // act
        final result = await dataSource.getAll(domain: domain);

        // assert
        expect(result, equals(data));
        verify(
          () => mockListClient.get<JSON>(
            ApiEndpoint.variable,
            queryParams: queryParams,
          ),
        ).called(1);
      });

      test('should return list with custom page', () async {
        // arrange
        final customQueryParams = {
          QueryParamConstant.page: 2,
          QueryParamConstant.domain: domain,
          QueryParamConstant.lang: DataLanguage.id.value,
        };
        when(
          () => mockListClient.get<JSON>(
            ApiEndpoint.variable,
            queryParams: customQueryParams,
          ),
        ).thenAnswer((_) async => response);

        // act
        final result = await dataSource.getAll(domain: domain, page: 2);

        // assert
        expect(result, equals(data));
        verify(
          () => mockListClient.get<JSON>(
            ApiEndpoint.variable,
            queryParams: customQueryParams,
          ),
        ).called(1);
      });

      test('should return list with custom language', () async {
        // arrange
        final customQueryParams = {
          QueryParamConstant.page: 1,
          QueryParamConstant.domain: domain,
          QueryParamConstant.lang: DataLanguage.en.value,
        };
        when(
          () => mockListClient.get<JSON>(
            ApiEndpoint.variable,
            queryParams: customQueryParams,
          ),
        ).thenAnswer((_) async => response);

        // act
        final result = await dataSource.getAll(
          domain: domain,
          lang: DataLanguage.en,
        );

        // assert
        expect(result, equals(data));
        verify(
          () => mockListClient.get<JSON>(
            ApiEndpoint.variable,
            queryParams: customQueryParams,
          ),
        ).called(1);
      });

      test(
        'should throw DynamicTableNotAvailableException when list-not-available',
        () async {
          when(
            () => mockListClient.get<JSON>(
              ApiEndpoint.variable,
              queryParams: queryParams,
            ),
          ).thenAnswer((_) async => unavailableResponse);

          final result = dataSource.getAll(domain: domain);

          await expectLater(
            result,
            throwsA(
              isA<DynamicTableNotAvailableException>().having(
                (e) => e.message,
                'Message',
                'Dynamic Table not available!',
              ),
            ),
          );
          verify(
            () => mockListClient.get<JSON>(
              ApiEndpoint.variable,
              queryParams: queryParams,
            ),
          ).called(1);
        },
      );

      test(
        'should throw ApiException when status is Error',
        () async {
          final errorResponse = {
            'status': 'Error',
            'message': 'Something went wrong',
          };
          when(
            () => mockListClient.get<JSON>(
              ApiEndpoint.variable,
              queryParams: queryParams,
            ),
          ).thenAnswer((_) async => errorResponse);

          final result = dataSource.getAll(domain: domain);

          await expectLater(
            result,
            throwsA(isA<ApiException>()),
          );
          verify(
            () => mockListClient.get<JSON>(
              ApiEndpoint.variable,
              queryParams: queryParams,
            ),
          ).called(1);
        },
      );
    });

    group('detail()', () {
      const variableID = 31;
      final queryParams = {
        QueryParamConstant.domain: domain,
        QueryParamConstant.lang: DataLanguage.id.value,
      };
      final path = '${ApiEndpoint.dynamicTable}/var/$variableID';

      late JSON response;
      late JSON unavailableResponse;

      setUp(() {
        response = jsonFromFixture(Fixture.dynamicTableDetail);
        unavailableResponse = jsonFromFixture(Fixture.unavailable);
      });

      test('should return an instance of dynamic table if success', () async {
        // arrange
        when(
          () => mockListClient.get<JSON>(
            path,
            queryParams: queryParams,
          ),
        ).thenAnswer((_) async => response);

        // act
        final result = await dataSource.detail(
          variableID: variableID,
          domain: domain,
        );

        // assert
        expect(result.data, isNotNull);
        expect(result.data?.variableID, 31);
        expect(result.data?.title, 'Jumlah Penduduk');
        verify(
          () => mockListClient.get<JSON>(
            path,
            queryParams: queryParams,
          ),
        ).called(1);
      });

      test('should include period filter in query params', () async {
        // arrange
        final queryWithPeriod = {
          ...queryParams,
          QueryParamConstant.period: '99',
        };
        when(
          () => mockListClient.get<JSON>(
            path,
            queryParams: queryWithPeriod,
          ),
        ).thenAnswer((_) async => response);

        // act
        final result = await dataSource.detail(
          variableID: variableID,
          domain: domain,
          period: '99',
        );

        // assert
        expect(result.data, isNotNull);
        verify(
          () => mockListClient.get<JSON>(
            path,
            queryParams: queryWithPeriod,
          ),
        ).called(1);
      });

      test('should include verticalVarID filter in query params', () async {
        // arrange
        final queryWithVervar = {
          ...queryParams,
          'vervar': 7315,
        };
        when(
          () => mockListClient.get<JSON>(
            path,
            queryParams: queryWithVervar,
          ),
        ).thenAnswer((_) async => response);

        // act
        final result = await dataSource.detail(
          variableID: variableID,
          domain: domain,
          verticalVarID: 7315,
        );

        // assert
        expect(result.data, isNotNull);
        verify(
          () => mockListClient.get<JSON>(
            path,
            queryParams: queryWithVervar,
          ),
        ).called(1);
      });

      test('should include derivedVarID filter in query params', () async {
        // arrange
        final queryWithTurvar = {
          ...queryParams,
          'turvar': 1,
        };
        when(
          () => mockListClient.get<JSON>(
            path,
            queryParams: queryWithTurvar,
          ),
        ).thenAnswer((_) async => response);

        // act
        final result = await dataSource.detail(
          variableID: variableID,
          domain: domain,
          derivedVarID: 1,
        );

        // assert
        expect(result.data, isNotNull);
        verify(
          () => mockListClient.get<JSON>(
            path,
            queryParams: queryWithTurvar,
          ),
        ).called(1);
      });

      test('should include derivedPeriodID filter in query params', () async {
        // arrange
        final queryWithTurtahun = {
          ...queryParams,
          'turtahun': 0,
        };
        when(
          () => mockListClient.get<JSON>(
            path,
            queryParams: queryWithTurtahun,
          ),
        ).thenAnswer((_) async => response);

        // act
        final result = await dataSource.detail(
          variableID: variableID,
          domain: domain,
          derivedPeriodID: 0,
        );

        // assert
        expect(result.data, isNotNull);
        verify(
          () => mockListClient.get<JSON>(
            path,
            queryParams: queryWithTurtahun,
          ),
        ).called(1);
      });

      test('should include custom language in query params', () async {
        // arrange
        final queryWithLang = {
          QueryParamConstant.domain: domain,
          QueryParamConstant.lang: DataLanguage.en.value,
        };
        when(
          () => mockListClient.get<JSON>(
            path,
            queryParams: queryWithLang,
          ),
        ).thenAnswer((_) async => response);

        // act
        final result = await dataSource.detail(
          variableID: variableID,
          domain: domain,
          lang: DataLanguage.en,
        );

        // assert
        expect(result.data, isNotNull);
        verify(
          () => mockListClient.get<JSON>(
            path,
            queryParams: queryWithLang,
          ),
        ).called(1);
      });

      test(
        'should throw DynamicTableNotAvailableException when not-available',
        () async {
          // arrange
          when(
            () => mockListClient.get<JSON>(
              path,
              queryParams: queryParams,
            ),
          ).thenAnswer((_) async => unavailableResponse);

          // act
          final result = dataSource.detail(
            variableID: variableID,
            domain: domain,
          );

          // assert
          await expectLater(
            result,
            throwsA(
              isA<DynamicTableNotAvailableException>().having(
                (e) => e.toString(),
                'To string',
                'StadataException - Dynamic Table not available!',
              ),
            ),
          );
          verify(
            () => mockListClient.get<JSON>(
              path,
              queryParams: queryParams,
            ),
          ).called(1);
        },
      );

      test(
        'should throw ApiException when status is Error',
        () async {
          final errorResponse = {
            'status': 'Error',
            'message': 'Something went wrong',
          };
          when(
            () => mockListClient.get<JSON>(
              path,
              queryParams: queryParams,
            ),
          ).thenAnswer((_) async => errorResponse);

          final result = dataSource.detail(
            variableID: variableID,
            domain: domain,
          );

          await expectLater(
            result,
            throwsA(isA<ApiException>()),
          );
          verify(
            () => mockListClient.get<JSON>(
              path,
              queryParams: queryParams,
            ),
          ).called(1);
        },
      );

      test('should not include empty period filter', () async {
        // arrange
        when(
          () => mockListClient.get<JSON>(
            path,
            queryParams: queryParams,
          ),
        ).thenAnswer((_) async => response);

        // act
        final result = await dataSource.detail(
          variableID: variableID,
          domain: domain,
          period: '',
        );

        // assert
        expect(result.data, isNotNull);
        verify(
          () => mockListClient.get<JSON>(
            path,
            queryParams: queryParams,
          ),
        ).called(1);
      });
    });
  });
}
