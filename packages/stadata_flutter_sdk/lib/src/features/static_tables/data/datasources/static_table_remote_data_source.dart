import 'package:stadata_flutter_sdk/src/core/core.dart';
import 'package:stadata_flutter_sdk/src/features/features.dart';
import 'package:stadata_flutter_sdk/src/shared/shared.dart';

abstract class StaticTableRemoteDataSource {
  Future<ApiResponseModel<List<StaticTableModel>?>> get({
    required String domain,
    int page = 1,
    DataLanguage lang = DataLanguage.id,
    int? month,
    int? year,
    String? keyword,
  });
  Future<ApiResponseModel<StaticTableModel?>> detail({
    required int id,
    required String domain,
    DataLanguage lang = DataLanguage.id,
  });
}

class StaticTableRemoteDataSourceImpl implements StaticTableRemoteDataSource {
  final NetworkClient _listClient = injector.get<NetworkClient>(
    instanceName: InjectorConstant.listClient,
  );
  final NetworkClient _detailClient = injector.get<NetworkClient>(
    instanceName: InjectorConstant.viewClient,
  );

  @override
  Future<ApiResponseModel<StaticTableModel?>> detail({
    required int id,
    required String domain,
    DataLanguage lang = DataLanguage.id,
  }) async {
    final result = await _detailClient.get<JSON>(
      ApiEndpoint.staticTable,
      queryParams: {
        QueryParamConstant.id: id,
        QueryParamConstant.domain: domain,
        QueryParamConstant.lang: lang.value,
      },
    );

    if (result.containsKey('status') && result['status'] == 'Error') {
      throw ApiException(result['message']?.toString() ?? '');
    }

    final response = ApiResponseModel<StaticTableModel?>.fromJson(result, (
      json,
    ) {
      if (json == null) {
        return null;
      }

      return StaticTableModel.fromJson(json as JSON);
    });

    if (response.dataAvailability == DataAvailability.notAvailable) {
      throw const StaticTableNotAvailableException();
    }

    return response;
  }

  @override
  Future<ApiResponseModel<List<StaticTableModel>?>> get({
    required String domain,
    int page = 1,
    DataLanguage lang = DataLanguage.id,
    int? month,
    int? year,
    String? keyword,
  }) async {
    final result = await _listClient.get<JSON>(
      ApiEndpoint.staticTable,
      queryParams: {
        QueryParamConstant.page: page,
        QueryParamConstant.domain: domain,
        QueryParamConstant.lang: lang.value,
        if (year != null) QueryParamConstant.year: year,
        if (month != null) QueryParamConstant.month: month,
        if (keyword != null && keyword.isNotEmpty)
          QueryParamConstant.keyword: keyword,
      },
    );

    if (result.containsKey('status') && result['status'] == 'Error') {
      throw ApiException(result['message']?.toString() ?? '');
    }

    final response = ApiResponseModel<List<StaticTableModel>?>.fromJson(
      result,
      (json) {
        if (json == null || json is! List) {
          return null;
        }

        return json.map((e) => StaticTableModel.fromJson(e as JSON)).toList();
      },
    );

    if (response.dataAvailability == DataAvailability.listNotAvailable) {
      throw const StaticTableNotAvailableException();
    }

    return response;
  }
}
