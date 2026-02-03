import 'package:stadata_flutter_sdk/src/core/core.dart';
import 'package:stadata_flutter_sdk/src/features/features.dart';
import 'package:stadata_flutter_sdk/src/shared/shared.dart';

/// Abstract interface for DerivedVariable remote data source.
abstract class DerivedVariableRemoteDataSource {
  /// Fetches derived variables from the remote API.
  Future<ApiResponseModel<List<DerivedVariableModel>?>> get({
    required String domain,
    int page = 1,
    DataLanguage lang = DataLanguage.id,
    int? variableID,
    int? verticalGroup,
  });
}

/// Implementation of [DerivedVariableRemoteDataSource] that fetches data from BPS API.
class DerivedVariableRemoteDataSourceImpl
    implements DerivedVariableRemoteDataSource {
  final NetworkClient _listHttpModule = injector.get<NetworkClient>(
    instanceName: InjectorConstant.listClient,
  );

  @override
  Future<ApiResponseModel<List<DerivedVariableModel>?>> get({
    required String domain,
    int page = 1,
    DataLanguage lang = DataLanguage.id,
    int? variableID,
    int? verticalGroup,
  }) async {
    final result = await _listHttpModule.get<JSON>(
      ApiEndpoint.derivedVariable,
      queryParams: {
        QueryParamConstant.page: page,
        QueryParamConstant.domain: domain,
        QueryParamConstant.lang: lang.value,
        if (variableID != null) QueryParamConstant.variable: variableID,
        if (verticalGroup != null) QueryParamConstant.group: verticalGroup,
      },
    );

    if (result.containsKey('status') && result['status'] == 'Error') {
      throw ApiException(result['message']?.toString() ?? '');
    }

    final response = ApiResponseModel<List<DerivedVariableModel>?>.fromJson(
      result,
      (
        json,
      ) {
        if (json == null || json is! List) {
          return null;
        }

        return json
            .map((e) => DerivedVariableModel.fromJson(e as JSON))
            .toList();
      },
    );

    if (response.dataAvailability == DataAvailability.listNotAvailable) {
      throw const DerivedVariableNotAvailableException();
    }

    return response;
  }
}
