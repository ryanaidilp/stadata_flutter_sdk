import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:stadata_flutter_sdk/src/core/core.dart';
import 'package:stadata_flutter_sdk/src/features/features.dart';
import 'package:stadata_flutter_sdk/src/shared/shared.dart';

import '../../../../../fixtures/fixtures.dart';
import '../../../../../helpers/test_injection.dart';

class MockPeriodRemoteDataSource extends Mock
    implements PeriodRemoteDataSource {}

class MockLog extends Mock implements Log {}

void main() {
  late Log mockLog;
  late PeriodRemoteDataSource mockRemoteDataSource;
  late PeriodRepository repository;
  late ApiResponseModel<List<PeriodModel>?> successResponse;
  late ApiResponse<List<Period>> periods;

  setUpAll(() {
    mockRemoteDataSource = MockPeriodRemoteDataSource();
    registerTestLazySingleton<PeriodRemoteDataSource>(mockRemoteDataSource);
    mockLog = MockLog();
    registerTestFactory<Log>(mockLog);
    registerFallbackValue(LogType.error);
    repository = PeriodRepositoryImpl();
    final json = jsonFromFixture(Fixture.periods);
    successResponse = ApiResponseModel<List<PeriodModel>?>.fromJson(
      json,
      (json) {
        if (json == null || json is! List) {
          return null;
        }

        return json.map((e) => PeriodModel.fromJson(e as JSON)).toList();
      },
    );

    final data = successResponse.data;

    periods = ApiResponse<List<Period>>(
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

  group('PeriodRepositoryImpl', () {
    group('get()', () {
      test('should return list of periods when call is successful', () async {
        // arrange
        when(
          () => mockRemoteDataSource.get(domain: domain),
        ).thenAnswer((_) async => successResponse);

        // act
        final result = await repository.get(domain: domain);

        // assert
        expect(
          result,
          equals(Result.success<Failure, ApiResponse<List<Period>>>(periods)),
        );
        verify(() => mockRemoteDataSource.get(domain: domain)).called(1);
      });

      test('should return list of periods with custom page', () async {
        // arrange
        const page = 2;
        when(
          () => mockRemoteDataSource.get(domain: domain, page: page),
        ).thenAnswer((_) async => successResponse);

        // act
        final result = await repository.get(domain: domain, page: page);

        // assert
        expect(
          result,
          equals(Result.success<Failure, ApiResponse<List<Period>>>(periods)),
        );
        verify(
          () => mockRemoteDataSource.get(domain: domain, page: page),
        ).called(1);
      });

      test('should return list of periods with English language', () async {
        // arrange
        when(
          () => mockRemoteDataSource.get(
            domain: domain,
            lang: DataLanguage.en,
          ),
        ).thenAnswer((_) async => successResponse);

        // act
        final result = await repository.get(
          domain: domain,
          lang: DataLanguage.en,
        );

        // assert
        expect(
          result,
          equals(Result.success<Failure, ApiResponse<List<Period>>>(periods)),
        );
        verify(
          () => mockRemoteDataSource.get(
            domain: domain,
            lang: DataLanguage.en,
          ),
        ).called(1);
      });

      test('should return list of periods with variableID filter', () async {
        // arrange
        const variableID = 145;
        when(
          () => mockRemoteDataSource.get(
            domain: domain,
            variableID: variableID,
          ),
        ).thenAnswer((_) async => successResponse);

        // act
        final result = await repository.get(
          domain: domain,
          variableID: variableID,
        );

        // assert
        expect(
          result,
          equals(Result.success<Failure, ApiResponse<List<Period>>>(periods)),
        );
        verify(
          () => mockRemoteDataSource.get(
            domain: domain,
            variableID: variableID,
          ),
        ).called(1);
      });

      test('should return data with correct properties', () async {
        // arrange
        when(
          () => mockRemoteDataSource.get(domain: domain),
        ).thenAnswer((_) async => successResponse);

        // act
        final result = await repository.get(domain: domain);

        // assert
        expect(result.isSuccess, isTrue);
        expect(
          result,
          equals(Result.success<Failure, ApiResponse<List<Period>>>(periods)),
        );
      });

      test('should return Failure when exception is thrown', () async {
        // arrange
        when(
          () => mockRemoteDataSource.get(domain: domain),
        ).thenThrow(const PeriodNotAvailableException());
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
            Result.failure<Failure, ApiResponse<List<Period>>>(
              const PeriodFailure(
                message: 'StadataException - Period not available!',
              ),
            ),
          ),
        );
        verify(() => mockRemoteDataSource.get(domain: domain)).called(1);
      });

      test('should return Failure when data is null', () async {
        // arrange
        final nullDataResponse = ApiResponseModel<List<PeriodModel>?>(
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
        expect(
          result,
          equals(
            Result.failure<Failure, ApiResponse<List<Period>>>(
              const PeriodFailure(
                message: 'StadataException - Period not available!',
              ),
            ),
          ),
        );
        verify(() => mockRemoteDataSource.get(domain: domain)).called(1);
      });

      test('should return Failure when data is not available', () async {
        // arrange
        const unavailableResponse = ApiResponseModel<List<PeriodModel>?>(
          status: true,
          dataAvailability: DataAvailability.listNotAvailable,
          data: <PeriodModel>[],
        );

        when(
          () => mockRemoteDataSource.get(domain: domain),
        ).thenAnswer((_) async => unavailableResponse);
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
            Result.failure<Failure, ApiResponse<List<Period>>>(
              const PeriodFailure(
                message: 'StadataException - Period not available!',
              ),
            ),
          ),
        );
        verify(() => mockRemoteDataSource.get(domain: domain)).called(1);
      });

      test('should log error when exception occurs', () async {
        // arrange
        const exception = PeriodNotAvailableException();
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
