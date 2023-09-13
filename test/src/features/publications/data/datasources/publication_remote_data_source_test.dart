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
  late ApiResponseModel<List<PublicationModel>> publications;
  late ApiResponseModel<PublicationModel> publication;
  late JSON listResponse;
  late JSON singleResponse;
  late JSON listUnavailableResponse;
  late JSON singleUnavailableResponse;
  setUpAll(
    () {
      mockListHttpModule = MockStadataListHttpModule();
      registerTestLazySingleton<StadataListHttpModule>(mockListHttpModule);
      mockViewHttpModule = MockStadataViewHttpModule();
      registerTestLazySingleton<StadataViewHttpModule>(mockViewHttpModule);
      dataSource = PublicationRemoteDataSourceImpl();
      listResponse = jsonFromFixture('publication_fixture_available.json');
      publications = ApiResponseModel<List<PublicationModel>>.fromJson(
        listResponse,
        (json) {
          if (json is! List) {
            return [];
          }

          return json.map((e) => PublicationModel.fromJson(e as JSON)).toList();
        },
      );
      singleResponse = jsonFromFixture('publication_detail_fixture.json');
      publication = ApiResponseModel<PublicationModel>.fromJson(
        singleResponse,
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
      listUnavailableResponse =
          jsonFromFixture('fixture_list_unavailable.json');
      singleUnavailableResponse = jsonFromFixture('fixture_unavailable.json');
    },
  );

  const domain = '7200';

  group(
    'PublicationRemoteDataSource',
    () {
      group(
        'get()',
        () {
          test(
            'should return list of publications if success',
            () async {
              // arrange
              when(
                () => mockListHttpModule
                    .get(ApiEndpoint.publication(domain: domain)),
              ).thenAnswer((_) async => listResponse);

              // act
              final result = await dataSource.get(domain: domain);

              // assert
              expect(result, publications);
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
                (_) async => listUnavailableResponse,
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
              ).thenAnswer((_) async => singleResponse);

              // act
              final result = await dataSource.detail(
                id: id,
                domain: domain,
              );

              // assert
              expect(result, publication);
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
              ).thenAnswer((_) async => singleUnavailableResponse);

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
