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
  Future<ApiResponseModel<DynamicTableModel?>> detail({
    required int variableID,
    required String domain,
    String? period,
    DataLanguage lang = DataLanguage.id,
  });
}

/// Implementation of [DynamicTableRemoteDataSource] using network client.
///
/// Uses separate network clients for list and detail endpoints:
/// - List: `/list/model/data/{domain}`
/// - Detail: `/view/model/data/{domain}/{variableID}`
class DynamicTableRemoteDataSourceImpl implements DynamicTableRemoteDataSource {
  final NetworkClient _listClient = injector.get<NetworkClient>(
    instanceName: InjectorConstant.listClient,
  );
  final NetworkClient _detailClient = injector.get<NetworkClient>(
    instanceName: InjectorConstant.viewClient,
  );

  @override
  Future<ApiResponseModel<DynamicTableModel?>> detail({
    required int variableID,
    required String domain,
    String? period,
    DataLanguage lang = DataLanguage.id,
  }) async {
    final result = await _detailClient.get<JSON>(
      ApiEndpoint.dynamicTable,
      queryParams: {
        QueryParamConstant.id: variableID,
        QueryParamConstant.domain: domain,
        QueryParamConstant.lang: lang.value,
        if (period != null && period.isNotEmpty)
          QueryParamConstant.period: period,
      },
    );

    if (result.containsKey('status') && result['status'] == 'Error') {
      throw ApiException(result['message']?.toString() ?? '');
    }

    final response = ApiResponseModel<DynamicTableModel?>.fromJson(
      result,
      (json) {
        if (json == null) {
          return null;
        }

        return DynamicTableModel.fromDetailJson(json as JSON);
      },
    );

    if (response.dataAvailability == DataAvailability.notAvailable) {
      throw const DynamicTableNotAvailableException();
    }

    return response;
  }

  @override
  Future<ApiResponseModel<List<DynamicTableModel>?>> getAll({
    required String domain,
    int page = 1,
    DataLanguage lang = DataLanguage.id,
  }) async {
    final result = await _listClient.get<JSON>(
      ApiEndpoint.dynamicTable,
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

        return json.map((e) => DynamicTableModel.fromJson(e as JSON)).toList();
      },
    );

    if (response.dataAvailability == DataAvailability.listNotAvailable) {
      throw const DynamicTableNotAvailableException();
    }

    return response;
  }
}
