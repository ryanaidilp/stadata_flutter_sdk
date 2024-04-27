import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:stadata_flutter_sdk/src/core/network/api_endpoint.dart';
import 'package:stadata_flutter_sdk/src/core/network/http/modules/stadata_list_http_module.dart';
import 'package:stadata_flutter_sdk/src/core/typedef/typedef.dart';
import 'package:stadata_flutter_sdk/src/features/strategic_indicators/data/datasources/strategic_indicator_remote_data_source.dart';
import 'package:stadata_flutter_sdk/src/features/strategic_indicators/data/models/strategic_indicator_model.dart';
import 'package:stadata_flutter_sdk/src/shared/data/models/api_response_model.dart';
import 'package:stadata_flutter_sdk/stadata_flutter_sdk.dart';

import '../../../../../fixtures/fixtures.dart';
import '../../../../../helpers/test_injection.dart';

class MockStadataListHttpModule extends Mock implements StadataListHttpModule {}

void main() {
  late StadataListHttpModule mockListHttpModule;
  late StrategicIndicatorRemoteDataSource dataSource;

  setUpAll(
    () {
      mockListHttpModule = MockStadataListHttpModule();
      registerTestLazySingleton<StadataListHttpModule>(mockListHttpModule);
      dataSource = StrategicIndicatorRemoteDataSourceImpl();
    },
  );

  tearDownAll(unregisterTestInjection);

  const domain = '7315';

  group(
    'StrategicIndicatorRemoteDataSource',
    () {
      group(
        'get()',
        () {
          late ApiResponseModel<List<StrategicIndicatorModel>?> data;
          late JSON response;
          late JSON unavailableResponse;
          setUp(
            () {
              response = jsonFromFixture(Fixture.strategicIndicators);
              unavailableResponse = jsonFromFixture(
                Fixture.listUnavailable,
              );
              data = ApiResponseModel<List<StrategicIndicatorModel>?>.fromJson(
                response,
                (json) {
                  if (json == null || json is! List) {
                    return null;
                  }

                  return json
                      .map((e) => StrategicIndicatorModel.fromJson(e as JSON))
                      .toList();
                },
              );
            },
          );
          test(
            'should return list of strategic indicators if success',
            () async {
              // arrange
              when(
                () => mockListHttpModule
                    .get(ApiEndpoint.strategicIndicators(domain: domain)),
              ).thenAnswer((_) async => response);

              // act
              final result = await dataSource.get(domain: domain);

              // assert
              expect(result, equals(data));
              verify(
                () => mockListHttpModule
                    .get(ApiEndpoint.strategicIndicators(domain: domain)),
              ).called(1);
            },
          );

          test(
            'should throw StrategicIndicatorNotAvailableException'
            ' when list-not-available',
            () async {
              when(
                () => mockListHttpModule.get(
                  ApiEndpoint.strategicIndicators(
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
                  isA<StrategicIndicatorNotAvailableException>().having(
                    (e) => e.message,
                    'Message',
                    'Strategic Indicator not available!',
                  ),
                ),
              );
              verify(
                () => mockListHttpModule.get(
                  ApiEndpoint.strategicIndicators(
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
