import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:stadata_flutter_sdk/src/base/base.dart';
import 'package:stadata_flutter_sdk/src/core/core.dart';
import 'package:stadata_flutter_sdk/src/features/features.dart';
import 'package:stadata_flutter_sdk/src/list/list.dart';
import 'package:stadata_flutter_sdk/src/shared/shared.dart';

import '../../fixtures/fixtures.dart';
import '../../helpers/test_injection.dart';

class MockGetDomains extends Mock implements GetDomains {}

class MockGetAllPublication extends Mock implements GetAllPublication {}

class MockGetAllInfographics extends Mock implements GetAllInfographics {}

class MockGetAllStaticTables extends Mock implements GetAllStaticTables {}

class MockGetAllNews extends Mock implements GetAllNews {}

class MockGetAllNewsCategories extends Mock implements GetAllNewsCategories {}

class MockGetAllSubjectCategories extends Mock
    implements GetAllSubjectCategories {}

class MockGetAllSubjects extends Mock implements GetAllSubjects {}

class MockGetAllPressReleases extends Mock implements GetAllPressReleases {}

class MockGetAllStrategicIndicators extends Mock
    implements GetAllStrategicIndicators {}

class MockGetAllVariables extends Mock implements GetAllVariables {}

class MockGetAllVerticalVariables extends Mock
    implements GetAllVerticalVariables {}

class MockGetAllUnits extends Mock implements GetAllUnits {}

class MockGetStatisticClassification extends Mock
    implements GetStatisticClassification {}

class MockGetListOfCensusEvents extends Mock implements GetListOfCensusEvents {}

class MockGetListOfCensusTopic extends Mock implements GetListOfCensusTopic {}

class MockGetListOfCensusArea extends Mock implements GetListOfCensusArea {}

class MockGetListOfCensusDatasets extends Mock
    implements GetListOfCensusDatasets {}

class MockGetCensusData extends Mock implements GetCensusData {}

void main() {
  late GetAllNews mockGetAllNews;
  late GetDomains mockGetDomains;
  late GetAllPublication mockGetAllPublication;
  late GetAllInfographics mockGetAllInfographics;
  late GetAllStaticTables mockGetAllStaticTables;
  late GetAllNewsCategories mockGetAllNewsCategories;
  late GetAllSubjectCategories mockGetAllSubjectCategories;
  late GetAllSubjects mockGetAllSubjects;
  late GetAllPressReleases mockGetAllPressReleases;
  late GetAllStrategicIndicators mockGetAllStrategicIndicators;
  late GetAllVariables mockGetAllVariables;
  late GetAllVerticalVariables mockGetAllVerticalVariables;
  late GetAllUnits mockGetAllUnits;
  late GetStatisticClassification mockGetStatisticClassification;
  late GetListOfCensusEvents mockGetListOfCensusEvents;
  late GetListOfCensusTopic mockGetListOfCensusTopic;
  late GetListOfCensusArea mockGetListOfCensusArea;
  late GetListOfCensusDatasets mockGetListOfCensusDatasets;
  late GetCensusData mockGetCensusData;
  late StadataList stadataList;

  setUpAll(() {
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
    mockGetAllSubjectCategories = MockGetAllSubjectCategories();
    registerTestLazySingleton<GetAllSubjectCategories>(
      mockGetAllSubjectCategories,
    );
    mockGetAllSubjects = MockGetAllSubjects();
    registerTestLazySingleton<GetAllSubjects>(mockGetAllSubjects);
    mockGetAllPressReleases = MockGetAllPressReleases();
    registerTestLazySingleton<GetAllPressReleases>(mockGetAllPressReleases);
    mockGetAllStrategicIndicators = MockGetAllStrategicIndicators();
    registerTestLazySingleton<GetAllStrategicIndicators>(
      mockGetAllStrategicIndicators,
    );
    mockGetAllVariables = MockGetAllVariables();
    registerTestLazySingleton<GetAllVariables>(mockGetAllVariables);
    mockGetAllVerticalVariables = MockGetAllVerticalVariables();
    registerTestLazySingleton<GetAllVerticalVariables>(
      mockGetAllVerticalVariables,
    );
    mockGetAllUnits = MockGetAllUnits();
    registerTestLazySingleton<GetAllUnits>(mockGetAllUnits);
    mockGetStatisticClassification = MockGetStatisticClassification();
    registerTestLazySingleton<GetStatisticClassification>(
      mockGetStatisticClassification,
    );
    mockGetListOfCensusEvents = MockGetListOfCensusEvents();
    registerTestLazySingleton<GetListOfCensusEvents>(mockGetListOfCensusEvents);
    mockGetListOfCensusTopic = MockGetListOfCensusTopic();
    registerTestLazySingleton<GetListOfCensusTopic>(mockGetListOfCensusTopic);
    mockGetListOfCensusArea = MockGetListOfCensusArea();
    registerTestLazySingleton<GetListOfCensusArea>(mockGetListOfCensusArea);
    mockGetListOfCensusDatasets = MockGetListOfCensusDatasets();
    registerTestLazySingleton<GetListOfCensusDatasets>(
      mockGetListOfCensusDatasets,
    );
    mockGetCensusData = MockGetCensusData();
    registerTestLazySingleton<GetCensusData>(mockGetCensusData);
    stadataList = StadataListImpl();
  });

  tearDownAll(unregisterTestInjection);

  group('StadataList', () {
    group('domains()', () {
      late ApiResponse<List<DomainEntity>> response;
      late ListResult<DomainEntity> data;
      setUp(() {
        final json = jsonFromFixture(Fixture.domains);
        final jsonResponse = ApiResponseModel<List<DomainModel>>.fromJson(
          json,
          (json) {
            if (json is! List) {
              return [];
            }

            return json.map((e) => DomainModel.fromJson(e as JSON)).toList();
          },
        );
        final dataResponse = jsonResponse.data?.map((e) => e).toList() ?? [];
        response = ApiResponse<List<DomainEntity>>(
          data: dataResponse,
          status: jsonResponse.status,
          dataAvailability: jsonResponse.dataAvailability,
          message: jsonResponse.message,
          pagination: jsonResponse.pagination,
        );
        data = ListResult<DomainEntity>(
          data: dataResponse,
          dataAvailability:
              response.dataAvailability ?? DataAvailability.listNotAvailable,
          pagination: jsonResponse.pagination,
        );
      });
      test(
        'should return ListResult<DomainEntity> when success with default parameters',
        () async {
          when(
            () => mockGetDomains(const GetDomainParam(type: DomainType.all)),
          ).thenAnswer((_) async => Result.success(response));

          final result = await stadataList.domains();

          expect(result, data);
          verify(
            () => mockGetDomains(const GetDomainParam(type: DomainType.all)),
          );
        },
      );

      test(
        'should return ListResult<DomainEntity> when success with province type',
        () async {
          when(
            () =>
                mockGetDomains(const GetDomainParam(type: DomainType.province)),
          ).thenAnswer((_) async => Result.success(response));

          final result = await stadataList.domains(type: DomainType.province);

          expect(result, data);
          verify(
            () =>
                mockGetDomains(const GetDomainParam(type: DomainType.province)),
          );
        },
      );

      test(
        'should return ListResult<DomainEntity> when success with province code',
        () async {
          when(
            () => mockGetDomains(
              const GetDomainParam(
                type: DomainType.regency,
                provinceCode: '72',
              ),
            ),
          ).thenAnswer((_) async => Result.success(response));

          final result = await stadataList.domains(
            type: DomainType.regency,
            provinceCode: '72',
          );

          expect(result, data);
          verify(
            () => mockGetDomains(
              const GetDomainParam(
                type: DomainType.regency,
                provinceCode: '72',
              ),
            ),
          );
        },
      );

      test('should throw Exception if failure occured', () async {
        when(
          () => mockGetDomains(const GetDomainParam(type: DomainType.all)),
        ).thenAnswer((_) async => Result.failure(const DomainFailure()));

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
          () => mockGetDomains(const GetDomainParam(type: DomainType.all)),
        );
      });
    });

    const domain = '7200';

    group('publications()', () {
      late ApiResponse<List<Publication>> response;
      late ListResult<Publication> data;

      setUp(() {
        final json = jsonFromFixture(Fixture.publications);
        final jsonResponse = ApiResponseModel<List<PublicationModel>>.fromJson(
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
        final responseData = jsonResponse.data?.map((e) => e).toList() ?? [];
        response = ApiResponse(
          data: responseData,
          status: jsonResponse.status,
          dataAvailability: jsonResponse.dataAvailability,
          message: jsonResponse.message,
          pagination: jsonResponse.pagination,
        );
        data = ListResult<Publication>(
          data: responseData,
          dataAvailability:
              response.dataAvailability ?? DataAvailability.listNotAvailable,
          pagination: response.pagination,
        );
      });
      test('should return ListResult<Publication> when success', () async {
        when(
          () =>
              mockGetAllPublication(const GetPublicationParam(domain: domain)),
        ).thenAnswer((_) async => Result.success(response));

        final result = await stadataList.publications(domain: domain);

        expect(result, data);
        verify(
          () =>
              mockGetAllPublication(const GetPublicationParam(domain: domain)),
        );
      });

      test('should throw Exception if failure occured', () async {
        when(
          () =>
              mockGetAllPublication(const GetPublicationParam(domain: domain)),
        ).thenAnswer((_) async => Result.failure(const PublicationFailure()));

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
          () =>
              mockGetAllPublication(const GetPublicationParam(domain: domain)),
        );
      });
    });

    group('infographics()', () {
      late ApiResponse<List<Infographic>> response;
      late ListResult<Infographic> data;

      setUp(() {
        final json = jsonFromFixture(Fixture.infographics);
        final jsonResponse = ApiResponseModel<List<InfographicModel>>.fromJson(
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
        final responseData = jsonResponse.data?.map((e) => e).toList() ?? [];
        response = ApiResponse(
          data: responseData,
          status: jsonResponse.status,
          dataAvailability: jsonResponse.dataAvailability,
          message: jsonResponse.message,
          pagination: jsonResponse.pagination,
        );
        data = ListResult<Infographic>(
          data: responseData,
          dataAvailability:
              response.dataAvailability ?? DataAvailability.listNotAvailable,
          pagination: response.pagination,
        );
      });
      test('should return ListResult<Infographic> when success', () async {
        when(
          () => mockGetAllInfographics(
            const GetAllInfographicParam(domain: domain),
          ),
        ).thenAnswer((_) async => Result.success(response));

        final result = await stadataList.infographics(domain: domain);

        expect(result, data);
        verify(
          () => mockGetAllInfographics(
            const GetAllInfographicParam(domain: domain),
          ),
        );
      });

      test('should throw Exception if failure occured', () async {
        when(
          () => mockGetAllInfographics(
            const GetAllInfographicParam(domain: domain),
          ),
        ).thenAnswer((_) async => Result.failure(const InfographicFailure()));

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
      });
    });

    group('staticTables()', () {
      late ApiResponse<List<StaticTable>> response;
      late ListResult<StaticTable> data;

      setUp(() {
        final json = jsonFromFixture(Fixture.staticTables);
        final jsonResponse = ApiResponseModel<List<StaticTableModel>>.fromJson(
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
        final responseData = jsonResponse.data?.map((e) => e).toList() ?? [];
        response = ApiResponse(
          data: responseData,
          status: jsonResponse.status,
          dataAvailability: jsonResponse.dataAvailability,
          message: jsonResponse.message,
          pagination: jsonResponse.pagination,
        );
        data = ListResult<StaticTable>(
          data: responseData,
          dataAvailability:
              response.dataAvailability ?? DataAvailability.listNotAvailable,
          pagination: response.pagination,
        );
      });
      test('should return ListResult<StaticTable> when success', () async {
        when(
          () => mockGetAllStaticTables(
            const GetAllStaticTableParams(domain: domain),
          ),
        ).thenAnswer((_) async => Result.success(response));

        final result = await stadataList.staticTables(domain: domain);

        expect(result, data);
        verify(
          () => mockGetAllStaticTables(
            const GetAllStaticTableParams(domain: domain),
          ),
        );
      });

      test('should throw Exception if failure occured', () async {
        when(
          () => mockGetAllStaticTables(
            const GetAllStaticTableParams(domain: domain),
          ),
        ).thenAnswer((_) async => Result.failure(const StaticTableFailure()));

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
      });
    });

    group('news()', () {
      late ApiResponse<List<News>> response;
      late ListResult<News> data;

      setUp(() {
        final json = jsonFromFixture(Fixture.news);
        final jsonResponse = ApiResponseModel<List<NewsModel>?>.fromJson(json, (
          json,
        ) {
          if (json == null || json is! List) {
            return null;
          }

          return json.map((e) => NewsModel.fromJson(e as JSON)).toList();
        });
        final responseData = jsonResponse.data?.map((e) => e).toList() ?? [];
        response = ApiResponse(
          data: responseData,
          status: jsonResponse.status,
          dataAvailability: jsonResponse.dataAvailability,
          message: jsonResponse.message,
          pagination: jsonResponse.pagination,
        );
        data = ListResult<News>(
          data: responseData,
          dataAvailability:
              response.dataAvailability ?? DataAvailability.listNotAvailable,
          pagination: response.pagination,
        );
      });
      test(
        'should return ListResult<News> when success with minimal parameters',
        () async {
          when(
            () => mockGetAllNews(const GetAllNewsParam(domain: domain)),
          ).thenAnswer((_) async => Result.success(response));

          final result = await stadataList.news(domain: domain);

          expect(result, data);
          verify(() => mockGetAllNews(const GetAllNewsParam(domain: domain)));
        },
      );

      test(
        'should return ListResult<News> when success with all parameters',
        () async {
          when(
            () => mockGetAllNews(
              const GetAllNewsParam(
                domain: domain,
                lang: DataLanguage.en,
                page: 2,
                keyword: 'economy',
                newsCategoryID: '5',
                month: 12,
                year: 2023,
              ),
            ),
          ).thenAnswer((_) async => Result.success(response));

          final result = await stadataList.news(
            domain: domain,
            lang: DataLanguage.en,
            page: 2,
            keyword: 'economy',
            newsCategoryID: '5',
            month: 12,
            year: 2023,
          );

          expect(result, data);
          verify(
            () => mockGetAllNews(
              const GetAllNewsParam(
                domain: domain,
                lang: DataLanguage.en,
                page: 2,
                keyword: 'economy',
                newsCategoryID: '5',
                month: 12,
                year: 2023,
              ),
            ),
          );
        },
      );

      test('should handle deprecated newsCategoryId parameter', () async {
        when(
          () => mockGetAllNews(
            const GetAllNewsParam(
              domain: domain,
              newsCategoryID: '5',
            ),
          ),
        ).thenAnswer((_) async => Result.success(response));

        final result = await stadataList.news(
          domain: domain,
          // Testing deprecated parameter for backward compatibility
          // ignore: deprecated_member_use_from_same_package
          newsCategoryId: '5',
        );

        expect(result, data);
        verify(
          () => mockGetAllNews(
            const GetAllNewsParam(
              domain: domain,
              newsCategoryID: '5',
            ),
          ),
        );
      });

      test('should throw Exception if failure occured', () async {
        when(
          () => mockGetAllNews(const GetAllNewsParam(domain: domain)),
        ).thenAnswer((_) async => Result.failure(const NewsFailure()));

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
        verify(() => mockGetAllNews(const GetAllNewsParam(domain: domain)));
      });
    });

    group('newsCategories()', () {
      late ApiResponse<List<NewsCategory>> response;
      late ListResult<NewsCategory> data;
      setUp(() {
        final json = jsonFromFixture(Fixture.newsCategory);
        final jsonResponse =
            ApiResponseModel<List<NewsCategoryModel>?>.fromJson(json, (json) {
              if (json == null || json is! List) {
                return null;
              }

              return json
                  .map((e) => NewsCategoryModel.fromJson(e as JSON))
                  .toList();
            });
        final dataResponse = jsonResponse.data?.map((e) => e).toList() ?? [];
        response = ApiResponse<List<NewsCategory>>(
          data: dataResponse,
          status: jsonResponse.status,
          dataAvailability: jsonResponse.dataAvailability,
          message: jsonResponse.message,
          pagination: jsonResponse.pagination,
        );
        data = ListResult<NewsCategory>(
          data: dataResponse,
          dataAvailability:
              response.dataAvailability ?? DataAvailability.listNotAvailable,
          pagination: jsonResponse.pagination,
        );
      });
      test('should return ListResult<NewsCategory> when success', () async {
        when(
          () => mockGetAllNewsCategories(
            const GetAllNewsCategoriesParam(domain: domain),
          ),
        ).thenAnswer((_) async => Result.success(response));

        final result = await stadataList.newsCategories(domain: domain);

        expect(result, equals(data));
        verify(
          () => mockGetAllNewsCategories(
            const GetAllNewsCategoriesParam(domain: domain),
          ),
        );
      });

      test('should throw Exception if failure occured', () async {
        when(
          () => mockGetAllNewsCategories(
            const GetAllNewsCategoriesParam(domain: domain),
          ),
        ).thenAnswer((_) async => Result.failure(const NewsCategoryFailure()));

        expect(
          () => stadataList.newsCategories(domain: domain),
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
      });
    });

    group('subjectCategories()', () {
      late ApiResponse<List<SubjectCategory>> response;
      late ListResult<SubjectCategory> data;
      setUp(() {
        final json = jsonFromFixture(Fixture.subjectCategories);
        final jsonResponse =
            ApiResponseModel<List<SubjectCategoryModel>?>.fromJson(json, (
              json,
            ) {
              if (json == null || json is! List) {
                return null;
              }

              return json
                  .map((e) => SubjectCategoryModel.fromJson(e as JSON))
                  .toList();
            });
        final dataResponse = jsonResponse.data?.map((e) => e).toList() ?? [];
        response = ApiResponse(
          data: dataResponse,
          status: jsonResponse.status,
          dataAvailability: jsonResponse.dataAvailability,
          message: jsonResponse.message,
          pagination: jsonResponse.pagination,
        );
        data = ListResult<SubjectCategory>(
          data: dataResponse,
          dataAvailability:
              response.dataAvailability ?? DataAvailability.listNotAvailable,
          pagination: jsonResponse.pagination,
        );
      });
      test('should return ListResult<SubjectCategory> when success', () async {
        when(
          () => mockGetAllSubjectCategories(
            const GetAllSubjectCategoriesParam(domain: domain),
          ),
        ).thenAnswer((_) async => Result.success(response));

        final result = await stadataList.subjectCategories(domain: domain);

        expect(result, data);
        verify(
          () => mockGetAllSubjectCategories(
            const GetAllSubjectCategoriesParam(domain: domain),
          ),
        );
      });

      test('should throw Exception if failure occured', () async {
        when(
          () => mockGetAllSubjectCategories(
            const GetAllSubjectCategoriesParam(domain: domain),
          ),
        ).thenAnswer(
          (_) async => Result.failure(const SubjectCategoryFailure()),
        );

        expect(
          () => stadataList.subjectCategories(domain: domain),
          throwsA(
            isA<Exception>().having(
              (e) => e.toString(),
              'Exception message',
              'StadataException - Failed to load subject category data!',
            ),
          ),
        );
        verify(
          () => mockGetAllSubjectCategories(
            const GetAllSubjectCategoriesParam(domain: domain),
          ),
        );
      });
    });

    group('subjects()', () {
      late ApiResponse<List<Subject>> response;
      late ListResult<Subject> data;
      setUp(() {
        final json = jsonFromFixture(Fixture.subjects);
        final jsonResponse = ApiResponseModel<List<SubjectModel>?>.fromJson(
          json,
          (json) {
            if (json == null || json is! List) {
              return null;
            }

            return json.map((e) => SubjectModel.fromJson(e as JSON)).toList();
          },
        );
        final dataResponse = jsonResponse.data?.map((e) => e).toList() ?? [];
        response = ApiResponse(
          data: dataResponse,
          status: jsonResponse.status,
          dataAvailability: jsonResponse.dataAvailability,
          message: jsonResponse.message,
          pagination: jsonResponse.pagination,
        );
        data = ListResult<Subject>(
          data: dataResponse,
          dataAvailability:
              response.dataAvailability ?? DataAvailability.listNotAvailable,
          pagination: jsonResponse.pagination,
        );
      });
      test(
        'should return ListResult<Subject> when success with minimal parameters',
        () async {
          when(
            () => mockGetAllSubjects(const GetAllSubjectsParam(domain: domain)),
          ).thenAnswer((_) async => Result.success(response));

          final result = await stadataList.subjects(domain: domain);

          expect(result, data);
          verify(
            () => mockGetAllSubjects(const GetAllSubjectsParam(domain: domain)),
          );
        },
      );

      test(
        'should return ListResult<Subject> when success with all parameters',
        () async {
          when(
            () => mockGetAllSubjects(
              const GetAllSubjectsParam(
                domain: domain,
                subjectCategoryID: 2,
                lang: DataLanguage.en,
                page: 3,
              ),
            ),
          ).thenAnswer((_) async => Result.success(response));

          final result = await stadataList.subjects(
            domain: domain,
            subjectCategoryID: 2,
            lang: DataLanguage.en,
            page: 3,
          );

          expect(result, data);
          verify(
            () => mockGetAllSubjects(
              const GetAllSubjectsParam(
                domain: domain,
                subjectCategoryID: 2,
                lang: DataLanguage.en,
                page: 3,
              ),
            ),
          );
        },
      );

      test('should handle deprecated subjectCategoryId parameter', () async {
        when(
          () => mockGetAllSubjects(
            const GetAllSubjectsParam(
              domain: domain,
              subjectCategoryID: 2,
            ),
          ),
        ).thenAnswer((_) async => Result.success(response));

        final result = await stadataList.subjects(
          domain: domain,
          // Testing deprecated parameter for backward compatibility
          // ignore: deprecated_member_use_from_same_package
          subjectCategoryId: 2,
        );

        expect(result, data);
        verify(
          () => mockGetAllSubjects(
            const GetAllSubjectsParam(
              domain: domain,
              subjectCategoryID: 2,
            ),
          ),
        );
      });

      test('should throw Exception if failure occured', () async {
        when(
          () => mockGetAllSubjects(const GetAllSubjectsParam(domain: domain)),
        ).thenAnswer((_) async => Result.failure(const SubjectFailure()));

        expect(
          () => stadataList.subjects(domain: domain),
          throwsA(
            isA<Exception>().having(
              (e) => e.toString(),
              'Exception message',
              'StadataException - Failed to load subject data!',
            ),
          ),
        );
        verify(
          () => mockGetAllSubjects(const GetAllSubjectsParam(domain: domain)),
        );
      });
    });

    group('pressReleases()', () {
      late ApiResponse<List<PressRelease>> response;
      late ListResult<PressRelease> data;

      setUp(() {
        final json = jsonFromFixture(Fixture.pressReleases);
        final jsonResponse = ApiResponseModel<List<PressReleaseModel>>.fromJson(
          json,
          (json) {
            if (json is! List) {
              return [];
            }

            return json
                .map((e) => PressReleaseModel.fromJson(e as JSON))
                .toList();
          },
        );
        final responseData = jsonResponse.data?.map((e) => e).toList() ?? [];
        response = ApiResponse(
          data: responseData,
          status: jsonResponse.status,
          dataAvailability: jsonResponse.dataAvailability,
          message: jsonResponse.message,
          pagination: jsonResponse.pagination,
        );
        data = ListResult<PressRelease>(
          data: responseData,
          dataAvailability:
              response.dataAvailability ?? DataAvailability.listNotAvailable,
          pagination: response.pagination,
        );
      });
      test('should return ListResult<PressRelease> when success', () async {
        when(
          () => mockGetAllPressReleases(
            const GetAllPressReleasesParam(domain: domain),
          ),
        ).thenAnswer((_) async => Result.success(response));

        final result = await stadataList.pressReleases(domain: domain);

        expect(result, data);
        verify(
          () => mockGetAllPressReleases(
            const GetAllPressReleasesParam(domain: domain),
          ),
        );
      });

      test('should throw Exception if failure occured', () async {
        when(
          () => mockGetAllPressReleases(
            const GetAllPressReleasesParam(domain: domain),
          ),
        ).thenAnswer((_) async => Result.failure(const PressReleaseFailure()));

        expect(
          () => stadataList.pressReleases(domain: domain),
          throwsA(
            isA<Exception>().having(
              (e) => e.toString(),
              'Exception message',
              'StadataException - Failed to load press release data!',
            ),
          ),
        );
        verify(
          () => mockGetAllPressReleases(
            const GetAllPressReleasesParam(domain: domain),
          ),
        );
      });
    });

    group('strategicIndicators()', () {
      late ApiResponse<List<StrategicIndicator>> response;
      late ListResult<StrategicIndicator> data;

      setUp(() {
        final json = jsonFromFixture(Fixture.strategicIndicators);
        final jsonResponse =
            ApiResponseModel<List<StrategicIndicatorModel>>.fromJson(json, (
              json,
            ) {
              if (json is! List) {
                return [];
              }

              return json
                  .map((e) => StrategicIndicatorModel.fromJson(e as JSON))
                  .toList();
            });
        final responseData = jsonResponse.data ?? [];
        response = ApiResponse(
          data: responseData,
          status: jsonResponse.status,
          dataAvailability: jsonResponse.dataAvailability,
          message: jsonResponse.message,
          pagination: jsonResponse.pagination,
        );
        data = ListResult<StrategicIndicator>(
          data: responseData,
          dataAvailability:
              response.dataAvailability ?? DataAvailability.listNotAvailable,
          pagination: response.pagination,
        );
      });
      test(
        'should return ListResult<StrategicIndicator> when success',
        () async {
          when(
            () => mockGetAllStrategicIndicators(
              const GetAllStrategicIndicatorsParam(domain: domain),
            ),
          ).thenAnswer((_) async => Result.success(response));

          final result = await stadataList.strategicIndicators(domain: domain);

          expect(result, data);
          verify(
            () => mockGetAllStrategicIndicators(
              const GetAllStrategicIndicatorsParam(domain: domain),
            ),
          );
        },
      );

      test('should throw Exception if failure occured', () async {
        when(
          () => mockGetAllStrategicIndicators(
            const GetAllStrategicIndicatorsParam(domain: domain),
          ),
        ).thenAnswer(
          (_) async => Result.failure(const StrategicIndicatorFailure()),
        );

        expect(
          () => stadataList.strategicIndicators(domain: domain),
          throwsA(
            isA<Exception>().having(
              (e) => e.toString(),
              'Exception message',
              'StadataException - Failed to load '
                  'strategic indicator data!',
            ),
          ),
        );
        verify(
          () => mockGetAllStrategicIndicators(
            const GetAllStrategicIndicatorsParam(domain: domain),
          ),
        );
      });
    });

    group('variables()', () {
      late ApiResponse<List<Variable>> response;
      late ListResult<Variable> data;

      setUp(() {
        final json = jsonFromFixture(Fixture.variables);
        final jsonResponse = ApiResponseModel<List<VariableModel>>.fromJson(
          json,
          (json) {
            if (json is! List) {
              return [];
            }

            return json.map((e) => VariableModel.fromJson(e as JSON)).toList();
          },
        );
        final responseData = jsonResponse.data ?? [];
        response = ApiResponse(
          data: responseData,
          status: jsonResponse.status,
          dataAvailability: jsonResponse.dataAvailability,
          message: jsonResponse.message,
          pagination: jsonResponse.pagination,
        );
        data = ListResult<Variable>(
          data: responseData,
          dataAvailability:
              response.dataAvailability ?? DataAvailability.listNotAvailable,
          pagination: response.pagination,
        );
      });
      test(
        'should return ListResult<Variable> when success with minimal parameters',
        () async {
          when(
            () =>
                mockGetAllVariables(const GetAllVariablesParam(domain: domain)),
          ).thenAnswer((_) async => Result.success(response));

          final result = await stadataList.variables(domain: domain);

          expect(result, data);
          verify(
            () =>
                mockGetAllVariables(const GetAllVariablesParam(domain: domain)),
          );
        },
      );

      test(
        'should return ListResult<Variable> when success with all parameters',
        () async {
          when(
            () => mockGetAllVariables(
              const GetAllVariablesParam(
                domain: domain,
                page: 2,
                lang: DataLanguage.en,
                showExistingVariables: true,
                year: 2023,
                subjectID: 5,
              ),
            ),
          ).thenAnswer((_) async => Result.success(response));

          final result = await stadataList.variables(
            domain: domain,
            page: 2,
            lang: DataLanguage.en,
            showExistingVariables: true,
            year: 2023,
            subjectID: 5,
          );

          expect(result, data);
          verify(
            () => mockGetAllVariables(
              const GetAllVariablesParam(
                domain: domain,
                page: 2,
                lang: DataLanguage.en,
                showExistingVariables: true,
                year: 2023,
                subjectID: 5,
              ),
            ),
          );
        },
      );

      test('should throw Exception if failure occured', () async {
        when(
          () => mockGetAllVariables(const GetAllVariablesParam(domain: domain)),
        ).thenAnswer((_) async => Result.failure(const VariableFailure()));

        expect(
          () => stadataList.variables(domain: domain),
          throwsA(
            isA<Exception>().having(
              (e) => e.toString(),
              'Exception message',
              'StadataException - Failed to load '
                  'variable data!',
            ),
          ),
        );
        verify(
          () => mockGetAllVariables(const GetAllVariablesParam(domain: domain)),
        );
      });
    });

    group('verticalVariables()', () {
      late ApiResponse<List<VerticalVariable>> response;
      late ListResult<VerticalVariable> data;

      setUp(() {
        final json = jsonFromFixture(Fixture.verticalVariables);
        final jsonResponse =
            ApiResponseModel<List<VerticalVariableModel>>.fromJson(json, (
              json,
            ) {
              if (json is! List) {
                return [];
              }

              return json
                  .map((e) => VerticalVariableModel.fromJson(e as JSON))
                  .toList();
            });
        final responseData = jsonResponse.data ?? [];
        response = ApiResponse(
          data: responseData,
          status: jsonResponse.status,
          dataAvailability: jsonResponse.dataAvailability,
          message: jsonResponse.message,
          pagination: jsonResponse.pagination,
        );
        data = ListResult<VerticalVariable>(
          data: responseData,
          dataAvailability:
              response.dataAvailability ?? DataAvailability.listNotAvailable,
          pagination: response.pagination,
        );
      });
      test('should return ListResult<VerticalVariable> when success', () async {
        when(
          () => mockGetAllVerticalVariables(
            const GetAllVerticalVariablesParam(domain: domain),
          ),
        ).thenAnswer((_) async => Result.success(response));

        final result = await stadataList.verticalVariables(domain: domain);

        expect(result, data);
        verify(
          () => mockGetAllVerticalVariables(
            const GetAllVerticalVariablesParam(domain: domain),
          ),
        );
      });

      test('should throw Exception if failure occured', () async {
        when(
          () => mockGetAllVerticalVariables(
            const GetAllVerticalVariablesParam(domain: domain),
          ),
        ).thenAnswer(
          (_) async => Result.failure(const VerticalVariableFailure()),
        );

        expect(
          () => stadataList.verticalVariables(domain: domain),
          throwsA(
            isA<Exception>().having(
              (e) => e.toString(),
              'Exception message',
              'StadataException - Failed to load '
                  'vertical variable data!',
            ),
          ),
        );
        verify(
          () => mockGetAllVerticalVariables(
            const GetAllVerticalVariablesParam(domain: domain),
          ),
        );
      });
    });

    group('units()', () {
      late ApiResponse<List<UnitData>> response;
      late ListResult<UnitData> data;

      setUp(() {
        final json = jsonFromFixture(Fixture.units);
        final jsonResponse = ApiResponseModel<List<UnitDataModel>>.fromJson(
          json,
          (json) {
            if (json is! List) {
              return [];
            }

            return json.map((e) => UnitDataModel.fromJson(e as JSON)).toList();
          },
        );
        final responseData = jsonResponse.data ?? [];
        response = ApiResponse<List<UnitData>>(
          data: responseData,
          status: jsonResponse.status,
          dataAvailability: jsonResponse.dataAvailability,
          message: jsonResponse.message,
          pagination: jsonResponse.pagination,
        );
        data = ListResult<UnitData>(
          data: responseData,
          dataAvailability:
              response.dataAvailability ?? DataAvailability.listNotAvailable,
          pagination: response.pagination,
        );
      });
      test('should return ListResult<UnitData> when success', () async {
        when(
          () => mockGetAllUnits(const GetAllUnitsParam(domain: domain)),
        ).thenAnswer((_) async => Result.success(response));

        final result = await stadataList.units(domain: domain);

        expect(result, data);
        verify(() => mockGetAllUnits(const GetAllUnitsParam(domain: domain)));
      });

      test('should throw Exception if failure occured', () async {
        when(
          () => mockGetAllUnits(const GetAllUnitsParam(domain: domain)),
        ).thenAnswer((_) async => Result.failure(const UnitFailure()));

        expect(
          () => stadataList.units(domain: domain),
          throwsA(
            isA<Exception>().having(
              (e) => e.toString(),
              'Exception message',
              'StadataException - Failed to load '
                  'unit data!',
            ),
          ),
        );
        verify(() => mockGetAllUnits(const GetAllUnitsParam(domain: domain)));
      });
    });

    group('statisticClassification()', () {
      late ApiResponse<List<StatisticClassification>> response;
      late ListResult<StatisticClassification> data;

      setUp(() {
        final json = jsonFromFixture(Fixture.statisticClassification);
        final jsonResponse =
            ApiResponseModel<List<StatisticClassification>>.fromJson(json, (
              json,
            ) {
              if (json is! List<Map>) {
                return [];
              }

              return json.map((json) {
                final data = json['_source'] as JSON;
                return StatisticClassificationModel.fromJson(data);
              }).toList();
            });

        response = ApiResponse<List<StatisticClassification>>(
          data: jsonResponse.data,
          status: jsonResponse.status,
          dataAvailability: jsonResponse.dataAvailability,
          message: jsonResponse.message,
          pagination: jsonResponse.pagination,
        );
        data = ListResult<StatisticClassification>(
          data: response.data ?? [],
          dataAvailability:
              response.dataAvailability ?? DataAvailability.listNotAvailable,
          pagination: response.pagination,
        );
      });
      test(
        'should return ListResult<StatisticClassification> when success with KBLIType',
        () async {
          when(
            () => mockGetStatisticClassification(
              const GetStatisticClassificationParam(type: KBLIType.y2009),
            ),
          ).thenAnswer((_) async => Result.success(response));

          final result = await stadataList.statisticClassifications(
            type: KBLIType.y2009,
          );

          expect(result, data);
          verify(
            () => mockGetStatisticClassification(
              const GetStatisticClassificationParam(type: KBLIType.y2009),
            ),
          );
        },
      );

      test(
        'should return ListResult<StatisticClassification> when success with KBKIType',
        () async {
          when(
            () => mockGetStatisticClassification(
              const GetStatisticClassificationParam(type: KBKIType.y2015),
            ),
          ).thenAnswer((_) async => Result.success(response));

          final result = await stadataList.statisticClassifications(
            type: KBKIType.y2015,
          );

          expect(result, data);
          verify(
            () => mockGetStatisticClassification(
              const GetStatisticClassificationParam(type: KBKIType.y2015),
            ),
          );
        },
      );

      test(
        'should return ListResult<StatisticClassification> with all optional parameters',
        () async {
          when(
            () => mockGetStatisticClassification(
              const GetStatisticClassificationParam(
                type: KBLIType.y2017,
                level: KBLILevel.category,
                lang: DataLanguage.en,
                page: 2,
                perPage: 25,
              ),
            ),
          ).thenAnswer((_) async => Result.success(response));

          final result = await stadataList.statisticClassifications(
            type: KBLIType.y2017,
            level: KBLILevel.category,
            lang: DataLanguage.en,
            page: 2,
            perPage: 25,
          );

          expect(result, data);
          verify(
            () => mockGetStatisticClassification(
              const GetStatisticClassificationParam(
                type: KBLIType.y2017,
                level: KBLILevel.category,
                lang: DataLanguage.en,
                page: 2,
                perPage: 25,
              ),
            ),
          );
        },
      );

      test('should throw Exception if failure occured', () async {
        when(
          () => mockGetStatisticClassification(
            const GetStatisticClassificationParam(type: KBLIType.y2009),
          ),
        ).thenAnswer(
          (_) async => Result.failure(const StatisticClassificationFailure()),
        );

        expect(
          () => stadataList.statisticClassifications(type: KBLIType.y2009),
          throwsA(
            isA<Exception>().having(
              (e) => e.toString(),
              'Exception message',
              'StadataException - Failed to load '
                  'statistic classification data!',
            ),
          ),
        );
        verify(
          () => mockGetStatisticClassification(
            const GetStatisticClassificationParam(type: KBLIType.y2009),
          ),
        );
      });
    });

    group('censusEvents()', () {
      late ApiResponse<List<CensusEvent>> response;
      late ListResult<CensusEvent> data;

      setUp(() {
        final json = jsonFromFixture(Fixture.census);
        final jsonResponse = ApiResponseModel<List<CensusEventModel>>.fromJson(
          json,
          (json) {
            if (json is! List) {
              return [];
            }

            return json
                .map((e) => CensusEventModel.fromJson(e as JSON))
                .toList();
          },
        );
        final responseData = jsonResponse.data?.map((e) => e).toList() ?? [];
        response = ApiResponse(
          data: responseData,
          status: jsonResponse.status,
          dataAvailability: jsonResponse.dataAvailability,
          message: jsonResponse.message,
          pagination: jsonResponse.pagination,
        );
        data = ListResult<CensusEvent>(
          data: responseData,
          dataAvailability:
              response.dataAvailability ?? DataAvailability.listNotAvailable,
          pagination: response.pagination,
        );
      });

      test('should return ListResult<Census> when success', () async {
        when(
          () => mockGetListOfCensusEvents(NoParams()),
        ).thenAnswer((_) async => Result.success(response));

        final result = await stadataList.censusEvents();

        expect(result, data);
        verify(() => mockGetListOfCensusEvents(NoParams()));
      });

      test('should throw Exception if failure occured', () async {
        when(
          () => mockGetListOfCensusEvents(NoParams()),
        ).thenAnswer((_) async => Result.failure(const CensusDataFailure()));

        expect(
          () => stadataList.censusEvents(),
          throwsA(
            isA<Exception>().having(
              (e) => e.toString(),
              'Exception message',
              'StadataException - Failed to load census data!',
            ),
          ),
        );
        verify(() => mockGetListOfCensusEvents(NoParams()));
      });
    });

    group('censusTopics()', () {
      late ApiResponse<List<CensusTopic>> response;
      late ListResult<CensusTopic> data;
      const testCensusId = 'sp2020';

      setUp(() {
        final json = jsonFromFixture(Fixture.censusTopic);
        final jsonResponse = ApiResponseModel<List<CensusTopicModel>>.fromJson(
          json,
          (json) {
            if (json is! List) {
              return [];
            }

            return json
                .map((e) => CensusTopicModel.fromJson(e as JSON))
                .toList();
          },
        );
        final responseData = jsonResponse.data?.map((e) => e).toList() ?? [];
        response = ApiResponse(
          data: responseData,
          status: jsonResponse.status,
          dataAvailability: jsonResponse.dataAvailability,
          message: jsonResponse.message,
          pagination: jsonResponse.pagination,
        );
        data = ListResult<CensusTopic>(
          data: responseData,
          dataAvailability:
              response.dataAvailability ?? DataAvailability.listNotAvailable,
          pagination: response.pagination,
        );
      });

      test('should return ListResult<CensusTopic> when success', () async {
        when(
          () => mockGetListOfCensusTopic(testCensusId),
        ).thenAnswer((_) async => Result.success(response));

        final result = await stadataList.censusTopics(censusID: testCensusId);

        expect(result, data);
        verify(() => mockGetListOfCensusTopic(testCensusId));
      });

      test('should throw Exception if failure occured', () async {
        when(() => mockGetListOfCensusTopic(testCensusId)).thenAnswer(
          (_) async => Result.failure(const CensusTopicFailure()),
        );

        expect(
          () => stadataList.censusTopics(censusID: testCensusId),
          throwsA(
            isA<Exception>().having(
              (e) => e.toString(),
              'Exception message',
              'StadataException - Failed to load census topic data!',
            ),
          ),
        );
        verify(() => mockGetListOfCensusTopic(testCensusId));
      });
    });

    group('censusEventAreas()', () {
      late ApiResponse<List<CensusArea>> response;
      late ListResult<CensusArea> data;
      const testCensusId = 'sp2020';

      setUp(() {
        final json = jsonFromFixture(Fixture.censusArea);
        final jsonResponse = ApiResponseModel<List<CensusAreaModel>>.fromJson(
          json,
          (json) {
            if (json is! List) {
              return [];
            }

            return json
                .map((e) => CensusAreaModel.fromJson(e as JSON))
                .toList();
          },
        );
        final responseData = jsonResponse.data?.map((e) => e).toList() ?? [];
        response = ApiResponse(
          data: responseData,
          status: jsonResponse.status,
          dataAvailability: jsonResponse.dataAvailability,
          message: jsonResponse.message,
          pagination: jsonResponse.pagination,
        );
        data = ListResult<CensusArea>(
          data: responseData,
          dataAvailability:
              response.dataAvailability ?? DataAvailability.listNotAvailable,
          pagination: response.pagination,
        );
      });

      test('should return ListResult<CensusArea> when success', () async {
        when(
          () => mockGetListOfCensusArea(testCensusId),
        ).thenAnswer((_) async => Result.success(response));

        final result = await stadataList.censusEventAreas(
          censusID: testCensusId,
        );

        expect(result, data);
        verify(() => mockGetListOfCensusArea(testCensusId));
      });

      test('should throw Exception if failure occured', () async {
        when(() => mockGetListOfCensusArea(testCensusId)).thenAnswer(
          (_) async => Result.failure(const CensusAreaFailure()),
        );

        expect(
          () => stadataList.censusEventAreas(censusID: testCensusId),
          throwsA(
            isA<Exception>().having(
              (e) => e.toString(),
              'Exception message',
              'StadataException - Failed to load census area data!',
            ),
          ),
        );
        verify(() => mockGetListOfCensusArea(testCensusId));
      });
    });

    group('censusEventDatasets()', () {
      late ApiResponse<List<CensusDataset>> response;
      late ListResult<CensusDataset> data;
      const testCensusId = 'sp2020';
      const testTopicId = 20;

      setUp(() {
        final json = jsonFromFixture(Fixture.censusDatasets);
        final jsonResponse =
            ApiResponseModel<List<CensusDatasetModel>>.fromJson(
              json,
              (json) {
                if (json is! List) {
                  return [];
                }

                return json
                    .map((e) => CensusDatasetModel.fromJson(e as JSON))
                    .toList();
              },
            );
        final responseData = jsonResponse.data?.map((e) => e).toList() ?? [];
        response = ApiResponse(
          data: responseData,
          status: jsonResponse.status,
          dataAvailability: jsonResponse.dataAvailability,
          message: jsonResponse.message,
          pagination: jsonResponse.pagination,
        );
        data = ListResult<CensusDataset>(
          data: responseData,
          dataAvailability:
              response.dataAvailability ?? DataAvailability.listNotAvailable,
          pagination: response.pagination,
        );
      });

      test('should return ListResult<CensusDataset> when success', () async {
        when(
          () => mockGetListOfCensusDatasets(
            const GetListOfCensusDatasetsParam(
              topicID: testTopicId,
              censusID: testCensusId,
            ),
          ),
        ).thenAnswer((_) async => Result.success(response));

        final result = await stadataList.censusEventDatasets(
          topicID: testTopicId,
          censusID: testCensusId,
        );

        expect(result, data);
        verify(
          () => mockGetListOfCensusDatasets(
            const GetListOfCensusDatasetsParam(
              topicID: testTopicId,
              censusID: testCensusId,
            ),
          ),
        );
      });

      test('should throw Exception if failure occured', () async {
        when(
          () => mockGetListOfCensusDatasets(
            const GetListOfCensusDatasetsParam(
              topicID: testTopicId,
              censusID: testCensusId,
            ),
          ),
        ).thenAnswer(
          (_) async => Result.failure(const CensusDataFailure()),
        );

        expect(
          () => stadataList.censusEventDatasets(
            topicID: testTopicId,
            censusID: testCensusId,
          ),
          throwsA(
            isA<Exception>().having(
              (e) => e.toString(),
              'Exception message',
              'StadataException - Failed to load census data!',
            ),
          ),
        );
        verify(
          () => mockGetListOfCensusDatasets(
            const GetListOfCensusDatasetsParam(
              topicID: testTopicId,
              censusID: testCensusId,
            ),
          ),
        );
      });
    });

    group('censusData()', () {
      late ApiResponse<List<CensusData>> response;
      late ListResult<CensusData> data;
      const testCensusId = 'sp2020';
      const testCensusAreaId = '1667';
      const testDatasetId = '1';

      setUp(() {
        final json = jsonFromFixture(Fixture.censusData);
        final jsonResponse = ApiResponseModel<List<CensusDataModel>>.fromJson(
          json,
          (json) {
            if (json is! List) {
              return [];
            }

            return json
                .map((e) => CensusDataModel.fromJson(e as JSON))
                .toList();
          },
        );
        final responseData = jsonResponse.data?.map((e) => e).toList() ?? [];
        response = ApiResponse(
          data: responseData,
          status: jsonResponse.status,
          dataAvailability: jsonResponse.dataAvailability,
          message: jsonResponse.message,
          pagination: jsonResponse.pagination,
        );
        data = ListResult<CensusData>(
          data: responseData,
          dataAvailability:
              response.dataAvailability ?? DataAvailability.listNotAvailable,
          pagination: response.pagination,
        );
      });

      test('should return ListResult<CensusData> when success', () async {
        when(
          () => mockGetCensusData(
            const GetCensusDataParam(
              censusID: testCensusId,
              censusAreaID: testCensusAreaId,
              datasetID: testDatasetId,
            ),
          ),
        ).thenAnswer((_) async => Result.success(response));

        final result = await stadataList.censusData(
          censusID: testCensusId,
          censusAreaID: testCensusAreaId,
          datasetID: testDatasetId,
        );

        expect(result, data);
        verify(
          () => mockGetCensusData(
            const GetCensusDataParam(
              censusID: testCensusId,
              censusAreaID: testCensusAreaId,
              datasetID: testDatasetId,
            ),
          ),
        );
      });

      test('should throw Exception if failure occured', () async {
        when(
          () => mockGetCensusData(
            const GetCensusDataParam(
              censusID: testCensusId,
              censusAreaID: testCensusAreaId,
              datasetID: testDatasetId,
            ),
          ),
        ).thenAnswer(
          (_) async => Result.failure(const CensusDataFailure()),
        );

        expect(
          () => stadataList.censusData(
            censusID: testCensusId,
            censusAreaID: testCensusAreaId,
            datasetID: testDatasetId,
          ),
          throwsA(
            isA<Exception>().having(
              (e) => e.toString(),
              'Exception message',
              'StadataException - Failed to load census data!',
            ),
          ),
        );
        verify(
          () => mockGetCensusData(
            const GetCensusDataParam(
              censusID: testCensusId,
              censusAreaID: testCensusAreaId,
              datasetID: testDatasetId,
            ),
          ),
        );
      });
    });
  });
}
