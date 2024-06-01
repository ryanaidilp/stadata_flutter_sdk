import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:stadata_flutter_sdk/src/core/failures/failures.dart';
import 'package:stadata_flutter_sdk/src/core/typedef/typedef.dart';
import 'package:stadata_flutter_sdk/src/features/static_tables/data/models/static_table_model.dart';
import 'package:stadata_flutter_sdk/src/features/static_tables/domain/repositories/static_table_repository.dart';
import 'package:stadata_flutter_sdk/src/features/static_tables/domain/usecases/get_detail_static_table.dart';
import 'package:stadata_flutter_sdk/src/shared/shared.dart';
import 'package:stadata_flutter_sdk/stadata_flutter_sdk.dart';

import '../../../../../fixtures/fixtures.dart';
import '../../../../../helpers/test_injection.dart';

class MockStaticTableRepository extends Mock implements StaticTableRepository {}

void main() {
  late StaticTableRepository mockRepository;
  late GetDetailStaticTable usecase;
  late ApiResponse<StaticTable> staticTable;

  setUpAll(
    () {
      mockRepository = MockStaticTableRepository();
      registerTestLazySingleton(mockRepository);
      usecase = GetDetailStaticTable();

      final json = jsonFromFixture(Fixture.staticTableDetail);
      final response = ApiResponseModel<StaticTableModel?>.fromJson(
        json,
        (json) => json == null ? null : StaticTableModel.fromJson(json as JSON),
      );

      staticTable = ApiResponse<StaticTable>(
        data: response.data?.toEntity(),
        status: response.status,
        message: response.message,
        dataAvailability: response.dataAvailability,
        pagination: response.pagination?.toEntity(),
      );
    },
  );

  tearDownAll(unregisterTestInjection);

  const id = 23;
  const domain = '7315';

  group(
    'GetDetailStaticTable',
    () {
      test(
        'should return instance of Static Table if call success',
        () async {
          // arrange
          when(
            () => mockRepository.detail(id: id, domain: domain),
          ).thenAnswer((_) async => Right(staticTable));

          // act
          final result = await usecase(
            const GetDetailStaticTableParam(
              id: id,
              domain: domain,
            ),
          );

          // assert
          expect(
            result,
            Right<Failure, ApiResponse<StaticTable>>(staticTable),
          );
          verify(
            () => mockRepository.detail(
              id: id,
              domain: domain,
            ),
          ).called(1);
        },
      );

      test(
        'should return failure if exception is thrown',
        () async {
          // arrange
          when(
            () => mockRepository.detail(id: id, domain: domain),
          ).thenAnswer(
            (_) async => const Left(
              StaticTableFailure(
                message: 'Static table not available!',
              ),
            ),
          );

          // act
          final result = await usecase(
            const GetDetailStaticTableParam(
              id: id,
              domain: domain,
            ),
          );

          // assert
          expect(
            result,
            const Left<Failure, ApiResponse<StaticTable>>(
              StaticTableFailure(
                message: 'Static table not available!',
              ),
            ),
          );
          verify(
            () => mockRepository.detail(
              id: id,
              domain: domain,
            ),
          ).called(1);
        },
      );
    },
  );
}
