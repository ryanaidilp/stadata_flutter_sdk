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
  late StrategicIndicatorRemoteDataSource dataSource;

  setUpAll(
    () {
      mockListClient = MockNetworkClient();
      registerTestFactory<NetworkClient>(
        mockListClient,
        instanceName: 'listClient',
      );
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
                () => mockListClient
                    .get<JSON>(ApiEndpoint.strategicIndicators(domain: domain)),
              ).thenAnswer((_) async => response);

              // act
              final result = await dataSource.get(domain: domain);

              // assert
              expect(result, equals(data));
              verify(
                () => mockListClient
                    .get<JSON>(ApiEndpoint.strategicIndicators(domain: domain)),
              ).called(1);
            },
          );

          test(
            'should throw StrategicIndicatorNotAvailableException'
            ' when list-not-available',
            () async {
              when(
                () => mockListClient.get<JSON>(
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
                () => mockListClient.get<JSON>(
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
