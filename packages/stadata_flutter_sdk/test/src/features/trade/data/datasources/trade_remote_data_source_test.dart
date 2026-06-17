import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:stadata_flutter_sdk/src/core/core.dart';
import 'package:stadata_flutter_sdk/src/features/trade/data/datasources/trade_remote_data_source.dart';
import 'package:stadata_flutter_sdk/src/features/trade/data/models/models.dart';
import 'package:stadata_flutter_sdk/src/features/trade/domain/enums/enums.dart';
import 'package:stadata_flutter_sdk/src/features/trade/domain/params/params.dart';
import 'package:stadata_flutter_sdk/src/shared/shared.dart';

import '../../../../../fixtures/fixtures.dart';
import '../../../../../helpers/test_injection.dart';

class MockNetworkClient extends Mock implements NetworkClient {}

void main() {
  late NetworkClient mockClient;
  late TradeRemoteDataSource dataSource;

  const param = TradeParam(
    source: TradeSource.export,
    period: TradePeriod.annually,
    hsCode: '0101',
    hsType: HSCodeType.twoDigit,
    year: '2023',
  );

  final queryParams = {
    'sumber': param.source.value,
    'periode': param.period.value,
    'kodehs': param.hsCode,
    'jenishs': param.hsType.value,
    'tahun': param.year,
  };

  setUpAll(() {
    mockClient = MockNetworkClient();
    registerTestFactory<NetworkClient>(mockClient);
    dataSource = TradeRemoteDataSourceImpl();
  });

  tearDownAll(unregisterTestInjection);

  group('TradeRemoteDataSource', () {
    group('getTrade()', () {
      late ApiResponseModel<List<TradeDataModel>> data;
      late JSON response;
      late JSON unavailableResponse;

      setUp(() {
        response = jsonFromFixture(Fixture.trade);
        unavailableResponse = jsonFromFixture(Fixture.listUnavailable);

        data = ApiResponseModel<List<TradeDataModel>>.fromJson(response, (
          json,
        ) {
          if (json == null || json is! List) {
            return [];
          }

          return json.map((e) => TradeDataModel.fromJson(e as JSON)).toList();
        });
      });

      test('should return list of trade data if success', () async {
        // arrange
        when(
          () => mockClient.get<JSON>(
            ApiEndpoint.trade,
            queryParams: queryParams,
          ),
        ).thenAnswer((_) async => response);

        // act
        final result = await dataSource.getTrade(param);

        // assert
        expect(result, equals(data));
        verify(
          () => mockClient.get<JSON>(
            ApiEndpoint.trade,
            queryParams: queryParams,
          ),
        ).called(1);
      });

      test(
        'should throw TradeNotAvailableException when list-not-available',
        () async {
          // arrange
          when(
            () => mockClient.get<JSON>(
              ApiEndpoint.trade,
              queryParams: queryParams,
            ),
          ).thenAnswer((_) async => unavailableResponse);

          // act
          final result = dataSource.getTrade(param);

          // assert
          await expectLater(
            result,
            throwsA(const TradeNotAvailableException()),
          );
          verify(
            () => mockClient.get<JSON>(
              ApiEndpoint.trade,
              queryParams: queryParams,
            ),
          ).called(1);
        },
      );

      test('should throw ApiException when status is Error', () async {
        // arrange
        final errorResponse = {
          'status': 'Error',
          'message': 'Something went wrong',
        };
        when(
          () => mockClient.get<JSON>(
            ApiEndpoint.trade,
            queryParams: queryParams,
          ),
        ).thenAnswer((_) async => errorResponse);

        // act
        final result = dataSource.getTrade(param);

        // assert
        await expectLater(result, throwsA(isA<ApiException>()));
        verify(
          () => mockClient.get<JSON>(
            ApiEndpoint.trade,
            queryParams: queryParams,
          ),
        ).called(1);
      });

      test('should work with import source param', () async {
        // arrange
        const importParam = TradeParam(
          source: TradeSource.import_,
          period: TradePeriod.monthly,
          hsCode: '0102',
          hsType: HSCodeType.full,
          year: '2022',
        );
        final importQueryParams = {
          'sumber': importParam.source.value,
          'periode': importParam.period.value,
          'kodehs': importParam.hsCode,
          'jenishs': importParam.hsType.value,
          'tahun': importParam.year,
        };
        when(
          () => mockClient.get<JSON>(
            ApiEndpoint.trade,
            queryParams: importQueryParams,
          ),
        ).thenAnswer((_) async => response);

        // act
        final result = await dataSource.getTrade(importParam);

        // assert
        expect(result, equals(data));
        verify(
          () => mockClient.get<JSON>(
            ApiEndpoint.trade,
            queryParams: importQueryParams,
          ),
        ).called(1);
      });
    });
  });
}
