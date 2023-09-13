import 'package:dartz/dartz.dart';
import 'package:stadata_flutter_sdk/src/core/failures/failures.dart';
import 'package:stadata_flutter_sdk/src/features/publications/domain/entities/publication.dart';
import 'package:stadata_flutter_sdk/src/shared/domain/entities/api_response.dart';
import 'package:stadata_flutter_sdk/src/shared/domain/enums/data_language.dart';

/// An abstract class representing the Publication Repository.
///
/// This repository defines methods for fetching publications
/// and publication details.
abstract class PublicationRepository {
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
  Future<Either<Failure, ApiResponse<List<Publication>>>> get({
    required String domain,
    DataLanguage lang = DataLanguage.id,
    int page = 1,
    String? keyword,
    int? month,
    int? year,
  });

  /// Fetches detailed information about a specific publication.
  ///
  /// Returns a [Future] that can yield either a [Failure] or an [ApiResponse]
  /// containing a single [Publication].
  ///
  /// - [id]: The unique identifier of the publication.
  /// - [domain]: The domain for which the publication detail is requested.
  /// - [lang]: The data language to request (default is [DataLanguage.id]).
  Future<Either<Failure, ApiResponse<Publication>>> detail({
    required String id,
    required String domain,
    DataLanguage lang = DataLanguage.id,
  });
}
