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
  late ApiResponseModel<List<PublicationModel>> successListResponse;
  late ApiResponse<List<Publication>> publications;
  late ApiResponseModel<PublicationModel> successResponse;
  late ApiResponse<Publication> publication;

  setUpAll(
    () {
      mockRemoteDataSource = MockPublicationRemoteDataSource();
      registerTestLazySingleton<PublicationRemoteDataSource>(
        mockRemoteDataSource,
      );
      repository = PublicationRepositoryImpl();

      final json = jsonFromFixture('publication_fixture_available.json');
      final jsonDetail = jsonFromFixture('publication_detail_fixture.json');

      successListResponse = ApiResponseModel<List<PublicationModel>>.fromJson(
        json,
        (json) {
          if (json is! List) {
            return [];
          }
          return json.map((e) => PublicationModel.fromJson(e as JSON)).toList();
        },
      );

      successResponse = ApiResponseModel<PublicationModel>.fromJson(
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

      publication = ApiResponse<Publication>(
        status: successResponse.status,
        dataAvailability: successResponse.dataAvailability,
        data: successResponse.data?.toEntity(),
        pagination: successResponse.pagination?.toEntity(),
        message: successResponse.message,
      );

      final data = successListResponse.data?.map((e) => e.toEntity()).toList();

      publications = ApiResponse(
        status: successListResponse.status,
        dataAvailability: successListResponse.dataAvailability,
        data: data,
        message: successListResponse.message,
        pagination: successListResponse.pagination?.toEntity(),
      );
    },
  );

  const domain = '7205';

  group(
    'PublicationRepositoryImpl',
    () {
      group(
        'get()',
        () {
          test(
            'should return List of Publications if success',
            () async {
              // arrange
              when(
                () => mockRemoteDataSource.get(
                  domain: domain,
                ),
              ).thenAnswer((_) async => successListResponse);

              // act
              final result = await repository.get(domain: domain);

              // assert
              expect(
                result,
                equals(
                  Right<Failure, ApiResponse<List<Publication>>>(
                    publications,
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
                isA<Left<Failure, ApiResponse<List<Publication>>>>(),
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
          test(
            'should return an instance of Publications if success',
            () async {
              // arrange
              when(
                () => mockRemoteDataSource.detail(
                  id: id,
                  domain: domain,
                ),
              ).thenAnswer((_) async => successResponse);

              // act
              final result = await repository.detail(
                id: id,
                domain: domain,
              );

              // assert
              expect(
                result,
                equals(
                  Right<Failure, ApiResponse<Publication>>(publication),
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
                isA<Left<Failure, ApiResponse<Publication>>>(),
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
