import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:stadata_flutter_sdk/src/core/core.dart';
import 'package:stadata_flutter_sdk/src/features/features.dart';
import 'package:stadata_flutter_sdk/src/shared/shared.dart';

import '../../../../../fixtures/fixtures.dart';
import '../../../../../helpers/test_injection.dart';

class MockGlossaryRemoteDataSource extends Mock
    implements GlossaryRemoteDataSource {}

class MockLog extends Mock implements Log {}

void main() {
  late Log mockLog;
  late GlossaryRemoteDataSource mockRemoteDataSource;
  late GlossaryRepository repository;

  setUpAll(() {
    mockRemoteDataSource = MockGlossaryRemoteDataSource();
    registerTestLazySingleton<GlossaryRemoteDataSource>(mockRemoteDataSource);
    mockLog = MockLog();
    registerTestFactory<Log>(mockLog);
    registerFallbackValue(LogType.error);
    repository = GlossaryRepositoryImpl();
  });

  tearDownAll(() => unregisterTestInjection);

  const domain = '7315';

  group('GlossaryRepositoryImpl', () {
    group('get()', () {
      late ApiResponseModel<List<GlossaryModel>?> response;
      late ApiResponse<List<Glossary>> data;

      setUp(() {
        final json = jsonFromFixture(Fixture.glossary);
        response = ApiResponseModel<List<GlossaryModel>?>.fromJson(json, (
          json,
        ) {
          if (json == null || json is! List) {
            return null;
          }

          return json.map((e) => GlossaryModel.fromJson(e as JSON)).toList();
        });

        final responseData = response.data?.map((e) => e).toList() ?? [];

        data = ApiResponse<List<Glossary>>(
          data: responseData,
          status: response.status,
          message: response.message,
          pagination: response.pagination,
          dataAvailability: response.dataAvailability,
        );
      });

      test('should return list of glossary if success', () async {
        when(
          () => mockRemoteDataSource.get(domain: domain),
        ).thenAnswer((_) async => response);

        final result = await repository.get(domain: domain);

        expect(
          result,
          equals(
            Result.success<Failure, ApiResponse<List<Glossary>>>(data),
          ),
        );
        verify(() => mockRemoteDataSource.get(domain: domain)).called(1);
      });

      test('should return GlossaryFailure if failed', () async {
        when(
          () => mockRemoteDataSource.get(domain: domain),
        ).thenThrow(const GlossaryNotAvailableException());
        when(
          () => mockLog.console(
            any(),
            error: any<dynamic>(named: 'error'),
            stackTrace: any(named: 'stackTrace'),
            type: any(named: 'type'),
          ),
        ).thenAnswer((_) async => Future.value());

        final result = await repository.get(domain: domain);

        expect(
          result,
          equals(
            Result.failure<Failure, ApiResponse<List<Glossary>>>(
              const GlossaryFailure(
                message: 'StadataException - Glossary not available!',
              ),
            ),
          ),
        );
        verify(() => mockRemoteDataSource.get(domain: domain)).called(1);
      });

      test('should return empty list when data is null', () async {
        final nullResponse = ApiResponseModel<List<GlossaryModel>?>.fromJson(
          const {
            'status': 'OK',
            'data-availability': 'available',
            'data': [
              {'page': 1, 'pages': 1, 'per_page': 10, 'count': 0, 'total': 0},
              null,
            ],
          },
          (json) => null,
        );

        when(
          () => mockRemoteDataSource.get(domain: domain),
        ).thenAnswer((_) async => nullResponse);
        when(
          () => mockLog.console(
            any(),
            error: any<dynamic>(named: 'error'),
            stackTrace: any(named: 'stackTrace'),
            type: any(named: 'type'),
          ),
        ).thenAnswer((_) async => Future.value());

        final result = await repository.get(domain: domain);

        expect(result.isFailure, isTrue);
        verify(() => mockRemoteDataSource.get(domain: domain)).called(1);
      });
    });
  });
}
