import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:stadata_flutter_sdk/src/core/failures/failures.dart';
import 'package:stadata_flutter_sdk/src/core/typedef/typedef.dart';
import 'package:stadata_flutter_sdk/src/features/vertical_variables/data/datasources/vertical_variable_remote_data_source.dart';
import 'package:stadata_flutter_sdk/src/features/vertical_variables/data/models/vertical_variable_model.dart';
import 'package:stadata_flutter_sdk/src/features/vertical_variables/data/repositories/vertical_variable_repository_impl.dart';
import 'package:stadata_flutter_sdk/src/features/vertical_variables/domain/repositories/vertical_variable_repository.dart';
import 'package:stadata_flutter_sdk/src/shared/data/models/api_response_model.dart';
import 'package:stadata_flutter_sdk/src/shared/data/models/pagination_model.dart';
import 'package:stadata_flutter_sdk/src/shared/domain/entities/api_response.dart';
import 'package:stadata_flutter_sdk/stadata_flutter_sdk.dart';

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