// Repository implementations use generic catch for comprehensive error handling
// ignore_for_file: avoid_catches_without_on_clauses
import 'package:stadata_flutter_sdk/src/core/core.dart';
import 'package:stadata_flutter_sdk/src/features/features.dart';
import 'package:stadata_flutter_sdk/src/shared/shared.dart';

/// An implementation of the Publication Repository.
///
/// This repository defines methods for fetching publications
/// and publication details.
class PublicationRepositoryImpl implements PublicationRepository {
  final PublicationRemoteDataSource _dataSource =
      injector.get<PublicationRemoteDataSource>();
  final Log _log = injector.get<Log>();

  /// Fetches detailed information about a specific publication.
  ///
  /// Returns a [Future] that can yield Result a [Failure] or an [ApiResponse]
  /// containing a single [Publication].
  ///
  /// - [id]: The unique identifier of the publication.
  /// - [domain]: The domain for which the publication detail is requested.
  /// - [lang]: The data language to request (default is [DataLanguage.id]).
  @override
  Future<Result<Failure, ApiResponse<Publication>>> detail({
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

      return Result.success(
        ApiResponse<Publication>(
          data: publication,
          status: response.status,
          message: response.message,
          pagination: response.pagination,
          dataAvailability: response.dataAvailability,
        ),
      );
    } catch (e, s) {
      await _log.console(
        e.toString(),
        error: e,
        stackTrace: s,
        type: LogType.error,
      );
      return Result.failure(PublicationFailure(message: e.toString()));
    }
  }

  /// Fetches a list of publications based on the specified parameters.
  ///
  /// Returns a [Future] that can yield Result a [Failure] or an [ApiResponse]
  /// containing a list of [Publication].
  ///
  /// - [domain]: The domain for which publications are requested.
  /// - [lang]: The data language to request (default is [DataLanguage.id]).
  /// - [page]: The page number to retrieve (default is 1).
  /// - [keyword]: A keyword to filter publications by (optional).
  /// - [month]: The month to filter publications by (optional).
  /// - [year]: The year to filter publications by (optional).
  @override
  Future<Result<Failure, ApiResponse<List<Publication>>>> get({
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

      if (response.data == null) {
        throw const PublicationNotAvailableException();
      }

      final publications = response.data ?? [];

      return Result.success(
        ApiResponse<List<Publication>>(
          data: publications,
          status: response.status,
          message: response.message,
          pagination: response.pagination,
          dataAvailability: response.dataAvailability,
        ),
      );
    } catch (e, s) {
      await _log.console(
        e.toString(),
        error: e,
        stackTrace: s,
        type: LogType.error,
      );
      return Result.failure(PublicationFailure(message: e.toString()));
    }
  }
}
