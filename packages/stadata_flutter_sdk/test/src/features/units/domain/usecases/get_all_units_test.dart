import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:stadata_flutter_sdk/src/core/core.dart';
import 'package:stadata_flutter_sdk/src/features/features.dart';
import 'package:stadata_flutter_sdk/src/shared/shared.dart';

import '../../../../../fixtures/fixtures.dart';
import '../../../../../helpers/test_injection.dart';

class MockUnitDataRepository extends Mock implements UnitDataRepository {}

void main() {
  late UnitDataRepository mockRepository;
  late GetAllUnits usecase;
  late ApiResponse<List<UnitData>> data;

  setUpAll(() {
    mockRepository = MockUnitDataRepository();
    registerTestLazySingleton<UnitDataRepository>(mockRepository);
    usecase = GetAllUnits();

    final json = jsonFromFixture(Fixture.units);
    final response = ApiResponseModel<List<UnitDataModel>?>.fromJson(json, (
      json,
    ) {
      if (json == null || json is! List) {
        return null;
      }

      return json.map((e) => UnitDataModel.fromJson(e as JSON)).toList();
    });

    final dataResponse = response.data ?? [];
    data = ApiResponse<List<UnitData>>(
      data: dataResponse,
      status: response.status,
      message: response.message,
      pagination: response.pagination,
      dataAvailability: response.dataAvailability,
    );
  });

  tearDownAll(unregisterTestInjection);

  const domain = '7200';

  group('GetAllUnits', () {
    test('should return list of units if call success', () async {
      // arrange
      when(
        () => mockRepository.get(domain: domain),
      ).thenAnswer((_) async => Result.success(data));

      // act
      final result = await usecase(const GetAllUnitsParam(domain: domain));

      // assert
      expect(
        result,
        equals(Result.success<Failure, ApiResponse<List<UnitData>>>(data)),
      );
      verify(() => mockRepository.get(domain: domain)).called(1);
    });

    test('should return failure if exception if failed ', () async {
      // arrange
      when(
        () => mockRepository.get(domain: domain),
      ).thenAnswer((_) async => Result.failure(const UnitFailure()));

      // act
      final result = await usecase(const GetAllUnitsParam(domain: domain));

      // assert
      expect(
        result,
        equals(
          Result.failure<Failure, ApiResponse<List<UnitData>>>(
            const UnitFailure(),
          ),
        ),
      );
      verify(() => mockRepository.get(domain: domain));
    });
  });
}
