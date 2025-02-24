// ignore_for_file: inference_failure_on_instance_creation

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:stadata_flutter_sdk/src/core/core.dart';
import 'package:stadata_flutter_sdk/src/features/features.dart';
import 'package:stadata_flutter_sdk/src/shared/shared.dart';

import '../../../../../fixtures/fixtures.dart';
import '../../../../../helpers/test_injection.dart';

class MockPressReleaseRepository extends Mock
    implements PressReleaseRepository {}

void main() {
  late PressReleaseRepository mockRepository;
  late GetDetailPressRelease usecase;

  late ApiResponse<PressRelease> pressRelease;

  setUpAll(() {
    mockRepository = MockPressReleaseRepository();
    registerTestLazySingleton<PressReleaseRepository>(mockRepository);
    usecase = GetDetailPressRelease();

    final jsonPublication = jsonFromFixture(Fixture.pressReleaseDetail);

    final pressReleaseResponse = ApiResponseModel<PressReleaseModel?>.fromJson(
      jsonPublication,
      (json) => json == null ? null : PressReleaseModel.fromJson(json as JSON),
    );

    pressRelease = ApiResponse<PressRelease>(
      status: pressReleaseResponse.status,
      dataAvailability: pressReleaseResponse.dataAvailability,
      data: pressReleaseResponse.data,
      message: pressReleaseResponse.message,
      pagination: pressReleaseResponse.pagination,
    );
  });

  tearDownAll(unregisterTestInjection);

  const id = 1234;
  const domain = '7315';

  group('GetDetailPressRelease', () {
    test('should return instance of press release if call success', () async {
      when(
        () => mockRepository.detail(id: id, domain: domain),
      ).thenAnswer((_) async => Result.success(pressRelease));

      final result = await usecase(
        const GetDetailPressReleaseParam(id: id, domain: domain),
      );

      expect(
        result,
        Result.success<Failure, ApiResponse<PressRelease>>(pressRelease),
      );
      verify(() => mockRepository.detail(id: id, domain: domain)).called(1);
    });

    test('should return failure if exception is thrown', () async {
      when(
        () => mockRepository.detail(id: id, domain: domain),
      ).thenAnswer((_) async => Result.failure(const PressReleaseFailure()));

      final result = await usecase(
        const GetDetailPressReleaseParam(id: id, domain: domain),
      );

      expect(
        result,
        Result.failure<Failure, ApiResponse<PressRelease>>(
          const PressReleaseFailure(),
        ),
      );
      verify(() => mockRepository.detail(id: id, domain: domain)).called(1);
    });
  });
}
