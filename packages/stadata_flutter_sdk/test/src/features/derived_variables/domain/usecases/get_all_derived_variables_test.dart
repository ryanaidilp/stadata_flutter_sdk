import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:stadata_flutter_sdk/src/core/core.dart';
import 'package:stadata_flutter_sdk/src/features/features.dart';
import 'package:stadata_flutter_sdk/src/shared/shared.dart';

import '../../../../../fixtures/fixtures.dart';
import '../../../../../helpers/test_injection.dart';

class MockDerivedVariableRepository extends Mock
    implements DerivedVariableRepository {}

void main() {
  late DerivedVariableRepository mockRepository;
  late GetAllDerivedVariables usecase;
  late ApiResponse<List<DerivedVariable>> data;

  setUpAll(() {
    mockRepository = MockDerivedVariableRepository();
    registerTestLazySingleton<DerivedVariableRepository>(mockRepository);
    usecase = GetAllDerivedVariables();

    final json = jsonFromFixture(Fixture.derivedVariables);
    final response = ApiResponseModel<List<DerivedVariableModel>?>.fromJson(
      json,
      (json) {
        if (json == null || json is! List) {
          return null;
        }

        return json
            .map((e) => DerivedVariableModel.fromJson(e as JSON))
            .toList();
      },
    );

    final dataResponse = response.data ?? [];
    data = ApiResponse<List<DerivedVariable>>(
      data: dataResponse,
      status: response.status,
      message: response.message,
      pagination: response.pagination,
      dataAvailability: response.dataAvailability,
    );
  });

  tearDownAll(unregisterTestInjection);

  const domain = '0000';

  group('GetAllDerivedVariables', () {
    test(
      'should return list of derived variables when call is successful',
      () async {
        // arrange
        when(
          () => mockRepository.get(domain: domain),
        ).thenAnswer((_) async => Result.success(data));

        // act
        final result = await usecase(
          const GetAllDerivedVariablesParam(domain: domain),
        );

        // assert
        expect(
          result,
          equals(
            Result.success<Failure, ApiResponse<List<DerivedVariable>>>(data),
          ),
        );
        verify(() => mockRepository.get(domain: domain)).called(1);
      },
    );

    test('should return list with verticalGroup parameter', () async {
      // arrange
      const verticalGroup = 5;
      when(
        () => mockRepository.get(
          domain: domain,
          verticalGroup: verticalGroup,
        ),
      ).thenAnswer((_) async => Result.success(data));

      // act
      final result = await usecase(
        const GetAllDerivedVariablesParam(
          domain: domain,
          verticalGroup: verticalGroup,
        ),
      );

      // assert
      expect(
        result,
        equals(
          Result.success<Failure, ApiResponse<List<DerivedVariable>>>(data),
        ),
      );
      verify(
        () => mockRepository.get(
          domain: domain,
          verticalGroup: verticalGroup,
        ),
      ).called(1);
    });

    test('should return failure when repository fails', () async {
      // arrange
      when(
        () => mockRepository.get(domain: domain),
      ).thenAnswer(
        (_) async => Result.failure(const DerivedVariableFailure()),
      );

      // act
      final result = await usecase(
        const GetAllDerivedVariablesParam(domain: domain),
      );

      // assert
      expect(
        result,
        equals(
          Result.failure<Failure, ApiResponse<List<DerivedVariable>>>(
            const DerivedVariableFailure(),
          ),
        ),
      );
      verify(() => mockRepository.get(domain: domain));
    });

    group('GetAllDerivedVariablesParam', () {
      test('should create param with required domain', () {
        // arrange
        const param = GetAllDerivedVariablesParam(domain: domain);

        // assert
        expect(param.domain, equals(domain));
        expect(param.lang, equals(DataLanguage.id));
        expect(param.page, equals(1));
        expect(param.variableID, isNull);
        expect(param.verticalGroup, isNull);
      });

      test('should create param with all optional parameters', () {
        // arrange
        const variableID = 145;
        const verticalGroup = 5;
        const param = GetAllDerivedVariablesParam(
          domain: domain,
          lang: DataLanguage.en,
          page: 2,
          variableID: variableID,
          verticalGroup: verticalGroup,
        );

        // assert
        expect(param.domain, equals(domain));
        expect(param.lang, equals(DataLanguage.en));
        expect(param.page, equals(2));
        expect(param.variableID, equals(variableID));
        expect(param.verticalGroup, equals(verticalGroup));
      });

      test('should be equal when properties are the same', () {
        // arrange
        const param1 = GetAllDerivedVariablesParam(domain: domain);
        const param2 = GetAllDerivedVariablesParam(domain: domain);

        // assert
        expect(param1, equals(param2));
        expect(param1.hashCode, equals(param2.hashCode));
      });

      test('should not be equal when domain is different', () {
        // arrange
        const param1 = GetAllDerivedVariablesParam(domain: '0000');
        const param2 = GetAllDerivedVariablesParam(domain: '7200');

        // assert
        expect(param1, isNot(equals(param2)));
      });

      test('should not be equal when verticalGroup differs', () {
        // arrange
        const param1 = GetAllDerivedVariablesParam(
          domain: domain,
          verticalGroup: 5,
        );
        const param2 = GetAllDerivedVariablesParam(
          domain: domain,
          verticalGroup: 10,
        );

        // assert
        expect(param1, isNot(equals(param2)));
      });

      test('should be a subclass of BaseEntity', () {
        // arrange
        const param = GetAllDerivedVariablesParam(domain: domain);

        // assert
        expect(param, isA<BaseEntity>());
      });
    });
  });
}
