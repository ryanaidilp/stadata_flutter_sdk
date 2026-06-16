import 'package:stadata_flutter_sdk/src/core/core.dart';
import 'package:stadata_flutter_sdk/src/features/features.dart';
import 'package:stadata_flutter_sdk/src/shared/shared.dart';

abstract interface class StrategicIndicatorRemoteDataSource {
  Future<ApiResponseModel<List<StrategicIndicatorModel>?>> get({
    required String domain,
    DataLanguage lang = DataLanguage.id,
    int page = 1,
    int? variableID,
  });
  Future<ApiResponseModel<StrategicIndicatorModel?>> detail({
    required int id,
    required String domain,
    DataLanguage lang = DataLanguage.id,
  });
}

class StrategicIndicatorRemoteDataSourceImpl
    implements StrategicIndicatorRemoteDataSource {
  final NetworkClient _listClient = injector.get<NetworkClient>(
    instanceName: InjectorConstant.listClient,
  );
  final NetworkClient _detailClient = injector.get<NetworkClient>(
    instanceName: InjectorConstant.viewClient,
  );

  @override
  Future<ApiResponseModel<StrategicIndicatorModel?>> detail({
    required int id,
    required String domain,
    DataLanguage lang = DataLanguage.id,
  }) async {
    final result = await _detailClient.get<JSON>(
      ApiEndpoint.strategicIndicator,
      queryParams: {
        QueryParamConstant.id: id,
        QueryParamConstant.domain: domain,
        QueryParamConstant.lang: lang.value,
      },
    );

    if (result.containsKey('status') && result['status'] == 'Error') {
      throw ApiException(result['message']?.toString() ?? '');
    }

    final response = ApiResponseModel<StrategicIndicatorModel?>.fromJson(
      result,
      (json) {
        if (json == null) {
          return null;
        }

        return StrategicIndicatorModel.fromJson(json as JSON);
      },
    );

    if (response.dataAvailability == DataAvailability.notAvailable) {
      throw const StrategicIndicatorNotAvailableException();
    }

    return response;
  }

  @override
  Future<ApiResponseModel<List<StrategicIndicatorModel>?>> get({
    required String domain,
    DataLanguage lang = DataLanguage.id,
    int page = 1,
    int? variableID,
  }) async {
    final result = await _listClient.get<JSON>(
      ApiEndpoint.strategicIndicator,
      queryParams: {
        QueryParamConstant.page: page,
        QueryParamConstant.lang: lang.value,
        QueryParamConstant.domain: domain,
        QueryParamConstant.variable: ?variableID,
      },
    );

    if (result.containsKey('status') && result['status'] == 'Error') {
      throw ApiException(result['message']?.toString() ?? '');
    }

    final response = ApiResponseModel<List<StrategicIndicatorModel>?>.fromJson(
      result,
      (json) {
        if (json == null || json is! List) {
          return null;
        }

        return json
            .map((e) => StrategicIndicatorModel.fromJson(e as JSON))
            .toList();
      },
    );

    if (response.dataAvailability == DataAvailability.listNotAvailable) {
      throw const StrategicIndicatorNotAvailableException();
    }

    return response;
  }
}
