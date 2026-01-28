// Data sources use generic catch for comprehensive error handling
// ignore_for_file: avoid_catches_without_on_clauses

import 'package:stadata_flutter_sdk/src/core/core.dart';
import 'package:stadata_flutter_sdk/src/features/tables/data/models/table_metadata_model.dart';
import 'package:stadata_flutter_sdk/src/shared/shared.dart';

/// Remote data source for table metadata operations.
///
/// Provides low-level API access for retrieving table metadata from
/// BPS Web API endpoints. This data source implements the table type
/// detection strategy by querying multiple endpoints.
abstract class TableRemoteDataSource {
  /// Fetches table metadata by attempting multiple API endpoints.
  ///
  /// Implements the table type detection strategy:
  /// 1. Queries static table list endpoint with table ID as filter
  /// 2. If found, returns metadata with [TableType.static]
  /// 3. If not found, queries dynamic table list endpoint
  /// 4. If found, returns metadata with [TableType.dynamic]
  /// 5. If still not found, throws exception
  ///
  /// Parameters:
  /// - [id]: Table identifier to search for
  /// - [domain]: Regional domain code
  /// - [lang]: Data language preference
  ///
  /// Returns [TableMetadataModel] with determined table type.
  ///
  /// Throws:
  /// - [TableNotFoundException] if table not found in any endpoint
  /// - [ApiException] for API errors
  Future<TableMetadataModel> getTableMetadata({
    required String id,
    required String domain,
    DataLanguage lang = DataLanguage.id,
  });
}

/// Implementation of [TableRemoteDataSource] using BPS Web API.
///
/// Uses both list and view network clients to query different API
/// endpoints for table type detection. Implements the unified table
/// discovery pattern by inspecting responses from multiple endpoints.
class TableRemoteDataSourceImpl implements TableRemoteDataSource {
  final NetworkClient _listClient = injector.get<NetworkClient>(
    instanceName: InjectorConstant.listClient,
  );

  @override
  Future<TableMetadataModel> getTableMetadata({
    required String id,
    required String domain,
    DataLanguage lang = DataLanguage.id,
  }) async {
    // Strategy 1: Try static table API
    try {
      final staticResult = await _tryStaticTableEndpoint(
        id: id,
        domain: domain,
        lang: lang,
      );
      if (staticResult != null) {
        return staticResult;
      }
    } catch (e) {
      // Continue to next strategy if not found
    }

    // Strategy 2: Try dynamic table API
    try {
      final dynamicResult = await _tryDynamicTableEndpoint(
        id: id,
        domain: domain,
        lang: lang,
      );
      if (dynamicResult != null) {
        return dynamicResult;
      }
    } catch (e) {
      // Continue to next strategy if not found
    }

    // Strategy 3: Table not found in any endpoint
    throw const TableNotFoundException();
  }

  /// Attempts to find table in static table endpoint.
  ///
  /// Queries the static table list API and searches for a table
  /// matching the provided ID. If found, constructs metadata with
  /// [TableType.static].
  Future<TableMetadataModel?> _tryStaticTableEndpoint({
    required String id,
    required String domain,
    DataLanguage lang = DataLanguage.id,
  }) async {
    final result = await _listClient.get<JSON>(
      ApiEndpoint.staticTable,
      queryParams: {
        QueryParamConstant.domain: domain,
        QueryParamConstant.lang: lang.value,
        QueryParamConstant.page: 1,
      },
    );

    if (result.containsKey('status') && result['status'] == 'Error') {
      return null;
    }

    final data = result['data'];
    if (data == null || data is! List || data.isEmpty) {
      return null;
    }

    // Search for table with matching ID in the list
    for (final item in data) {
      if (item is! Map<String, dynamic>) continue;

      final tableId =
          item['table_id']?.toString() ?? item['tabel_id']?.toString();
      if (tableId == id) {
        // Found the table, return metadata with static type
        return TableMetadataModel.fromJson({
          ...item,
          'table_source': '1', // Force static type
        });
      }
    }

    return null;
  }

  /// Attempts to find table in dynamic table endpoint.
  ///
  /// Queries the dynamic table list API and searches for a table
  /// matching the provided ID. If found, constructs metadata with
  /// [TableType.dynamic].
  Future<TableMetadataModel?> _tryDynamicTableEndpoint({
    required String id,
    required String domain,
    DataLanguage lang = DataLanguage.id,
  }) async {
    final result = await _listClient.get<JSON>(
      ApiEndpoint.dynamicTable,
      queryParams: {
        QueryParamConstant.domain: domain,
        QueryParamConstant.lang: lang.value,
        QueryParamConstant.page: 1,
      },
    );

    if (result.containsKey('status') && result['status'] == 'Error') {
      return null;
    }

    final data = result['data'];
    if (data == null || data is! List || data.isEmpty) {
      return null;
    }

    // Search for table with matching ID in the list
    for (final item in data) {
      if (item is! Map<String, dynamic>) continue;

      final tableId = item['table_id']?.toString() ?? item['var']?.toString();
      if (tableId == id) {
        // Found the table, return metadata with dynamic type
        return TableMetadataModel.fromJson({
          ...item,
          'table_source': '2', // Force dynamic type
        });
      }
    }

    return null;
  }
}
