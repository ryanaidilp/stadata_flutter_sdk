import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:stadata_flutter_sdk/src/core/core.dart';
import 'package:stadata_flutter_sdk/src/features/features.dart';
import 'package:stadata_flutter_sdk/src/shared/shared.dart';

import '../../../../../fixtures/fixtures.dart';
import '../../../../../helpers/test_injection.dart';

class MockVariableRemoteDataSource extends Mock
    implements VariableRemoteDataSource {}

class MockLog extends Mock implements Log {}

void main() {
  late Log mockLog;
  late VariableRemoteDataSource mockRemoteDataSource;
  late VariableRepository repository;
  late ApiResponseModel<List<VariableModel>?> successResponse;
  late ApiResponse<List<Variable>> variables;

  setUpAll(() {
    mockRemoteDataSource = MockVariableRemoteDataSource();
    registerTestLazySingleton<VariableRemoteDataSource>(mockRemoteDataSource);
    mockLog = MockLog();
    registerTestFactory<Log>(mockLog);
    registerFallbackValue(LogType.error);
    repository = VariableRepositoryImpl();
    final json = jsonFromFixture(Fixture.variables);
    successResponse = ApiResponseModel<List<VariableModel>?>.fromJson(json, (
      json,
    ) {
      if (json == null || json is! List) {
        return null;
      }

      return json.map((e) => VariableModel.fromJson(e as JSON)).toList();
    });

    final data = successResponse.data;

    variables = ApiResponse<List<Variable>>(
      status: successResponse.status,
      dataAvailability: successResponse.dataAvailability,
      data: data,
      message: successResponse.message,
      pagination: successResponse.pagination,
    );
  });

  tearDownAll(unregisterTestInjection);

  const domain = '7200';

  group('VariableRepositoryImpl', () {
    group('get()', () {
      test('should return list of variables if success', () async {
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
            Result.success<Failure, ApiResponse<List<Variable>>>(variables),
          ),
        );
        verify(() => mockRemoteDataSource.get(domain: domain)).called(1);
      });

      test('should return Failure if failed.', () async {
        // arrange
        when(
          () => mockRemoteDataSource.get(domain: domain),
        ).thenThrow(const VariableNotAvailableException());
        when(
          () => mockLog.console(
            any(),
            error: any<dynamic>(named: 'error'),
            stackTrace: any(named: 'stackTrace'),
            type: any(named: 'type'),
          ),
        ).thenAnswer((_) async => Future.value());

        // act
        final result = await repository.get(domain: domain);

        // assert
        expect(
          result,
          equals(
            Result.failure<Failure, ApiResponse<List<Variable>>>(
              const VariableFailure(
                message: 'StadataException - Variable not available!',
              ),
            ),
          ),
        );
        verify(() => mockRemoteDataSource.get(domain: domain)).called(1);
      });
    });
  });
}
