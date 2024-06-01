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
  late SubjectRemoteDataSource dataSource;
  late ApiResponseModel<List<SubjectModel>?> subjects;
  late JSON response;
  late JSON unavailableResponse;

  setUpAll(
    () {
      mockListHttpModule = MockStadataListHttpModule();
      registerTestLazySingleton<StadataListHttpModule>(
        mockListHttpModule,
      );
      dataSource = SubjectRemoteDataSourceImpl();

      response = jsonFromFixture(Fixture.subjects);
      unavailableResponse = jsonFromFixture(Fixture.listUnavailable);

      subjects = ApiResponseModel<List<SubjectModel>?>.fromJson(
        response,
        (json) {
          if (json == null || json is! List) {
            return null;
          }

          return json.map((e) => SubjectModel.fromJson(e as JSON)).toList();
        },
      );
    },
  );

  tearDownAll(() => unregisterTestInjection);

  const domain = '7200';

  group(
    'SubjectRemoteDataSource',
    () {
      group(
        'get()',
        () {
          test(
            'should return List of subjects if success',
            () async {
              when(
                () => mockListHttpModule.get(
                  ApiEndpoint.subjects(domain: domain),
                ),
              ).thenAnswer(
                (_) async => response,
              );

              final result = await dataSource.get(domain: domain);

              expect(result, equals(subjects));
              verify(
                () => mockListHttpModule.get(
                  ApiEndpoint.subjects(domain: domain),
                ),
              ).called(1);
            },
          );

          test(
            'should throw SubjectNotAvailableException when '
            'list-not-available',
            () async {
              when(
                () => mockListHttpModule.get(
                  ApiEndpoint.subjects(
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
                  const SubjectNotAvailableException(),
                ),
              );
              verify(
                () => mockListHttpModule.get(
                  ApiEndpoint.subjects(
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
