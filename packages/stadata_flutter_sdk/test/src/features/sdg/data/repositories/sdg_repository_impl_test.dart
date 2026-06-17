import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:stadata_flutter_sdk/src/core/core.dart';
import 'package:stadata_flutter_sdk/src/features/features.dart';
import 'package:stadata_flutter_sdk/src/shared/shared.dart';

import '../../../../../fixtures/fixtures.dart';
import '../../../../../helpers/test_injection.dart';

class MockSdgRemoteDataSource extends Mock implements SdgRemoteDataSource {}

class MockLog extends Mock implements Log {}

void main() {
  late Log mockLog;
  late SdgRemoteDataSource mockRemoteDataSource;
  late SdgRepository repository;

  setUpAll(() {
    mockRemoteDataSource = MockSdgRemoteDataSource();
    registerTestLazySingleton<SdgRemoteDataSource>(mockRemoteDataSource);
    mockLog = MockLog();
    registerTestFactory<Log>(mockLog);
    registerFallbackValue(LogType.error);
    repository = SdgRepositoryImpl();
  });

  tearDownAll(() => unregisterTestInjection);

  const domain = '7315';
  const goal = SdgGoalNumber.noPoverty;

  group('SdgRepositoryImpl', () {
    group('get()', () {
      late ApiResponseModel<List<SdgIndicatorModel>?> response;
      late ApiResponse<List<SdgIndicator>> data;

      setUp(() {
        final json = jsonFromFixture(Fixture.sdg);
        response = ApiResponseModel<List<SdgIndicatorModel>?>.fromJson(json, (
          json,
        ) {
          if (json == null || json is! List) {
            return null;
          }

          return json
              .map((e) => SdgIndicatorModel.fromJson(e as JSON))
              .toList();
        });

        final responseData = response.data?.map((e) => e).toList() ?? [];

        data = ApiResponse<List<SdgIndicator>>(
          data: responseData,
          status: response.status,
          message: response.message,
          pagination: response.pagination,
          dataAvailability: response.dataAvailability,
        );
      });

      test('should return list of SDG indicators if success', () async {
        when(
          () => mockRemoteDataSource.get(domain: domain, goal: goal),
        ).thenAnswer((_) async => response);

        final result = await repository.get(domain: domain, goal: goal);

        expect(
          result,
          equals(
            Result.success<Failure, ApiResponse<List<SdgIndicator>>>(data),
          ),
        );
        verify(
          () => mockRemoteDataSource.get(domain: domain, goal: goal),
        ).called(1);
      });

      test('should return SdgFailure if failed', () async {
        when(
          () => mockRemoteDataSource.get(domain: domain, goal: goal),
        ).thenThrow(const SdgNotAvailableException());
        when(
          () => mockLog.console(
            any(),
            error: any<dynamic>(named: 'error'),
            stackTrace: any(named: 'stackTrace'),
            type: any(named: 'type'),
          ),
        ).thenAnswer((_) async => Future.value());

        final result = await repository.get(domain: domain, goal: goal);

        expect(
          result,
          equals(
            Result.failure<Failure, ApiResponse<List<SdgIndicator>>>(
              const SdgFailure(
                message: 'StadataException - SDG Indicator not available!',
              ),
            ),
          ),
        );
        verify(
          () => mockRemoteDataSource.get(domain: domain, goal: goal),
        ).called(1);
      });

      test('should return failure when data is null', () async {
        final nullResponse =
            ApiResponseModel<List<SdgIndicatorModel>?>.fromJson(
              const {
                'status': 'OK',
                'data-availability': 'available',
                'data': [
                  {
                    'page': 1,
                    'pages': 1,
                    'per_page': 10,
                    'count': 0,
                    'total': 0,
                  },
                  null,
                ],
              },
              (json) => null,
            );

        when(
          () => mockRemoteDataSource.get(domain: domain, goal: goal),
        ).thenAnswer((_) async => nullResponse);
        when(
          () => mockLog.console(
            any(),
            error: any<dynamic>(named: 'error'),
            stackTrace: any(named: 'stackTrace'),
            type: any(named: 'type'),
          ),
        ).thenAnswer((_) async => Future.value());

        final result = await repository.get(domain: domain, goal: goal);

        expect(result.isFailure, isTrue);
        verify(
          () => mockRemoteDataSource.get(domain: domain, goal: goal),
        ).called(1);
      });
    });
  });
}
