// Repository implementations use generic catch for comprehensive error handling
// ignore_for_file: avoid_catches_without_on_clauses
import 'package:stadata_flutter_sdk/src/core/core.dart';
import 'package:stadata_flutter_sdk/src/features/dynamic_tables/data/datasources/dynamic_table_remote_data_source.dart';
import 'package:stadata_flutter_sdk/src/features/dynamic_tables/domain/entities/entities.dart';
import 'package:stadata_flutter_sdk/src/features/dynamic_tables/domain/repositories/dynamic_table_repository.dart';
import 'package:stadata_flutter_sdk/src/shared/shared.dart';

/// Implementation of [DynamicTableRepository].
///
/// Handles data operations for dynamic tables by delegating to the
/// remote data source and transforming responses into domain entities.
class DynamicTableRepositoryImpl implements DynamicTableRepository {
  final DynamicTableRemoteDataSource _remoteDataSource =
      injector.get<DynamicTableRemoteDataSource>();
  final Log _log = injector.get<Log>();

  @override
  Future<Result<Failure, DynamicTable>> detail({
    required int variableID,
    required String domain,
    String? period,
    DataLanguage lang = DataLanguage.id,
  }) async {
    try {
      final response = await _remoteDataSource.detail(
        variableID: variableID,
        domain: domain,
        period: period,
        lang: lang,
      );

      final dynamicTable = response.data;

      if (dynamicTable == null) {
        throw const DynamicTableNotAvailableException();
      }

      return Result.success(dynamicTable);
    } catch (e, s) {
      _log.console(
        e.toString(),
        error: e,
        stackTrace: s,
        type: LogType.error,
      );
      return Result.failure(DynamicTableFailure(message: e.toString()));
    }
  }

  @override
  Future<Result<Failure, ApiResponse<List<DynamicTable>>>> getAll({
    required String domain,
    int page = 1,
    DataLanguage lang = DataLanguage.id,
  }) async {
    try {
      final response = await _remoteDataSource.getAll(
        domain: domain,
        page: page,
        lang: lang,
      );

      if (response.data == null) {
        throw const DynamicTableNotAvailableException();
      }

      final dynamicTables = response.data ?? [];

      return Result.success(
        ApiResponse<List<DynamicTable>>(
          data: dynamicTables,
          status: response.status,
          message: response.message,
          pagination: response.pagination,
          dataAvailability: response.dataAvailability,
        ),
      );
    } catch (e, s) {
      _log.console(
        e.toString(),
        error: e,
        stackTrace: s,
        type: LogType.error,
      );
      return Result.failure(DynamicTableFailure(message: e.toString()));
    }
  }
}
