// Repository implementations use generic catch for comprehensive error handling
// ignore_for_file: avoid_catches_without_on_clauses
import 'package:stadata_flutter_sdk/src/core/core.dart';
import 'package:stadata_flutter_sdk/src/features/features.dart';
import 'package:stadata_flutter_sdk/src/shared/shared.dart';

/// Implementation of [DerivedPeriodRepository] that fetches derived period data.
class DerivedPeriodRepositoryImpl implements DerivedPeriodRepository {
  final DerivedPeriodRemoteDataSource _remoteDataSource =
      injector.get<DerivedPeriodRemoteDataSource>();
  final Log _log = injector.get<Log>();

  @override
  Future<Result<Failure, ApiResponse<List<DerivedPeriod>>>> get({
    required String domain,
    int page = 1,
    DataLanguage lang = DataLanguage.id,
    int? variableID,
  }) async {
    try {
      final result = await _remoteDataSource.get(
        domain: domain,
        lang: lang,
        page: page,
        variableID: variableID,
      );

      if (result.data == null ||
          result.dataAvailability == DataAvailability.listNotAvailable) {
        throw const DerivedPeriodNotAvailableException();
      }

      return Result.success(
        ApiResponse<List<DerivedPeriod>>(
          data: result.data,
          status: result.status,
          message: result.message,
          pagination: result.pagination,
          dataAvailability: result.dataAvailability,
        ),
      );
    } catch (e, s) {
      _log.console(
        e.toString(),
        error: e,
        stackTrace: s,
        type: LogType.error,
      );
      return Result.failure(DerivedPeriodFailure(message: e.toString()));
    }
  }
}
