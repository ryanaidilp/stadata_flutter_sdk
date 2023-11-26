// ignore_for_file: inference_failure_on_instance_creation

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:stadata_flutter_sdk/src/core/failures/failures.dart';
import 'package:stadata_flutter_sdk/src/core/typedef/typedef.dart';
import 'package:stadata_flutter_sdk/src/features/press_releases/data/models/press_release_model.dart';
import 'package:stadata_flutter_sdk/src/features/press_releases/domain/repositories/press_release_repository.dart';
import 'package:stadata_flutter_sdk/src/features/press_releases/domain/usecases/get_detail_press_release.dart';
import 'package:stadata_flutter_sdk/src/shared/data/models/api_response_model.dart';
import 'package:stadata_flutter_sdk/src/shared/data/models/pagination_model.dart';
import 'package:stadata_flutter_sdk/src/shared/domain/entities/api_response.dart';
import 'package:stadata_flutter_sdk/stadata_flutter_sdk.dart';

import '../../../../../fixtures/fixtures.dart';
import '../../../../../helpers/test_injection.dart';

class MockPressReleaseRepository extends Mock
    implements PressReleaseRepository {}

void main() {
  late PressReleaseRepository mockRepository;
  late GetDetailPressRelease usecase;

  late ApiResponse<PressRelease> pressRelease;

  setUpAll(
    () {
      mockRepository = MockPressReleaseRepository();
      registerTestLazySingleton<PressReleaseRepository>(mockRepository);
      usecase = GetDetailPressRelease();

      final jsonPublication = jsonFromFixture(
        Fixture.pressReleaseDetail,
      );

      final pressReleaseResponse =
          ApiResponseModel<PressReleaseModel?>.fromJson(
        jsonPublication,
        (json) =>
            json == null ? null : PressReleaseModel.fromJson(json as JSON),
      );

      pressRelease = ApiResponse<PressRelease>(
        status: pressReleaseResponse.status,
        dataAvailability: pressReleaseResponse.dataAvailability,
        data: pressReleaseResponse.data?.toEntity(),
        message: pressReleaseResponse.message,
        pagination: pressReleaseResponse.pagination?.toEntity(),
      );
    },
  );

  tearDownAll(unregisterTestInjection);

  const id = 1234;
  const domain = '7315';

  group(
    'GetDetailPressRelease',
    () {
      test(
        'should return instance of press release if call success',
        () async {
          when(
            () => mockRepository.detail(
              id: id,
              domain: domain,
            ),
          ).thenAnswer((_) async => Right(pressRelease));

          final result = await usecase(
            const GetDetailPressReleaseParam(
              id: id,
              domain: domain,
            ),
          );

          expect(result, Right(pressRelease));
          verify(
            () => mockRepository.detail(
              id: id,
              domain: domain,
            ),
          ).called(1);
        },
      );

      test(
        'should return failure if exception is thrown',
        () async {
          when(
            () => mockRepository.detail(
              id: id,
              domain: domain,
            ),
          ).thenAnswer(
            (_) async => const Left(
              PressReleaseFailure(),
            ),
          );

          final result = await usecase(
            const GetDetailPressReleaseParam(
              id: id,
              domain: domain,
            ),
          );

          expect(
            result,
            const Left(
              PressReleaseFailure(),
            ),
          );
          verify(
            () => mockRepository.detail(
              id: id,
              domain: domain,
            ),
          ).called(1);
        },
      );
    },
  );
}
