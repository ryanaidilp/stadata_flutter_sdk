// ignore_for_file: inference_failure_on_instance_creation

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:stadata_flutter_sdk/src/core/failures/failures.dart';
import 'package:stadata_flutter_sdk/src/core/typedef/typedef.dart';
import 'package:stadata_flutter_sdk/src/features/publications/data/models/publication_model.dart';
import 'package:stadata_flutter_sdk/src/features/publications/domain/entities/publication.dart';
import 'package:stadata_flutter_sdk/src/features/publications/domain/repositories/publication_repository.dart';
import 'package:stadata_flutter_sdk/src/features/publications/domain/usecases/get_all_publication.dart';
import 'package:stadata_flutter_sdk/src/shared/data/models/api_response_model.dart';
import 'package:stadata_flutter_sdk/src/shared/data/models/pagination_model.dart';
import 'package:stadata_flutter_sdk/src/shared/domain/entities/api_response.dart';

import '../../../../../fixtures/fixtures.dart';
import '../../../../../helpers/test_injection.dart';

class MockPublicationRepository extends Mock implements PublicationRepository {}

void main() {
  late PublicationRepository mockRepository;
  late GetAllPublication usecase;
  late ApiResponse<List<Publication>> publications;

  setUpAll(
    () {
      mockRepository = MockPublicationRepository();
      registerTestLazySingleton<PublicationRepository>(mockRepository);
      usecase = GetAllPublication();

      final jsonPublications = jsonFromFixture(
        Fixture.publications.value,
      );

      final publicationsResponse =
          ApiResponseModel<List<PublicationModel>>.fromJson(
        jsonPublications,
        (json) {
          if (json is! List) {
            return [];
          }

          return json.map((e) => PublicationModel.fromJson(e as JSON)).toList();
        },
      );

      final publicationsData =
          publicationsResponse.data?.map((e) => e.toEntity()).toList() ?? [];

      publications = ApiResponse<List<Publication>>(
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
    'getAllPublication',
    () {
      test(
        'should return list of publication if call success',
        () async {
          when(
            () => mockRepository.get(
              domain: domain,
            ),
          ).thenAnswer((_) async => Right(publications));

          final result = await usecase(
            const GetPublicationParam(
              domain: domain,
            ),
          );

          expect(result, Right(publications));
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
              PublicationFailure(message: 'Publication not available!'),
            ),
          );

          final result = await usecase(
            const GetPublicationParam(
              domain: domain,
            ),
          );

          expect(
            result,
            const Left(
              PublicationFailure(message: 'Publication not available!'),
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
