import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:stadata_flutter_sdk/src/core/core.dart';
import 'package:stadata_flutter_sdk/src/features/features.dart';
import 'package:stadata_flutter_sdk/src/shared/shared.dart';

import '../../../../../fixtures/fixtures.dart';
import '../../../../../helpers/test_injection.dart';

class MockNetworkClient extends Mock implements NetworkClient {}

void main() {
  late NetworkClient mockNetworkClient;
  late InfographicRemoteDataSource dataSource;
  late ApiResponseModel<List<InfographicModel>?> infographics;
  late JSON listResponse;
  late JSON listUnavailableResponse;

  setUpAll(
    () {
      mockNetworkClient = MockNetworkClient();
      registerTestFactory<NetworkClient>(
        mockNetworkClient,
        instanceName: 'listClient',
      );
      dataSource = InfographicRemoteDataSourceImpl();

      listResponse = jsonFromFixture(Fixture.infographics);
      listUnavailableResponse = jsonFromFixture(Fixture.listUnavailable);

      infographics = ApiResponseModel<List<InfographicModel>?>.fromJson(
        listResponse,
        (json) {
          if (json == null || json is! List) {
            return null;
          }

          return json.map((e) => InfographicModel.fromJson(e as JSON)).toList();
        },
      );
    },
  );

  tearDownAll(unregisterTestInjection);

  const domain = '7205';

  group(
    'InfographicRemoteDataSource',
    () {
      group(
        'get()',
        () {
          test(
            'should return list of infographics if success',
            () async {
              // arrange
              when(
                () => mockNetworkClient.get<JSON>(
                  ApiEndpoint.infographic(
                    domain: domain,
                  ),
                ),
              ).thenAnswer((_) async => listResponse);

              // act
              final result = await dataSource.get(
                domain: domain,
              );

              // assert
              expect(result, infographics);
              verify(
                () => mockNetworkClient.get<JSON>(
                  ApiEndpoint.infographic(
                    domain: domain,
                  ),
                ),
              ).called(1);
            },
          );

          test(
            'should throw InfographicNotAvailable when list-not-available',
            () async {
              // arrange
              when(
                () => mockNetworkClient.get<JSON>(
                  ApiEndpoint.infographic(
                    domain: domain,
                  ),
                ),
              ).thenAnswer((_) async => listUnavailableResponse);

              // act
              final result = dataSource.get(
                domain: domain,
              );

              // assert
              await expectLater(
                result,
                throwsA(
                  const InfographicNotAvailableException(),
                ),
              );
              verify(
                () => mockNetworkClient.get<JSON>(
                  ApiEndpoint.infographic(
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
