import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:stadata_flutter_sdk/src/core/exceptions/exceptions.dart';
import 'package:stadata_flutter_sdk/src/core/network/api_endpoint.dart';
import 'package:stadata_flutter_sdk/src/core/network/http/modules/stadata_list_http_module.dart';
import 'package:stadata_flutter_sdk/src/core/network/http/modules/stadata_view_http_module.dart';
import 'package:stadata_flutter_sdk/src/core/typedef/typedef.dart';
import 'package:stadata_flutter_sdk/src/features/publications/data/datasources/publication_remote_data_source.dart';
import 'package:stadata_flutter_sdk/src/features/publications/data/models/publication_model.dart';
import 'package:stadata_flutter_sdk/src/shared/data/models/api_response_model.dart';

import '../../../../../fixtures/fixtures.dart';
import '../../../../../helpers/test_injection.dart';

class MockStadataListHttpModule extends Mock implements StadataListHttpModule {}

class MockStadataViewHttpModule extends Mock implements StadataViewHttpModule {}

void main() {
  late StadataListHttpModule mockListHttpModule;
  late StadataViewHttpModule mockViewHttpModule;
  late PublicationRemoteDataSource dataSource;

  setUpAll(
    () {
      mockListHttpModule = MockStadataListHttpModule();
      registerTestLazySingleton<StadataListHttpModule>(mockListHttpModule);
      mockViewHttpModule = MockStadataViewHttpModule();
      registerTestLazySingleton<StadataViewHttpModule>(mockViewHttpModule);
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
          late ApiResponseModel<List<PublicationModel>> data;
          late JSON response;
          late JSON unavailableResponse;
          setUp(
            () {
              response = jsonFromFixture(Fixture.publications.value);
              unavailableResponse = jsonFromFixture(
                Fixture.listUnavailable.value,
              );

              data = ApiResponseModel<List<PublicationModel>>.fromJson(
                response,
                (json) {
                  if (json is! List) {
                    return [];
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
                () => mockListHttpModule
                    .get(ApiEndpoint.publication(domain: domain)),
              ).thenAnswer((_) async => response);

              // act
              final result = await dataSource.get(domain: domain);

              // assert
              expect(result, equals(data));
              verify(
                () => mockListHttpModule
                    .get(ApiEndpoint.publication(domain: domain)),
              ).called(1);
            },
          );

          test(
            'should throw PublicationNotAvailable when list-not-available',
            () async {
              when(
                () => mockListHttpModule.get(
                  ApiEndpoint.publication(
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
                  const PublicationNotAvailableException(),
                ),
              );
              verify(
                () => mockListHttpModule.get(
                  ApiEndpoint.publication(
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
          const id = '3da8ga08301adg';

          late JSON response;
          late JSON unavailableResponse;
          late ApiResponseModel<PublicationModel> data;

          setUp(
            () {
              response = jsonFromFixture(Fixture.publicationDetail.value);
              unavailableResponse = jsonFromFixture(Fixture.unavailable.value);
              data = ApiResponseModel<PublicationModel>.fromJson(
                response,
                (json) {
                  if (json == null) {
                    return PublicationModel(
                      id: '',
                      title: '',
                      issn: '',
                      cover: '',
                      pdf: '',
                      size: '',
                    );
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
                () => mockViewHttpModule.get(
                  ApiEndpoint.publicationDetail(
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
                  ApiEndpoint.publicationDetail(
                    id: id,
                    domain: domain,
                  ),
                ),
              ).called(1);
            },
          );

          test(
            'should thrown a PublicationNotAvailableException when failed',
            () async {
              // arrange
              when(
                () => mockViewHttpModule.get(
                  ApiEndpoint.publicationDetail(
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
                  const PublicationNotAvailableException(),
                ),
              );
              verify(
                () => mockViewHttpModule.get(
                  ApiEndpoint.publicationDetail(
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
