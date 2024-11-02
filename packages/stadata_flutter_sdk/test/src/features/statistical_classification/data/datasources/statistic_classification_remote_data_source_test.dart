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
  late final NetworkClient mockListClient;
  late final NetworkClient mockViewClient;
  late final StatisticClassificationRemoteDataSource dataSource;

  setUpAll(
    () {
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
      dataSource = StatisticClassificationRemoteDataSourceImpl();
    },
  );

  tearDownAll(unregisterTestInjection);

  group(
    'StatisticClassificationRemoteDataSource',
    () {
      group(
        'get()',
        () {
          late ApiResponseModel<List<StatisticClassificationModel>> data;
          late JSON response;
          late JSON unavailableResponse;

          setUp(
            () {
              response = jsonFromFixture(Fixture.statisticClassification);
              unavailableResponse = jsonFromFixture(Fixture.listUnavailable);
              data =
                  ApiResponseModel<List<StatisticClassificationModel>>.fromJson(
                response,
                (json) {
                  if (json is! List) {
                    return [];
                  }

                  final jsonList = json.map((e) => e as Map).toList();

                  final dataList = jsonList
                      .map(
                        JSON.from,
                      )
                      .toList();

                  return dataList
                      .map(
                        (e) => StatisticClassificationModel.fromJson(
                          JSON.from(e['_source'] as Map),
                        ),
                      )
                      .toList();
                },
              );
            },
          );

          test(
            'should return list of statistic classifications if success',
            () async {
              // arrange
              when(
                () => mockListClient.get<JSON>(
                  ApiEndpoint.statisticClassification(
                    type: KBLIType.y2009,
                  ),
                  queryParams: {
                    'lang': DataLanguage.id.value,
                    'page': 1,
                    'perpage': 10,
                  },
                ),
              ).thenAnswer((_) async => response);

              // act
              final result = await dataSource.get(
                type: KBLIType.y2009,
              );

              // assert
              expect(result, equals(data));
              verify(
                () => mockListClient.get<JSON>(
                  ApiEndpoint.statisticClassification(
                    type: KBLIType.y2009,
                  ),
                  queryParams: {
                    'lang': DataLanguage.id.value,
                    'page': 1,
                    'perpage': 10,
                  },
                ),
              ).called(1);
            },
          );

          test(
            'should include level as param when it set',
            () async {
              // arrange
              when(
                () => mockListClient.get<JSON>(
                  ApiEndpoint.statisticClassification(
                    type: KBLIType.y2009,
                  ),
                  queryParams: {
                    'level': KBLILevel.category.value,
                    'lang': DataLanguage.id.value,
                    'page': 1,
                    'perpage': 10,
                  },
                ),
              ).thenAnswer((_) async => response);

              // act
              final result = await dataSource.get(
                type: KBLIType.y2009,
                level: KBLILevel.category,
              );

              // assert
              expect(result, equals(data));
              verify(
                () => mockListClient.get<JSON>(
                  ApiEndpoint.statisticClassification(
                    type: KBLIType.y2009,
                  ),
                  queryParams: {
                    'level': KBLILevel.category.value,
                    'lang': DataLanguage.id.value,
                    'page': 1,
                    'perpage': 10,
                  },
                ),
              ).called(1);
            },
          );

          test(
            'should throw StatisticClassificationNotAvailable'
            ' when list-not-available',
            () async {
              // arrange
              when(
                () => mockListClient.get<JSON>(
                  ApiEndpoint.statisticClassification(
                    type: KBLIType.y2009,
                  ),
                  queryParams: {
                    'lang': DataLanguage.id.value,
                    'page': 1,
                    'perpage': 10,
                  },
                ),
              ).thenAnswer((_) async => unavailableResponse);

              // act
              final result = dataSource.get(
                type: KBLIType.y2009,
              );

              // assert
              await expectLater(
                result,
                throwsA(
                  isA<StatisticClassificationNotAvailableException>().having(
                    (e) => e.message,
                    'Message',
                    'Statistic Classification not available!',
                  ),
                ),
              );
              verify(
                () => mockListClient.get<JSON>(
                  ApiEndpoint.statisticClassification(
                    type: KBLIType.y2009,
                  ),
                  queryParams: {
                    'lang': DataLanguage.id.value,
                    'page': 1,
                    'perpage': 10,
                  },
                ),
              ).called(1);
            },
          );
        },
      );

      group(
        'detail()',
        () {
          const id = 'kbli2020_id';
          late ApiResponseModel<List<StatisticClassificationModel>> data;
          late JSON response;
          late JSON unavailableResponse;

          setUp(
            () {
              response = jsonFromFixture(Fixture.statisticClassificationDetail);
              unavailableResponse = jsonFromFixture(Fixture.unavailable);
              data =
                  ApiResponseModel<List<StatisticClassificationModel>>.fromJson(
                response,
                (json) {
                  if (json is! List) {
                    return [];
                  }

                  final jsonList = json.map((e) => e as Map).toList();

                  final dataList = jsonList
                      .map(
                        JSON.from,
                      )
                      .toList();

                  return dataList
                      .map(
                        (e) => StatisticClassificationModel.fromJson(
                          JSON.from(e['_source'] as Map),
                        ),
                      )
                      .toList();
                },
              );
            },
          );

          test(
            'should return list of statistic classifications if success',
            () async {
              // arrange
              when(
                () => mockViewClient.get<JSON>(
                  ApiEndpoint.statisticClassification(
                    type: KBLIType.y2009,
                  ),
                  queryParams: {
                    'id': id,
                    'lang': DataLanguage.id.value,
                    'page': 1,
                    'perpage': 10,
                  },
                ),
              ).thenAnswer((_) async => response);

              // act
              final result = await dataSource.detail(
                id: id,
                type: KBLIType.y2009,
              );

              // assert
              expect(result, equals(data));
              verify(
                () => mockViewClient.get<JSON>(
                  ApiEndpoint.statisticClassification(
                    type: KBLIType.y2009,
                  ),
                  queryParams: {
                    'id': id,
                    'lang': DataLanguage.id.value,
                    'page': 1,
                    'perpage': 10,
                  },
                ),
              ).called(1);
            },
          );

          test(
            'should throw StatisticClassificationNotAvailable'
            ' when not-available',
            () async {
              // arrange
              when(
                () => mockViewClient.get<JSON>(
                  ApiEndpoint.statisticClassification(
                    type: KBLIType.y2009,
                  ),
                  queryParams: {
                    'id': id,
                    'lang': DataLanguage.id.value,
                    'page': 1,
                    'perpage': 10,
                  },
                ),
              ).thenAnswer((_) async => unavailableResponse);

              // act
              final result = dataSource.detail(
                id: id,
                type: KBLIType.y2009,
              );

              // assert
              await expectLater(
                result,
                throwsA(
                  isA<StatisticClassificationNotAvailableException>().having(
                    (e) => e.message,
                    'Message',
                    'Statistic Classification not available!',
                  ),
                ),
              );
              verify(
                () => mockViewClient.get<JSON>(
                  ApiEndpoint.statisticClassification(
                    type: KBLIType.y2009,
                  ),
                  queryParams: {
                    'id': id,
                    'lang': DataLanguage.id.value,
                    'page': 1,
                    'perpage': 10,
                  },
                ),
              ).called(1);
            },
          );
        },
      );
    },
  );
}
