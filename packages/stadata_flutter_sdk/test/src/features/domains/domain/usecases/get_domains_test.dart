// ignore_for_file: inference_failure_on_instance_creation

import 'package:dartz/dartz.dart';
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

  setUpAll(
    () {
      mockRepository = MockDomainRepository();
      registerTestLazySingleton(mockRepository);
      usecase = GetDomains();
      final json = jsonFromFixture(Fixture.domains);
      final response = ApiResponseModel<List<DomainModel>>.fromJson(
        json,
        (json) {
          if (json is! List) {
            return [];
          }

          return json.map((e) => DomainModel.fromJson(e as JSON)).toList();
        },
      );
      final domains = response.data?.map((e) => e.toEntity()).toList();
      data = ApiResponse(
        status: response.status,
        dataAvailability: response.dataAvailability,
        pagination: response.pagination?.toEntity(),
        data: domains,
      );
    },
  );

  tearDownAll(unregisterTestInjection);

  group(
    'GetDomains',
    () {
      test(
        'should return list of domain entities if call success',
        () async {
          // arrange
          when(
            () => mockRepository.get(),
          ).thenAnswer((_) async => Right(data));

          // act
          final result = await usecase(
            const GetDomainParam(
              type: DomainType.all,
            ),
          );

          // assert
          expect(result, Right(data));
          verify(
            () => mockRepository.get(),
          ).called(1);
        },
      );

      test(
        'should throw error if provinceCode not provided and '
        'type is regencyByProv',
        () async {
          // arrange
          when(
            () => mockRepository.get(
              type: DomainType.regencyByProvince,
            ),
          ).thenAnswer(
            (_) async => const Left(
              DomainProvinceCodeMissingFailure(),
            ),
          );

          // act
          final result = await usecase(
            const GetDomainParam(
              type: DomainType.regencyByProvince,
            ),
          );

          // assert
          expect(
            result,
            const Left(DomainProvinceCodeMissingFailure()),
          );
          verifyNever(
            () => mockRepository.get(),
          );
        },
      );
    },
  );
}
