import 'package:stadata_flutter_sdk/src/core/core.dart';
import 'package:stadata_flutter_sdk/src/features/features.dart';
import 'package:stadata_flutter_sdk/src/shared/shared.dart';

abstract class UnitDataRemoteDataSource {
  Future<ApiResponseModel<List<UnitDataModel>?>> get({
    required String domain,
    DataLanguage lang = DataLanguage.id,
    int page = 1,
    int? variableID,
  });
  Future<ApiResponseModel<UnitDataModel?>> detail({
    required int id,
    required String domain,
    DataLanguage lang = DataLanguage.id,
  });
}

class UnitDataRemoteDataSourceImpl implements UnitDataRemoteDataSource {
  final NetworkClient _listHttpModule = injector.get<NetworkClient>(
    instanceName: InjectorConstant.listClient,
  );
  final NetworkClient _detailClient = injector.get<NetworkClient>(
    instanceName: InjectorConstant.viewClient,
  );

  @override
  Future<ApiResponseModel<UnitDataModel?>> detail({
    required int id,
    required String domain,
    DataLanguage lang = DataLanguage.id,
  }) async {
    final result = await _detailClient.get<JSON>(
      ApiEndpoint.unit,
      queryParams: {
        QueryParamConstant.id: id,
        QueryParamConstant.domain: domain,
        QueryParamConstant.lang: lang.value,
      },
    );

    if (result.containsKey('status') && result['status'] == 'Error') {
      throw ApiException(result['message']?.toString() ?? '');
    }

    final response = ApiResponseModel<UnitDataModel?>.fromJson(result, (json) {
      if (json == null) {
        return null;
      }

      return UnitDataModel.fromJson(json as JSON);
    });

    if (response.dataAvailability == DataAvailability.notAvailable) {
      throw const UnitNotAvailableException();
    }

    return response;
  }

  @override
  Future<ApiResponseModel<List<UnitDataModel>?>> get({
    required String domain,
    DataLanguage lang = DataLanguage.id,
    int page = 1,
    int? variableID,
  }) async {
    final result = await _listHttpModule.get<JSON>(
      ApiEndpoint.unit,
      queryParams: {
        QueryParamConstant.page: page,
        QueryParamConstant.domain: domain,
        QueryParamConstant.lang: lang.value,
        QueryParamConstant.variable: ?variableID,
      },
    );

    if (result.containsKey('status') && result['status'] == 'Error') {
      throw ApiException(result['message']?.toString() ?? '');
    }

    final response = ApiResponseModel<List<UnitDataModel>?>.fromJson(result, (
      json,
    ) {
      if (json == null || json is! List) {
        return null;
      }

      return json.map((e) => UnitDataModel.fromJson(e as JSON)).toList();
    });

    if (response.dataAvailability == DataAvailability.listNotAvailable) {
      throw const UnitNotAvailableException();
    }

    return response;
  }
}
