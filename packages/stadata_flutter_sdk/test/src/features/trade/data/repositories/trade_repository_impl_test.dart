import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:stadata_flutter_sdk/src/core/core.dart';
import 'package:stadata_flutter_sdk/src/features/trade/data/datasources/trade_remote_data_source.dart';
import 'package:stadata_flutter_sdk/src/features/trade/data/models/models.dart';
import 'package:stadata_flutter_sdk/src/features/trade/data/repositories/trade_repository_impl.dart';
import 'package:stadata_flutter_sdk/src/features/trade/domain/entities/entities.dart';
import 'package:stadata_flutter_sdk/src/features/trade/domain/enums/enums.dart';
import 'package:stadata_flutter_sdk/src/features/trade/domain/params/params.dart';
import 'package:stadata_flutter_sdk/src/features/trade/domain/repositories/trade_repository.dart';
import 'package:stadata_flutter_sdk/src/shared/shared.dart';

import '../../../../../fixtures/fixtures.dart';
import '../../../../../helpers/test_injection.dart';

class MockTradeRemoteDataSource extends Mock implements TradeRemoteDataSource {}

class MockLog extends Mock implements Log {}

void main() {
  late Log mockLog;
  late TradeRemoteDataSource mockRemoteDataSource;
  late TradeRepository repository;

  const param = TradeParam(
    source: TradeSource.export,
    period: TradePeriod.annually,
    hsCode: '0101',
    hsType: HSCodeType.twoDigit,
    year: '2023',
  );

  setUpAll(() {
    mockRemoteDataSource = MockTradeRemoteDataSource();
    registerTestLazySingleton<TradeRemoteDataSource>(mockRemoteDataSource);
    mockLog = MockLog();
    registerTestFactory<Log>(mockLog);
    registerFallbackValue(LogType.error);
    repository = TradeRepositoryImpl();
  });

  tearDownAll(unregisterTestInjection);

  group('TradeRepositoryImpl', () {
    late ApiResponseModel<List<TradeDataModel>> response;
    late ApiResponse<List<TradeData>> data;

    setUp(() {
      final json = jsonFromFixture(Fixture.trade);
      response = ApiResponseModel<List<TradeDataModel>>.fromJson(json, (json) {
        if (json == null || json is! List) {
          return [];
        }

        return json.map((e) => TradeDataModel.fromJson(e as JSON)).toList();
      });

      final responseData = response.data?.map((e) => e).toList() ?? [];

      data = ApiResponse<List<TradeData>>(
        data: responseData,
        status: response.status,
        message: response.message,
        pagination: response.pagination,
        dataAvailability: response.dataAvailability,
      );
    });

    group('getTrade()', () {
      test('should return List of TradeData if success', () async {
        // arrange
        when(
          () => mockRemoteDataSource.getTrade(param),
        ).thenAnswer((_) async => response);

        // act
        final result = await repository.getTrade(param);

        // assert
        expect(
          result,
          equals(
            Result.success<Failure, ApiResponse<List<TradeData>>>(data),
          ),
        );
        verify(() => mockRemoteDataSource.getTrade(param)).called(1);
      });

      test(
        'should return Failure if TradeNotAvailableException is thrown',
        () async {
          // arrange
          when(
            () => mockRemoteDataSource.getTrade(param),
          ).thenThrow(const TradeNotAvailableException());
          when(
            () => mockLog.console(
              any(),
              error: any<dynamic>(named: 'error'),
              stackTrace: any(named: 'stackTrace'),
              type: any(named: 'type'),
            ),
          ).thenAnswer((_) async => Future.value());

          // act
          final result = await repository.getTrade(param);

          // assert
          expect(
            result,
            equals(
              Result.failure<Failure, ApiResponse<List<TradeData>>>(
                const TradeFailure(
                  message: 'StadataException - Trade data not available!',
                ),
              ),
            ),
          );
          verify(() => mockRemoteDataSource.getTrade(param)).called(1);
        },
      );

      test('should return Failure if generic exception is thrown', () async {
        // arrange
        when(
          () => mockRemoteDataSource.getTrade(param),
        ).thenThrow(const FormatException('Invalid format'));
        when(
          () => mockLog.console(
            any(),
            error: any<dynamic>(named: 'error'),
            stackTrace: any(named: 'stackTrace'),
            type: any(named: 'type'),
          ),
        ).thenAnswer((_) async => Future.value());

        // act
        final result = await repository.getTrade(param);

        // assert
        expect(
          result,
          equals(
            Result.failure<Failure, ApiResponse<List<TradeData>>>(
              const TradeFailure(
                message: 'FormatException: Invalid format',
              ),
            ),
          ),
        );
        verify(() => mockRemoteDataSource.getTrade(param)).called(1);
      });

      test('should return empty list when data is null', () async {
        // arrange
        const nullResponse = ApiResponseModel<List<TradeDataModel>>(
          status: true,
          dataAvailability: DataAvailability.available,
        );
        when(
          () => mockRemoteDataSource.getTrade(param),
        ).thenAnswer((_) async => nullResponse);

        // act
        final result = await repository.getTrade(param);

        // assert
        expect(result.isSuccess, isTrue);
        result.when(
          success: (response) => expect(response.data, isEmpty),
          failure: (_) => fail('Expected success result'),
        );
        verify(() => mockRemoteDataSource.getTrade(param)).called(1);
      });
    });
  });
}
