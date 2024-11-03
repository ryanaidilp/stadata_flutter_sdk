import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:stadata_flutter_sdk/src/core/core.dart';
import 'package:stadata_flutter_sdk/src/features/features.dart';
import 'package:stadata_flutter_sdk/src/shared/shared.dart';
import 'package:stadata_flutter_sdk/src/view/view.dart';

import '../../fixtures/fixtures.dart';
import '../../helpers/test_injection.dart';

class MockGetDetailPublication extends Mock implements GetDetailPublication {}

class MockGetDetailStaticTable extends Mock implements GetDetailStaticTable {}

class MockGetDetailNews extends Mock implements GetDetailNews {}

class MockGetDetailPressRelease extends Mock implements GetDetailPressRelease {}

class MockGetDetailStatisticClassification extends Mock
    implements GetDetailStatisticClassification {}

void main() {
  late GetDetailNews mockGetDetailNews;
  late GetDetailPublication mockGetDetailPublication;
  late GetDetailStaticTable mockGetDetailStaticTable;
  late GetDetailPressRelease mockGetDetailPressRelease;
  late GetDetailStatisticClassification mockGetDetailStatisticClassification;
  late StadataView stadataView;

  setUpAll(
    () {
      mockGetDetailNews = MockGetDetailNews();
      registerTestLazySingleton<GetDetailNews>(mockGetDetailNews);
      mockGetDetailPublication = MockGetDetailPublication();
      registerTestLazySingleton<GetDetailPublication>(mockGetDetailPublication);
      mockGetDetailStaticTable = MockGetDetailStaticTable();
      registerTestLazySingleton<GetDetailStaticTable>(mockGetDetailStaticTable);
      mockGetDetailPressRelease = MockGetDetailPressRelease();
      registerTestLazySingleton<GetDetailPressRelease>(
        mockGetDetailPressRelease,
      );
      mockGetDetailStatisticClassification =
          MockGetDetailStatisticClassification();
      registerTestLazySingleton<GetDetailStatisticClassification>(
        mockGetDetailStatisticClassification,
      );
      stadataView = StadataViewImpl();
    },
  );

  tearDownAll(unregisterTestInjection);

  const domain = '7200';

  group(
    'StadataView',
    () {
      group(
        'publication()',
        () {
          late ApiResponse<Publication> response;
          late Publication data;
          setUp(
            () {
              final json = jsonFromFixture(Fixture.publicationDetail);
              final jsonResponse = ApiResponseModel<PublicationModel?>.fromJson(
                json,
                (json) => json == null
                    ? null
                    : PublicationModel.fromJson(json as JSON),
              );
              response = ApiResponse<Publication>(
                data: jsonResponse.data,
                status: jsonResponse.status,
                message: jsonResponse.message,
                dataAvailability: jsonResponse.dataAvailability,
                pagination: jsonResponse.pagination,
              );
              data = jsonResponse.data!;
            },
          );

          const id = '1234';

          test(
            'should return an instance of Publication when success',
            () async {
              when(
                () => mockGetDetailPublication(
                  const GetPublicationDetailParam(id: id, domain: domain),
                ),
              ).thenAnswer((_) async => Result.success(response));

              final result =
                  await stadataView.publication(id: id, domain: domain);

              expect(result, data);
              verify(
                () => mockGetDetailPublication(
                  const GetPublicationDetailParam(id: id, domain: domain),
                ),
              );
            },
          );

          test(
            'should throw Exception if failure occured',
            () async {
              when(
                () => mockGetDetailPublication(
                  const GetPublicationDetailParam(id: id, domain: domain),
                ),
              ).thenAnswer(
                (_) async => Result.failure(
                  const PublicationFailure(),
                ),
              );

              expect(
                () => stadataView.publication(id: id, domain: domain),
                throwsA(
                  isA<Exception>().having(
                    (e) => e.toString(),
                    'Exception message',
                    'StadataException - Failed to load publication data!',
                  ),
                ),
              );
              verify(
                () => mockGetDetailPublication(
                  const GetPublicationDetailParam(id: id, domain: domain),
                ),
              );
            },
          );
        },
      );

      group(
        'staticTable()',
        () {
          late ApiResponse<StaticTable> response;
          late StaticTable data;
          setUp(
            () {
              final json = jsonFromFixture(Fixture.staticTableDetail);
              final jsonResponse = ApiResponseModel<StaticTableModel?>.fromJson(
                json,
                (json) => json == null
                    ? null
                    : StaticTableModel.fromJson(json as JSON),
              );
              response = ApiResponse<StaticTable>(
                data: jsonResponse.data,
                status: jsonResponse.status,
                message: jsonResponse.message,
                dataAvailability: jsonResponse.dataAvailability,
                pagination: jsonResponse.pagination,
              );
              data = jsonResponse.data!;
            },
          );

          const id = 1234;

          test(
            'should return an instance of Static Table when success',
            () async {
              when(
                () => mockGetDetailStaticTable(
                  const GetDetailStaticTableParam(id: id, domain: domain),
                ),
              ).thenAnswer((_) async => Result.success(response));

              final result =
                  await stadataView.staticTable(id: id, domain: domain);

              expect(result, data);
              verify(
                () => mockGetDetailStaticTable(
                  const GetDetailStaticTableParam(id: id, domain: domain),
                ),
              );
            },
          );

          test(
            'should throw Exception if failure occured',
            () async {
              when(
                () => mockGetDetailStaticTable(
                  const GetDetailStaticTableParam(id: id, domain: domain),
                ),
              ).thenAnswer(
                (_) async => Result.failure(
                  const StaticTableFailure(),
                ),
              );

              expect(
                () => stadataView.staticTable(id: id, domain: domain),
                throwsA(
                  isA<Exception>().having(
                    (e) => e.toString(),
                    'Exception message',
                    'StadataException - Failed to load static table data!',
                  ),
                ),
              );
              verify(
                () => mockGetDetailStaticTable(
                  const GetDetailStaticTableParam(id: id, domain: domain),
                ),
              );
            },
          );
        },
      );
      group(
        'news()',
        () {
          late ApiResponse<News> response;
          late News data;
          setUp(
            () {
              final json = jsonFromFixture(Fixture.newsDetail);
              final jsonResponse = ApiResponseModel<NewsModel?>.fromJson(
                json,
                (json) =>
                    json == null ? null : NewsModel.fromJson(json as JSON),
              );
              response = ApiResponse<News>(
                data: jsonResponse.data,
                status: jsonResponse.status,
                message: jsonResponse.message,
                dataAvailability: jsonResponse.dataAvailability,
                pagination: jsonResponse.pagination,
              );
              data = jsonResponse.data!;
            },
          );

          const id = 1234;

          test(
            'should return an instance of News when success',
            () async {
              when(
                () => mockGetDetailNews(
                  const GetDetailNewsParam(id: id, domain: domain),
                ),
              ).thenAnswer((_) async => Result.success(response));

              final result = await stadataView.news(id: id, domain: domain);

              expect(result, data);
              verify(
                () => mockGetDetailNews(
                  const GetDetailNewsParam(id: id, domain: domain),
                ),
              );
            },
          );

          test(
            'should throw Exception if failure occured',
            () async {
              when(
                () => mockGetDetailNews(
                  const GetDetailNewsParam(id: id, domain: domain),
                ),
              ).thenAnswer(
                (_) async => Result.failure(
                  const NewsFailure(),
                ),
              );

              expect(
                () => stadataView.news(id: id, domain: domain),
                throwsA(
                  isA<Exception>().having(
                    (e) => e.toString(),
                    'Exception message',
                    'StadataException - Failed to load news data!',
                  ),
                ),
              );
              verify(
                () => mockGetDetailNews(
                  const GetDetailNewsParam(id: id, domain: domain),
                ),
              );
            },
          );
        },
      );

      group(
        'pressRelease()',
        () {
          late ApiResponse<PressRelease> response;
          late PressRelease data;
          setUp(
            () {
              final json = jsonFromFixture(Fixture.pressReleaseDetail);
              final jsonResponse =
                  ApiResponseModel<PressReleaseModel?>.fromJson(
                json,
                (json) => json == null
                    ? null
                    : PressReleaseModel.fromJson(json as JSON),
              );
              response = ApiResponse<PressRelease>(
                data: jsonResponse.data,
                status: jsonResponse.status,
                message: jsonResponse.message,
                dataAvailability: jsonResponse.dataAvailability,
                pagination: jsonResponse.pagination,
              );
              data = jsonResponse.data!;
            },
          );

          const id = 1234;

          test(
            'should return an instance of Press Release when success',
            () async {
              when(
                () => mockGetDetailPressRelease(
                  const GetDetailPressReleaseParam(id: id, domain: domain),
                ),
              ).thenAnswer((_) async => Result.success(response));

              final result =
                  await stadataView.pressRelease(id: id, domain: domain);

              expect(result, data);
              verify(
                () => mockGetDetailPressRelease(
                  const GetDetailPressReleaseParam(id: id, domain: domain),
                ),
              );
            },
          );

          test(
            'should throw Exception if failure occured',
            () async {
              when(
                () => mockGetDetailPressRelease(
                  const GetDetailPressReleaseParam(id: id, domain: domain),
                ),
              ).thenAnswer(
                (_) async => Result.failure(
                  const PressReleaseFailure(),
                ),
              );

              expect(
                () => stadataView.pressRelease(id: id, domain: domain),
                throwsA(
                  isA<Exception>().having(
                    (e) => e.toString(),
                    'Exception message',
                    'StadataException - Failed to load press release data!',
                  ),
                ),
              );
              verify(
                () => mockGetDetailPressRelease(
                  const GetDetailPressReleaseParam(id: id, domain: domain),
                ),
              );
            },
          );
        },
      );

      group(
        'statisticClassification()',
        () {
          late ApiResponse<List<StatisticClassification>> response;
          late List<StatisticClassification> data;
          setUp(
            () {
              final json = jsonFromFixture(Fixture.staticTableDetail);
              final jsonResponse =
                  ApiResponseModel<List<StatisticClassification>?>.fromJson(
                json,
                (json) {
                  if (json is! List<Map>) {
                    return [];
                  }

                  return json.map(
                    (json) {
                      final data = json['_source'] as JSON;
                      return StatisticClassificationModel.fromJson(data);
                    },
                  ).toList();
                },
              );
              response = ApiResponse<List<StatisticClassification>>(
                data: jsonResponse.data,
                status: jsonResponse.status,
                message: jsonResponse.message,
                dataAvailability: jsonResponse.dataAvailability,
                pagination: jsonResponse.pagination,
              );
              data = jsonResponse.data ?? [];
            },
          );

          const type = KBLIType.y2020;
          final id = type.urlParamGenerator('A');

          test(
            'should return childrens of KBLI/KBKI when success',
            () async {
              when(
                () => mockGetDetailStatisticClassification(
                  GetDetailStatisticClassificationParam(
                    id: id,
                    type: type,
                  ),
                ),
              ).thenAnswer((_) async => Result.success(response));

              final result = await stadataView.statisticClassification(
                id: id,
                type: type,
              );

              expect(result, data);
              verify(
                () => mockGetDetailStatisticClassification(
                  GetDetailStatisticClassificationParam(
                    id: id,
                    type: type,
                  ),
                ),
              );
            },
          );

          test(
            'should throw Exception if failure occured',
            () async {
              when(
                () => mockGetDetailStatisticClassification(
                  GetDetailStatisticClassificationParam(
                    id: id,
                    type: type,
                  ),
                ),
              ).thenAnswer(
                (_) async => Result.failure(
                  const StatisticClassificationFailure(),
                ),
              );

              expect(
                () => stadataView.statisticClassification(id: id, type: type),
                throwsA(
                  isA<Exception>().having(
                    (e) => e.toString(),
                    'Exception message',
                    'StadataException - Failed to load statistic classification data!',
                  ),
                ),
              );
              verify(
                () => mockGetDetailStatisticClassification(
                  GetDetailStatisticClassificationParam(
                    id: id,
                    type: type,
                  ),
                ),
              );
            },
          );
        },
      );
    },
  );
}
