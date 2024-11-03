import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:stadata_flutter_sdk/src/core/core.dart';
import 'package:stadata_flutter_sdk/src/features/features.dart';
import 'package:stadata_flutter_sdk/src/shared/shared.dart';

import '../../../../../fixtures/fixtures.dart';
import '../../../../../helpers/test_injection.dart';

class MockNewsCategoryRemoteDataSource extends Mock
    implements NewsCategoryRemoteDataSource {}

class MockLog extends Mock implements Log {}

void main() {
  late Log mockLog;
  late NewsCategoryRemoteDataSource mockRemoteDataSource;
  late NewsCategoryRepository repository;

  setUpAll(
    () {
      mockRemoteDataSource = MockNewsCategoryRemoteDataSource();
      registerTestLazySingleton<NewsCategoryRemoteDataSource>(
        mockRemoteDataSource,
      );
      mockLog = MockLog();
      registerTestFactory<Log>(mockLog);
      registerFallbackValue(LogType.error);
      repository = NewsCategoryRepositoryImpl();
    },
  );

  tearDownAll(() => unregisterTestInjection);

  const domain = '7315';

  group(
    'NewsCategoryRepositoryImpl',
    () {
      group(
        'get()',
        () {
          late ApiResponseModel<List<NewsCategoryModel>?> response;
          late ApiResponse<List<NewsCategory>> data;

          setUp(
            () {
              final json = jsonFromFixture(Fixture.newsCategory);
              response = ApiResponseModel<List<NewsCategoryModel>?>.fromJson(
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

              final responseData = response.data?.map((e) => e).toList() ?? [];

              data = ApiResponse<List<NewsCategory>>(
                data: responseData,
                status: response.status,
                message: response.message,
                pagination: response.pagination,
                dataAvailability: response.dataAvailability,
              );
            },
          );

          test(
            'should return list of news categories if success',
            () async {
              // arrange
              when(
                () => mockRemoteDataSource.get(domain: domain),
              ).thenAnswer((_) async => response);

              // act
              final result = await repository.get(domain: domain);

              // assert
              expect(
                result,
                equals(
                  Result.success<Failure, ApiResponse<List<NewsCategory>>>(
                    data,
                  ),
                ),
              );
              verify(
                () => mockRemoteDataSource.get(domain: domain),
              ).called(1);
            },
          );

          test(
            'should return Failure if failed.',
            () async {
              // arrange
              when(
                () => mockRemoteDataSource.get(domain: domain),
              ).thenThrow(const NewsCategoryNotAvailableException());
              when(
                () => mockLog.console(
                  any(),
                  error: any<dynamic>(named: 'error'),
                  stackTrace: any(named: 'stackTrace'),
                  type: any(named: 'type'),
                ),
              ).thenAnswer((_) async => Future.value());

              // act
              final result = await repository.get(domain: domain);

              // assert
              expect(
                result,
                equals(
                  Result.failure<Failure, ApiResponse<List<NewsCategory>>>(
                    const NewsCategoryFailure(
                      message:
                          'StadataException - News Category not available!',
                    ),
                  ),
                ),
              );
              verify(
                () => mockRemoteDataSource.get(
                  domain: domain,
                ),
              ).called(1);
            },
          );
        },
      );
    },
  );
}
