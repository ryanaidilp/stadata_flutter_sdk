import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:stadata_flutter_sdk/src/core/core.dart';
import 'package:stadata_flutter_sdk/src/features/features.dart';
import 'package:stadata_flutter_sdk/src/shared/shared.dart';

import '../../../../../fixtures/fixtures.dart';
import '../../../../../helpers/test_injection.dart';

class MockDerivedPeriodRemoteDataSource extends Mock
    implements DerivedPeriodRemoteDataSource {}

class MockLog extends Mock implements Log {}

void main() {
  late Log mockLog;
  late DerivedPeriodRemoteDataSource mockRemoteDataSource;
  late DerivedPeriodRepository repository;
  late ApiResponseModel<List<DerivedPeriodModel>?> successResponse;
  late ApiResponse<List<DerivedPeriod>> derivedPeriods;

  setUpAll(() {
    mockRemoteDataSource = MockDerivedPeriodRemoteDataSource();
    registerTestLazySingleton<DerivedPeriodRemoteDataSource>(
      mockRemoteDataSource,
    );
    mockLog = MockLog();
    registerTestFactory<Log>(mockLog);
    registerFallbackValue(LogType.error);
    repository = DerivedPeriodRepositoryImpl();
    final json = jsonFromFixture(Fixture.derivedPeriods);
    successResponse = ApiResponseModel<List<DerivedPeriodModel>?>.fromJson(
      json,
      (json) {
        if (json == null || json is! List) {
          return null;
        }

        return json.map((e) => DerivedPeriodModel.fromJson(e as JSON)).toList();
      },
    );

    final data = successResponse.data;

    derivedPeriods = ApiResponse<List<DerivedPeriod>>(
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

  group('DerivedPeriodRepositoryImpl', () {
    group('get()', () {
      test(
        'should return list of derived periods when call is successful',
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
              Result.success<Failure, ApiResponse<List<DerivedPeriod>>>(
                derivedPeriods,
              ),
            ),
          );
          verify(() => mockRemoteDataSource.get(domain: domain)).called(1);
        },
      );

      test('should return Failure when exception is thrown', () async {
        // arrange
        when(
          () => mockRemoteDataSource.get(domain: domain),
        ).thenThrow(const DerivedPeriodNotAvailableException());
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
            Result.failure<Failure, ApiResponse<List<DerivedPeriod>>>(
              const DerivedPeriodFailure(
                message: 'StadataException - DerivedPeriod not available!',
              ),
            ),
          ),
        );
        verify(() => mockRemoteDataSource.get(domain: domain)).called(1);
      });

      test('should return Failure when data is null', () async {
        // arrange
        const nullDataResponse = ApiResponseModel<List<DerivedPeriodModel>?>(
          status: true,
          dataAvailability: DataAvailability.available,
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
        const exception = DerivedPeriodNotAvailableException();
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
