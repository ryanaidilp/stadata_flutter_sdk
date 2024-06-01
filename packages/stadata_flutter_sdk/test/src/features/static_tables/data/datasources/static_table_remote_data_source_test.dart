import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:stadata_flutter_sdk/src/core/exceptions/exceptions.dart';
import 'package:stadata_flutter_sdk/src/core/network/api_endpoint.dart';
import 'package:stadata_flutter_sdk/src/core/network/http/modules/stadata_list_http_module.dart';
import 'package:stadata_flutter_sdk/src/core/network/http/modules/stadata_view_http_module.dart';
import 'package:stadata_flutter_sdk/src/core/typedef/typedef.dart';
import 'package:stadata_flutter_sdk/src/features/features.dart';
import 'package:stadata_flutter_sdk/src/shared/shared.dart';

import '../../../../../fixtures/fixtures.dart';
import '../../../../../helpers/test_injection.dart';

class MockStadataListHttpModule extends Mock implements StadataListHttpModule {}

class MockStadataViewHttpModule extends Mock implements StadataViewHttpModule {}

void main() {
  late StadataListHttpModule mockListHttpModule;
  late StadataViewHttpModule mockViewHttpModule;
  late StaticTableRemoteDataSource dataSource;

  setUpAll(
    () {
      mockListHttpModule = MockStadataListHttpModule();
      registerTestLazySingleton<StadataListHttpModule>(mockListHttpModule);
      mockViewHttpModule = MockStadataViewHttpModule();
      registerTestLazySingleton<StadataViewHttpModule>(mockViewHttpModule);
      dataSource = StaticTableRemoteDataSourceImpl();
    },
  );

  tearDownAll(unregisterTestInjection);

  const domain = '7315';

  group(
    'StaticTableRemoteDataSource',
    () {
      group(
        'get()',
        () {
          late ApiResponseModel<List<StaticTableModel>?> data;
          late JSON response;
          late JSON unavailableResponse;
          setUp(
            () {
              response = jsonFromFixture(Fixture.staticTables);
              unavailableResponse = jsonFromFixture(
                Fixture.listUnavailable,
              );
              data = ApiResponseModel<List<StaticTableModel>?>.fromJson(
                response,
                (json) {
                  if (json == null || json is! List) {
                    return null;
                  }

                  return json
                      .map((e) => StaticTableModel.fromJson(e as JSON))
                      .toList();
                },
              );
            },
          );
          test(
            'should return list of static tables if success',
            () async {
              // arrange
              when(
                () => mockListHttpModule
                    .get(ApiEndpoint.staticTable(domain: domain)),
              ).thenAnswer((_) async => response);

              // act
              final result = await dataSource.get(domain: domain);

              // assert
              expect(result, equals(data));
              verify(
                () => mockListHttpModule
                    .get(ApiEndpoint.staticTable(domain: domain)),
              ).called(1);
            },
          );

          test(
            'should throw StaticTableNotAvailable when list-not-available',
            () async {
              when(
                () => mockListHttpModule.get(
                  ApiEndpoint.staticTable(
                    domain: domain,
                  ),
                ),
              ).thenAnswer(
                (_) async => unavailableResponse,
              );

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
                () => mockListHttpModule.get(
                  ApiEndpoint.staticTable(
                    domain: domain,
                  ),
                ),
              ).called(1);
            },
          );
        },
      );
      group(
        'detail()',
        () {
          const id = 123;
          late ApiResponseModel<StaticTableModel?> data;
          late JSON response;
          late JSON unavailableResponse;
          setUp(
            () {
              response = jsonFromFixture(Fixture.staticTableDetail);
              data = ApiResponseModel<StaticTableModel?>.fromJson(
                response,
                (json) {
                  if (json == null) {
                    return null;
                  }

                  return StaticTableModel.fromJson(json as JSON);
                },
              );

              unavailableResponse = jsonFromFixture(Fixture.unavailable);
            },
          );

          test(
            'should return an instance of static table if success',
            () async {
              // arrange
              when(
                () => mockViewHttpModule.get(
                  ApiEndpoint.staticTableDetail(
                    id: id,
                    domain: domain,
                  ),
                ),
              ).thenAnswer((_) async => response);

              // act
              final result = await dataSource.detail(
                id: id,
                domain: domain,
              );

              // assert
              expect(result, equals(data));
              verify(
                () => mockViewHttpModule.get(
                  ApiEndpoint.staticTableDetail(
                    id: id,
                    domain: domain,
                  ),
                ),
              ).called(1);
            },
          );

          test(
            'should thrown a StaticTableNotAvailable when failed',
            () async {
              // arrange
              when(
                () => mockViewHttpModule.get(
                  ApiEndpoint.staticTableDetail(
                    id: id,
                    domain: domain,
                  ),
                ),
              ).thenAnswer((_) async => unavailableResponse);

              // act
              final result = dataSource.detail(
                id: id,
                domain: domain,
              );

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
                () => mockViewHttpModule.get(
                  ApiEndpoint.staticTableDetail(
                    id: id,
                    domain: domain,
                  ),
                ),
              ).called(1);
            },
          );
        },
      );
    },
  );
}
