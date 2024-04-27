import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:stadata_flutter_sdk/src/core/failures/failures.dart';
import 'package:stadata_flutter_sdk/src/core/typedef/typedef.dart';
import 'package:stadata_flutter_sdk/src/features/variables/data/datasources/variable_remote_data_source.dart';
import 'package:stadata_flutter_sdk/src/features/variables/data/models/variable_model.dart';
import 'package:stadata_flutter_sdk/src/features/variables/data/repositories/variable_repository_impl.dart';
import 'package:stadata_flutter_sdk/src/features/variables/domain/repositories/variable_repository.dart';
import 'package:stadata_flutter_sdk/src/shared/data/models/api_response_model.dart';
import 'package:stadata_flutter_sdk/src/shared/data/models/pagination_model.dart';
import 'package:stadata_flutter_sdk/src/shared/domain/entities/api_response.dart';
import 'package:stadata_flutter_sdk/stadata_flutter_sdk.dart';

import '../../../../../fixtures/fixtures.dart';
import '../../../../../helpers/test_injection.dart';

class MockVariableRemoteDataSource extends Mock
    implements VariableRemoteDataSource {}

void main() {
  late VariableRemoteDataSource mockRemoteDataSource;
  late VariableRepository repository;
  late ApiResponseModel<List<VariableModel>?> successResponse;
  late ApiResponse<List<Variable>> variables;

  setUpAll(
    () {
      mockRemoteDataSource = MockVariableRemoteDataSource();
      registerTestLazySingleton<VariableRemoteDataSource>(
        mockRemoteDataSource,
      );
      repository = VariableRepositoryImpl();
      final json = jsonFromFixture(Fixture.variables);
      successResponse = ApiResponseModel<List<VariableModel>?>.fromJson(
        json,
        (json) {
          if (json == null || json is! List) {
            return null;
          }

          return json.map((e) => VariableModel.fromJson(e as JSON)).toList();
        },
      );

      final data = successResponse.data?.map((e) => e.toEntity()).toList();

      variables = ApiResponse<List<Variable>>(
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
    'VariableRepositoryImpl',
    () {
      group(
        'get()',
        () {
          test(
            'should return list of variables if success',
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
                  Right<Failure, ApiResponse<List<Variable>>>(
                    variables,
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
              ).thenThrow(const VariableNotAvailableException());

              // act
              final result = await repository.get(domain: domain);

              // assert
              expect(
                result,
                equals(
                  const Left<Failure, ApiResponse<List<Variable>>>(
                    VariableFailure(
                      message: 'StadataException - Variable not available!',
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
