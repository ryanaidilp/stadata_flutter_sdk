import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:stadata_flutter_sdk/src/core/core.dart';
import 'package:stadata_flutter_sdk/src/features/features.dart';
import 'package:stadata_flutter_sdk/src/shared/shared.dart';

import '../../../../../fixtures/fixtures.dart';
import '../../../../../helpers/test_injection.dart';

class MockStadataListHttpModule extends Mock implements StadataListHttpModule {}

void main() {
  late StadataListHttpModule mockListHttpModule;
  late NewsCategoryRemoteDataSource dataSource;
  late ApiResponseModel<List<NewsCategoryModel>?> data;
  late JSON response;
  late JSON unavailableResponse;

  setUpAll(
    () {
      mockListHttpModule = MockStadataListHttpModule();
      registerTestLazySingleton<StadataListHttpModule>(mockListHttpModule);
      dataSource = NewsCategoryRemoteDataSourceImpl();

      response = jsonFromFixture(Fixture.newsCategory);
      unavailableResponse = jsonFromFixture(Fixture.listUnavailable);

      data = ApiResponseModel<List<NewsCategoryModel>?>.fromJson(
        response,
        (json) {
          if (json == null || json is! List) {
            return null;
          }
          return json
              .map((e) => NewsCategoryModel.fromJson(e as JSON))
              .toList();
        },
      );
    },
  );

  tearDownAll(unregisterTestInjection);

  const domain = '7315';

  group(
    'NewsCategoryRemoteDataSource',
    () {
      group(
        'get()',
        () {
          test(
            'should return List of news categories if success',
            () async {
              when(
                () => mockListHttpModule.get(
                  ApiEndpoint.newsCategory(
                    domain: domain,
                  ),
                ),
              ).thenAnswer(
                (_) async => response,
              );

              final result = await dataSource.get(
                domain: domain,
              );

              expect(result, equals(data));
              verify(
                () => mockListHttpModule.get(
                  ApiEndpoint.newsCategory(
                    domain: domain,
                  ),
                ),
              ).called(1);
            },
          );

          test(
            'should throw NewsCategoryNotAvailableException '
            'when list-not-available',
            () async {
              when(
                () => mockListHttpModule.get(
                  ApiEndpoint.newsCategory(domain: domain),
                ),
              ).thenAnswer(
                (_) async => unavailableResponse,
              );

              final result = dataSource.get(
                domain: domain,
              );

              await expectLater(
                result,
                throwsA(
                  const NewsCategoryNotAvailableException(),
                ),
              );
              verify(
                () => mockListHttpModule.get(
                  ApiEndpoint.newsCategory(domain: domain),
                ),
              ).called(1);
            },
          );
        },
      );
    },
  );
}
