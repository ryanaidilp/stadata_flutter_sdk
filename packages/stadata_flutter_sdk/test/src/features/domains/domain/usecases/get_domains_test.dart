// ignore_for_file: inference_failure_on_instance_creation

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:stadata_flutter_sdk/src/core/core.dart';
import 'package:stadata_flutter_sdk/src/features/features.dart';
import 'package:stadata_flutter_sdk/src/shared/shared.dart';

import '../../../../../fixtures/fixtures.dart';
import '../../../../../helpers/test_injection.dart';

class MockDomainRepository extends Mock implements DomainRepository {}

void main() {
  late DomainRepository mockRepository;
  late GetDomains usecase;
  late ApiResponse<List<DomainEntity>> data;

  setUpAll(() {
    mockRepository = MockDomainRepository();
    registerTestLazySingleton(mockRepository);
    usecase = GetDomains();
    final json = jsonFromFixture(Fixture.domains);
    final response = ApiResponseModel<List<DomainModel>>.fromJson(json, (json) {
      if (json is! List) {
        return [];
      }

      return json.map((e) => DomainModel.fromJson(e as JSON)).toList();
    });
    final domains = response.data?.map((e) => e).toList();
    data = ApiResponse(
      status: response.status,
      dataAvailability: response.dataAvailability,
      pagination: response.pagination,
      data: domains,
    );
  });

  tearDownAll(unregisterTestInjection);

  group('GetDomains', () {
    test('should return list of domain entities if call success', () async {
      // arrange
      when(
        () => mockRepository.get(),
      ).thenAnswer((_) async => Result.success(data));

      // act
      final result = await usecase(const GetDomainParam(type: DomainType.all));

      // assert
      expect(
        result,
        Result.success<Failure, ApiResponse<List<DomainEntity>>>(data),
      );
      verify(() => mockRepository.get()).called(1);
    });

    test('should throw error if provinceCode not provided and '
        'type is regencyByProv', () async {
      // arrange
      when(
        () => mockRepository.get(type: DomainType.regencyByProvince),
      ).thenAnswer(
        (_) async => Result.failure(const DomainProvinceCodeMissingFailure()),
      );

      // act
      final result = await usecase(
        const GetDomainParam(type: DomainType.regencyByProvince),
      );

      // assert
      expect(
        result,
        Result.failure<Failure, ApiResponse<List<DomainEntity>>>(
          const DomainProvinceCodeMissingFailure(),
        ),
      );
      verifyNever(() => mockRepository.get());
    });
  });
}
