import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:stadata_flutter_sdk/src/core/core.dart';
import 'package:stadata_flutter_sdk/src/features/features.dart';
import 'package:stadata_flutter_sdk/src/shared/shared.dart';

import '../../../../../fixtures/fixtures.dart';
import '../../../../../helpers/test_injection.dart';

class MockDomainRemoteDataSource extends Mock
    implements DomainRemoteDataSource {}

void main() {
  late DomainRemoteDataSource mockRemoteDataSource;
  late DomainRepository repository;
  late ApiResponseModel<List<DomainModel>?> successResponse;
  late ApiResponse<List<DomainEntity>> domains;
  setUpAll(
    () {
      mockRemoteDataSource = MockDomainRemoteDataSource();
      registerTestLazySingleton<DomainRemoteDataSource>(mockRemoteDataSource);
      repository = DomainRepositoryImpl();
      final json = jsonFromFixture(Fixture.domains);
      successResponse = ApiResponseModel<List<DomainModel>?>.fromJson(
        json,
        (json) {
          if (json == null || json is! List) {
            return null;
          }

          return json.map((e) => DomainModel.fromJson(e as JSON)).toList();
        },
      );

      final data = successResponse.data?.map((e) => e).toList();

      domains = ApiResponse(
        status: successResponse.status,
        dataAvailability: successResponse.dataAvailability,
        data: data,
        message: successResponse.message,
        pagination: successResponse.pagination,
      );
    },
  );

  tearDownAll(unregisterTestInjection);

  group(
    'DomainRepositoryImpl',
    () {
      group(
        'get()',
        () {
          test(
            'should return list of domains if success',
            () async {
              // arrange
              when(
                () => mockRemoteDataSource.get(
                  type: DomainType.all,
                ),
              ).thenAnswer((_) async => successResponse);

              // act
              final result = await repository.get();

              // assert
              expect(
                result,
                equals(
                  Result.success<Failure, ApiResponse<List<DomainEntity>>>(
                    domains,
                  ),
                ),
              );
              verify(
                () => mockRemoteDataSource.get(
                  type: DomainType.all,
                ),
              ).called(1);
            },
          );

          test(
            'should return Failure if failed.',
            () async {
              // arrange
              when(
                () => mockRemoteDataSource.get(
                  type: DomainType.all,
                ),
              ).thenThrow(const DomainNotAvailableException());

              // act
              final result = await repository.get();

              // assert
              expect(
                result,
                equals(
                  Result.failure<Failure, ApiResponse<List<DomainEntity>>>(
                    const DomainFailure(
                      message: 'StadataException - Domain not available!',
                    ),
                  ),
                ),
              );
              verify(
                () => mockRemoteDataSource.get(
                  type: DomainType.all,
                ),
              ).called(1);
            },
          );
        },
      );
    },
  );
}
