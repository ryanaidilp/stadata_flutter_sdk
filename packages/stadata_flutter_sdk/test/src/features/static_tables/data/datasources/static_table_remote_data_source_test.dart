import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:stadata_flutter_sdk/src/core/core.dart';
import 'package:stadata_flutter_sdk/src/features/features.dart';
import 'package:stadata_flutter_sdk/src/shared/shared.dart';

import '../../../../../fixtures/fixtures.dart';
import '../../../../../helpers/test_injection.dart';

class MockListNetworkClient extends Mock implements NetworkClient {}

class MockViewNetworkClient extends Mock implements NetworkClient {}

void main() {
  late NetworkClient mockListClient;
  late NetworkClient mockViewClient;
  late StaticTableRemoteDataSource dataSource;

  setUpAll(() {
    mockListClient = MockListNetworkClient();
    registerTestFactory<NetworkClient>(
      mockListClient,
      instanceName: 'listClient',
    );
    mockViewClient = MockViewNetworkClient();
    registerTestFactory<NetworkClient>(
      mockViewClient,
      instanceName: 'viewClient',
    );
    dataSource = StaticTableRemoteDataSourceImpl();
  });

  tearDownAll(unregisterTestInjection);

  const domain = '7315';

  group('StaticTableRemoteDataSource', () {
    group('get()', () {
      final queryParams = {
        QueryParamConstant.page: 1,
        QueryParamConstant.domain: domain,
        QueryParamConstant.lang: DataLanguage.id.value,
      };

      late ApiResponseModel<List<StaticTableModel>?> data;
      late JSON response;
      late JSON unavailableResponse;
      setUp(() {
        response = jsonFromFixture(Fixture.staticTables);
        unavailableResponse = jsonFromFixture(Fixture.listUnavailable);
        data = ApiResponseModel<List<StaticTableModel>?>.fromJson(response, (
          json,
        ) {
          if (json == null || json is! List) {
            return null;
          }

          return json.map((e) => StaticTableModel.fromJson(e as JSON)).toList();
        });
      });
      test('should return list of static tables if success', () async {
        // arrange
        when(
          () => mockListClient.get<JSON>(
            ApiEndpoint.staticTable,
            queryParams: queryParams,
          ),
        ).thenAnswer((_) async => response);

        // act
        final result = await dataSource.get(domain: domain);

        // assert
        expect(result, equals(data));
        verify(
          () => mockListClient.get<JSON>(
            ApiEndpoint.staticTable,
            queryParams: queryParams,
          ),
        ).called(1);
      });

      test(
        'should throw StaticTableNotAvailable when list-not-available',
        () async {
          when(
            () => mockListClient.get<JSON>(
              ApiEndpoint.staticTable,
              queryParams: queryParams,
            ),
          ).thenAnswer((_) async => unavailableResponse);

          final result = dataSource.get(domain: domain);

          await expectLater(
            result,
            throwsA(
              isA<StaticTableNotAvailableException>().having(
                (e) => e.message,
                'Message',
                'Static Table not available!',
              ),
            ),
          );
          verify(
            () => mockListClient.get<JSON>(
              ApiEndpoint.staticTable,
              queryParams: queryParams,
            ),
          ).called(1);
        },
      );
    });
    group('detail()', () {
      const id = 123;
      final queryParams = {
        QueryParamConstant.id: id,
        QueryParamConstant.domain: domain,
        QueryParamConstant.lang: DataLanguage.id.value,
      };
      late ApiResponseModel<StaticTableModel?> data;
      late JSON response;
      late JSON unavailableResponse;
      setUp(() {
        response = jsonFromFixture(Fixture.staticTableDetail);
        data = ApiResponseModel<StaticTableModel?>.fromJson(response, (json) {
          if (json == null) {
            return null;
          }

          return StaticTableModel.fromJson(json as JSON);
        });

        unavailableResponse = jsonFromFixture(Fixture.unavailable);
      });

      test('should return an instance of static table if success', () async {
        // arrange
        when(
          () => mockViewClient.get<JSON>(
            ApiEndpoint.staticTable,
            queryParams: queryParams,
          ),
        ).thenAnswer((_) async => response);

        // act
        final result = await dataSource.detail(id: id, domain: domain);

        // assert
        expect(result, equals(data));
        verify(
          () => mockViewClient.get<JSON>(
            ApiEndpoint.staticTable,
            queryParams: queryParams,
          ),
        ).called(1);
      });

      test('should thrown a StaticTableNotAvailable when failed', () async {
        // arrange
        when(
          () => mockViewClient.get<JSON>(
            ApiEndpoint.staticTable,
            queryParams: queryParams,
          ),
        ).thenAnswer((_) async => unavailableResponse);

        // act
        final result = dataSource.detail(id: id, domain: domain);

        // assert
        await expectLater(
          result,
          throwsA(
            isA<StaticTableNotAvailableException>().having(
              (e) => e.toString(),
              'To string',
              'StadataException - Static Table not available!',
            ),
          ),
        );
        verify(
          () => mockViewClient.get<JSON>(
            ApiEndpoint.staticTable,
            queryParams: queryParams,
          ),
        ).called(1);
      });
    });
  });
}
