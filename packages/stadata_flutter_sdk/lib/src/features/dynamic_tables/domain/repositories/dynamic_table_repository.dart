import 'package:stadata_flutter_sdk/src/core/core.dart';
import 'package:stadata_flutter_sdk/src/features/dynamic_tables/domain/entities/entities.dart';
import 'package:stadata_flutter_sdk/src/shared/shared.dart';

/// Repository interface for dynamic table data operations.
///
/// Defines the contract for retrieving dynamic statistical tables
/// from the BPS Web API. Implementations must handle both listing
/// available dynamic tables and fetching detailed table data.
abstract class DynamicTableRepository {
  /// Retrieves a paginated list of available dynamic tables.
  ///
  /// Fetches metadata about available dynamic tables for a specific
  /// domain and language. This provides information about what variables
  /// and tables are available for detailed queries.
  ///
  /// Parameters:
  /// - [domain]: Regional identifier (required), e.g., "7200" for national
  /// - [page]: Page number for pagination (default: 1)
  /// - [lang]: Data language (default: Indonesian)
  ///
  /// Returns a [Result] containing either:
  /// - Success: [ApiResponse] with list of [DynamicTable] metadata
  /// - Failure: [Failure] describing the error
  ///
  /// Example:
  /// ```dart
  /// final result = await repository.getAll(
  ///   domain: '7200',
  ///   lang: DataLanguage.en,
  /// );
  /// ```
  Future<Result<Failure, ApiResponse<List<DynamicTable>>>> getAll({
    required String domain,
    int page = 1,
    DataLanguage lang = DataLanguage.id,
  });

  /// Retrieves detailed dynamic table data for a specific variable.
  ///
  /// Fetches the complete table data including time series values,
  /// vertical variable breakdowns, and all associated metadata for
  /// a specific statistical variable.
  ///
  /// Parameters:
  /// - [variableID]: Variable identifier (required)
  /// - [domain]: Regional identifier (required), e.g., "7200"
  /// - [period]: Time period filter (optional), e.g., "117", "117;118", "117:120"
  /// - [verticalVarID]: Vertical variable ID filter (optional)
  /// - [derivedVarID]: Derived variable ID filter (optional)
  /// - [derivedPeriodID]: Derived period ID filter (optional)
  /// - [lang]: Data language (default: Indonesian)
  ///
  /// Returns a [Result] containing either:
  /// - Success: Complete [DynamicTable] with data
  /// - Failure: [Failure] describing the error
  ///
  /// Example:
  /// ```dart
  /// final result = await repository.detail(
  ///   variableID: 123,
  ///   domain: '7200',
  ///   period: '117:120',
  ///   lang: DataLanguage.id,
  /// );
  /// ```
  Future<Result<Failure, DynamicTable>> detail({
    required int variableID,
    required String domain,
    String? period,
    int? verticalVarID,
    int? derivedVarID,
    int? derivedPeriodID,
    DataLanguage lang = DataLanguage.id,
  });
}
