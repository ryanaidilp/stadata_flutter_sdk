import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:stadata_flutter_sdk/src/core/core.dart';
import 'package:stadata_flutter_sdk/src/features/features.dart';
import 'package:stadata_flutter_sdk/src/shared/shared.dart';

import '../../../../../fixtures/fixtures.dart';
import '../../../../../helpers/test_injection.dart';

class MockGlossaryRepository extends Mock implements GlossaryRepository {}

void main() {
  late GlossaryRepository mockRepository;
  late GetAllGlossary usecase;
  late ApiResponse<List<Glossary>> data;

  setUpAll(() {
    mockRepository = MockGlossaryRepository();
    registerTestLazySingleton<GlossaryRepository>(mockRepository);
    usecase = GetAllGlossary();

    final json = jsonFromFixture(Fixture.glossary);
    final response = ApiResponseModel<List<GlossaryModel>?>.fromJson(json, (
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

  tearDownAll(unregisterTestInjection);

  const domain = '0000';

  group('GetAllGlossary', () {
    test(
      'should return list of glossary items when call is successful',
      () async {
        // arrange
        when(
          () => mockRepository.get(domain: domain),
        ).thenAnswer((_) async => Result.success(data));

        // act
        final result = await usecase(const GetAllGlossaryParam(domain: domain));

        // assert
        expect(
          result,
          equals(
            Result.success<Failure, ApiResponse<List<Glossary>>>(data),
          ),
        );
        verify(() => mockRepository.get(domain: domain)).called(1);
      },
    );

    test('should return glossary items with custom page', () async {
      // arrange
      const page = 2;
      when(
        () => mockRepository.get(domain: domain, page: page),
      ).thenAnswer((_) async => Result.success(data));

      // act
      final result = await usecase(
        const GetAllGlossaryParam(domain: domain, page: page),
      );

      // assert
      expect(
        result,
        equals(
          Result.success<Failure, ApiResponse<List<Glossary>>>(data),
        ),
      );
      verify(() => mockRepository.get(domain: domain, page: page)).called(1);
    });

    test('should return glossary items with English language', () async {
      // arrange
      when(
        () => mockRepository.get(domain: domain, lang: DataLanguage.en),
      ).thenAnswer((_) async => Result.success(data));

      // act
      final result = await usecase(
        const GetAllGlossaryParam(domain: domain, lang: DataLanguage.en),
      );

      // assert
      expect(
        result,
        equals(
          Result.success<Failure, ApiResponse<List<Glossary>>>(data),
        ),
      );
      verify(
        () => mockRepository.get(domain: domain, lang: DataLanguage.en),
      ).called(1);
    });

    test('should return glossary items with keyword filter', () async {
      // arrange
      const keyword = 'absolut';
      when(
        () => mockRepository.get(domain: domain, keyword: keyword),
      ).thenAnswer((_) async => Result.success(data));

      // act
      final result = await usecase(
        const GetAllGlossaryParam(domain: domain, keyword: keyword),
      );

      // assert
      expect(
        result,
        equals(
          Result.success<Failure, ApiResponse<List<Glossary>>>(data),
        ),
      );
      verify(
        () => mockRepository.get(domain: domain, keyword: keyword),
      ).called(1);
    });

    test('should return glossary items with prefix filter', () async {
      // arrange
      const prefix = 'A';
      when(
        () => mockRepository.get(domain: domain, prefix: prefix),
      ).thenAnswer((_) async => Result.success(data));

      // act
      final result = await usecase(
        const GetAllGlossaryParam(domain: domain, prefix: prefix),
      );

      // assert
      expect(
        result,
        equals(
          Result.success<Failure, ApiResponse<List<Glossary>>>(data),
        ),
      );
      verify(
        () => mockRepository.get(domain: domain, prefix: prefix),
      ).called(1);
    });

    test('should return failure when repository fails', () async {
      // arrange
      when(
        () => mockRepository.get(domain: domain),
      ).thenAnswer((_) async => Result.failure(const GlossaryFailure()));

      // act
      final result = await usecase(const GetAllGlossaryParam(domain: domain));

      // assert
      expect(
        result,
        equals(
          Result.failure<Failure, ApiResponse<List<Glossary>>>(
            const GlossaryFailure(),
          ),
        ),
      );
      verify(() => mockRepository.get(domain: domain)).called(1);
    });

    group('GetAllGlossaryParam', () {
      test('should create param with required domain and default values', () {
        // arrange
        const param = GetAllGlossaryParam(domain: domain);

        // assert
        expect(param.domain, equals(domain));
        expect(param.lang, equals(DataLanguage.id));
        expect(param.page, equals(1));
        expect(param.keyword, isNull);
        expect(param.prefix, isNull);
      });

      test('should create param with all optional parameters', () {
        // arrange
        const param = GetAllGlossaryParam(
          domain: domain,
          lang: DataLanguage.en,
          page: 3,
          keyword: 'test',
          prefix: 'T',
        );

        // assert
        expect(param.domain, equals(domain));
        expect(param.lang, equals(DataLanguage.en));
        expect(param.page, equals(3));
        expect(param.keyword, equals('test'));
        expect(param.prefix, equals('T'));
      });

      test('should be equal when properties are the same', () {
        // arrange
        const param1 = GetAllGlossaryParam(domain: domain);
        const param2 = GetAllGlossaryParam(domain: domain);

        // assert
        expect(param1, equals(param2));
        expect(param1.hashCode, equals(param2.hashCode));
      });

      test('should not be equal when domain is different', () {
        // arrange
        const param1 = GetAllGlossaryParam(domain: '0000');
        const param2 = GetAllGlossaryParam(domain: '7200');

        // assert
        expect(param1, isNot(equals(param2)));
      });

      test('should not be equal when keyword is different', () {
        // arrange
        const param1 = GetAllGlossaryParam(domain: domain);
        const param2 = GetAllGlossaryParam(domain: domain, keyword: 'test');

        // assert
        expect(param1, isNot(equals(param2)));
      });

      test('should not be equal when prefix is different', () {
        // arrange
        const param1 = GetAllGlossaryParam(domain: domain);
        const param2 = GetAllGlossaryParam(domain: domain, prefix: 'A');

        // assert
        expect(param1, isNot(equals(param2)));
      });

      test('should not be equal when page is different', () {
        // arrange
        const param1 = GetAllGlossaryParam(domain: domain);
        const param2 = GetAllGlossaryParam(domain: domain, page: 2);

        // assert
        expect(param1, isNot(equals(param2)));
      });

      test('should expose props with all five fields', () {
        // arrange
        const param = GetAllGlossaryParam(domain: domain);

        // assert
        expect(
          param.props,
          equals([domain, DataLanguage.id, 1, null, null]),
        );
      });

      test('should be a subclass of BaseEntity', () {
        // arrange
        const param = GetAllGlossaryParam(domain: domain);

        // assert
        expect(param, isA<BaseEntity>());
      });
    });
  });
}
