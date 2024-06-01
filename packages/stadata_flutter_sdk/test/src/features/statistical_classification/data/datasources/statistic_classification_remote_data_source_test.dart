import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:stadata_flutter_sdk/src/core/network/api_endpoint.dart';
import 'package:stadata_flutter_sdk/src/core/network/http/modules/stadata_list_http_module.dart';
import 'package:stadata_flutter_sdk/src/core/network/http/modules/stadata_view_http_module.dart';
import 'package:stadata_flutter_sdk/src/core/typedef/typedef.dart';
import 'package:stadata_flutter_sdk/src/features/statistical_classification/statistical_classification.dart';
import 'package:stadata_flutter_sdk/src/shared/data/models/api_response_model.dart';
import 'package:stadata_flutter_sdk/stadata_flutter_sdk.dart';

import '../../../../../fixtures/fixtures.dart';
import '../../../../../helpers/test_injection.dart';

class MockStadataListHttpModule extends Mock implements StadataListHttpModule {}

class MockStadataViewHttpModule extends Mock implements StadataViewHttpModule {}

void main() {
  late final StadataListHttpModule mockListHttpModule;
  late final StadataViewHttpModule mockViewHttpModule;
  late final StatisticClassificationRemoteDataSource dataSource;

  setUpAll(
    () {
      mockListHttpModule = MockStadataListHttpModule();
      registerTestLazySingleton<StadataListHttpModule>(mockListHttpModule);
      mockViewHttpModule = MockStadataViewHttpModule();
      registerTestLazySingleton<StadataViewHttpModule>(mockViewHttpModule);
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
                () => mockListHttpModule.get(
                  ApiEndpoint.statisticClassification(
                    type: KBLIType.y2009,
                  ),
                  param: {
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
                () => mockListHttpModule.get(
                  ApiEndpoint.statisticClassification(
                    type: KBLIType.y2009,
                  ),
                  param: {
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
                () => mockListHttpModule.get(
                  ApiEndpoint.statisticClassification(
                    type: KBLIType.y2009,
                  ),
                  param: {
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
                () => mockListHttpModule.get(
                  ApiEndpoint.statisticClassification(
                    type: KBLIType.y2009,
                  ),
                  param: {
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
                () => mockListHttpModule.get(
                  ApiEndpoint.statisticClassification(
                    type: KBLIType.y2009,
                  ),
                  param: {
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
                () => mockListHttpModule.get(
                  ApiEndpoint.statisticClassification(
                    type: KBLIType.y2009,
                  ),
                  param: {
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
                () => mockViewHttpModule.get(
                  ApiEndpoint.statisticClassification(
                    type: KBLIType.y2009,
                  ),
                  param: {
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
                () => mockViewHttpModule.get(
                  ApiEndpoint.statisticClassification(
                    type: KBLIType.y2009,
                  ),
                  param: {
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
                () => mockViewHttpModule.get(
                  ApiEndpoint.statisticClassification(
                    type: KBLIType.y2009,
                  ),
                  param: {
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
                () => mockViewHttpModule.get(
                  ApiEndpoint.statisticClassification(
                    type: KBLIType.y2009,
                  ),
                  param: {
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
