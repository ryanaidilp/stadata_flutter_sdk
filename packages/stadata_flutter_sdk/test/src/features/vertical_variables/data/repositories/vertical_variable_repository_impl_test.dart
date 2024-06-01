import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:stadata_flutter_sdk/src/core/core.dart';
import 'package:stadata_flutter_sdk/src/features/features.dart';
import 'package:stadata_flutter_sdk/src/shared/shared.dart';

import '../../../../../fixtures/fixtures.dart';
import '../../../../../helpers/test_injection.dart';

class MockVerticalVariableRemoteDataSource extends Mock
    implements VerticalVariableRemoteDataSource {}

void main() {
  late VerticalVariableRemoteDataSource mockRemoteDataSource;
  late VerticalVariableRepository repository;
  late ApiResponseModel<List<VerticalVariableModel>?> successResponse;
  late ApiResponse<List<VerticalVariable>> verticalVariables;

  setUpAll(
    () {
      mockRemoteDataSource = MockVerticalVariableRemoteDataSource();
      registerTestLazySingleton<VerticalVariableRemoteDataSource>(
        mockRemoteDataSource,
      );
      repository = VerticalVariableRepositoryImpl();
      final json = jsonFromFixture(Fixture.verticalVariables);
      successResponse = ApiResponseModel<List<VerticalVariableModel>?>.fromJson(
        json,
        (json) {
          if (json == null || json is! List) {
            return null;
          }

          return json
              .map((e) => VerticalVariableModel.fromJson(e as JSON))
              .toList();
        },
      );

      final data = successResponse.data?.map((e) => e.toEntity()).toList();

      verticalVariables = ApiResponse<List<VerticalVariable>>(
        status: successResponse.status,
        dataAvailability: successResponse.dataAvailability,
        data: data,
        message: successResponse.message,
        pagination: successResponse.pagination?.toEntity(),
      );
    },
  );

  tearDownAll(unregisterTestInjection);

  const domain = '7200';

  group(
    'VerticalVariableRepositoryImpl',
    () {
      group(
        'get()',
        () {
          test(
            'should return list of vertical variables if success',
            () async {
              // arrange
              when(
                () => mockRemoteDataSource.get(
                  domain: domain,
                ),
              ).thenAnswer((_) async => successResponse);

              // act
              final result = await repository.get(domain: domain);

              // assert
              expect(
                result,
                equals(
                  Right<Failure, ApiResponse<List<VerticalVariable>>>(
                    verticalVariables,
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
            'should return Failure if failed.',
            () async {
              // arrange
              when(
                () => mockRemoteDataSource.get(
                  domain: domain,
                ),
              ).thenThrow(const VerticalVariableNotAvailableException());

              // act
              final result = await repository.get(domain: domain);

              // assert
              expect(
                result,
                equals(
                  const Left<Failure, ApiResponse<List<VerticalVariable>>>(
                    VerticalVariableFailure(
                      message:
                          'StadataException - Vertical Variable not available!',
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
