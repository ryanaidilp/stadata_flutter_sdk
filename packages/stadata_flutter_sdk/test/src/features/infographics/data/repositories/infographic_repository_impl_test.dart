import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:stadata_flutter_sdk/src/core/core.dart';
import 'package:stadata_flutter_sdk/src/features/features.dart';
import 'package:stadata_flutter_sdk/src/shared/shared.dart';

import '../../../../../fixtures/fixtures.dart';
import '../../../../../helpers/test_injection.dart';

class MockInfographicRemoteDataSource extends Mock
    implements InfographicRemoteDataSource {}

void main() {
  late InfographicRemoteDataSource mockRemoteDataSource;
  late InfographicRepository repository;
  late ApiResponseModel<List<InfographicModel>?> successResponse;
  late ApiResponse<List<Infographic>> infographics;

  setUpAll(
    () {
      mockRemoteDataSource = MockInfographicRemoteDataSource();
      registerTestLazySingleton<InfographicRemoteDataSource>(
        mockRemoteDataSource,
      );
      repository = InfographicRepositoryImpl();

      final json = jsonFromFixture(Fixture.infographics);

      successResponse = ApiResponseModel<List<InfographicModel>?>.fromJson(
        json,
        (json) {
          if (json == null || json is! List) {
            return null;
          }

          return json.map((e) => InfographicModel.fromJson(e as JSON)).toList();
        },
      );

      final data = successResponse.data?.map((e) => e).toList();

      infographics = ApiResponse(
        data: data,
        status: successResponse.status,
        message: successResponse.message,
        dataAvailability: successResponse.dataAvailability,
        pagination: successResponse.pagination,
      );
    },
  );
  tearDownAll(unregisterTestInjection);

  const domain = '7205';

  group(
    'InfographicRepositoryImpl',
    () {
      group(
        'get()',
        () {
          test(
            'should return list of infographics if success',
            () async {
              // arrange
              when(
                () => mockRemoteDataSource.get(domain: domain),
              ).thenAnswer((_) async => successResponse);

              // act
              final result = await repository.get(domain: domain);

              // assert
              expect(
                result,
                equals(
                  Result.success<Failure, ApiResponse<List<Infographic>>>(
                    infographics,
                  ),
                ),
              );
              verify(
                () => mockRemoteDataSource.get(domain: domain),
              ).called(1);
            },
          );

          test(
            'should return Failure if exception occured',
            () async {
              // arrange
              when(
                () => mockRemoteDataSource.get(domain: domain),
              ).thenThrow(const InfographicNotAvailableException());

              // act
              final result = await repository.get(domain: domain);

              // assert
              expect(
                result,
                equals(
                  Result.failure<Failure, ApiResponse<List<Infographic>>>(
                    const InfographicFailure(
                      message: 'StadataException - Infographic not available!',
                    ),
                  ),
                ),
              );
              verify(
                () => mockRemoteDataSource.get(domain: domain),
              ).called(1);
            },
          );
        },
      );
    },
  );
}
