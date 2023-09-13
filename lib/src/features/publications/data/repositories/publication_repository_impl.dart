import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:stadata_flutter_sdk/src/core/di/service_locator.dart';
import 'package:stadata_flutter_sdk/src/core/exceptions/exceptions.dart';
import 'package:stadata_flutter_sdk/src/core/failures/failures.dart';
import 'package:stadata_flutter_sdk/src/features/publications/data/datasources/publication_remote_data_source.dart';
import 'package:stadata_flutter_sdk/src/features/publications/data/models/publication_model.dart';
import 'package:stadata_flutter_sdk/src/features/publications/domain/entities/publication.dart';
import 'package:stadata_flutter_sdk/src/features/publications/domain/repositories/publication_repository.dart';
import 'package:stadata_flutter_sdk/src/shared/data/models/pagination_model.dart';
import 'package:stadata_flutter_sdk/src/shared/domain/entities/api_response.dart';
import 'package:stadata_flutter_sdk/src/shared/domain/enums/data_language.dart';

/// An implementation of the Publication Repository.
///
/// This repository defines methods for fetching publications
/// and publication details.
@LazySingleton(as: PublicationRepository)
class PublicationRepositoryImpl implements PublicationRepository {
  final _dataSource = getIt<PublicationRemoteDataSource>();

  /// Fetches a list of publications based on the specified parameters.
  ///
  /// Returns a [Future] that can yield either a [Failure] or an [ApiResponse]
  /// containing a list of [Publication].
  ///
  /// - [domain]: The domain for which publications are requested.
  /// - [lang]: The data language to request (default is [DataLanguage.id]).
  /// - [page]: The page number to retrieve (default is 1).
  /// - [keyword]: A keyword to filter publications by (optional).
  /// - [month]: The month to filter publications by (optional).
  /// - [year]: The year to filter publications by (optional).
  @override
  Future<Either<Failure, ApiResponse<Publication>>> detail({
    required String id,
    required String domain,
    DataLanguage lang = DataLanguage.id,
  }) async {
    try {
      final response = await _dataSource.detail(
        id: id,
        domain: domain,
        lang: lang,
      );

      final publication = response.data;

      if (publication == null) {
        throw const PublicationNotAvailableException();
      }

      return Right(
        ApiResponse<Publication>(
          status: response.status,
          dataAvailability: response.dataAvailability,
          message: response.message,
          data: publication.toEntity(),
          pagination: response.pagination?.toEntity(),
        ),
      );
    } on StadataException catch (e) {
      log(e.message, name: 'StadataException');
      return Left(PublicationFailure(message: e.message));
    } catch (e) {
      log(e.toString(), name: 'StadataException');
      return Left(PublicationFailure(message: e.toString()));
    }
  }

  /// Fetches detailed information about a specific publication.
  ///
  /// Returns a [Future] that can yield either a [Failure] or an [ApiResponse]
  /// containing a single [Publication].
  ///
  /// - [id]: The unique identifier of the publication.
  /// - [domain]: The domain for which the publication detail is requested.
  /// - [lang]: The data language to request (default is [DataLanguage.id]).
  @override
  Future<Either<Failure, ApiResponse<List<Publication>>>> get({
    required String domain,
    DataLanguage lang = DataLanguage.id,
    int page = 1,
    String? keyword,
    int? month,
    int? year,
  }) async {
    try {
      final response = await _dataSource.get(
        domain: domain,
        lang: lang,
        page: page,
        keyword: keyword,
        month: month,
        year: year,
      );

      final publications =
          response.data?.map((e) => e.toEntity()).toList() ?? [];

      return Right(
        ApiResponse<List<Publication>>(
          status: response.status,
          dataAvailability: response.dataAvailability,
          message: response.message,
          data: publications,
          pagination: response.pagination?.toEntity(),
        ),
      );
    } on StadataException catch (e) {
      log(e.message, name: 'StadataException');
      return Left(PublicationFailure(message: e.message));
    } catch (e) {
      log(e.toString(), name: 'StadataException');
      return Left(PublicationFailure(message: e.toString()));
    }
  }
}
