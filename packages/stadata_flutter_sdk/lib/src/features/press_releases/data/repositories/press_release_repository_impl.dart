// Repository implementations use generic catch for comprehensive error handling
// ignore_for_file: avoid_catches_without_on_clauses
import 'package:stadata_flutter_sdk/src/core/core.dart';
import 'package:stadata_flutter_sdk/src/features/features.dart';
import 'package:stadata_flutter_sdk/src/shared/shared.dart';

class PressReleaseRepositoryImpl implements PressReleaseRepository {
  final PressReleaseRemoteDataSource _remoteDataSource =
      injector.get<PressReleaseRemoteDataSource>();
  final Log _log = injector.get<Log>();

  @override
  Future<Result<Failure, ApiResponse<PressRelease>>> detail({
    required int id,
    required String domain,
    DataLanguage lang = DataLanguage.id,
  }) async {
    try {
      final result = await _remoteDataSource.detail(
        id: id,
        lang: lang,
        domain: domain,
      );

      if (result.data == null) {
        throw const PressReleaseNotAvailableException();
      }

      return Result.success(
        ApiResponse<PressRelease>(
          data: result.data,
          status: result.status,
          message: result.message,
          pagination: result.pagination,
          dataAvailability: result.dataAvailability,
        ),
      );
    } catch (e, s) {
      await _log.console(
        e.toString(),
        error: e,
        stackTrace: s,
        type: LogType.error,
      );
      return Result.failure(PressReleaseFailure(message: e.toString()));
    }
  }

  @override
  Future<Result<Failure, ApiResponse<List<PressRelease>>>> get({
    required String domain,
    DataLanguage lang = DataLanguage.id,
    int page = 1,
    int? month,
    int? year,
    String? keyword,
  }) async {
    try {
      final result = await _remoteDataSource.get(
        page: page,
        lang: lang,
        year: year,
        month: month,
        domain: domain,
        keyword: keyword,
      );

      if (result.data == null) {
        throw const NewsNotAvailableException();
      }

      final data = result.data;

      return Result.success(
        ApiResponse<List<PressRelease>>(
          data: data,
          status: result.status,
          message: result.message,
          pagination: result.pagination,
          dataAvailability: result.dataAvailability,
        ),
      );
    } catch (e, s) {
      await _log.console(
        e.toString(),
        error: e,
        stackTrace: s,
        type: LogType.error,
      );
      return Result.failure(PressReleaseFailure(message: e.toString()));
    }
  }
}
