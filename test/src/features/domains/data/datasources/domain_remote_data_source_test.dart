import 'package:flutter_test/flutter_test.dart';

import 'package:mocktail/mocktail.dart';
import 'package:stadata_flutter_sdk/src/core/exceptions/exceptions.dart';
import 'package:stadata_flutter_sdk/src/core/network/api_endpoint.dart';
import 'package:stadata_flutter_sdk/src/core/network/http/modules/stadata_http_module.dart';
import 'package:stadata_flutter_sdk/src/core/typedef/typedef.dart';
import 'package:stadata_flutter_sdk/src/features/domains/data/datasources/domain_remote_data_source.dart';
import 'package:stadata_flutter_sdk/src/features/domains/data/models/domain_model.dart';
import 'package:stadata_flutter_sdk/src/features/domains/domain/enums/domain_type.dart';
import 'package:stadata_flutter_sdk/src/shared/data/models/api_response_model.dart';

import '../../../../../fixtures/fixtures.dart';
import '../../../../../helpers/test_injection.dart';

class MockStadataHttpModule extends Mock implements StadataHttpModule {}

void main() {
  late StadataHttpModule mockHttpModule;
  late DomainRemoteDataSource dataSource;
  late ApiResponseModel<List<DomainModel>> domains;
  late JSON response;
  late JSON unavailableResponse;

  setUpAll(
    () {
      mockHttpModule = MockStadataHttpModule();
      registerTestLazySingleton<StadataHttpModule>(mockHttpModule);
      dataSource = DomainRemoteDataSourceImpl();

      response = jsonFromFixture(Fixture.domains.value);
      unavailableResponse = jsonFromFixture(Fixture.listUnavailable.value);

      domains = ApiResponseModel<List<DomainModel>>.fromJson(
        response,
        (json) {
          if (json is! List) {
            return [];
          }

          return json.map((e) => DomainModel.fromJson(e as JSON)).toList();
        },
      );
    },
  );

  tearDownAll(unregisterTestInjection);

  group(
    'DomainRemoteDataSource',
    () {
      group(
        'get()',
        () {
          test(
            'should return List of domains if success',
            () async {
              when(
                () => mockHttpModule.get(ApiEndpoint.domain()),
              ).thenAnswer(
                (_) async => response,
              );

              final result = await dataSource.get(type: DomainType.all);

              expect(result, equals(domains));
              verify(
                () => mockHttpModule.get(ApiEndpoint.domain()),
              ).called(1);
            },
          );

          test(
            'should throw DomainNotAvailableException when list-not-available',
            () async {
              when(
                () => mockHttpModule.get(ApiEndpoint.domain()),
              ).thenAnswer(
                (_) async => unavailableResponse,
              );

              final result = dataSource.get(type: DomainType.all);

              await expectLater(
                result,
                throwsA(
                  const DomainNotAvailableException(),
                ),
              );
              verify(
                () => mockHttpModule.get(ApiEndpoint.domain()),
              ).called(1);
            },
          );
          test(
            'should throw DomainProvinceCodeException when type '
            'is regencyByProv but provinceCode is null',
            () async {
              final result = dataSource.get(type: DomainType.regencyByProvince);

              await expectLater(
                result,
                throwsA(
                  const DomainProvinceCodeException(),
                ),
              );
            },
          );
        },
      );
    },
  );
}
