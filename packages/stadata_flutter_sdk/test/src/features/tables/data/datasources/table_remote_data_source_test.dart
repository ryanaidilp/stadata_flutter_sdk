import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:stadata_flutter_sdk/src/core/core.dart';
import 'package:stadata_flutter_sdk/src/features/features.dart';
import 'package:stadata_flutter_sdk/src/shared/shared.dart';

import '../../../../../helpers/test_injection.dart';

class MockListNetworkClient extends Mock implements NetworkClient {}

void main() {
  late NetworkClient mockListClient;
  late TableRemoteDataSource dataSource;

  setUpAll(() {
    mockListClient = MockListNetworkClient();
    registerTestFactory<NetworkClient>(
      mockListClient,
      instanceName: 'listClient',
    );
    dataSource = TableRemoteDataSourceImpl();
  });

  tearDownAll(unregisterTestInjection);

  const domain = '7200';
  const id = '123';

  group('TableRemoteDataSource', () {
    group('getTableMetadata()', () {
      final staticQueryParams = {
        QueryParamConstant.domain: domain,
        QueryParamConstant.lang: DataLanguage.id.value,
        QueryParamConstant.page: 1,
      };

      final dynamicQueryParams = {
        QueryParamConstant.domain: domain,
        QueryParamConstant.lang: DataLanguage.id.value,
        QueryParamConstant.page: 1,
      };

      test(
        'should return TableMetadata with static type if found in static endpoint',
        () async {
          // arrange
          final staticTableResponse = {
            'status': 'OK',
            'data-availability': 'available',
            'data': [
              {
                'table_id': id,
                'title': 'Test Static Table',
                'table_source': '1',
              },
            ],
          };
          when(
            () => mockListClient.get<JSON>(
              ApiEndpoint.staticTable,
              queryParams: staticQueryParams,
            ),
          ).thenAnswer((_) async => staticTableResponse);

          // act
          final result = await dataSource.getTableMetadata(
            id: id,
            domain: domain,
          );

          // assert
          expect(result.id, id);
          expect(result.type, TableType.static);
          verify(
            () => mockListClient.get<JSON>(
              ApiEndpoint.staticTable,
              queryParams: staticQueryParams,
            ),
          ).called(1);
        },
      );

      test(
        'should return TableMetadata with dynamic type if found in dynamic endpoint',
        () async {
          // arrange
          // Static endpoint returns empty data
          final staticTableResponse = {
            'status': 'OK',
            'data-availability': 'available',
            'data': <dynamic>[],
          };
          // Dynamic endpoint returns the table - uses 'var' field for ID
          // and sets table_id in the JSON for the model
          final dynamicTableResponse = {
            'status': 'OK',
            'data-availability': 'available',
            'data': [
              {
                'var': id,
                'title': 'Test Dynamic Table',
                'table_id': id,
              },
            ],
          };
          when(
            () => mockListClient.get<JSON>(
              ApiEndpoint.staticTable,
              queryParams: staticQueryParams,
            ),
          ).thenAnswer((_) async => staticTableResponse);
          when(
            () => mockListClient.get<JSON>(
              ApiEndpoint.dynamicTable,
              queryParams: dynamicQueryParams,
            ),
          ).thenAnswer((_) async => dynamicTableResponse);

          // act
          final result = await dataSource.getTableMetadata(
            id: id,
            domain: domain,
          );

          // assert
          expect(result.id, id);
          expect(result.type, TableType.dynamic);
          verify(
            () => mockListClient.get<JSON>(
              ApiEndpoint.staticTable,
              queryParams: staticQueryParams,
            ),
          ).called(1);
          verify(
            () => mockListClient.get<JSON>(
              ApiEndpoint.dynamicTable,
              queryParams: dynamicQueryParams,
            ),
          ).called(1);
        },
      );

      test(
        'should throw TableNotFoundException when table not found in any endpoint',
        () async {
          // arrange
          final emptyResponse = {
            'status': 'OK',
            'data-availability': 'available',
            'data': <dynamic>[],
          };
          when(
            () => mockListClient.get<JSON>(
              ApiEndpoint.staticTable,
              queryParams: staticQueryParams,
            ),
          ).thenAnswer((_) async => emptyResponse);
          when(
            () => mockListClient.get<JSON>(
              ApiEndpoint.dynamicTable,
              queryParams: dynamicQueryParams,
            ),
          ).thenAnswer((_) async => emptyResponse);

          // act
          final result = dataSource.getTableMetadata(
            id: id,
            domain: domain,
          );

          // assert
          await expectLater(
            result,
            throwsA(
              isA<TableNotFoundException>().having(
                (e) => e.message,
                'Message',
                'Table not found in any endpoint!',
              ),
            ),
          );
          verify(
            () => mockListClient.get<JSON>(
              ApiEndpoint.staticTable,
              queryParams: staticQueryParams,
            ),
          );
          verify(
            () => mockListClient.get<JSON>(
              ApiEndpoint.dynamicTable,
              queryParams: dynamicQueryParams,
            ),
          );
        },
      );

      test('should use custom language parameter', () async {
        // arrange
        final customLangQueryParams = {
          QueryParamConstant.domain: domain,
          QueryParamConstant.lang: DataLanguage.en.value,
          QueryParamConstant.page: 1,
        };
        final staticTableResponse = {
          'status': 'OK',
          'data-availability': 'available',
          'data': [
            {
              'table_id': id,
              'title': 'Test Static Table',
              'table_source': '1',
            },
          ],
        };
        when(
          () => mockListClient.get<JSON>(
            ApiEndpoint.staticTable,
            queryParams: customLangQueryParams,
          ),
        ).thenAnswer((_) async => staticTableResponse);

        // act
        final result = await dataSource.getTableMetadata(
          id: id,
          domain: domain,
          lang: DataLanguage.en,
        );

        // assert
        expect(result.id, id);
        verify(
          () => mockListClient.get<JSON>(
            ApiEndpoint.staticTable,
            queryParams: customLangQueryParams,
          ),
        ).called(1);
      });

      test(
        'should continue to dynamic endpoint if static endpoint returns error',
        () async {
          // arrange
          final errorResponse = {
            'status': 'Error',
            'message': 'Something went wrong',
          };
          final dynamicTableResponse = {
            'status': 'OK',
            'data-availability': 'available',
            'data': [
              {
                'var': id,
                'title': 'Test Dynamic Table',
                'table_id': id,
              },
            ],
          };
          when(
            () => mockListClient.get<JSON>(
              ApiEndpoint.staticTable,
              queryParams: staticQueryParams,
            ),
          ).thenAnswer((_) async => errorResponse);
          when(
            () => mockListClient.get<JSON>(
              ApiEndpoint.dynamicTable,
              queryParams: dynamicQueryParams,
            ),
          ).thenAnswer((_) async => dynamicTableResponse);

          // act
          final result = await dataSource.getTableMetadata(
            id: id,
            domain: domain,
          );

          // assert
          expect(result.type, TableType.dynamic);
          verify(
            () => mockListClient.get<JSON>(
              ApiEndpoint.staticTable,
              queryParams: staticQueryParams,
            ),
          );
          verify(
            () => mockListClient.get<JSON>(
              ApiEndpoint.dynamicTable,
              queryParams: dynamicQueryParams,
            ),
          );
        },
      );

      test('should find table using tabel_id key', () async {
        // arrange
        final staticTableResponse = {
          'status': 'OK',
          'data-availability': 'available',
          'data': [
            {
              'tabel_id': id,
              'title': 'Test Static Table',
              'table_source': '1',
            },
          ],
        };
        when(
          () => mockListClient.get<JSON>(
            ApiEndpoint.staticTable,
            queryParams: staticQueryParams,
          ),
        ).thenAnswer((_) async => staticTableResponse);

        // act
        final result = await dataSource.getTableMetadata(
          id: id,
          domain: domain,
        );

        // assert
        expect(result.id, id);
        expect(result.type, TableType.static);
        verify(
          () => mockListClient.get<JSON>(
            ApiEndpoint.staticTable,
            queryParams: staticQueryParams,
          ),
        ).called(1);
      });

      test('should return null when data is null', () async {
        // arrange
        final nullDataResponse = {
          'status': 'OK',
          'data-availability': 'available',
          'data': null,
        };
        final dynamicTableResponse = {
          'status': 'OK',
          'data-availability': 'available',
          'data': [
            {
              'var': id,
              'title': 'Test Dynamic Table',
              'table_id': id,
            },
          ],
        };
        when(
          () => mockListClient.get<JSON>(
            ApiEndpoint.staticTable,
            queryParams: staticQueryParams,
          ),
        ).thenAnswer((_) async => nullDataResponse);
        when(
          () => mockListClient.get<JSON>(
            ApiEndpoint.dynamicTable,
            queryParams: dynamicQueryParams,
          ),
        ).thenAnswer((_) async => dynamicTableResponse);

        // act
        final result = await dataSource.getTableMetadata(
          id: id,
          domain: domain,
        );

        // assert
        expect(result.type, TableType.dynamic);
        verify(
          () => mockListClient.get<JSON>(
            ApiEndpoint.staticTable,
            queryParams: staticQueryParams,
          ),
        );
        verify(
          () => mockListClient.get<JSON>(
            ApiEndpoint.dynamicTable,
            queryParams: dynamicQueryParams,
          ),
        );
      });

      test('should skip non-map items in data array', () async {
        // arrange
        final invalidDataResponse = {
          'status': 'OK',
          'data-availability': 'available',
          'data': ['invalid', null, 123],
        };
        final dynamicTableResponse = {
          'status': 'OK',
          'data-availability': 'available',
          'data': [
            {
              'var': id,
              'title': 'Test Dynamic Table',
              'table_id': id,
            },
          ],
        };
        when(
          () => mockListClient.get<JSON>(
            ApiEndpoint.staticTable,
            queryParams: staticQueryParams,
          ),
        ).thenAnswer((_) async => invalidDataResponse);
        when(
          () => mockListClient.get<JSON>(
            ApiEndpoint.dynamicTable,
            queryParams: dynamicQueryParams,
          ),
        ).thenAnswer((_) async => dynamicTableResponse);

        // act
        final result = await dataSource.getTableMetadata(
          id: id,
          domain: domain,
        );

        // assert
        expect(result.type, TableType.dynamic);
      });
    });
  });
}
