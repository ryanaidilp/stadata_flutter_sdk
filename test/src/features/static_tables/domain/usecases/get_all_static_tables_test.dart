import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:stadata_flutter_sdk/src/core/failures/failures.dart';
import 'package:stadata_flutter_sdk/src/core/typedef/typedef.dart';
import 'package:stadata_flutter_sdk/src/features/static_tables/data/models/static_table_model.dart';
import 'package:stadata_flutter_sdk/src/features/static_tables/domain/entities/static_table.dart';
import 'package:stadata_flutter_sdk/src/features/static_tables/domain/repositories/static_table_repository.dart';
import 'package:stadata_flutter_sdk/src/features/static_tables/domain/usecases/get_all_static_tables.dart';
import 'package:stadata_flutter_sdk/src/shared/data/models/api_response_model.dart';
import 'package:stadata_flutter_sdk/src/shared/data/models/pagination_model.dart';
import 'package:stadata_flutter_sdk/src/shared/domain/entities/api_response.dart';

import '../../../../../fixtures/fixtures.dart';
import '../../../../../helpers/test_injection.dart';

class MockStaticTableRepository extends Mock implements StaticTableRepository {}

void main() {
  late StaticTableRepository mockRepository;
  late GetAllStaticTables usecase;
  late ApiResponse<List<StaticTable>> staticTables;

  setUpAll(
    () {
      mockRepository = MockStaticTableRepository();
      registerTestLazySingleton<StaticTableRepository>(mockRepository);
      usecase = GetAllStaticTables();

      final jsonStaticTables = jsonFromFixture(
        Fixture.staticTables.value,
      );

      final staticTableResponse =
          ApiResponseModel<List<StaticTableModel>>.fromJson(
        jsonStaticTables,
        (json) {
          if (json is! List) {
            return [];
          }

          return json.map((e) => StaticTableModel.fromJson(e as JSON)).toList();
        },
      );

      final data =
          staticTableResponse.data?.map((e) => e.toEntity()).toList() ?? [];

      staticTables = ApiResponse<List<StaticTable>>(
        data: data,
        status: staticTableResponse.status,
        message: staticTableResponse.message,
        pagination: staticTableResponse.pagination?.toEntity(),
        dataAvailability: staticTableResponse.dataAvailability,
      );
    },
  );

  tearDownAll(unregisterTestInjection);

  const domain = '7315';

  group(
    'GetAllStaticTable',
    () {
      test(
        'should return list of static tables if call success',
        () async {
          // arrange
          when(
            () => mockRepository.get(
              domain: domain,
            ),
          ).thenAnswer((_) async => Right(staticTables));

          // act
          final result = await usecase(
            const GetAllStaticTableParams(
              domain: domain,
            ),
          );

          // assert
          expect(
            result,
            equals(
              Right<Failure, ApiResponse<List<StaticTable>>>(
                staticTables,
              ),
            ),
          );
          verify(
            () => mockRepository.get(
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
            () => mockRepository.get(
              domain: domain,
            ),
          ).thenAnswer(
            (_) async => const Left(
              StaticTableFailure(
                message: 'Static table not available!',
              ),
            ),
          );

          // act
          final result = await usecase(
            const GetAllStaticTableParams(
              domain: domain,
            ),
          );

          // assert
          expect(
            result,
            equals(
              const Left<Failure, ApiResponse<List<StaticTable>>>(
                StaticTableFailure(
                  message: 'Static table not available!',
                ),
              ),
            ),
          );
          verify(
            () => mockRepository.get(
              domain: domain,
            ),
          ).called(1);
        },
      );
    },
  );
}
