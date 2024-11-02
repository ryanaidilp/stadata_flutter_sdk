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
  late PressReleaseRemoteDataSource dataSource;

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
      dataSource = PressReleaseRemoteDataSourceImpl();
    },
  );

  tearDownAll(unregisterTestInjection);

  const domain = '7200';

  group(
    'PressReleaseRemoteDataSource',
    () {
      group(
        'get()',
        () {
          late ApiResponseModel<List<PressReleaseModel>?> data;
          late JSON response;
          late JSON unavailableResponse;
          setUp(
            () {
              response = jsonFromFixture(Fixture.pressReleases);
              unavailableResponse = jsonFromFixture(
                Fixture.listUnavailable,
              );

              data = ApiResponseModel<List<PressReleaseModel>?>.fromJson(
                response,
                (json) {
                  if (json == null || json is! List) {
                    return null;
                  }

                  return json
                      .map((e) => PressReleaseModel.fromJson(e as JSON))
                      .toList();
                },
              );
            },
          );
          test(
            'should return list of press releases if success',
            () async {
              // arrange
              when(
                () => mockListClient
                    .get<JSON>(ApiEndpoint.pressReleases(domain: domain)),
              ).thenAnswer((_) async => response);

              // act
              final result = await dataSource.get(domain: domain);

              // assert
              expect(result, equals(data));
              verify(
                () => mockListClient
                    .get<JSON>(ApiEndpoint.pressReleases(domain: domain)),
              ).called(1);
            },
          );

          test(
            'should throw PressReleaseNotAvailable when list-not-available',
            () async {
              when(
                () => mockListClient.get<JSON>(
                  ApiEndpoint.pressReleases(
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
                  const PressReleaseNotAvailableException(),
                ),
              );
              verify(
                () => mockListClient.get<JSON>(
                  ApiEndpoint.pressReleases(
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
          const id = 1234;

          late JSON response;
          late JSON unavailableResponse;
          late ApiResponseModel<PressReleaseModel?> data;

          setUp(
            () {
              response = jsonFromFixture(Fixture.pressReleaseDetail);
              unavailableResponse = jsonFromFixture(Fixture.unavailable);
              data = ApiResponseModel<PressReleaseModel?>.fromJson(
                response,
                (json) {
                  if (json == null) {
                    return null;
                  }

                  return PressReleaseModel.fromJson(json as JSON);
                },
              );
            },
          );

          test(
            'should return an instance of press release if success',
            () async {
              // arrange
              when(
                () => mockViewClient.get<JSON>(
                  ApiEndpoint.pressReleaseDetail(
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
                () => mockViewClient.get<JSON>(
                  ApiEndpoint.pressReleaseDetail(
                    id: id,
                    domain: domain,
                  ),
                ),
              ).called(1);
            },
          );

          test(
            'should thrown a PressReleaseNotAvailableException when failed',
            () async {
              // arrange
              when(
                () => mockViewClient.get<JSON>(
                  ApiEndpoint.pressReleaseDetail(
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
                  const PressReleaseNotAvailableException(),
                ),
              );
              verify(
                () => mockViewClient.get<JSON>(
                  ApiEndpoint.pressReleaseDetail(
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
