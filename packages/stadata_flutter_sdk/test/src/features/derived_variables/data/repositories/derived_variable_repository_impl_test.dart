import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:stadata_flutter_sdk/src/core/core.dart';
import 'package:stadata_flutter_sdk/src/features/features.dart';
import 'package:stadata_flutter_sdk/src/shared/shared.dart';

import '../../../../../fixtures/fixtures.dart';
import '../../../../../helpers/test_injection.dart';

class MockDerivedVariableRemoteDataSource extends Mock
    implements DerivedVariableRemoteDataSource {}

class MockLog extends Mock implements Log {}

void main() {
  late Log mockLog;
  late DerivedVariableRemoteDataSource mockRemoteDataSource;
  late DerivedVariableRepository repository;
  late ApiResponseModel<List<DerivedVariableModel>?> successResponse;
  late ApiResponse<List<DerivedVariable>> derivedVariables;

  setUpAll(() {
    mockRemoteDataSource = MockDerivedVariableRemoteDataSource();
    registerTestLazySingleton<DerivedVariableRemoteDataSource>(
      mockRemoteDataSource,
    );
    mockLog = MockLog();
    registerTestFactory<Log>(mockLog);
    registerFallbackValue(LogType.error);
    repository = DerivedVariableRepositoryImpl();
    final json = jsonFromFixture(Fixture.derivedVariables);
    successResponse = ApiResponseModel<List<DerivedVariableModel>?>.fromJson(
      json,
      (json) {
        if (json == null || json is! List) {
          return null;
        }

        return json
            .map((e) => DerivedVariableModel.fromJson(e as JSON))
            .toList();
      },
    );

    final data = successResponse.data;

    derivedVariables = ApiResponse<List<DerivedVariable>>(
      status: successResponse.status,
      dataAvailability: successResponse.dataAvailability,
      data: data,
      message: successResponse.message,
      pagination: successResponse.pagination,
    );
  });

  tearDownAll(unregisterTestInjection);

  setUp(() {
    reset(mockRemoteDataSource);
    reset(mockLog);
  });

  const domain = '0000';

  group('DerivedVariableRepositoryImpl', () {
    group('get()', () {
      test(
        'should return list of derived variables when call is successful',
        () async {
          // arrange
          when(
            () => mockRemoteDataSource.get(domain: domain),
          ).thenAnswer((_) async => successResponse);

          // act
          final result = await repository.get(domain: domain);

          // assert
          expect(
            result,
            equals(
              Result.success<Failure, ApiResponse<List<DerivedVariable>>>(
                derivedVariables,
              ),
            ),
          );
          verify(() => mockRemoteDataSource.get(domain: domain)).called(1);
        },
      );

      test('should return list with verticalGroup parameter', () async {
        // arrange
        const verticalGroup = 5;
        when(
          () => mockRemoteDataSource.get(
            domain: domain,
            verticalGroup: verticalGroup,
          ),
        ).thenAnswer((_) async => successResponse);

        // act
        final result = await repository.get(
          domain: domain,
          verticalGroup: verticalGroup,
        );

        // assert
        expect(
          result,
          equals(
            Result.success<Failure, ApiResponse<List<DerivedVariable>>>(
              derivedVariables,
            ),
          ),
        );
        verify(
          () => mockRemoteDataSource.get(
            domain: domain,
            verticalGroup: verticalGroup,
          ),
        ).called(1);
      });

      test('should return Failure when exception is thrown', () async {
        // arrange
        when(
          () => mockRemoteDataSource.get(domain: domain),
        ).thenThrow(const DerivedVariableNotAvailableException());
        when(
          () => mockLog.console(
            any(),
            error: any<dynamic>(named: 'error'),
            stackTrace: any(named: 'stackTrace'),
            type: any(named: 'type'),
          ),
        ).thenAnswer((_) async => Future<void>.value());

        // act
        final result = await repository.get(domain: domain);

        // assert
        expect(result.isFailure, isTrue);
        expect(
          result,
          equals(
            Result.failure<Failure, ApiResponse<List<DerivedVariable>>>(
              const DerivedVariableFailure(
                message: 'StadataException - DerivedVariable not available!',
              ),
            ),
          ),
        );
        verify(() => mockRemoteDataSource.get(domain: domain)).called(1);
      });

      test('should return Failure when data is null', () async {
        // arrange
        final nullDataResponse = ApiResponseModel<List<DerivedVariableModel>?>(
          status: true,
          dataAvailability: DataAvailability.available,
          data: null,
        );

        when(
          () => mockRemoteDataSource.get(domain: domain),
        ).thenAnswer((_) async => nullDataResponse);
        when(
          () => mockLog.console(
            any(),
            error: any<dynamic>(named: 'error'),
            stackTrace: any(named: 'stackTrace'),
            type: any(named: 'type'),
          ),
        ).thenAnswer((_) async => Future<void>.value());

        // act
        final result = await repository.get(domain: domain);

        // assert
        expect(result.isFailure, isTrue);
        verify(() => mockRemoteDataSource.get(domain: domain)).called(1);
      });

      test('should log error when exception occurs', () async {
        // arrange
        const exception = DerivedVariableNotAvailableException();
        when(
          () => mockRemoteDataSource.get(domain: domain),
        ).thenThrow(exception);
        when(
          () => mockLog.console(
            any(),
            error: any<dynamic>(named: 'error'),
            stackTrace: any(named: 'stackTrace'),
            type: any(named: 'type'),
          ),
        ).thenAnswer((_) async => Future<void>.value());

        // act
        await repository.get(domain: domain);

        // assert
        verify(
          () => mockLog.console(
            exception.toString(),
            error: exception,
            stackTrace: any(named: 'stackTrace'),
            type: LogType.error,
          ),
        ).called(1);
      });
    });
  });
}
