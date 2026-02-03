import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:stadata_flutter_sdk/src/core/core.dart';
import 'package:stadata_flutter_sdk/src/features/features.dart';
import 'package:stadata_flutter_sdk/src/shared/shared.dart';

import '../../../../../fixtures/fixtures.dart';
import '../../../../../helpers/test_injection.dart';

class MockPeriodRepository extends Mock implements PeriodRepository {}

void main() {
  late PeriodRepository mockRepository;
  late GetAllPeriods usecase;
  late ApiResponse<List<Period>> data;

  setUpAll(() {
    mockRepository = MockPeriodRepository();
    registerTestLazySingleton<PeriodRepository>(mockRepository);
    usecase = GetAllPeriods();

    final json = jsonFromFixture(Fixture.periods);
    final response = ApiResponseModel<List<PeriodModel>?>.fromJson(
      json,
      (json) {
        if (json == null || json is! List) {
          return null;
        }

        return json.map((e) => PeriodModel.fromJson(e as JSON)).toList();
      },
    );

    final dataResponse = response.data ?? [];
    data = ApiResponse<List<Period>>(
      data: dataResponse,
      status: response.status,
      message: response.message,
      pagination: response.pagination,
      dataAvailability: response.dataAvailability,
    );
  });

  tearDownAll(unregisterTestInjection);

  const domain = '0000';

  group('GetAllPeriods', () {
    test('should return list of periods when call is successful', () async {
      // arrange
      when(
        () => mockRepository.get(domain: domain),
      ).thenAnswer((_) async => Result.success(data));

      // act
      final result = await usecase(const GetAllPeriodsParam(domain: domain));

      // assert
      expect(
        result,
        equals(Result.success<Failure, ApiResponse<List<Period>>>(data)),
      );
      verify(() => mockRepository.get(domain: domain)).called(1);
    });

    test('should return list of periods with custom page', () async {
      // arrange
      const page = 2;
      when(
        () => mockRepository.get(domain: domain, page: page),
      ).thenAnswer((_) async => Result.success(data));

      // act
      final result = await usecase(
        const GetAllPeriodsParam(domain: domain, page: page),
      );

      // assert
      expect(
        result,
        equals(Result.success<Failure, ApiResponse<List<Period>>>(data)),
      );
      verify(() => mockRepository.get(domain: domain, page: page)).called(1);
    });

    test('should return list of periods with English language', () async {
      // arrange
      when(
        () => mockRepository.get(domain: domain, lang: DataLanguage.en),
      ).thenAnswer((_) async => Result.success(data));

      // act
      final result = await usecase(
        const GetAllPeriodsParam(domain: domain, lang: DataLanguage.en),
      );

      // assert
      expect(
        result,
        equals(Result.success<Failure, ApiResponse<List<Period>>>(data)),
      );
      verify(
        () => mockRepository.get(domain: domain, lang: DataLanguage.en),
      ).called(1);
    });

    test('should return list of periods with variableID filter', () async {
      // arrange
      const variableID = 145;
      when(
        () => mockRepository.get(domain: domain, variableID: variableID),
      ).thenAnswer((_) async => Result.success(data));

      // act
      final result = await usecase(
        const GetAllPeriodsParam(domain: domain, variableID: variableID),
      );

      // assert
      expect(
        result,
        equals(Result.success<Failure, ApiResponse<List<Period>>>(data)),
      );
      verify(
        () => mockRepository.get(domain: domain, variableID: variableID),
      ).called(1);
    });

    test('should return failure when repository fails', () async {
      // arrange
      when(
        () => mockRepository.get(domain: domain),
      ).thenAnswer((_) async => Result.failure(const PeriodFailure()));

      // act
      final result = await usecase(const GetAllPeriodsParam(domain: domain));

      // assert
      expect(
        result,
        equals(
          Result.failure<Failure, ApiResponse<List<Period>>>(
            const PeriodFailure(),
          ),
        ),
      );
      verify(() => mockRepository.get(domain: domain));
    });

    group('GetAllPeriodsParam', () {
      test('should create param with required domain', () {
        // arrange
        const param = GetAllPeriodsParam(domain: domain);

        // assert
        expect(param.domain, equals(domain));
        expect(param.lang, equals(DataLanguage.id));
        expect(param.page, equals(1));
        expect(param.variableID, isNull);
      });

      test('should create param with all optional parameters', () {
        // arrange
        const variableID = 145;
        const param = GetAllPeriodsParam(
          domain: domain,
          lang: DataLanguage.en,
          page: 2,
          variableID: variableID,
        );

        // assert
        expect(param.domain, equals(domain));
        expect(param.lang, equals(DataLanguage.en));
        expect(param.page, equals(2));
        expect(param.variableID, equals(variableID));
      });

      test('should be equal when properties are the same', () {
        // arrange
        const param1 = GetAllPeriodsParam(domain: domain);
        const param2 = GetAllPeriodsParam(domain: domain);

        // assert
        expect(param1, equals(param2));
        expect(param1.hashCode, equals(param2.hashCode));
      });

      test('should not be equal when domain is different', () {
        // arrange
        const param1 = GetAllPeriodsParam(domain: '0000');
        const param2 = GetAllPeriodsParam(domain: '7200');

        // assert
        expect(param1, isNot(equals(param2)));
      });

      test('should not be equal when optional parameters differ', () {
        // arrange
        const param1 = GetAllPeriodsParam(domain: domain);
        const param2 = GetAllPeriodsParam(domain: domain, page: 2);

        // assert
        expect(param1, isNot(equals(param2)));
      });

      test('should be a subclass of BaseEntity', () {
        // arrange
        const param = GetAllPeriodsParam(domain: domain);

        // assert
        expect(param, isA<BaseEntity>());
      });
    });
  });
}
