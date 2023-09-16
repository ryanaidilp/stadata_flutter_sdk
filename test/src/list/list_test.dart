import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:stadata_flutter_sdk/src/core/failures/failures.dart';
import 'package:stadata_flutter_sdk/src/core/typedef/typedef.dart';
import 'package:stadata_flutter_sdk/src/features/domains/data/models/domain_model.dart';
import 'package:stadata_flutter_sdk/src/features/domains/domain/usecases/get_domains.dart';
import 'package:stadata_flutter_sdk/src/features/infographics/data/models/infographic_model.dart';
import 'package:stadata_flutter_sdk/src/features/infographics/domain/usecases/get_all_infographics.dart';
import 'package:stadata_flutter_sdk/src/features/news/data/models/news_model.dart';
import 'package:stadata_flutter_sdk/src/features/news/domain/usecases/get_all_news.dart';
import 'package:stadata_flutter_sdk/src/features/news_categories/data/models/news_category_model.dart';
import 'package:stadata_flutter_sdk/src/features/news_categories/domain/usecases/get_all_news_categories.dart';
import 'package:stadata_flutter_sdk/src/features/publications/data/models/publication_model.dart';
import 'package:stadata_flutter_sdk/src/features/publications/domain/usecases/get_all_publication.dart';
import 'package:stadata_flutter_sdk/src/features/static_tables/data/models/static_table_model.dart';
import 'package:stadata_flutter_sdk/src/features/static_tables/domain/usecases/get_all_static_tables.dart';
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

class MockGetAllStaticTables extends Mock implements GetAllStaticTables {}

class MockGetAllNews extends Mock implements GetAllNews {}

class MockGetAllNewsCategories extends Mock implements GetAllNewsCategories {}

void main() {
  late GetAllNews mockGetAllNews;
  late GetDomains mockGetDomains;
  late GetAllPublication mockGetAllPublication;
  late GetAllInfographics mockGetAllInfographics;
  late GetAllStaticTables mockGetAllStaticTables;
  late GetAllNewsCategories mockGetAllNewsCategories;
  late StadataList stadataList;

  setUpAll(
    () {
      mockGetAllNews = MockGetAllNews();
      registerTestLazySingleton<GetAllNews>(mockGetAllNews);
      mockGetDomains = MockGetDomains();
      registerTestLazySingleton<GetDomains>(mockGetDomains);
      mockGetAllPublication = MockGetAllPublication();
      registerTestLazySingleton<GetAllPublication>(mockGetAllPublication);
      mockGetAllInfographics = MockGetAllInfographics();
      registerTestLazySingleton<GetAllInfographics>(mockGetAllInfographics);
      mockGetAllStaticTables = MockGetAllStaticTables();
      registerTestLazySingleton<GetAllStaticTables>(mockGetAllStaticTables);
      mockGetAllNewsCategories = MockGetAllNewsCategories();
      registerTestLazySingleton<GetAllNewsCategories>(mockGetAllNewsCategories);
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
          late ApiResponse<List<DomainEntity>> response;
          late ListResult<DomainEntity> data;
          setUp(
            () {
              final json = jsonFromFixture(Fixture.domains.value);
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
              final dataResponse =
                  jsonResponse.data?.map((e) => e.toEntity()).toList() ?? [];
              response = ApiResponse(
                data: dataResponse,
                status: jsonResponse.status,
                dataAvailability: jsonResponse.dataAvailability,
                message: jsonResponse.message,
                pagination: jsonResponse.pagination?.toEntity(),
              );
              data = ListResult<DomainEntity>(
                data: dataResponse,
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
              ).thenAnswer((_) async => Right(response));

              final result = await stadataList.domains();

              expect(result, data);
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
                    'StadataException - Failed to load domain data!',
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
          late ApiResponse<List<Publication>> response;
          late ListResult<Publication> data;

          setUp(
            () {
              final json = jsonFromFixture(Fixture.publications.value);
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
              final responseData =
                  jsonResponse.data?.map((e) => e.toEntity()).toList() ?? [];
              response = ApiResponse(
                data: responseData,
                status: jsonResponse.status,
                dataAvailability: jsonResponse.dataAvailability,
                message: jsonResponse.message,
                pagination: jsonResponse.pagination?.toEntity(),
              );
              data = ListResult<Publication>(
                data: responseData,
                pagination: response.pagination,
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
              ).thenAnswer((_) async => Right(response));

              final result = await stadataList.publications(domain: domain);

              expect(result, data);
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
                    'StadataException - Failed to load publication data!',
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
          late ApiResponse<List<Infographic>> response;
          late ListResult<Infographic> data;

          setUp(
            () {
              final json = jsonFromFixture(Fixture.infographics.value);
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
              final responseData =
                  jsonResponse.data?.map((e) => e.toEntity()).toList() ?? [];
              response = ApiResponse(
                data: responseData,
                status: jsonResponse.status,
                dataAvailability: jsonResponse.dataAvailability,
                message: jsonResponse.message,
                pagination: jsonResponse.pagination?.toEntity(),
              );
              data = ListResult<Infographic>(
                data: responseData,
                pagination: response.pagination,
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
              ).thenAnswer((_) async => Right(response));

              final result = await stadataList.infographics(domain: domain);

              expect(result, data);
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
                    'StadataException - Failed to load infographic data!',
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

      group(
        'staticTables()',
        () {
          late ApiResponse<List<StaticTable>> response;
          late ListResult<StaticTable> data;

          setUp(
            () {
              final json = jsonFromFixture(Fixture.staticTables.value);
              final jsonResponse =
                  ApiResponseModel<List<StaticTableModel>>.fromJson(
                json,
                (json) {
                  if (json is! List) {
                    return [];
                  }

                  return json
                      .map((e) => StaticTableModel.fromJson(e as JSON))
                      .toList();
                },
              );
              final responseData =
                  jsonResponse.data?.map((e) => e.toEntity()).toList() ?? [];
              response = ApiResponse(
                data: responseData,
                status: jsonResponse.status,
                dataAvailability: jsonResponse.dataAvailability,
                message: jsonResponse.message,
                pagination: jsonResponse.pagination?.toEntity(),
              );
              data = ListResult<StaticTable>(
                data: responseData,
                pagination: response.pagination,
              );
            },
          );
          test(
            'should return ListResult<StaticTable> when success',
            () async {
              when(
                () => mockGetAllStaticTables(
                  const GetAllStaticTableParams(domain: domain),
                ),
              ).thenAnswer((_) async => Right(response));

              final result = await stadataList.staticTables(domain: domain);

              expect(result, data);
              verify(
                () => mockGetAllStaticTables(
                  const GetAllStaticTableParams(domain: domain),
                ),
              );
            },
          );

          test(
            'should throw Exception if failure occured',
            () async {
              when(
                () => mockGetAllStaticTables(
                  const GetAllStaticTableParams(domain: domain),
                ),
              ).thenAnswer(
                (_) async => const Left(
                  StaticTableFailure(),
                ),
              );

              expect(
                () => stadataList.staticTables(domain: domain),
                throwsA(
                  isA<Exception>().having(
                    (e) => e.toString(),
                    'Exception message',
                    'StadataException - Failed to load static table data!',
                  ),
                ),
              );
              verify(
                () => mockGetAllStaticTables(
                  const GetAllStaticTableParams(domain: domain),
                ),
              );
            },
          );
        },
      );

      group(
        'news()',
        () {
          late ApiResponse<List<News>> response;
          late ListResult<News> data;

          setUp(
            () {
              final json = jsonFromFixture(Fixture.news.value);
              final jsonResponse = ApiResponseModel<List<NewsModel>?>.fromJson(
                json,
                (json) {
                  if (json == null || json is! List) {
                    return null;
                  }

                  return json
                      .map((e) => NewsModel.fromJson(e as JSON))
                      .toList();
                },
              );
              final responseData =
                  jsonResponse.data?.map((e) => e.toEntity()).toList() ?? [];
              response = ApiResponse(
                data: responseData,
                status: jsonResponse.status,
                dataAvailability: jsonResponse.dataAvailability,
                message: jsonResponse.message,
                pagination: jsonResponse.pagination?.toEntity(),
              );
              data = ListResult<News>(
                data: responseData,
                pagination: response.pagination,
              );
            },
          );
          test(
            'should return ListResult<News> when success',
            () async {
              when(
                () => mockGetAllNews(
                  const GetAllNewsParam(domain: domain),
                ),
              ).thenAnswer((_) async => Right(response));

              final result = await stadataList.news(domain: domain);

              expect(result, data);
              verify(
                () => mockGetAllNews(
                  const GetAllNewsParam(domain: domain),
                ),
              );
            },
          );

          test(
            'should throw Exception if failure occured',
            () async {
              when(
                () => mockGetAllNews(
                  const GetAllNewsParam(domain: domain),
                ),
              ).thenAnswer(
                (_) async => const Left(
                  NewsFailure(),
                ),
              );

              expect(
                () => stadataList.news(domain: domain),
                throwsA(
                  isA<Exception>().having(
                    (e) => e.toString(),
                    'Exception message',
                    'StadataException - Failed to load news data!',
                  ),
                ),
              );
              verify(
                () => mockGetAllNews(
                  const GetAllNewsParam(domain: domain),
                ),
              );
            },
          );
        },
      );

      group(
        'newsCategory()',
        () {
          late ApiResponse<List<NewsCategory>> response;
          late ListResult<NewsCategory> data;
          setUp(
            () {
              final json = jsonFromFixture(Fixture.newsCategory.value);
              final jsonResponse =
                  ApiResponseModel<List<NewsCategoryModel>?>.fromJson(
                json,
                (json) {
                  if (json == null || json is! List) {
                    return null;
                  }

                  return json
                      .map((e) => NewsCategoryModel.fromJson(e as JSON))
                      .toList();
                },
              );
              final dataResponse =
                  jsonResponse.data?.map((e) => e.toEntity()).toList() ?? [];
              response = ApiResponse<List<NewsCategory>>(
                data: dataResponse,
                status: jsonResponse.status,
                dataAvailability: jsonResponse.dataAvailability,
                message: jsonResponse.message,
                pagination: jsonResponse.pagination?.toEntity(),
              );
              data = ListResult<NewsCategory>(
                data: dataResponse,
                pagination: jsonResponse.pagination?.toEntity(),
              );
            },
          );
          test(
            'should return ListResult<NewsCategory> when success',
            () async {
              when(
                () => mockGetAllNewsCategories(
                  const GetAllNewsCategoriesParam(domain: domain),
                ),
              ).thenAnswer((_) async => Right(response));

              final result = await stadataList.newsCategory(domain: domain);

              expect(result, equals(data));
              verify(
                () => mockGetAllNewsCategories(
                  const GetAllNewsCategoriesParam(domain: domain),
                ),
              );
            },
          );

          test(
            'should throw Exception if failure occured',
            () async {
              when(
                () => mockGetAllNewsCategories(
                  const GetAllNewsCategoriesParam(domain: domain),
                ),
              ).thenAnswer(
                (_) async => const Left(
                  NewsCategoryFailure(),
                ),
              );

              expect(
                () => stadataList.newsCategory(domain: domain),
                throwsA(
                  isA<Exception>().having(
                    (e) => e.toString(),
                    'Exception message',
                    'StadataException - Failed to load news category data!',
                  ),
                ),
              );
              verify(
                () => mockGetAllNewsCategories(
                  const GetAllNewsCategoriesParam(domain: domain),
                ),
              );
            },
          );
        },
      );
    },
  );
}
