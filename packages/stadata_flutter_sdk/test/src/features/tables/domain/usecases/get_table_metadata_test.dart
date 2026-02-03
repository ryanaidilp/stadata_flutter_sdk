import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:stadata_flutter_sdk/src/core/core.dart';
import 'package:stadata_flutter_sdk/src/features/features.dart';
import 'package:stadata_flutter_sdk/src/shared/shared.dart';

import '../../../../../helpers/test_injection.dart';

class MockTableRepository extends Mock implements TableRepository {}

void main() {
  late TableRepository mockRepository;
  late GetTableMetadata usecase;
  late TableMetadata tableMetadata;

  setUpAll(() {
    mockRepository = MockTableRepository();
    registerTestLazySingleton<TableRepository>(mockRepository);
    usecase = GetTableMetadata();

    tableMetadata = const TableMetadataModel(
      id: '123',
      title: 'Test Table',
      type: TableType.static,
      subjectID: 1,
      subjectName: 'Test Subject',
      domain: '7200',
      tableSource: '1',
    );
  });

  tearDownAll(unregisterTestInjection);

  const id = '123';
  const domain = '7200';

  group('GetTableMetadata', () {
    test('should return TableMetadata if call success', () async {
      // arrange
      when(
        () => mockRepository.getTableMetadata(id: id, domain: domain),
      ).thenAnswer((_) async => Result.success(tableMetadata));

      // act
      final result = await usecase(
        const GetTableMetadataParams(id: id, domain: domain),
      );

      // assert
      expect(
        result,
        Result.success<Failure, TableMetadata>(tableMetadata),
      );
      verify(
        () => mockRepository.getTableMetadata(id: id, domain: domain),
      ).called(1);
    });

    test('should return success with custom language', () async {
      // arrange
      when(
        () => mockRepository.getTableMetadata(
          id: id,
          domain: domain,
          lang: DataLanguage.en,
        ),
      ).thenAnswer((_) async => Result.success(tableMetadata));

      // act
      final result = await usecase(
        const GetTableMetadataParams(
          id: id,
          domain: domain,
          lang: DataLanguage.en,
        ),
      );

      // assert
      expect(
        result,
        Result.success<Failure, TableMetadata>(tableMetadata),
      );
      verify(
        () => mockRepository.getTableMetadata(
          id: id,
          domain: domain,
          lang: DataLanguage.en,
        ),
      ).called(1);
    });

    test('should return failure if exception is thrown', () async {
      // arrange
      when(
        () => mockRepository.getTableMetadata(id: id, domain: domain),
      ).thenAnswer(
        (_) async => Result.failure(
          const TableFailure(message: 'Table not found!'),
        ),
      );

      // act
      final result = await usecase(
        const GetTableMetadataParams(id: id, domain: domain),
      );

      // assert
      expect(
        result,
        Result.failure<Failure, TableMetadata>(
          const TableFailure(message: 'Table not found!'),
        ),
      );
      verify(
        () => mockRepository.getTableMetadata(id: id, domain: domain),
      ).called(1);
    });
  });

  group('GetTableMetadataParams', () {
    test('should have correct props', () {
      const param = GetTableMetadataParams(
        id: id,
        domain: domain,
        lang: DataLanguage.en,
      );

      expect(param.props, [id, domain, DataLanguage.en]);
    });

    test('should have default language value', () {
      const param = GetTableMetadataParams(
        id: id,
        domain: domain,
      );

      expect(param.lang, DataLanguage.id);
    });
  });
}
