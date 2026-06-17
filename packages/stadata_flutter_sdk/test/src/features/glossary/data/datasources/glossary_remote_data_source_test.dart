import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:stadata_flutter_sdk/src/core/core.dart';
import 'package:stadata_flutter_sdk/src/features/features.dart';
import 'package:stadata_flutter_sdk/src/shared/shared.dart';

import '../../../../../fixtures/fixtures.dart';
import '../../../../../helpers/test_injection.dart';

class MockListNetworkClient extends Mock implements NetworkClient {}

void main() {
  late NetworkClient mockListClient;
  late GlossaryRemoteDataSource dataSource;
  late ApiResponseModel<List<GlossaryModel>?> data;
  late JSON response;
  late JSON unavailableResponse;

  setUpAll(() {
    mockListClient = MockListNetworkClient();
    registerTestFactory<NetworkClient>(
      mockListClient,
      instanceName: 'listClient',
    );
    dataSource = GlossaryRemoteDataSourceImpl();

    response = jsonFromFixture(Fixture.glossary);
    unavailableResponse = jsonFromFixture(Fixture.listUnavailable);

    data = ApiResponseModel<List<GlossaryModel>?>.fromJson(response, (json) {
      if (json == null || json is! List) {
        return null;
      }
      return json.map((e) => GlossaryModel.fromJson(e as JSON)).toList();
    });
  });

  tearDownAll(unregisterTestInjection);

  const domain = '7315';

  group('GlossaryRemoteDataSource', () {
    group('get()', () {
      final queryParams = {
        QueryParamConstant.domain: domain,
        QueryParamConstant.lang: DataLanguage.id.value,
        QueryParamConstant.page: 1,
      };

      test('should return list of glossary if success', () async {
        when(
          () => mockListClient.get<JSON>(
            ApiEndpoint.glossary,
            queryParams: queryParams,
          ),
        ).thenAnswer((_) async => response);

        final result = await dataSource.get(domain: domain);

        expect(result, equals(data));
        verify(
          () => mockListClient.get<JSON>(
            ApiEndpoint.glossary,
            queryParams: queryParams,
          ),
        ).called(1);
      });

      test(
        'should throw GlossaryNotAvailableException when list-not-available',
        () async {
          when(
            () => mockListClient.get<JSON>(
              ApiEndpoint.glossary,
              queryParams: queryParams,
            ),
          ).thenAnswer((_) async => unavailableResponse);

          final result = dataSource.get(domain: domain);

          await expectLater(
            result,
            throwsA(const GlossaryNotAvailableException()),
          );
          verify(
            () => mockListClient.get<JSON>(
              ApiEndpoint.glossary,
              queryParams: queryParams,
            ),
          ).called(1);
        },
      );

      test('should throw ApiException on error status', () async {
        when(
          () => mockListClient.get<JSON>(
            ApiEndpoint.glossary,
            queryParams: queryParams,
          ),
        ).thenAnswer(
          (_) async => {'status': 'Error', 'message': 'Something went wrong'},
        );

        final result = dataSource.get(domain: domain);

        await expectLater(result, throwsA(isA<ApiException>()));
        verify(
          () => mockListClient.get<JSON>(
            ApiEndpoint.glossary,
            queryParams: queryParams,
          ),
        ).called(1);
      });
    });
  });
}
