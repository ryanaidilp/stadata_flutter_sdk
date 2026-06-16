// Repository implementations use generic catch for comprehensive error handling
// ignore_for_file: avoid_catches_without_on_clauses
import 'package:stadata_flutter_sdk/src/core/core.dart';
import 'package:stadata_flutter_sdk/src/features/features.dart';
import 'package:stadata_flutter_sdk/src/shared/shared.dart';

class UnitDataRepositoryImpl implements UnitDataRepository {
  final UnitDataRemoteDataSource _remoteDataSource = injector
      .get<UnitDataRemoteDataSource>();
  final Log _log = injector.get<Log>();

  @override
  Future<Result<Failure, ApiResponse<UnitData>>> detail({
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
        throw const UnitNotAvailableException();
      }

      return Result.success(
        ApiResponse<UnitData>(
          data: result.data,
          status: result.status,
          message: result.message,
          pagination: result.pagination,
          dataAvailability: result.dataAvailability,
        ),
      );
    } catch (e, s) {
      _log.console(e.toString(), error: e, stackTrace: s, type: LogType.error);
      return Result.failure(UnitFailure(message: e.toString()));
    }
  }

  @override
  Future<Result<Failure, ApiResponse<List<UnitData>>>> get({
    required String domain,
    DataLanguage lang = DataLanguage.id,
    int page = 1,
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
        throw const UnitNotAvailableException();
      }

      return Result.success(
        ApiResponse<List<UnitData>>(
          data: result.data,
          status: result.status,
          message: result.message,
          pagination: result.pagination,
          dataAvailability: result.dataAvailability,
        ),
      );
    } catch (e, s) {
      _log.console(e.toString(), error: e, stackTrace: s, type: LogType.error);
      return Result.failure(UnitFailure(message: e.toString()));
    }
  }
}
