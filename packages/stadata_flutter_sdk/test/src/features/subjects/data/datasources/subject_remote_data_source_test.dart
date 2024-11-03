import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:stadata_flutter_sdk/src/core/core.dart';
import 'package:stadata_flutter_sdk/src/features/features.dart';
import 'package:stadata_flutter_sdk/src/shared/shared.dart';

import '../../../../../fixtures/fixtures.dart';
import '../../../../../helpers/test_injection.dart';

class MockNetworkClient extends Mock implements NetworkClient {}

void main() {
  late NetworkClient mockListClient;
  late SubjectRemoteDataSource dataSource;
  late ApiResponseModel<List<SubjectModel>?> subjects;
  late JSON response;
  late JSON unavailableResponse;

  setUpAll(
    () {
      mockListClient = MockNetworkClient();
      registerTestFactory<NetworkClient>(
        mockListClient,
        instanceName: 'listClient',
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
                () => mockListClient.get<JSON>(
                  ApiEndpoint.subjects(domain: domain),
                ),
              ).thenAnswer(
                (_) async => response,
              );

              final result = await dataSource.get(domain: domain);

              expect(result, equals(subjects));
              verify(
                () => mockListClient.get<JSON>(
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
                () => mockListClient.get<JSON>(
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
                () => mockListClient.get<JSON>(
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
