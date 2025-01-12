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
  late PublicationRemoteDataSource dataSource;

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
      dataSource = PublicationRemoteDataSourceImpl();
    },
  );

  tearDownAll(unregisterTestInjection);

  const domain = '7200';

  group(
    'PublicationRemoteDataSource',
    () {
      group(
        'get()',
        () {
          final queryParams = {
            QueryParamConstant.page: 1,
            QueryParamConstant.domain: domain,
            QueryParamConstant.lang: DataLanguage.id.value,
          };

          late ApiResponseModel<List<PublicationModel>?> data;
          late JSON response;
          late JSON unavailableResponse;
          setUp(
            () {
              response = jsonFromFixture(Fixture.publications);
              unavailableResponse = jsonFromFixture(
                Fixture.listUnavailable,
              );

              data = ApiResponseModel<List<PublicationModel>?>.fromJson(
                response,
                (json) {
                  if (json == null || json is! List) {
                    return null;
                  }

                  return json
                      .map((e) => PublicationModel.fromJson(e as JSON))
                      .toList();
                },
              );
            },
          );
          test(
            'should return list of publications if success',
            () async {
              // arrange
              when(
                () => mockListClient.get<JSON>(
                  ApiEndpoint.publication,
                  queryParams: queryParams,
                ),
              ).thenAnswer((_) async => response);

              // act
              final result = await dataSource.get(domain: domain);

              // assert
              expect(result, equals(data));
              verify(
                () => mockListClient.get<JSON>(
                  ApiEndpoint.publication,
                  queryParams: queryParams,
                ),
              ).called(1);
            },
          );

          test(
            'should throw PublicationNotAvailable when list-not-available',
            () async {
              when(
                () => mockListClient.get<JSON>(
                  ApiEndpoint.publication,
                  queryParams: queryParams,
                ),
              ).thenAnswer(
                (_) async => unavailableResponse,
              );

              final result = dataSource.get(domain: domain);

              await expectLater(
                result,
                throwsA(
                  const PublicationNotAvailableException(),
                ),
              );
              verify(
                () => mockListClient.get<JSON>(
                  ApiEndpoint.publication,
                  queryParams: queryParams,
                ),
              ).called(1);
            },
          );
        },
      );

      group(
        'detail()',
        () {
          const id = '3da8ga08301adg';

          final queryParams = {
            QueryParamConstant.id: id,
            QueryParamConstant.domain: domain,
            QueryParamConstant.lang: DataLanguage.id.value,
          };

          late JSON response;
          late JSON unavailableResponse;
          late ApiResponseModel<PublicationModel?> data;

          setUp(
            () {
              response = jsonFromFixture(Fixture.publicationDetail);
              unavailableResponse = jsonFromFixture(Fixture.unavailable);
              data = ApiResponseModel<PublicationModel?>.fromJson(
                response,
                (json) {
                  if (json == null) {
                    return null;
                  }

                  return PublicationModel.fromJson(json as JSON);
                },
              );
            },
          );

          test(
            'should return an instance of publications if success',
            () async {
              // arrange
              when(
                () => mockViewClient.get<JSON>(
                  ApiEndpoint.publication,
                  queryParams: queryParams,
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
                  ApiEndpoint.publication,
                  queryParams: queryParams,
                ),
              ).called(1);
            },
          );

          test(
            'should thrown a PublicationNotAvailableException when failed',
            () async {
              // arrange
              when(
                () => mockViewClient.get<JSON>(
                  ApiEndpoint.publication,
                  queryParams: queryParams,
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
                  const PublicationNotAvailableException(),
                ),
              );
              verify(
                () => mockViewClient.get<JSON>(
                  ApiEndpoint.publication,
                  queryParams: queryParams,
                ),
              ).called(1);
            },
          );
        },
      );
    },
  );
}
