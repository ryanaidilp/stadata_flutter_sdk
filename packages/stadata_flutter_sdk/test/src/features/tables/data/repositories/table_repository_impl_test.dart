import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:stadata_flutter_sdk/src/core/core.dart';
import 'package:stadata_flutter_sdk/src/features/features.dart';
import 'package:stadata_flutter_sdk/src/shared/shared.dart';

import '../../../../../helpers/test_injection.dart';

class MockTableRemoteDataSource extends Mock implements TableRemoteDataSource {}

class MockLog extends Mock implements Log {}

void main() {
  late Log mockLog;
  late TableRemoteDataSource mockRemoteDataSource;
  late TableRepository repository;

  setUpAll(() {
    mockRemoteDataSource = MockTableRemoteDataSource();
    registerTestLazySingleton<TableRemoteDataSource>(mockRemoteDataSource);
    mockLog = MockLog();
    registerTestFactory<Log>(mockLog);
    registerFallbackValue(LogType.error);
    repository = TableRepositoryImpl();
  });

  tearDownAll(unregisterTestInjection);

  const id = '123';
  const domain = '7200';

  group('TableRepositoryImpl', () {
    group('getTableMetadata()', () {
      late TableMetadataModel metadata;

      setUp(() {
        metadata = const TableMetadataModel(
          id: id,
          title: 'Test Table',
          type: TableType.static,
          subjectID: 1,
          subjectName: 'Test Subject',
          domain: domain,
          tableSource: '1',
        );
      });

      test('should return TableMetadata if success', () async {
        // arrange
        when(
          () => mockRemoteDataSource.getTableMetadata(id: id, domain: domain),
        ).thenAnswer((_) async => metadata);

        // act
        final result = await repository.getTableMetadata(
          id: id,
          domain: domain,
        );

        // assert
        expect(
          result,
          equals(Result.success<Failure, TableMetadata>(metadata)),
        );
        verify(
          () => mockRemoteDataSource.getTableMetadata(id: id, domain: domain),
        ).called(1);
      });

      test('should return TableMetadata with custom language', () async {
        // arrange
        when(
          () => mockRemoteDataSource.getTableMetadata(
            id: id,
            domain: domain,
            lang: DataLanguage.en,
          ),
        ).thenAnswer((_) async => metadata);

        // act
        final result = await repository.getTableMetadata(
          id: id,
          domain: domain,
          lang: DataLanguage.en,
        );

        // assert
        expect(
          result,
          equals(Result.success<Failure, TableMetadata>(metadata)),
        );
        verify(
          () => mockRemoteDataSource.getTableMetadata(
            id: id,
            domain: domain,
            lang: DataLanguage.en,
          ),
        ).called(1);
      });

      test(
        'should return Failure if TableNotFoundException occurred',
        () async {
          // arrange
          when(
            () => mockRemoteDataSource.getTableMetadata(id: id, domain: domain),
          ).thenThrow(const TableNotFoundException());
          when(
            () => mockLog.console(
              any(),
              error: any<dynamic>(named: 'error'),
              stackTrace: any(named: 'stackTrace'),
              type: any(named: 'type'),
            ),
          ).thenAnswer((_) async => Future.value());

          // act
          final result = await repository.getTableMetadata(
            id: id,
            domain: domain,
          );

          // assert
          expect(
            result,
            equals(
              Result.failure<Failure, TableMetadata>(
                const TableFailure(
                  message:
                      'StadataException - Table not found in any endpoint!',
                ),
              ),
            ),
          );
          verify(
            () => mockRemoteDataSource.getTableMetadata(id: id, domain: domain),
          ).called(1);
        },
      );

      test('should return Failure if generic exception occurred', () async {
        // arrange
        when(
          () => mockRemoteDataSource.getTableMetadata(id: id, domain: domain),
        ).thenThrow(const FormatException());
        when(
          () => mockLog.console(
            any(),
            error: any<dynamic>(named: 'error'),
            stackTrace: any(named: 'stackTrace'),
            type: any(named: 'type'),
          ),
        ).thenAnswer((_) async => Future.value());

        // act
        final result = await repository.getTableMetadata(
          id: id,
          domain: domain,
        );

        // assert
        expect(
          result,
          equals(
            Result.failure<Failure, TableMetadata>(
              const TableFailure(message: 'FormatException'),
            ),
          ),
        );
        verify(
          () => mockRemoteDataSource.getTableMetadata(id: id, domain: domain),
        ).called(1);
      });

      test('should return Failure if ApiException occurred', () async {
        // arrange
        when(
          () => mockRemoteDataSource.getTableMetadata(id: id, domain: domain),
        ).thenThrow(ApiException('API error'));
        when(
          () => mockLog.console(
            any(),
            error: any<dynamic>(named: 'error'),
            stackTrace: any(named: 'stackTrace'),
            type: any(named: 'type'),
          ),
        ).thenAnswer((_) async => Future.value());

        // act
        final result = await repository.getTableMetadata(
          id: id,
          domain: domain,
        );

        // assert
        expect(
          result.isFailure,
          isTrue,
        );
        verify(
          () => mockRemoteDataSource.getTableMetadata(id: id, domain: domain),
        ).called(1);
      });
    });
  });
}
