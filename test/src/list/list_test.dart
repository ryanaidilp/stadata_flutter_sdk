import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:stadata_flutter_sdk/src/core/failures/failures.dart';
import 'package:stadata_flutter_sdk/src/core/typedef/typedef.dart';
import 'package:stadata_flutter_sdk/src/features/domains/data/models/domain_model.dart';
import 'package:stadata_flutter_sdk/src/features/domains/domain/usecases/get_domains.dart';
import 'package:stadata_flutter_sdk/src/features/infographics/data/models/infographic_model.dart';
import 'package:stadata_flutter_sdk/src/features/infographics/domain/usecases/get_all_infographics.dart';
import 'package:stadata_flutter_sdk/src/features/publications/data/models/publication_model.dart';
import 'package:stadata_flutter_sdk/src/features/publications/domain/usecases/get_all_publication.dart';
import 'package:stadata_flutter_sdk/src/list/list.dart';
import 'package:stadata_flutter_sdk/src/shared/data/models/api_response_model.dart';
import 'package:stadata_flutter_sdk/src/shared/data/models/pagination_model.dart';
import 'package:stadata_flutter_sdk/src/shared/domain/entities/api_response.dart';
import 'package:stadata_flutter_sdk/stadata_flutter_sdk.dart';

import '../../fixtures/fixtures.dart';
import '../../helpers/test_injection.dart';

class MockGetDomains extends Mock implements GetDomains {}

class MockGetAllPublication extends Mock implements GetAllPublication {}

class MockGetAllInfographics extends Mock implements GetAllInfographics {}

void main() {
  late GetDomains mockGetDomains;
  late GetAllPublication mockGetAllPublication;
  late GetAllInfographics mockGetAllInfographics;
  late StadataList stadataList;

  setUpAll(
    () {
      mockGetDomains = MockGetDomains();
      registerTestLazySingleton<GetDomains>(mockGetDomains);
      mockGetAllPublication = MockGetAllPublication();
      registerTestLazySingleton<GetAllPublication>(mockGetAllPublication);
      mockGetAllInfographics = MockGetAllInfographics();
      registerTestLazySingleton<GetAllInfographics>(mockGetAllInfographics);
      stadataList = StadataListImpl();
    },
  );

  tearDownAll(unregisterTestInjection);

  group(
    'StadataList',
    () {
      group(
        'domains()',
        () {
          late ApiResponse<List<DomainEntity>> responseDomain;
          late ListResult<DomainEntity> domains;
          setUp(
            () {
              final json = jsonFromFixture('domain_fixtures_available.json');
              final jsonResponse = ApiResponseModel<List<DomainModel>>.fromJson(
                json,
                (json) {
                  if (json is! List) {
                    return [];
                  }

                  return json
                      .map((e) => DomainModel.fromJson(e as JSON))
                      .toList();
                },
              );
              final data =
                  jsonResponse.data?.map((e) => e.toEntity()).toList() ?? [];
              responseDomain = ApiResponse(
                data: data,
                status: jsonResponse.status,
                dataAvailability: jsonResponse.dataAvailability,
                message: jsonResponse.message,
                pagination: jsonResponse.pagination?.toEntity(),
              );
              domains = ListResult<DomainEntity>(
                data: data,
                pagination: jsonResponse.pagination?.toEntity(),
              );
            },
          );
          test(
            'should return ListResult<DomainEntity> when success',
            () async {
              when(
                () => mockGetDomains(
                  const GetDomainParam(type: DomainType.all),
                ),
              ).thenAnswer((_) async => Right(responseDomain));

              final result = await stadataList.domains();

              expect(result, domains);
              verify(
                () => mockGetDomains(
                  const GetDomainParam(
                    type: DomainType.all,
                  ),
                ),
              );
            },
          );

          test(
            'should throw Exception if failure occured',
            () async {
              when(
                () => mockGetDomains(
                  const GetDomainParam(type: DomainType.all),
                ),
              ).thenAnswer(
                (_) async => const Left(
                  DomainFailure(),
                ),
              );

              expect(
                () => stadataList.domains(),
                throwsA(
                  isA<Exception>().having(
                    (e) => e.toString(),
                    'Exception message',
                    'Exception: Failed to load domain data!',
                  ),
                ),
              );
              verify(
                () => mockGetDomains(
                  const GetDomainParam(
                    type: DomainType.all,
                  ),
                ),
              );
            },
          );
        },
      );

      const domain = '7200';

      group(
        'publications()',
        () {
          late ApiResponse<List<Publication>> responsePublication;
          late ListResult<Publication> publications;

          setUp(
            () {
              final json =
                  jsonFromFixture('publication_fixture_available.json');
              final jsonResponse =
                  ApiResponseModel<List<PublicationModel>>.fromJson(
                json,
                (json) {
                  if (json is! List) {
                    return [];
                  }

                  return json
                      .map((e) => PublicationModel.fromJson(e as JSON))
                      .toList();
                },
              );
              final data =
                  jsonResponse.data?.map((e) => e.toEntity()).toList() ?? [];
              responsePublication = ApiResponse(
                data: data,
                status: jsonResponse.status,
                dataAvailability: jsonResponse.dataAvailability,
                message: jsonResponse.message,
                pagination: jsonResponse.pagination?.toEntity(),
              );
              publications = ListResult<Publication>(
                data: data,
                pagination: responsePublication.pagination,
              );
            },
          );
          test(
            'should return ListResult<Publication> when success',
            () async {
              when(
                () => mockGetAllPublication(
                  const GetPublicationParam(domain: domain),
                ),
              ).thenAnswer((_) async => Right(responsePublication));

              final result = await stadataList.publications(domain: domain);

              expect(result, publications);
              verify(
                () => mockGetAllPublication(
                  const GetPublicationParam(domain: domain),
                ),
              );
            },
          );

          test(
            'should throw Exception if failure occured',
            () async {
              when(
                () => mockGetAllPublication(
                  const GetPublicationParam(domain: domain),
                ),
              ).thenAnswer(
                (_) async => const Left(
                  PublicationFailure(),
                ),
              );

              expect(
                () => stadataList.publications(domain: domain),
                throwsA(
                  isA<Exception>().having(
                    (e) => e.toString(),
                    'Exception message',
                    'Exception: Failed to load publication data!',
                  ),
                ),
              );
              verify(
                () => mockGetAllPublication(
                  const GetPublicationParam(domain: domain),
                ),
              );
            },
          );
        },
      );

      group(
        'infographics()',
        () {
          late ApiResponse<List<Infographic>> responseInfographics;
          late ListResult<Infographic> infographics;

          setUp(
            () {
              final json =
                  jsonFromFixture('infographic_fixture_available.json');
              final jsonResponse =
                  ApiResponseModel<List<InfographicModel>>.fromJson(
                json,
                (json) {
                  if (json is! List) {
                    return [];
                  }

                  return json
                      .map((e) => InfographicModel.fromJson(e as JSON))
                      .toList();
                },
              );
              final data =
                  jsonResponse.data?.map((e) => e.toEntity()).toList() ?? [];
              responseInfographics = ApiResponse(
                data: data,
                status: jsonResponse.status,
                dataAvailability: jsonResponse.dataAvailability,
                message: jsonResponse.message,
                pagination: jsonResponse.pagination?.toEntity(),
              );
              infographics = ListResult<Infographic>(
                data: data,
                pagination: responseInfographics.pagination,
              );
            },
          );
          test(
            'should return ListResult<Infographic> when success',
            () async {
              when(
                () => mockGetAllInfographics(
                  const GetAllInfographicParam(domain: domain),
                ),
              ).thenAnswer((_) async => Right(responseInfographics));

              final result = await stadataList.infographics(domain: domain);

              expect(result, infographics);
              verify(
                () => mockGetAllInfographics(
                  const GetAllInfographicParam(domain: domain),
                ),
              );
            },
          );

          test(
            'should throw Exception if failure occured',
            () async {
              when(
                () => mockGetAllInfographics(
                  const GetAllInfographicParam(domain: domain),
                ),
              ).thenAnswer(
                (_) async => const Left(
                  InfographicFailure(),
                ),
              );

              expect(
                () => stadataList.infographics(domain: domain),
                throwsA(
                  isA<Exception>().having(
                    (e) => e.toString(),
                    'Exception message',
                    'Exception: Failed to load infographic data!',
                  ),
                ),
              );
              verify(
                () => mockGetAllInfographics(
                  const GetAllInfographicParam(domain: domain),
                ),
              );
            },
          );
        },
      );
    },
  );
}
