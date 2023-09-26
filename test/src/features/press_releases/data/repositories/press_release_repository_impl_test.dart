import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:stadata_flutter_sdk/src/core/failures/failures.dart';
import 'package:stadata_flutter_sdk/src/core/typedef/typedef.dart';
import 'package:stadata_flutter_sdk/src/features/press_releases/data/datasources/press_release_remote_data_source.dart';
import 'package:stadata_flutter_sdk/src/features/press_releases/data/models/press_release_model.dart';
import 'package:stadata_flutter_sdk/src/features/press_releases/data/repositories/press_release_repository_impl.dart';
import 'package:stadata_flutter_sdk/src/features/press_releases/domain/repositories/press_release_repository.dart';
import 'package:stadata_flutter_sdk/src/shared/data/models/api_response_model.dart';
import 'package:stadata_flutter_sdk/src/shared/data/models/pagination_model.dart';
import 'package:stadata_flutter_sdk/src/shared/domain/entities/api_response.dart';
import 'package:stadata_flutter_sdk/stadata_flutter_sdk.dart';

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
              final json = jsonFromFixture(Fixture.pressReleases.value);

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

              final responseData =
                  response.data?.map((e) => e.toEntity()).toList();

              data = ApiResponse<List<PressRelease>>(
                status: response.status,
                dataAvailability: response.dataAvailability,
                data: responseData,
                message: response.message,
                pagination: response.pagination?.toEntity(),
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
                  Right<Failure, ApiResponse<List<PressRelease>>>(
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
                  const Left<Failure, ApiResponse<List<PressRelease>>>(
                    PressReleaseFailure(
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
                Fixture.pressReleaseDetail.value,
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
                data: response.data?.toEntity(),
                pagination: response.pagination?.toEntity(),
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
                  Right<Failure, ApiResponse<PressRelease>>(data),
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
                  const Left<Failure, ApiResponse<Publication>>(
                    PressReleaseFailure(
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
