import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:stadata_flutter_sdk/src/core/failures/failures.dart';
import 'package:stadata_flutter_sdk/src/core/typedef/typedef.dart';
import 'package:stadata_flutter_sdk/src/features/static_tables/data/datasources/static_table_remote_data_source.dart';
import 'package:stadata_flutter_sdk/src/features/static_tables/data/models/static_table_model.dart';
import 'package:stadata_flutter_sdk/src/features/static_tables/data/repositories/static_table_repository_impl.dart';
import 'package:stadata_flutter_sdk/src/features/static_tables/domain/repositories/static_table_repository.dart';
import 'package:stadata_flutter_sdk/src/shared/data/models/api_response_model.dart';
import 'package:stadata_flutter_sdk/src/shared/data/models/pagination_model.dart';
import 'package:stadata_flutter_sdk/src/shared/domain/entities/api_response.dart';
import 'package:stadata_flutter_sdk/stadata_flutter_sdk.dart';

import '../../../../../fixtures/fixtures.dart';
import '../../../../../helpers/test_injection.dart';

class MockStaticTableRemoteDataSource extends Mock
    implements StaticTableRemoteDataSource {}

void main() {
  late StaticTableRemoteDataSource mockRemoteDataSource;
  late StaticTableRepository repository;
  setUpAll(
    () {
      mockRemoteDataSource = MockStaticTableRemoteDataSource();
      registerTestLazySingleton<StaticTableRemoteDataSource>(
        mockRemoteDataSource,
      );
      repository = StaticTableRepositoryImpl();
    },
  );

  tearDownAll(unregisterTestInjection);

  const domain = '7315';

  group(
    'StaticTableRepositoryImpl',
    () {
      group(
        'get()',
        () {
          late ApiResponseModel<List<StaticTableModel>> response;
          late ApiResponse<List<StaticTable>> data;
          setUp(
            () {
              final json = jsonFromFixture(Fixture.staticTables.value);
              response = ApiResponseModel<List<StaticTableModel>>.fromJson(
                json,
                (json) {
                  if (json is! List) {
                    return [];
                  }
                  return json
                      .map((e) => StaticTableModel.fromJson(e as JSON))
                      .toList();
                },
              );

              final responseData = response.data
                  ?.map(
                    (e) => e.toEntity(),
                  )
                  .toList();
              data = ApiResponse<List<StaticTable>>(
                data: responseData,
                status: response.status,
                message: response.message,
                dataAvailability: response.dataAvailability,
                pagination: response.pagination?.toEntity(),
              );
            },
          );

          test(
            'should return List of Static Tables if success',
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
                  Right<Failure, ApiResponse<List<StaticTable>>>(
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
              ).thenThrow(const StaticTableNotAvailableException());

              // act
              final result = await repository.get(domain: domain);

              // assert
              expect(
                result,
                isA<Left<Failure, ApiResponse<List<StaticTable>>>>(),
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
      group(
        'detail()',
        () {
          const id = 123;
          late ApiResponseModel<StaticTableModel> response;
          late ApiResponse<StaticTable> data;
          setUp(
            () {
              final json = jsonFromFixture(Fixture.staticTableDetail.value);
              response = ApiResponseModel<StaticTableModel>.fromJson(
                json,
                (json) {
                  if (json == null) {
                    return StaticTableModel(
                      id: 0,
                      title: '',
                      subjectId: 0,
                      size: '',
                      updatedAt: DateTime.now(),
                      excel: '',
                    );
                  }
                  return StaticTableModel.fromJson(json as JSON);
                },
              );

              data = ApiResponse<StaticTable>(
                data: response.data?.toEntity(),
                status: response.status,
                message: response.message,
                dataAvailability: response.dataAvailability,
                pagination: response.pagination?.toEntity(),
              );
            },
          );

          test(
            'should return an instance of Static Table if success',
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
                  Right<Failure, ApiResponse<StaticTable>>(data),
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
            'should return Failure if static table exception occured',
            () async {
              // arrange
              when(
                () => mockRemoteDataSource.detail(
                  id: id,
                  domain: domain,
                ),
              ).thenThrow(const StaticTableNotAvailableException());

              // act
              final result = await repository.detail(id: id, domain: domain);

              // assert
              expect(
                result,
                isA<Left<Failure, ApiResponse<StaticTable>>>(),
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
              ).thenThrow(const FormatException());

              // act
              final result = await repository.detail(id: id, domain: domain);

              // assert
              expect(
                result,
                isA<Left<Failure, ApiResponse<StaticTable>>>(),
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
