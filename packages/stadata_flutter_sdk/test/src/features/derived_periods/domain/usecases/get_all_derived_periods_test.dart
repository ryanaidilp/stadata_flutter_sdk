import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:stadata_flutter_sdk/src/core/core.dart';
import 'package:stadata_flutter_sdk/src/features/features.dart';
import 'package:stadata_flutter_sdk/src/shared/shared.dart';

import '../../../../../fixtures/fixtures.dart';
import '../../../../../helpers/test_injection.dart';

class MockDerivedPeriodRepository extends Mock
    implements DerivedPeriodRepository {}

void main() {
  late DerivedPeriodRepository mockRepository;
  late GetAllDerivedPeriods usecase;
  late ApiResponse<List<DerivedPeriod>> data;

  setUpAll(() {
    mockRepository = MockDerivedPeriodRepository();
    registerTestLazySingleton<DerivedPeriodRepository>(mockRepository);
    usecase = GetAllDerivedPeriods();

    final json = jsonFromFixture(Fixture.derivedPeriods);
    final response = ApiResponseModel<List<DerivedPeriodModel>?>.fromJson(
      json,
      (json) {
        if (json == null || json is! List) {
          return null;
        }

        return json.map((e) => DerivedPeriodModel.fromJson(e as JSON)).toList();
      },
    );

    final dataResponse = response.data ?? [];
    data = ApiResponse<List<DerivedPeriod>>(
      data: dataResponse,
      status: response.status,
      message: response.message,
      pagination: response.pagination,
      dataAvailability: response.dataAvailability,
    );
  });

  tearDownAll(unregisterTestInjection);

  const domain = '0000';

  group('GetAllDerivedPeriods', () {
    test(
      'should return list of derived periods when call is successful',
      () async {
        // arrange
        when(
          () => mockRepository.get(domain: domain),
        ).thenAnswer((_) async => Result.success(data));

        // act
        final result = await usecase(
          const GetAllDerivedPeriodsParam(domain: domain),
        );

        // assert
        expect(
          result,
          equals(
            Result.success<Failure, ApiResponse<List<DerivedPeriod>>>(data),
          ),
        );
        verify(() => mockRepository.get(domain: domain)).called(1);
      },
    );

    test('should return failure when repository fails', () async {
      // arrange
      when(
        () => mockRepository.get(domain: domain),
      ).thenAnswer((_) async => Result.failure(const DerivedPeriodFailure()));

      // act
      final result = await usecase(
        const GetAllDerivedPeriodsParam(domain: domain),
      );

      // assert
      expect(
        result,
        equals(
          Result.failure<Failure, ApiResponse<List<DerivedPeriod>>>(
            const DerivedPeriodFailure(),
          ),
        ),
      );
      verify(() => mockRepository.get(domain: domain));
    });

    group('GetAllDerivedPeriodsParam', () {
      test('should create param with required domain', () {
        // arrange
        const param = GetAllDerivedPeriodsParam(domain: domain);

        // assert
        expect(param.domain, equals(domain));
        expect(param.lang, equals(DataLanguage.id));
        expect(param.page, equals(1));
        expect(param.variableID, isNull);
      });

      test('should be equal when properties are the same', () {
        // arrange
        const param1 = GetAllDerivedPeriodsParam(domain: domain);
        const param2 = GetAllDerivedPeriodsParam(domain: domain);

        // assert
        expect(param1, equals(param2));
        expect(param1.hashCode, equals(param2.hashCode));
      });

      test('should be a subclass of BaseEntity', () {
        // arrange
        const param = GetAllDerivedPeriodsParam(domain: domain);

        // assert
        expect(param, isA<BaseEntity>());
      });
    });
  });
}
