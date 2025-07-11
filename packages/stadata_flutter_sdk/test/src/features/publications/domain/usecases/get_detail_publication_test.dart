// Test file uses generic instance creation for mock objects
// ignore_for_file: inference_failure_on_instance_creation

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:stadata_flutter_sdk/src/core/core.dart';
import 'package:stadata_flutter_sdk/src/features/features.dart';
import 'package:stadata_flutter_sdk/src/shared/shared.dart';

import '../../../../../fixtures/fixtures.dart';
import '../../../../../helpers/test_injection.dart';

class MockPublicationRepository extends Mock implements PublicationRepository {}

void main() {
  late PublicationRepository mockRepository;
  late GetDetailPublication usecase;

  late ApiResponse<Publication> publication;

  setUpAll(() {
    mockRepository = MockPublicationRepository();
    registerTestLazySingleton<PublicationRepository>(mockRepository);
    usecase = GetDetailPublication();

    final jsonPublication = jsonFromFixture(Fixture.publicationDetail);

    final publicationResponse = ApiResponseModel<PublicationModel?>.fromJson(
      jsonPublication,
      (json) => json == null ? null : PublicationModel.fromJson(json as JSON),
    );

    publication = ApiResponse<Publication>(
      status: publicationResponse.status,
      dataAvailability: publicationResponse.dataAvailability,
      data: publicationResponse.data,
      message: publicationResponse.message,
      pagination: publicationResponse.pagination,
    );
  });

  tearDownAll(unregisterTestInjection);

  const id = 'a78f4d4f1c3548600cffcd29';
  const domain = '7315';

  group('getDetailPublication', () {
    test('should return instance of publication if call success', () async {
      when(
        () => mockRepository.detail(id: id, domain: domain),
      ).thenAnswer((_) async => Result.success(publication));

      final result = await usecase(
        const GetPublicationDetailParam(id: id, domain: domain),
      );

      expect(
        result,
        Result.success<Failure, ApiResponse<Publication>>(publication),
      );
      verify(() => mockRepository.detail(id: id, domain: domain)).called(1);
    });

    test('should return failure if exception is thrown', () async {
      when(() => mockRepository.detail(id: id, domain: domain)).thenAnswer(
        (_) async => Result.failure(
          const PublicationFailure(message: 'Publication not available!'),
        ),
      );

      final result = await usecase(
        const GetPublicationDetailParam(id: id, domain: domain),
      );

      expect(
        result,
        Result.failure<Failure, ApiResponse<Publication>>(
          const PublicationFailure(message: 'Publication not available!'),
        ),
      );
      verify(() => mockRepository.detail(id: id, domain: domain)).called(1);
    });
  });
}
