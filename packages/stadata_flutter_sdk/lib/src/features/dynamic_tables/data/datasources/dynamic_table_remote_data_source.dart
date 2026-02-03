import 'package:stadata_flutter_sdk/src/core/core.dart';
import 'package:stadata_flutter_sdk/src/features/dynamic_tables/data/models/models.dart';
import 'package:stadata_flutter_sdk/src/shared/shared.dart';

/// Abstract interface for dynamic table remote data source.
///
/// Defines methods for fetching dynamic table data from the BPS API.
abstract class DynamicTableRemoteDataSource {
  /// Retrieves a paginated list of all dynamic tables.
  ///
  /// Returns [ApiResponseModel] containing a list of [DynamicTableModel].
  /// Throws [DynamicTableNotAvailableException] if no data is available.
  Future<ApiResponseModel<List<DynamicTableModel>?>> getAll({
    required String domain,
    int page = 1,
    DataLanguage lang = DataLanguage.id,
  });

  /// Retrieves detailed dynamic table data including time series.
  ///
  /// Returns [ApiResponseModel] containing a single [DynamicTableModel]
  /// with populated data array.
  /// Throws [DynamicTableNotAvailableException] if table is not found.
  ///
  /// Optional filters:
  /// - [period] - Filter by period ID(s): "117", "117;118", "117:120"
  /// - [verticalVarID] - Filter by vertical variable ID
  /// - [derivedVarID] - Filter by derived variable ID
  /// - [derivedPeriodID] - Filter by derived period ID
  Future<ApiResponseModel<DynamicTableModel?>> detail({
    required int variableID,
    required String domain,
    String? period,
    int? verticalVarID,
    int? derivedVarID,
    int? derivedPeriodID,
    DataLanguage lang = DataLanguage.id,
  });
}

/// Implementation of [DynamicTableRemoteDataSource] using network client.
///
/// Note: There is no separate "list" endpoint for dynamic tables.
/// The list of available tables is handled by the variables feature.
/// This data source only handles the detail endpoint:
/// - Detail: `/list/model/data/domain/{domain}/var/{variableID}`
class DynamicTableRemoteDataSourceImpl implements DynamicTableRemoteDataSource {
  final NetworkClient _listClient = injector.get<NetworkClient>(
    instanceName: InjectorConstant.listClient,
  );

  @override
  Future<ApiResponseModel<DynamicTableModel?>> detail({
    required int variableID,
    required String domain,
    String? period,
    int? verticalVarID,
    int? derivedVarID,
    int? derivedPeriodID,
    DataLanguage lang = DataLanguage.id,
  }) async {
    // Build query parameters
    final queryParams = <String, dynamic>{
      QueryParamConstant.domain: domain,
      QueryParamConstant.lang: lang.value,
    };

    // Construct path with var parameter
    final path = '${ApiEndpoint.dynamicTable}/var/$variableID';

    // Add optional period parameter
    if (period != null && period.isNotEmpty) {
      queryParams[QueryParamConstant.period] = period;
    }

    // Add optional vertical variable filter
    if (verticalVarID != null) {
      queryParams['vervar'] = verticalVarID;
    }

    // Add optional derived variable filter
    if (derivedVarID != null) {
      queryParams['turvar'] = derivedVarID;
    }

    // Add optional derived period filter
    if (derivedPeriodID != null) {
      queryParams['turtahun'] = derivedPeriodID;
    }

    final result = await _listClient.get<JSON>(
      path,
      queryParams: queryParams,
    );

    if (result.containsKey('status') && result['status'] == 'Error') {
      throw ApiException(result['message']?.toString() ?? '');
    }

    // Detail response doesn't follow standard ApiResponse format
    // It returns data directly at top level with var[], vervar[], etc.
    final statusStr = result['status'] as String? ?? 'OK';
    final dataAvailabilityStr = result['data-availability'] as String? ?? '';

    if (dataAvailabilityStr == 'list-not-available' ||
        dataAvailabilityStr == 'not-available') {
      throw const DynamicTableNotAvailableException();
    }

    // Parse the model directly from the response
    final model = DynamicTableModel.fromDetailJson(result);

    // Wrap in ApiResponseModel for consistency
    return ApiResponseModel<DynamicTableModel?>(
      status: const ApiStatusConverter().fromJson(statusStr),
      dataAvailability: const DataAvailabilityConverter().fromJson(
        dataAvailabilityStr,
      ),
      data: model,
    );
  }

  @override
  Future<ApiResponseModel<List<DynamicTableModel>?>> getAll({
    required String domain,
    int page = 1,
    DataLanguage lang = DataLanguage.id,
  }) async {
    // Note: There is no dedicated list endpoint for dynamic tables.
    // The list of available tables is provided by the variables endpoint.
    // This method fetches variables and wraps them as DynamicTableModel
    // for convenience in the use case layer.

    final result = await _listClient.get<JSON>(
      ApiEndpoint.variable,
      queryParams: {
        QueryParamConstant.page: page,
        QueryParamConstant.domain: domain,
        QueryParamConstant.lang: lang.value,
      },
    );

    if (result.containsKey('status') && result['status'] == 'Error') {
      throw ApiException(result['message']?.toString() ?? '');
    }

    final response = ApiResponseModel<List<DynamicTableModel>?>.fromJson(
      result,
      (json) {
        if (json == null || json is! List) {
          return null;
        }

        // Variables use same structure as dynamic table list items
        return json.map((e) => DynamicTableModel.fromJson(e as JSON)).toList();
      },
    );

    if (response.dataAvailability == DataAvailability.listNotAvailable) {
      throw const DynamicTableNotAvailableException();
    }

    return response;
  }
}
