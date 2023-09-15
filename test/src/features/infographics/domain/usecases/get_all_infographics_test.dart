import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:stadata_flutter_sdk/src/core/failures/failures.dart';
import 'package:stadata_flutter_sdk/src/core/typedef/typedef.dart';
import 'package:stadata_flutter_sdk/src/features/infographics/data/models/infographic_model.dart';
import 'package:stadata_flutter_sdk/src/features/infographics/domain/entities/infographic.dart';
import 'package:stadata_flutter_sdk/src/features/infographics/domain/repositories/infographic_repository.dart';
import 'package:stadata_flutter_sdk/src/features/infographics/domain/usecases/get_all_infographics.dart';
import 'package:stadata_flutter_sdk/src/shared/data/models/api_response_model.dart';
import 'package:stadata_flutter_sdk/src/shared/data/models/pagination_model.dart';
import 'package:stadata_flutter_sdk/src/shared/domain/entities/api_response.dart';

import '../../../../../fixtures/fixtures.dart';
import '../../../../../helpers/test_injection.dart';

class MockInfographicRepository extends Mock implements InfographicRepository {}

void main() {
  late InfographicRepository mockRepository;
  late GetAllInfographics usecase;
  late ApiResponse<List<Infographic>> infographics;

  setUpAll(
    () {
      mockRepository = MockInfographicRepository();
      registerTestLazySingleton<InfographicRepository>(mockRepository);
      usecase = GetAllInfographics();

      final jsonInfographics = jsonFromFixture(
        'infographic_fixture_available.json',
      );

      final infographicsResponse =
          ApiResponseModel<List<InfographicModel>>.fromJson(
        jsonInfographics,
        (json) {
          if (json is! List) {
            return [];
          }

          return json.map((e) => InfographicModel.fromJson(e as JSON)).toList();
        },
      );

      final infographicsData =
          infographicsResponse.data?.map((e) => e.toEntity()).toList() ?? [];

      infographics = ApiResponse<List<Infographic>>(
        status: infographicsResponse.status,
        data: infographicsData,
        dataAvailability: infographicsResponse.dataAvailability,
        message: infographicsResponse.message,
        pagination: infographicsResponse.pagination?.toEntity(),
      );
    },
  );

  tearDownAll(unregisterTestInjection);

  const domain = '7200';

  group(
    'GetAllInfographics',
    () {
      test(
        'should return list of infographics if success',
        () async {
          // arrange
          when(
            () => mockRepository.get(domain: domain),
          ).thenAnswer((_) async => Right(infographics));

          // act
          final result = await usecase(
            const GetAllInfographicParam(domain: domain),
          );

          // assert
          expect(
            result,
            Right<Failure, ApiResponse<List<Infographic>>>(infographics),
          );
          verify(
            () => mockRepository.get(domain: domain),
          ).called(1);
        },
      );

      test(
        'should return failure if exception is thrown',
        () async {
          // arrange
          when(
            () => mockRepository.get(domain: domain),
          ).thenAnswer(
            (_) async => const Left(
              PublicationFailure(),
            ),
          );

          // act
          final result = await usecase(
            const GetAllInfographicParam(domain: domain),
          );

          // assert
          expect(
            result,
            const Left<Failure, ApiResponse<List<Infographic>>>(
              PublicationFailure(),
            ),
          );
          verify(
            () => mockRepository.get(domain: domain),
          ).called(1);
        },
      );
    },
  );
}
