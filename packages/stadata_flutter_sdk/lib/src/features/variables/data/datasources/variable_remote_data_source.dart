import 'package:stadata_flutter_sdk/src/core/core.dart';
import 'package:stadata_flutter_sdk/src/features/features.dart';
import 'package:stadata_flutter_sdk/src/shared/shared.dart';

abstract class VariableRemoteDataSource {
  Future<ApiResponseModel<List<VariableModel>?>> get({
    required String domain,
    int page = 1,
    DataLanguage lang = DataLanguage.id,
    bool showExistingVariables = false,
    int? year,
    int? subjectID,
  });
  Future<ApiResponseModel<VariableModel?>> detail({
    required int id,
    required String domain,
    DataLanguage lang = DataLanguage.id,
  });
}

class VariableRemoteDataSourceImpl implements VariableRemoteDataSource {
  final NetworkClient _listHttpModule = injector.get<NetworkClient>(
    instanceName: InjectorConstant.listClient,
  );
  final NetworkClient _detailClient = injector.get<NetworkClient>(
    instanceName: InjectorConstant.viewClient,
  );

  @override
  Future<ApiResponseModel<VariableModel?>> detail({
    required int id,
    required String domain,
    DataLanguage lang = DataLanguage.id,
  }) async {
    final result = await _detailClient.get<JSON>(
      ApiEndpoint.variable,
      queryParams: {
        QueryParamConstant.id: id,
        QueryParamConstant.domain: domain,
        QueryParamConstant.lang: lang.value,
      },
    );

    if (result.containsKey('status') && result['status'] == 'Error') {
      throw ApiException(result['message']?.toString() ?? '');
    }

    final response = ApiResponseModel<VariableModel?>.fromJson(result, (json) {
      if (json == null) {
        return null;
      }

      return VariableModel.fromJson(json as JSON);
    });

    if (response.dataAvailability == DataAvailability.notAvailable) {
      throw const VariableNotAvailableException();
    }

    return response;
  }

  @override
  Future<ApiResponseModel<List<VariableModel>?>> get({
    required String domain,
    int page = 1,
    DataLanguage lang = DataLanguage.id,
    bool showExistingVariables = false,
    int? year,
    int? subjectID,
  }) async {
    final result = await _listHttpModule.get<JSON>(
      ApiEndpoint.variable,
      queryParams: {
        QueryParamConstant.page: page,
        QueryParamConstant.domain: domain,
        QueryParamConstant.lang: lang.value,
        QueryParamConstant.area: showExistingVariables ? 1 : 0,
        QueryParamConstant.year: ?year,
        QueryParamConstant.subject: ?subjectID,
      },
    );

    if (result.containsKey('status') && result['status'] == 'Error') {
      throw ApiException(result['message']?.toString() ?? '');
    }

    final response = ApiResponseModel<List<VariableModel>?>.fromJson(result, (
      json,
    ) {
      if (json == null || json is! List) {
        return null;
      }

      return json.map((e) => VariableModel.fromJson(e as JSON)).toList();
    });

    if (response.dataAvailability == DataAvailability.listNotAvailable) {
      throw const VariableNotAvailableException();
    }

    return response;
  }
}
