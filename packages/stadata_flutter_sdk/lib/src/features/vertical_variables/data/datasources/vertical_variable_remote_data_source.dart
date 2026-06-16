import 'package:stadata_flutter_sdk/src/core/core.dart';
import 'package:stadata_flutter_sdk/src/features/features.dart';
import 'package:stadata_flutter_sdk/src/shared/shared.dart';

abstract class VerticalVariableRemoteDataSource {
  Future<ApiResponseModel<List<VerticalVariableModel>?>> get({
    required String domain,
    int page = 1,
    DataLanguage lang = DataLanguage.id,
    int? variableID,
  });
  Future<ApiResponseModel<VerticalVariableModel?>> detail({
    required int id,
    required String domain,
    DataLanguage lang = DataLanguage.id,
  });
}

class VerticalVariableRemoteDataSourceImpl
    implements VerticalVariableRemoteDataSource {
  final NetworkClient _listHttpModule = injector.get<NetworkClient>(
    instanceName: InjectorConstant.listClient,
  );
  final NetworkClient _detailClient = injector.get<NetworkClient>(
    instanceName: InjectorConstant.viewClient,
  );

  @override
  Future<ApiResponseModel<VerticalVariableModel?>> detail({
    required int id,
    required String domain,
    DataLanguage lang = DataLanguage.id,
  }) async {
    final result = await _detailClient.get<JSON>(
      ApiEndpoint.verticalVariable,
      queryParams: {
        QueryParamConstant.id: id,
        QueryParamConstant.domain: domain,
        QueryParamConstant.lang: lang.value,
      },
    );

    if (result.containsKey('status') && result['status'] == 'Error') {
      throw ApiException(result['message']?.toString() ?? '');
    }

    final response = ApiResponseModel<VerticalVariableModel?>.fromJson(
      result,
      (json) {
        if (json == null) {
          return null;
        }

        return VerticalVariableModel.fromJson(json as JSON);
      },
    );

    if (response.dataAvailability == DataAvailability.notAvailable) {
      throw const VerticalVariableNotAvailableException();
    }

    return response;
  }

  @override
  Future<ApiResponseModel<List<VerticalVariableModel>?>> get({
    required String domain,
    int page = 1,
    DataLanguage lang = DataLanguage.id,
    int? variableID,
  }) async {
    final result = await _listHttpModule.get<JSON>(
      ApiEndpoint.verticalVariable,
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

    final response = ApiResponseModel<List<VerticalVariableModel>?>.fromJson(
      result,
      (json) {
        if (json == null || json is! List) {
          return null;
        }

        return json
            .map((e) => VerticalVariableModel.fromJson(e as JSON))
            .toList();
      },
    );

    if (response.dataAvailability == DataAvailability.listNotAvailable) {
      throw const VerticalVariableNotAvailableException();
    }

    return response;
  }
}
