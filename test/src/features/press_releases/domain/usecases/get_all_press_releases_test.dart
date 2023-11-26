import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:stadata_flutter_sdk/src/core/failures/failures.dart';
import 'package:stadata_flutter_sdk/src/core/typedef/typedef.dart';
import 'package:stadata_flutter_sdk/src/features/press_releases/data/models/press_release_model.dart';
import 'package:stadata_flutter_sdk/src/features/press_releases/domain/repositories/press_release_repository.dart';
import 'package:stadata_flutter_sdk/src/features/press_releases/domain/usecases/get_all_press_releases.dart';
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
  late GetAllPressReleases usecase;
  late ApiResponse<List<PressRelease>> pressReleases;

  setUpAll(
    () {
      mockRepository = MockPressReleaseRepository();
      registerTestLazySingleton<PressReleaseRepository>(mockRepository);
      usecase = GetAllPressReleases();

      final jsonPublications = jsonFromFixture(
        Fixture.pressReleases,
      );

      final publicationsResponse =
          ApiResponseModel<List<PressReleaseModel>>.fromJson(
        jsonPublications,
        (json) {
          if (json is! List) {
            return [];
          }

          return json
              .map((e) => PressReleaseModel.fromJson(e as JSON))
              .toList();
        },
      );

      final publicationsData =
          publicationsResponse.data?.map((e) => e.toEntity()).toList() ?? [];

      pressReleases = ApiResponse<List<PressRelease>>(
        status: publicationsResponse.status,
        dataAvailability: publicationsResponse.dataAvailability,
        data: publicationsData,
        message: publicationsResponse.message,
        pagination: publicationsResponse.pagination?.toEntity(),
      );
    },
  );

  tearDownAll(unregisterTestInjection);

  const domain = '7315';

  group(
    'GetAllPressReleases',
    () {
      test(
        'should return list of press releases if call success',
        () async {
          when(
            () => mockRepository.get(
              domain: domain,
            ),
          ).thenAnswer((_) async => Right(pressReleases));

          final result = await usecase(
            const GetAllPressReleasesParam(
              domain: domain,
            ),
          );

          expect(
            result,
            Right<Failure, ApiResponse<List<PressRelease>>>(pressReleases),
          );
          verify(
            () => mockRepository.get(
              domain: domain,
            ),
          ).called(1);
        },
      );

      test(
        'should return failure if exception is thrown',
        () async {
          when(
            () => mockRepository.get(
              domain: domain,
            ),
          ).thenAnswer(
            (_) async => const Left(
              PressReleaseFailure(),
            ),
          );

          final result = await usecase(
            const GetAllPressReleasesParam(
              domain: domain,
            ),
          );

          expect(
            result,
            const Left<Failure, ApiResponse<List<PressRelease>>>(
              PressReleaseFailure(),
            ),
          );
          verify(
            () => mockRepository.get(
              domain: domain,
            ),
          ).called(1);
        },
      );
    },
  );
}
