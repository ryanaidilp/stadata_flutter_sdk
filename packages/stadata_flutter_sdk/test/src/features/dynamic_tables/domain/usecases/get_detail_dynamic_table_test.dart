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
  late GetDetailDynamicTable usecase;
  late DynamicTable dynamicTable;

  setUpAll(() {
    mockRepository = MockDynamicTableRepository();
    registerTestLazySingleton<DynamicTableRepository>(mockRepository);
    usecase = GetDetailDynamicTable();

    final json = jsonFromFixture(Fixture.dynamicTableDetail);
    dynamicTable = DynamicTableModel.fromDetailJson(json);
  });

  tearDownAll(unregisterTestInjection);

  const variableID = 31;
  const domain = '7315';

  group('GetDetailDynamicTable', () {
    test('should return instance of DynamicTable if call success', () async {
      // arrange
      when(
        () => mockRepository.detail(variableID: variableID, domain: domain),
      ).thenAnswer((_) async => Result.success(dynamicTable));

      // act
      final result = await usecase(
        const GetDetailDynamicTableParam(
          variableID: variableID,
          domain: domain,
        ),
      );

      // assert
      expect(
        result,
        Result.success<Failure, DynamicTable>(dynamicTable),
      );
      verify(
        () => mockRepository.detail(variableID: variableID, domain: domain),
      ).called(1);
    });

    test('should return success with period filter', () async {
      // arrange
      when(
        () => mockRepository.detail(
          variableID: variableID,
          domain: domain,
          period: '99',
        ),
      ).thenAnswer((_) async => Result.success(dynamicTable));

      // act
      final result = await usecase(
        const GetDetailDynamicTableParam(
          variableID: variableID,
          domain: domain,
          period: '99',
        ),
      );

      // assert
      expect(
        result,
        Result.success<Failure, DynamicTable>(dynamicTable),
      );
      verify(
        () => mockRepository.detail(
          variableID: variableID,
          domain: domain,
          period: '99',
        ),
      ).called(1);
    });

    test('should return success with verticalVarID filter', () async {
      // arrange
      when(
        () => mockRepository.detail(
          variableID: variableID,
          domain: domain,
          verticalVarID: 7315,
        ),
      ).thenAnswer((_) async => Result.success(dynamicTable));

      // act
      final result = await usecase(
        const GetDetailDynamicTableParam(
          variableID: variableID,
          domain: domain,
          verticalVarID: 7315,
        ),
      );

      // assert
      expect(
        result,
        Result.success<Failure, DynamicTable>(dynamicTable),
      );
      verify(
        () => mockRepository.detail(
          variableID: variableID,
          domain: domain,
          verticalVarID: 7315,
        ),
      ).called(1);
    });

    test('should return success with derivedVarID filter', () async {
      // arrange
      when(
        () => mockRepository.detail(
          variableID: variableID,
          domain: domain,
          derivedVarID: 1,
        ),
      ).thenAnswer((_) async => Result.success(dynamicTable));

      // act
      final result = await usecase(
        const GetDetailDynamicTableParam(
          variableID: variableID,
          domain: domain,
          derivedVarID: 1,
        ),
      );

      // assert
      expect(
        result,
        Result.success<Failure, DynamicTable>(dynamicTable),
      );
      verify(
        () => mockRepository.detail(
          variableID: variableID,
          domain: domain,
          derivedVarID: 1,
        ),
      ).called(1);
    });

    test('should return success with derivedPeriodID filter', () async {
      // arrange
      when(
        () => mockRepository.detail(
          variableID: variableID,
          domain: domain,
          derivedPeriodID: 0,
        ),
      ).thenAnswer((_) async => Result.success(dynamicTable));

      // act
      final result = await usecase(
        const GetDetailDynamicTableParam(
          variableID: variableID,
          domain: domain,
          derivedPeriodID: 0,
        ),
      );

      // assert
      expect(
        result,
        Result.success<Failure, DynamicTable>(dynamicTable),
      );
      verify(
        () => mockRepository.detail(
          variableID: variableID,
          domain: domain,
          derivedPeriodID: 0,
        ),
      ).called(1);
    });

    test('should return success with custom language', () async {
      // arrange
      when(
        () => mockRepository.detail(
          variableID: variableID,
          domain: domain,
          lang: DataLanguage.en,
        ),
      ).thenAnswer((_) async => Result.success(dynamicTable));

      // act
      final result = await usecase(
        const GetDetailDynamicTableParam(
          variableID: variableID,
          domain: domain,
          lang: DataLanguage.en,
        ),
      );

      // assert
      expect(
        result,
        Result.success<Failure, DynamicTable>(dynamicTable),
      );
      verify(
        () => mockRepository.detail(
          variableID: variableID,
          domain: domain,
          lang: DataLanguage.en,
        ),
      ).called(1);
    });

    test('should return failure if exception is thrown', () async {
      // arrange
      when(
        () => mockRepository.detail(variableID: variableID, domain: domain),
      ).thenAnswer(
        (_) async => Result.failure(
          const DynamicTableFailure(message: 'Dynamic table not available!'),
        ),
      );

      // act
      final result = await usecase(
        const GetDetailDynamicTableParam(
          variableID: variableID,
          domain: domain,
        ),
      );

      // assert
      expect(
        result,
        Result.failure<Failure, DynamicTable>(
          const DynamicTableFailure(message: 'Dynamic table not available!'),
        ),
      );
      verify(
        () => mockRepository.detail(variableID: variableID, domain: domain),
      ).called(1);
    });
  });

  group('GetDetailDynamicTableParam', () {
    test('should have correct props', () {
      const param = GetDetailDynamicTableParam(
        variableID: variableID,
        domain: domain,
        period: '99',
        verticalVarID: 7315,
        derivedVarID: 1,
        derivedPeriodID: 0,
        lang: DataLanguage.en,
      );

      expect(
        param.props,
        [variableID, domain, '99', 7315, 1, 0, DataLanguage.en],
      );
    });

    test('should have default values', () {
      const param = GetDetailDynamicTableParam(
        variableID: variableID,
        domain: domain,
      );

      expect(param.period, isNull);
      expect(param.verticalVarID, isNull);
      expect(param.derivedVarID, isNull);
      expect(param.derivedPeriodID, isNull);
      expect(param.lang, DataLanguage.id);
    });
  });
}
