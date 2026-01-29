import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:stadata_flutter_sdk/src/core/core.dart';
import 'package:stadata_flutter_sdk/src/features/features.dart';
import 'package:stadata_flutter_sdk/src/shared/shared.dart';

import '../../../../../fixtures/fixtures.dart';
import '../../../../../helpers/test_injection.dart';

class MockDynamicTableRemoteDataSource extends Mock
    implements DynamicTableRemoteDataSource {}

class MockLog extends Mock implements Log {}

void main() {
  late Log mockLog;
  late DynamicTableRemoteDataSource mockRemoteDataSource;
  late DynamicTableRepository repository;

  setUpAll(() {
    mockRemoteDataSource = MockDynamicTableRemoteDataSource();
    registerTestLazySingleton<DynamicTableRemoteDataSource>(
      mockRemoteDataSource,
    );
    mockLog = MockLog();
    registerTestFactory<Log>(mockLog);
    registerFallbackValue(LogType.error);
    repository = DynamicTableRepositoryImpl();
  });

  tearDownAll(unregisterTestInjection);

  const domain = '7315';

  group('DynamicTableRepositoryImpl', () {
    group('getAll()', () {
      late ApiResponseModel<List<DynamicTableModel>> response;
      late ApiResponse<List<DynamicTable>> data;

      setUp(() {
        final json = jsonFromFixture(Fixture.dynamicTables);
        response = ApiResponseModel<List<DynamicTableModel>>.fromJson(
          json,
          (json) {
            if (json is! List) {
              return [];
            }
            return json
                .map((e) => DynamicTableModel.fromJson(e as JSON))
                .toList();
          },
        );

        final responseData = response.data?.map((e) => e).toList();
        data = ApiResponse<List<DynamicTable>>(
          data: responseData,
          status: response.status,
          message: response.message,
          dataAvailability: response.dataAvailability,
          pagination: response.pagination,
        );
      });

      test('should return List of Dynamic Tables if success', () async {
        // arrange
        when(
          () => mockRemoteDataSource.getAll(domain: domain),
        ).thenAnswer((_) async => response);

        // act
        final result = await repository.getAll(domain: domain);

        // assert
        expect(
          result,
          equals(
            Result.success<Failure, ApiResponse<List<DynamicTable>>>(data),
          ),
        );
        verify(() => mockRemoteDataSource.getAll(domain: domain)).called(1);
      });

      test('should return List with custom page', () async {
        // arrange
        when(
          () => mockRemoteDataSource.getAll(domain: domain, page: 2),
        ).thenAnswer((_) async => response);

        // act
        final result = await repository.getAll(domain: domain, page: 2);

        // assert
        expect(
          result,
          equals(
            Result.success<Failure, ApiResponse<List<DynamicTable>>>(data),
          ),
        );
        verify(
          () => mockRemoteDataSource.getAll(domain: domain, page: 2),
        ).called(1);
      });

      test('should return List with custom language', () async {
        // arrange
        when(
          () => mockRemoteDataSource.getAll(
            domain: domain,
            lang: DataLanguage.en,
          ),
        ).thenAnswer((_) async => response);

        // act
        final result = await repository.getAll(
          domain: domain,
          lang: DataLanguage.en,
        );

        // assert
        expect(
          result,
          equals(
            Result.success<Failure, ApiResponse<List<DynamicTable>>>(data),
          ),
        );
        verify(
          () => mockRemoteDataSource.getAll(
            domain: domain,
            lang: DataLanguage.en,
          ),
        ).called(1);
      });

      test('should return Failure if exception occurred', () async {
        // arrange
        when(
          () => mockRemoteDataSource.getAll(domain: domain),
        ).thenThrow(const DynamicTableNotAvailableException());
        when(
          () => mockLog.console(
            any(),
            error: any<dynamic>(named: 'error'),
            stackTrace: any(named: 'stackTrace'),
            type: any(named: 'type'),
          ),
        ).thenAnswer((_) async => Future.value());

        // act
        final result = await repository.getAll(domain: domain);

        // assert
        expect(
          result,
          equals(
            Result.failure<Failure, ApiResponse<List<DynamicTable>>>(
              const DynamicTableFailure(
                message: 'StadataException - Dynamic Table not available!',
              ),
            ),
          ),
        );
        verify(() => mockRemoteDataSource.getAll(domain: domain)).called(1);
      });

      test('should return Failure if data is null', () async {
        // arrange
        const nullResponse = ApiResponseModel<List<DynamicTableModel>?>(
          status: true,
          dataAvailability: DataAvailability.available,
        );
        when(
          () => mockRemoteDataSource.getAll(domain: domain),
        ).thenAnswer((_) async => nullResponse);
        when(
          () => mockLog.console(
            any(),
            error: any<dynamic>(named: 'error'),
            stackTrace: any(named: 'stackTrace'),
            type: any(named: 'type'),
          ),
        ).thenAnswer((_) async => Future.value());

        // act
        final result = await repository.getAll(domain: domain);

        // assert
        expect(
          result.isFailure,
          isTrue,
        );
        verify(() => mockRemoteDataSource.getAll(domain: domain)).called(1);
      });
    });

    group('detail()', () {
      const variableID = 31;
      late ApiResponseModel<DynamicTableModel> response;
      late DynamicTable data;

      setUp(() {
        final json = jsonFromFixture(Fixture.dynamicTableDetail);
        final model = DynamicTableModel.fromDetailJson(json);
        response = ApiResponseModel<DynamicTableModel>(
          status: true,
          dataAvailability: DataAvailability.available,
          data: model,
        );
        data = model;
      });

      test('should return an instance of Dynamic Table if success', () async {
        // arrange
        when(
          () => mockRemoteDataSource.detail(
            variableID: variableID,
            domain: domain,
          ),
        ).thenAnswer((_) async => response);

        // act
        final result = await repository.detail(
          variableID: variableID,
          domain: domain,
        );

        // assert
        expect(
          result,
          equals(Result.success<Failure, DynamicTable>(data)),
        );
        verify(
          () => mockRemoteDataSource.detail(
            variableID: variableID,
            domain: domain,
          ),
        ).called(1);
      });

      test('should return success with period filter', () async {
        // arrange
        when(
          () => mockRemoteDataSource.detail(
            variableID: variableID,
            domain: domain,
            period: '99',
          ),
        ).thenAnswer((_) async => response);

        // act
        final result = await repository.detail(
          variableID: variableID,
          domain: domain,
          period: '99',
        );

        // assert
        expect(
          result,
          equals(Result.success<Failure, DynamicTable>(data)),
        );
        verify(
          () => mockRemoteDataSource.detail(
            variableID: variableID,
            domain: domain,
            period: '99',
          ),
        ).called(1);
      });

      test('should return success with verticalVarID filter', () async {
        // arrange
        when(
          () => mockRemoteDataSource.detail(
            variableID: variableID,
            domain: domain,
            verticalVarID: 7315,
          ),
        ).thenAnswer((_) async => response);

        // act
        final result = await repository.detail(
          variableID: variableID,
          domain: domain,
          verticalVarID: 7315,
        );

        // assert
        expect(
          result,
          equals(Result.success<Failure, DynamicTable>(data)),
        );
        verify(
          () => mockRemoteDataSource.detail(
            variableID: variableID,
            domain: domain,
            verticalVarID: 7315,
          ),
        ).called(1);
      });

      test('should return success with derivedVarID filter', () async {
        // arrange
        when(
          () => mockRemoteDataSource.detail(
            variableID: variableID,
            domain: domain,
            derivedVarID: 1,
          ),
        ).thenAnswer((_) async => response);

        // act
        final result = await repository.detail(
          variableID: variableID,
          domain: domain,
          derivedVarID: 1,
        );

        // assert
        expect(
          result,
          equals(Result.success<Failure, DynamicTable>(data)),
        );
        verify(
          () => mockRemoteDataSource.detail(
            variableID: variableID,
            domain: domain,
            derivedVarID: 1,
          ),
        ).called(1);
      });

      test('should return success with derivedPeriodID filter', () async {
        // arrange
        when(
          () => mockRemoteDataSource.detail(
            variableID: variableID,
            domain: domain,
            derivedPeriodID: 0,
          ),
        ).thenAnswer((_) async => response);

        // act
        final result = await repository.detail(
          variableID: variableID,
          domain: domain,
          derivedPeriodID: 0,
        );

        // assert
        expect(
          result,
          equals(Result.success<Failure, DynamicTable>(data)),
        );
        verify(
          () => mockRemoteDataSource.detail(
            variableID: variableID,
            domain: domain,
            derivedPeriodID: 0,
          ),
        ).called(1);
      });

      test('should return success with custom language', () async {
        // arrange
        when(
          () => mockRemoteDataSource.detail(
            variableID: variableID,
            domain: domain,
            lang: DataLanguage.en,
          ),
        ).thenAnswer((_) async => response);

        // act
        final result = await repository.detail(
          variableID: variableID,
          domain: domain,
          lang: DataLanguage.en,
        );

        // assert
        expect(
          result,
          equals(Result.success<Failure, DynamicTable>(data)),
        );
        verify(
          () => mockRemoteDataSource.detail(
            variableID: variableID,
            domain: domain,
            lang: DataLanguage.en,
          ),
        ).called(1);
      });

      test(
        'should return Failure if dynamic table exception occurred',
        () async {
          // arrange
          when(
            () => mockRemoteDataSource.detail(
              variableID: variableID,
              domain: domain,
            ),
          ).thenThrow(const DynamicTableNotAvailableException());
          when(
            () => mockLog.console(
              any(),
              error: any<dynamic>(named: 'error'),
              stackTrace: any(named: 'stackTrace'),
              type: any(named: 'type'),
            ),
          ).thenAnswer((_) async => Future.value());

          // act
          final result = await repository.detail(
            variableID: variableID,
            domain: domain,
          );

          // assert
          expect(
            result,
            equals(
              Result.failure<Failure, DynamicTable>(
                const DynamicTableFailure(
                  message: 'StadataException - Dynamic Table not available!',
                ),
              ),
            ),
          );
          verify(
            () => mockRemoteDataSource.detail(
              variableID: variableID,
              domain: domain,
            ),
          ).called(1);
        },
      );

      test('should return Failure if exception occurred', () async {
        // arrange
        when(
          () => mockRemoteDataSource.detail(
            variableID: variableID,
            domain: domain,
          ),
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
        final result = await repository.detail(
          variableID: variableID,
          domain: domain,
        );

        // assert
        expect(
          result,
          equals(
            Result.failure<Failure, DynamicTable>(
              const DynamicTableFailure(message: 'FormatException'),
            ),
          ),
        );
        verify(
          () => mockRemoteDataSource.detail(
            variableID: variableID,
            domain: domain,
          ),
        ).called(1);
      });

      test('should return Failure if data is null', () async {
        // arrange
        const nullResponse = ApiResponseModel<DynamicTableModel?>(
          status: true,
          dataAvailability: DataAvailability.available,
        );
        when(
          () => mockRemoteDataSource.detail(
            variableID: variableID,
            domain: domain,
          ),
        ).thenAnswer((_) async => nullResponse);
        when(
          () => mockLog.console(
            any(),
            error: any<dynamic>(named: 'error'),
            stackTrace: any(named: 'stackTrace'),
            type: any(named: 'type'),
          ),
        ).thenAnswer((_) async => Future.value());

        // act
        final result = await repository.detail(
          variableID: variableID,
          domain: domain,
        );

        // assert
        expect(
          result.isFailure,
          isTrue,
        );
        verify(
          () => mockRemoteDataSource.detail(
            variableID: variableID,
            domain: domain,
          ),
        ).called(1);
      });
    });
  });
}
