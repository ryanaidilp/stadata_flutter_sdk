// Repository implementations use generic catch for comprehensive error handling
// ignore_for_file: avoid_catches_without_on_clauses

import 'package:stadata_flutter_sdk/src/core/core.dart';
import 'package:stadata_flutter_sdk/src/features/tables/data/datasources/table_remote_data_source.dart';
import 'package:stadata_flutter_sdk/src/features/tables/domain/entities/table_metadata.dart';
import 'package:stadata_flutter_sdk/src/features/tables/domain/repositories/table_repository.dart';
import 'package:stadata_flutter_sdk/src/shared/shared.dart';

/// Implementation of [TableRepository] using remote data sources.
///
/// Provides table metadata retrieval with automatic type detection
/// by querying multiple BPS API endpoints. Implements the Result
/// pattern for comprehensive error handling.
class TableRepositoryImpl implements TableRepository {
  final TableRemoteDataSource _remoteDataSource =
      injector.get<TableRemoteDataSource>();
  final Log _log = injector.get<Log>();

  @override
  Future<Result<Failure, TableMetadata>> getTableMetadata({
    required String id,
    required String domain,
    DataLanguage lang = DataLanguage.id,
  }) async {
    try {
      final metadata = await _remoteDataSource.getTableMetadata(
        id: id,
        domain: domain,
        lang: lang,
      );

      return Result.success(metadata);
    } catch (e, s) {
      _log.console(
        'Failed to get table metadata for ID: $id',
        error: e,
        stackTrace: s,
        type: LogType.error,
      );

      return Result.failure(
        TableFailure(
          message: e.toString(),
        ),
      );
    }
  }
}
