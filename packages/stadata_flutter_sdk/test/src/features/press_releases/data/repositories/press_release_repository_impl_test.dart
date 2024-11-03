import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:stadata_flutter_sdk/src/core/core.dart';
import 'package:stadata_flutter_sdk/src/features/features.dart';
import 'package:stadata_flutter_sdk/src/shared/shared.dart';

import '../../../../../fixtures/fixtures.dart';
import '../../../../../helpers/test_injection.dart';

class MockPressReleaseRemoteDataSource extends Mock
    implements PressReleaseRemoteDataSource {}

void main() {
  late PressReleaseRemoteDataSource mockRemoteDataSource;
  late PressReleaseRepository repository;

  setUpAll(
    () {
      mockRemoteDataSource = MockPressReleaseRemoteDataSource();
      registerTestLazySingleton<PressReleaseRemoteDataSource>(
        mockRemoteDataSource,
      );
      repository = PressReleaseRepositoryImpl();
    },
  );

  tearDownAll(unregisterTestInjection);

  const domain = '7205';

  group(
    'PublicationRepositoryImpl',
    () {
      group(
        'get()',
        () {
          late ApiResponseModel<List<PressReleaseModel>?> response;
          late ApiResponse<List<PressRelease>> data;

          setUp(
            () {
              final json = jsonFromFixture(Fixture.pressReleases);

              response = ApiResponseModel<List<PressReleaseModel>?>.fromJson(
                json,
                (json) {
                  if (json == null || json is! List) {
                    return null;
                  }
                  return json
                      .map((e) => PressReleaseModel.fromJson(e as JSON))
                      .toList();
                },
              );

              final responseData = response.data?.map((e) => e).toList();

              data = ApiResponse<List<PressRelease>>(
                status: response.status,
                dataAvailability: response.dataAvailability,
                data: responseData,
                message: response.message,
                pagination: response.pagination,
              );
            },
          );
          test(
            'should return List of Press Releases if success',
            () async {
              // arrange
              when(
                () => mockRemoteDataSource.get(
                  domain: domain,
                ),
              ).thenAnswer((_) async => response);

              // act
              final result = await repository.get(domain: domain);

              // assert
              expect(
                result,
                equals(
                  Result.success<Failure, ApiResponse<List<PressRelease>>>(
                    data,
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

          test(
            'should return Failure if exception occured',
            () async {
              // arrange
              when(
                () => mockRemoteDataSource.get(
                  domain: domain,
                ),
              ).thenThrow(const PressReleaseNotAvailableException());

              // act
              final result = await repository.get(domain: domain);

              // assert
              expect(
                result,
                equals(
                  Result.failure<Failure, ApiResponse<List<PressRelease>>>(
                    const PressReleaseFailure(
                      message:
                          'StadataException - Press Release not available!',
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

      const id = 1234;

      group(
        'detail()',
        () {
          late ApiResponseModel<PressReleaseModel?> response;
          late ApiResponse<PressRelease> data;
          setUp(
            () {
              final jsonDetail = jsonFromFixture(
                Fixture.pressReleaseDetail,
              );

              response = ApiResponseModel<PressReleaseModel?>.fromJson(
                jsonDetail,
                (json) {
                  if (json == null) {
                    return null;
                  }

                  return PressReleaseModel.fromJson(json as JSON);
                },
              );

              data = ApiResponse<PressRelease>(
                status: response.status,
                dataAvailability: response.dataAvailability,
                data: response.data,
                pagination: response.pagination,
                message: response.message,
              );
            },
          );
          test(
            'should return an instance of PressRelease if success',
            () async {
              // arrange
              when(
                () => mockRemoteDataSource.detail(
                  id: id,
                  domain: domain,
                ),
              ).thenAnswer((_) async => response);

              // act
              final result = await repository.detail(
                id: id,
                domain: domain,
              );

              // assert
              expect(
                result,
                equals(
                  Result.success<Failure, ApiResponse<PressRelease>>(data),
                ),
              );
              verify(
                () => mockRemoteDataSource.detail(
                  id: id,
                  domain: domain,
                ),
              ).called(1);
            },
          );

          test(
            'should return Failure if exception occured',
            () async {
              // arrange
              when(
                () => mockRemoteDataSource.detail(
                  id: id,
                  domain: domain,
                ),
              ).thenThrow(const PressReleaseNotAvailableException());

              // act
              final result = await repository.detail(id: id, domain: domain);

              // assert
              expect(
                result,
                equals(
                  Result.failure<Failure, ApiResponse<PressRelease>>(
                    const PressReleaseFailure(
                      message:
                          'StadataException - Press Release not available!',
                    ),
                  ),
                ),
              );
              verify(
                () => mockRemoteDataSource.detail(
                  id: id,
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
