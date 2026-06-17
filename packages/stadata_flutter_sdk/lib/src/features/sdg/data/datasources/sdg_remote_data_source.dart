import 'package:stadata_flutter_sdk/src/core/core.dart';
import 'package:stadata_flutter_sdk/src/features/features.dart';
import 'package:stadata_flutter_sdk/src/shared/shared.dart';

abstract class SdgRemoteDataSource {
  Future<ApiResponseModel<List<SdgIndicatorModel>?>> get({
    required String domain,
    required int goal,
    DataLanguage lang = DataLanguage.id,
    int page = 1,
  });
}

class SdgRemoteDataSourceImpl implements SdgRemoteDataSource {
  final NetworkClient _listClient = injector.get<NetworkClient>(
    instanceName: InjectorConstant.listClient,
  );

  @override
  Future<ApiResponseModel<List<SdgIndicatorModel>?>> get({
    required String domain,
    required int goal,
    DataLanguage lang = DataLanguage.id,
    int page = 1,
  }) async {
    final queryParams = <String, dynamic>{
      QueryParamConstant.domain: domain,
      QueryParamConstant.lang: lang.value,
      QueryParamConstant.page: page,
      QueryParamConstant.goal: goal,
    };

    final result = await _listClient.get<JSON>(
      ApiEndpoint.sdg,
      queryParams: queryParams,
    );

    if (result.containsKey('status') && result['status'] == 'Error') {
      throw ApiException(result['message']?.toString() ?? '');
    }

    final response = ApiResponseModel<List<SdgIndicatorModel>?>.fromJson(
      result,
      (json) {
        if (json == null || json is! List) {
          return null;
        }

        return json.map((e) => SdgIndicatorModel.fromJson(e as JSON)).toList();
      },
    );

    if (response.dataAvailability == DataAvailability.listNotAvailable) {
      throw const SdgNotAvailableException();
    }

    return response;
  }
}
