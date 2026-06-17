import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:stadata_flutter_sdk/src/core/core.dart';
import 'package:stadata_flutter_sdk/src/features/features.dart';
import 'package:stadata_flutter_sdk/src/shared/shared.dart';

import '../../../../../fixtures/fixtures.dart';
import '../../../../../helpers/test_injection.dart';

class MockSdgRepository extends Mock implements SdgRepository {}

void main() {
  late SdgRepository mockRepository;
  late GetAllSdgIndicators usecase;
  late ApiResponse<List<SdgIndicator>> data;

  setUpAll(() {
    mockRepository = MockSdgRepository();
    registerTestLazySingleton<SdgRepository>(mockRepository);
    usecase = GetAllSdgIndicators();

    final json = jsonFromFixture(Fixture.sdg);
    final response = ApiResponseModel<List<SdgIndicatorModel>?>.fromJson(
      json,
      (json) {
        if (json == null || json is! List) {
          return null;
        }

        return json.map((e) => SdgIndicatorModel.fromJson(e as JSON)).toList();
      },
    );

    final responseData = response.data?.map((e) => e).toList() ?? [];

    data = ApiResponse<List<SdgIndicator>>(
      data: responseData,
      status: response.status,
      message: response.message,
      pagination: response.pagination,
      dataAvailability: response.dataAvailability,
    );
  });

  tearDownAll(unregisterTestInjection);

  const domain = '7315';
  const goal = SdgGoalNumber.noPoverty;

  group('GetAllSdgIndicators', () {
    test(
      'should return list of SDG indicators when call is successful',
      () async {
        // arrange
        when(
          () => mockRepository.get(domain: domain, goal: goal),
        ).thenAnswer((_) async => Result.success(data));

        // act
        final result = await usecase(
          const GetAllSdgIndicatorsParam(domain: domain, goal: goal),
        );

        // assert
        expect(
          result,
          equals(
            Result.success<Failure, ApiResponse<List<SdgIndicator>>>(data),
          ),
        );
        verify(() => mockRepository.get(domain: domain, goal: goal)).called(1);
      },
    );

    test('should return list of SDG indicators with custom page', () async {
      // arrange
      const page = 2;
      when(
        () => mockRepository.get(domain: domain, goal: goal, page: page),
      ).thenAnswer((_) async => Result.success(data));

      // act
      final result = await usecase(
        const GetAllSdgIndicatorsParam(domain: domain, goal: goal, page: page),
      );

      // assert
      expect(
        result,
        equals(
          Result.success<Failure, ApiResponse<List<SdgIndicator>>>(data),
        ),
      );
      verify(
        () => mockRepository.get(domain: domain, goal: goal, page: page),
      ).called(1);
    });

    test(
      'should return list of SDG indicators with English language',
      () async {
        // arrange
        when(
          () => mockRepository.get(
            domain: domain,
            goal: goal,
            lang: DataLanguage.en,
          ),
        ).thenAnswer((_) async => Result.success(data));

        // act
        final result = await usecase(
          const GetAllSdgIndicatorsParam(
            domain: domain,
            goal: goal,
            lang: DataLanguage.en,
          ),
        );

        // assert
        expect(
          result,
          equals(
            Result.success<Failure, ApiResponse<List<SdgIndicator>>>(data),
          ),
        );
        verify(
          () => mockRepository.get(
            domain: domain,
            goal: goal,
            lang: DataLanguage.en,
          ),
        ).called(1);
      },
    );

    test('should return failure when repository fails', () async {
      // arrange
      when(
        () => mockRepository.get(domain: domain, goal: goal),
      ).thenAnswer((_) async => Result.failure(const SdgFailure()));

      // act
      final result = await usecase(
        const GetAllSdgIndicatorsParam(domain: domain, goal: goal),
      );

      // assert
      expect(
        result,
        equals(
          Result.failure<Failure, ApiResponse<List<SdgIndicator>>>(
            const SdgFailure(),
          ),
        ),
      );
      verify(() => mockRepository.get(domain: domain, goal: goal)).called(1);
    });

    group('GetAllSdgIndicatorsParam', () {
      test('should create param with required fields and default values', () {
        // arrange
        const param = GetAllSdgIndicatorsParam(domain: domain, goal: goal);

        // assert
        expect(param.domain, equals(domain));
        expect(param.goal, equals(goal));
        expect(param.lang, equals(DataLanguage.id));
        expect(param.page, equals(1));
      });

      test('should create param with all optional parameters', () {
        // arrange
        const param = GetAllSdgIndicatorsParam(
          domain: domain,
          goal: SdgGoalNumber.zeroHunger,
          lang: DataLanguage.en,
          page: 3,
        );

        // assert
        expect(param.domain, equals(domain));
        expect(param.goal, equals(SdgGoalNumber.zeroHunger));
        expect(param.lang, equals(DataLanguage.en));
        expect(param.page, equals(3));
      });

      test('should be equal when properties are the same', () {
        // arrange
        const param1 = GetAllSdgIndicatorsParam(domain: domain, goal: goal);
        const param2 = GetAllSdgIndicatorsParam(domain: domain, goal: goal);

        // assert
        expect(param1, equals(param2));
        expect(param1.hashCode, equals(param2.hashCode));
      });

      test('should not be equal when domain is different', () {
        // arrange
        const param1 = GetAllSdgIndicatorsParam(domain: '0000', goal: goal);
        const param2 = GetAllSdgIndicatorsParam(domain: '7315', goal: goal);

        // assert
        expect(param1, isNot(equals(param2)));
      });

      test('should not be equal when goal is different', () {
        // arrange
        const param1 = GetAllSdgIndicatorsParam(
          domain: domain,
          goal: SdgGoalNumber.noPoverty,
        );
        const param2 = GetAllSdgIndicatorsParam(
          domain: domain,
          goal: SdgGoalNumber.zeroHunger,
        );

        // assert
        expect(param1, isNot(equals(param2)));
      });

      test('should not be equal when page is different', () {
        // arrange
        const param1 = GetAllSdgIndicatorsParam(domain: domain, goal: goal);
        const param2 = GetAllSdgIndicatorsParam(
          domain: domain,
          goal: goal,
          page: 2,
        );

        // assert
        expect(param1, isNot(equals(param2)));
      });

      test('should expose props with all four fields', () {
        // arrange
        const param = GetAllSdgIndicatorsParam(domain: domain, goal: goal);

        // assert
        expect(
          param.props,
          equals([domain, goal, DataLanguage.id, 1]),
        );
      });

      test('should be a subclass of BaseEntity', () {
        // arrange
        const param = GetAllSdgIndicatorsParam(domain: domain, goal: goal);

        // assert
        expect(param, isA<BaseEntity>());
      });
    });
  });
}
