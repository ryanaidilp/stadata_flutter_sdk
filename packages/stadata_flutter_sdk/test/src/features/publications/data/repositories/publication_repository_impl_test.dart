import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:stadata_flutter_sdk/src/core/exceptions/exceptions.dart';
import 'package:stadata_flutter_sdk/src/core/failures/failures.dart';
import 'package:stadata_flutter_sdk/src/core/typedef/typedef.dart';
import 'package:stadata_flutter_sdk/src/features/publications/data/datasources/publication_remote_data_source.dart';
import 'package:stadata_flutter_sdk/src/features/publications/data/models/publication_model.dart';
import 'package:stadata_flutter_sdk/src/features/publications/data/repositories/publication_repository_impl.dart';
import 'package:stadata_flutter_sdk/src/features/publications/domain/entities/publication.dart';
import 'package:stadata_flutter_sdk/src/features/publications/domain/repositories/publication_repository.dart';
import 'package:stadata_flutter_sdk/src/shared/data/models/api_response_model.dart';
import 'package:stadata_flutter_sdk/src/shared/data/models/pagination_model.dart';
import 'package:stadata_flutter_sdk/src/shared/domain/entities/api_response.dart';

import '../../../../../fixtures/fixtures.dart';
import '../../../../../helpers/test_injection.dart';

class MockPublicationRemoteDataSource extends Mock
    implements PublicationRemoteDataSource {}

void main() {
  late PublicationRemoteDataSource mockRemoteDataSource;
  late PublicationRepository repository;

  setUpAll(
    () {
      mockRemoteDataSource = MockPublicationRemoteDataSource();
      registerTestLazySingleton<PublicationRemoteDataSource>(
        mockRemoteDataSource,
      );
      repository = PublicationRepositoryImpl();
    },
  );

  tearDownAll(unregisterTestInjection);

  const domain = '7205';

  group(
    'PublicationRepositoryImpl',
    () {
      group(
        'get()',
        () {
          late ApiResponseModel<List<PublicationModel>> response;
          late ApiResponse<List<Publication>> data;

          setUp(
            () {
              final json = jsonFromFixture(Fixture.publications);

              response = ApiResponseModel<List<PublicationModel>>.fromJson(
                json,
                (json) {
                  if (json is! List) {
                    return [];
                  }
                  return json
                      .map((e) => PublicationModel.fromJson(e as JSON))
                      .toList();
                },
              );

              final responseData =
                  response.data?.map((e) => e.toEntity()).toList();

              data = ApiResponse<List<Publication>>(
                status: response.status,
                dataAvailability: response.dataAvailability,
                data: responseData,
                message: response.message,
                pagination: response.pagination?.toEntity(),
              );
            },
          );
          test(
            'should return List of Publications if success',
            () async {
              // arrange
              when(
                () => mockRemoteDataSource.get(
                  domain: domain,
                ),
              ).thenAnswer((_) async => response);

              // act
              final result = await repository.get(domain: domain);

              // assert
              expect(
                result,
                equals(
                  Right<Failure, ApiResponse<List<Publication>>>(
                    data,
                  ),
                ),
              );
              verify(
                () => mockRemoteDataSource.get(
                  domain: domain,
                ),
              ).called(1);
            },
          );

          test(
            'should return Failure if exception occured',
            () async {
              // arrange
              when(
                () => mockRemoteDataSource.get(
                  domain: domain,
                ),
              ).thenThrow(const PublicationNotAvailableException());

              // act
              final result = await repository.get(domain: domain);

              // assert
              expect(
                result,
                equals(
                  const Left<Failure, ApiResponse<List<Publication>>>(
                    PublicationFailure(
                      message: 'StadataException - Publication not available!',
                    ),
                  ),
                ),
              );
              verify(
                () => mockRemoteDataSource.get(
                  domain: domain,
                ),
              ).called(1);
            },
          );
        },
      );

      const id = '91031jda00114';

      group(
        'detail()',
        () {
          late ApiResponseModel<PublicationModel> response;
          late ApiResponse<Publication> data;
          setUp(
            () {
              final jsonDetail = jsonFromFixture(
                Fixture.publicationDetail,
              );

              response = ApiResponseModel<PublicationModel>.fromJson(
                jsonDetail,
                (json) {
                  if (json == null) {
                    return PublicationModel(
                      id: '',
                      title: '',
                      issn: '',
                      cover: '',
                      pdf: '',
                      size: '',
                    );
                  }

                  return PublicationModel.fromJson(json as JSON);
                },
              );

              data = ApiResponse<Publication>(
                status: response.status,
                dataAvailability: response.dataAvailability,
                data: response.data?.toEntity(),
                pagination: response.pagination?.toEntity(),
                message: response.message,
              );
            },
          );
          test(
            'should return an instance of Publications if success',
            () async {
              // arrange
              when(
                () => mockRemoteDataSource.detail(
                  id: id,
                  domain: domain,
                ),
              ).thenAnswer((_) async => response);

              // act
              final result = await repository.detail(
                id: id,
                domain: domain,
              );

              // assert
              expect(
                result,
                equals(
                  Right<Failure, ApiResponse<Publication>>(data),
                ),
              );
              verify(
                () => mockRemoteDataSource.detail(
                  id: id,
                  domain: domain,
                ),
              ).called(1);
            },
          );

          test(
            'should return Failure if exception occured',
            () async {
              // arrange
              when(
                () => mockRemoteDataSource.detail(
                  id: id,
                  domain: domain,
                ),
              ).thenThrow(const PublicationNotAvailableException());

              // act
              final result = await repository.detail(id: id, domain: domain);

              // assert
              expect(
                result,
                equals(
                  const Left<Failure, ApiResponse<List<Publication>>>(
                    PublicationFailure(
                      message: 'StadataException - Publication not available!',
                    ),
                  ),
                ),
              );
              verify(
                () => mockRemoteDataSource.detail(
                  id: id,
                  domain: domain,
                ),
              ).called(1);
            },
          );
        },
      );
    },
  );
}
