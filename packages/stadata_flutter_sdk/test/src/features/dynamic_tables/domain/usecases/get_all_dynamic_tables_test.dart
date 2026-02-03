import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:stadata_flutter_sdk/src/core/core.dart';
import 'package:stadata_flutter_sdk/src/features/features.dart';
import 'package:stadata_flutter_sdk/src/shared/shared.dart';

import '../../../../../fixtures/fixtures.dart';
import '../../../../../helpers/test_injection.dart';

class MockDynamicTableRepository extends Mock
    implements DynamicTableRepository {}

void main() {
  late DynamicTableRepository mockRepository;
  late GetAllDynamicTables usecase;
  late ApiResponse<List<DynamicTable>> dynamicTables;

  setUpAll(() {
    mockRepository = MockDynamicTableRepository();
    registerTestLazySingleton<DynamicTableRepository>(mockRepository);
    usecase = GetAllDynamicTables();

    final jsonDynamicTables = jsonFromFixture(Fixture.dynamicTables);

    final dynamicTableResponse =
        ApiResponseModel<List<DynamicTableModel>>.fromJson(
          jsonDynamicTables,
          (json) {
            if (json is! List) {
              return [];
            }

            return json
                .map((e) => DynamicTableModel.fromJson(e as JSON))
                .toList();
          },
        );

    final data = dynamicTableResponse.data?.map((e) => e).toList() ?? [];

    dynamicTables = ApiResponse<List<DynamicTable>>(
      data: data,
      status: dynamicTableResponse.status,
      message: dynamicTableResponse.message,
      pagination: dynamicTableResponse.pagination,
      dataAvailability: dynamicTableResponse.dataAvailability,
    );
  });

  tearDownAll(unregisterTestInjection);

  const domain = '7200';

  group('GetAllDynamicTables', () {
    test('should return list of dynamic tables if call success', () async {
      // arrange
      when(
        () => mockRepository.getAll(domain: domain),
      ).thenAnswer((_) async => Result.success(dynamicTables));

      // act
      final result = await usecase(
        const GetAllDynamicTablesParam(domain: domain),
      );

      // assert
      expect(
        result,
        equals(
          Result.success<Failure, ApiResponse<List<DynamicTable>>>(
            dynamicTables,
          ),
        ),
      );
      verify(() => mockRepository.getAll(domain: domain)).called(1);
    });

    test('should return list with custom page parameter', () async {
      // arrange
      when(
        () => mockRepository.getAll(domain: domain, page: 2),
      ).thenAnswer((_) async => Result.success(dynamicTables));

      // act
      final result = await usecase(
        const GetAllDynamicTablesParam(domain: domain, page: 2),
      );

      // assert
      expect(
        result,
        equals(
          Result.success<Failure, ApiResponse<List<DynamicTable>>>(
            dynamicTables,
          ),
        ),
      );
      verify(() => mockRepository.getAll(domain: domain, page: 2)).called(1);
    });

    test('should return list with custom language parameter', () async {
      // arrange
      when(
        () => mockRepository.getAll(domain: domain, lang: DataLanguage.en),
      ).thenAnswer((_) async => Result.success(dynamicTables));

      // act
      final result = await usecase(
        const GetAllDynamicTablesParam(domain: domain, lang: DataLanguage.en),
      );

      // assert
      expect(
        result,
        equals(
          Result.success<Failure, ApiResponse<List<DynamicTable>>>(
            dynamicTables,
          ),
        ),
      );
      verify(
        () => mockRepository.getAll(domain: domain, lang: DataLanguage.en),
      ).called(1);
    });

    test('should return failure if exception is thrown', () async {
      // arrange
      when(() => mockRepository.getAll(domain: domain)).thenAnswer(
        (_) async => Result.failure(
          const DynamicTableFailure(message: 'Dynamic table not available!'),
        ),
      );

      // act
      final result = await usecase(
        const GetAllDynamicTablesParam(domain: domain),
      );

      // assert
      expect(
        result,
        equals(
          Result.failure<Failure, ApiResponse<List<DynamicTable>>>(
            const DynamicTableFailure(message: 'Dynamic table not available!'),
          ),
        ),
      );
      verify(() => mockRepository.getAll(domain: domain)).called(1);
    });
  });

  group('GetAllDynamicTablesParam', () {
    test('should have correct props', () {
      const param = GetAllDynamicTablesParam(
        domain: domain,
        lang: DataLanguage.en,
        page: 2,
      );

      expect(param.props, [domain, DataLanguage.en, 2]);
    });

    test('should have default values', () {
      const param = GetAllDynamicTablesParam(domain: domain);

      expect(param.lang, DataLanguage.id);
      expect(param.page, 1);
    });
  });
}
