import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:stadata_flutter_sdk/src/core/network/api_endpoint.dart';

import 'package:stadata_flutter_sdk/src/core/network/http/modules/stadata_list_http_module.dart';
import 'package:stadata_flutter_sdk/src/core/typedef/typedef.dart';
import 'package:stadata_flutter_sdk/src/features/subject_categories/data/datasources/subject_category_remote_data_source.dart';
import 'package:stadata_flutter_sdk/src/features/subject_categories/data/models/subject_category_model.dart';
import 'package:stadata_flutter_sdk/src/shared/data/models/api_response_model.dart';
import 'package:stadata_flutter_sdk/stadata_flutter_sdk.dart';

import '../../../../../fixtures/fixtures.dart';
import '../../../../../helpers/test_injection.dart';

class MockStadataListHttpModule extends Mock implements StadataListHttpModule {}

void main() {
  late StadataListHttpModule mockListHttpModule;
  late SubjectCategoryRemoteDataSource dataSource;
  late ApiResponseModel<List<SubjectCategoryModel>?> subjectCategories;
  late JSON response;
  late JSON unavailableResponse;

  setUpAll(
    () {
      mockListHttpModule = MockStadataListHttpModule();
      registerTestLazySingleton<StadataListHttpModule>(mockListHttpModule);
      dataSource = SubjectCategoryRemoteDataSourceImpl();

      response = jsonFromFixture(Fixture.subjectCategories);
      unavailableResponse = jsonFromFixture(Fixture.listUnavailable);

      subjectCategories =
          ApiResponseModel<List<SubjectCategoryModel>?>.fromJson(
        response,
        (json) {
          if (json == null || json is! List) {
            return null;
          }

          return json
              .map((e) => SubjectCategoryModel.fromJson(e as JSON))
              .toList();
        },
      );
    },
  );

  tearDownAll(unregisterTestInjection);

  const domain = '7200';

  group(
    'SubjectCategoryRemoteDataSource',
    () {
      group(
        'get()',
        () {
          test(
            'should return List of subject categories if success',
            () async {
              when(
                () => mockListHttpModule.get(
                  ApiEndpoint.subjectCategories(domain: domain),
                ),
              ).thenAnswer(
                (_) async => response,
              );

              final result = await dataSource.get(domain: domain);

              expect(result, equals(subjectCategories));
              verify(
                () => mockListHttpModule.get(
                  ApiEndpoint.subjectCategories(domain: domain),
                ),
              ).called(1);
            },
          );

          test(
            'should throw SubjectCategoryNotAvailableException when '
            'list-not-available',
            () async {
              when(
                () => mockListHttpModule.get(
                  ApiEndpoint.subjectCategories(
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
                  const SubjectCategoryNotAvailableException(),
                ),
              );
              verify(
                () => mockListHttpModule.get(
                  ApiEndpoint.subjectCategories(
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
