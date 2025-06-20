import 'package:stadata_flutter_sdk/src/core/core.dart';
import 'package:stadata_flutter_sdk/src/features/features.dart';
import 'package:stadata_flutter_sdk/src/shared/shared.dart';

class StaticTableRepositoryImpl implements StaticTableRepository {
  final StaticTableRemoteDataSource _remoteDataSource =
      injector.get<StaticTableRemoteDataSource>();
  final Log _log = injector.get<Log>();

  @override
  Future<Result<Failure, ApiResponse<StaticTable>>> detail({
    required int id,
    required String domain,
    DataLanguage lang = DataLanguage.id,
  }) async {
    try {
      final response = await _remoteDataSource.detail(
        id: id,
        lang: lang,
        domain: domain,
      );

      final staticTable = response.data;

      if (staticTable == null) {
        throw const StaticTableNotAvailableException();
      }

      return Result.success(
        ApiResponse<StaticTable>(
          data: staticTable,
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
      return Result.failure(StaticTableFailure(message: e.toString()));
    }
  }

  @override
  Future<Result<Failure, ApiResponse<List<StaticTable>>>> get({
    required String domain,
    int page = 1,
    DataLanguage lang = DataLanguage.id,
    int? month,
    int? year,
    String? keyword,
  }) async {
    try {
      final response = await _remoteDataSource.get(
        page: page,
        lang: lang,
        year: year,
        domain: domain,
        month: month,
        keyword: keyword,
      );

      if (response.data == null) {
        throw const StaticTableNotAvailableException();
      }

      final staticTables = response.data ?? [];

      return Result.success(
        ApiResponse<List<StaticTable>>(
          data: staticTables,
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
      return Result.failure(StaticTableFailure(message: e.toString()));
    }
  }
}
