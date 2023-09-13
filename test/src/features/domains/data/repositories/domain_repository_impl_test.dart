import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:mocktail/mocktail.dart';
import 'package:stadata_flutter_sdk/src/core/exceptions/exceptions.dart';
import 'package:stadata_flutter_sdk/src/core/failures/failures.dart';
import 'package:stadata_flutter_sdk/src/core/typedef/typedef.dart';

import 'package:stadata_flutter_sdk/src/features/domains/data/datasources/domain_remote_data_source.dart';
import 'package:stadata_flutter_sdk/src/features/domains/data/models/domain_model.dart';
import 'package:stadata_flutter_sdk/src/features/domains/data/repositories/domain_repository_impl.dart';
import 'package:stadata_flutter_sdk/src/features/domains/domain/entities/domain_entity.dart';
import 'package:stadata_flutter_sdk/src/features/domains/domain/enums/domain_type.dart';
import 'package:stadata_flutter_sdk/src/features/domains/domain/repositories/domain_repository.dart';
import 'package:stadata_flutter_sdk/src/shared/data/models/api_response_model.dart';
import 'package:stadata_flutter_sdk/src/shared/data/models/pagination_model.dart';
import 'package:stadata_flutter_sdk/src/shared/domain/entities/api_response.dart';

import '../../../../../fixtures/fixtures.dart';
import '../../../../../helpers/test_injection.dart';

class MockDomainRemoteDataSource extends Mock
    implements DomainRemoteDataSource {}

void main() {
  late DomainRemoteDataSource mockRemoteDataSource;
  late DomainRepository repository;
  late ApiResponseModel<List<DomainModel>> successResponse;
  late ApiResponse<List<DomainEntity>> domains;
  setUpAll(
    () {
      mockRemoteDataSource = MockDomainRemoteDataSource();
      registerTestLazySingleton<DomainRemoteDataSource>(mockRemoteDataSource);
      repository = DomainRepositoryImpl();
      final json = jsonFromFixture('domain_fixtures_available.json');
      successResponse = ApiResponseModel<List<DomainModel>>.fromJson(
        json,
        (json) {
          if (json is! List) {
            return [];
          }

          return json.map((e) => DomainModel.fromJson(e as JSON)).toList();
        },
      );

      final data = successResponse.data?.map((e) => e.toEntity()).toList();

      domains = ApiResponse(
        status: successResponse.status,
        dataAvailability: successResponse.dataAvailability,
        data: data,
        message: successResponse.message,
        pagination: successResponse.pagination?.toEntity(),
      );
    },
  );

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
                  Right<Failure, ApiResponse<List<DomainEntity>>>(domains),
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
                isA<Left<Failure, ApiResponse<List<DomainEntity>>>>(),
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
