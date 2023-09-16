import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:stadata_flutter_sdk/src/core/exceptions/exceptions.dart';
import 'package:stadata_flutter_sdk/src/core/network/api_endpoint.dart';
import 'package:stadata_flutter_sdk/src/core/network/http/modules/stadata_list_http_module.dart';
import 'package:stadata_flutter_sdk/src/core/typedef/typedef.dart';
import 'package:stadata_flutter_sdk/src/features/infographics/data/datasources/infographic_remote_data_source.dart';
import 'package:stadata_flutter_sdk/src/features/infographics/data/models/infographic_model.dart';
import 'package:stadata_flutter_sdk/src/shared/data/models/api_response_model.dart';

import '../../../../../fixtures/fixtures.dart';
import '../../../../../helpers/test_injection.dart';

class MockStadataListHttpModule extends Mock implements StadataListHttpModule {}

void main() {
  late StadataListHttpModule mockListHttpModule;
  late InfographicRemoteDataSource dataSource;
  late ApiResponseModel<List<InfographicModel>> infographics;
  late JSON listResponse;
  late JSON listUnavailableResponse;

  setUpAll(
    () {
      mockListHttpModule = MockStadataListHttpModule();
      registerTestLazySingleton<StadataListHttpModule>(mockListHttpModule);
      dataSource = InfographicRemoteDataSourceImpl();

      listResponse = jsonFromFixture(Fixture.infographics.value);
      listUnavailableResponse = jsonFromFixture(Fixture.listUnavailable.value);

      infographics = ApiResponseModel<List<InfographicModel>>.fromJson(
        listResponse,
        (json) {
          if (json is! List) {
            return [];
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
                () => mockListHttpModule.get(
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
                () => mockListHttpModule.get(
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
                () => mockListHttpModule.get(
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
                () => mockListHttpModule.get(
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
