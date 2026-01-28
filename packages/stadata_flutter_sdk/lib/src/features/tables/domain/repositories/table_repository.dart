import 'package:stadata_flutter_sdk/src/core/core.dart';
import 'package:stadata_flutter_sdk/src/features/tables/domain/entities/table_metadata.dart';
import 'package:stadata_flutter_sdk/src/shared/shared.dart';

/// Repository interface for unified table metadata operations.
///
/// This repository provides a unified way to retrieve metadata about any
/// table type (static, dynamic, or simdasi) in the BPS Web API. It enables
/// the unified table navigation pattern where table type is determined at
/// runtime based on API responses.
///
/// The metadata inspection allows applications to route to appropriate
/// table display implementations without requiring separate entry points
/// for each table type.
abstract class TableRepository {
  /// Retrieves metadata for a specific table.
  ///
  /// Inspects the table's API endpoints to determine its type and gather
  /// basic metadata. This method queries both static and dynamic table
  /// endpoints to identify the table type at runtime.
  ///
  /// The method follows this strategy:
  /// 1. First attempts to fetch from static table API
  /// 2. If not found, attempts dynamic table API
  /// 3. Returns metadata with determined [TableType]
  ///
  /// Parameters:
  /// - [id]: Unique identifier for the table (required)
  /// - [domain]: Regional identifier (required), e.g., "0000" for national
  /// - [lang]: Data language preference (default: Indonesian)
  ///
  /// Returns a [Result] containing either:
  /// - Success: [TableMetadata] with determined type and basic info
  /// - Failure: [Failure] if table not found or error occurred
  ///
  /// Example:
  /// ```dart
  /// final result = await repository.getTableMetadata(
  ///   id: '123',
  ///   domain: '0000',
  ///   lang: DataLanguage.id,
  /// );
  ///
  /// result.when(
  ///   success: (metadata) {
  ///     if (metadata.isStatic) {
  ///       // Navigate to static table view
  ///     } else if (metadata.isDynamic) {
  ///       // Navigate to dynamic table view
  ///     }
  ///   },
  ///   failure: (error) => print('Error: $error'),
  /// );
  /// ```
  Future<Result<Failure, TableMetadata>> getTableMetadata({
    required String id,
    required String domain,
    DataLanguage lang = DataLanguage.id,
  });
}
