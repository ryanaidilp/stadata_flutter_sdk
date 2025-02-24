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
}

class UnitDataRemoteDataSourceImpl implements UnitDataRemoteDataSource {
  final _listHttpModule = injector.get<NetworkClient>(
    instanceName: InjectorConstant.listClient,
  );

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
        if (variableID != null) QueryParamConstant.variable: variableID,
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
