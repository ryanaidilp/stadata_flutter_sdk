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
  late GetAllPublication usecase;
  late ApiResponse<List<Publication>> publications;

  setUpAll(() {
    mockRepository = MockPublicationRepository();
    registerTestLazySingleton<PublicationRepository>(mockRepository);
    usecase = GetAllPublication();

    final jsonPublications = jsonFromFixture(Fixture.publications);

    final publicationsResponse =
        ApiResponseModel<List<PublicationModel>>.fromJson(jsonPublications, (
          json,
        ) {
          if (json is! List) {
            return [];
          }

          return json.map((e) => PublicationModel.fromJson(e as JSON)).toList();
        });

    final publicationsData =
        publicationsResponse.data?.map((e) => e).toList() ?? [];

    publications = ApiResponse<List<Publication>>(
      status: publicationsResponse.status,
      dataAvailability: publicationsResponse.dataAvailability,
      data: publicationsData,
      message: publicationsResponse.message,
      pagination: publicationsResponse.pagination,
    );
  });

  tearDownAll(unregisterTestInjection);

  const domain = '7315';

  group('getAllPublication', () {
    test('should return list of publication if call success', () async {
      when(
        () => mockRepository.get(domain: domain),
      ).thenAnswer((_) async => Result.success(publications));

      final result = await usecase(const GetPublicationParam(domain: domain));

      expect(
        result,
        Result.success<Failure, ApiResponse<List<Publication>>>(publications),
      );
      verify(() => mockRepository.get(domain: domain)).called(1);
    });

    test('should return failure if exception is thrown', () async {
      when(() => mockRepository.get(domain: domain)).thenAnswer(
        (_) async => Result.failure(
          const PublicationFailure(message: 'Publication not available!'),
        ),
      );

      final result = await usecase(const GetPublicationParam(domain: domain));

      expect(
        result,
        Result.failure<Failure, ApiResponse<List<Publication>>>(
          const PublicationFailure(message: 'Publication not available!'),
        ),
      );
      verify(() => mockRepository.get(domain: domain)).called(1);
    });
  });
}
