import 'package:stadata_flutter_sdk/src/core/core.dart';
import 'package:stadata_flutter_sdk/src/features/features.dart';
import 'package:stadata_flutter_sdk/src/shared/shared.dart';

abstract class GlossaryRemoteDataSource {
  Future<ApiResponseModel<List<GlossaryModel>?>> get({
    required String domain,
    DataLanguage lang = DataLanguage.id,
    int page = 1,
    String? keyword,
    String? prefix,
  });
}

class GlossaryRemoteDataSourceImpl implements GlossaryRemoteDataSource {
  final NetworkClient _listClient = injector.get<NetworkClient>(
    instanceName: InjectorConstant.listClient,
  );

  @override
  Future<ApiResponseModel<List<GlossaryModel>?>> get({
    required String domain,
    DataLanguage lang = DataLanguage.id,
    int page = 1,
    String? keyword,
    String? prefix,
  }) async {
    final queryParams = <String, dynamic>{
      QueryParamConstant.domain: domain,
      QueryParamConstant.lang: lang.value,
      QueryParamConstant.page: page,
      QueryParamConstant.keyword: ?keyword,
      QueryParamConstant.prefix: ?prefix,
    };

    final result = await _listClient.get<JSON>(
      ApiEndpoint.glossary,
      queryParams: queryParams,
    );

    if (result.containsKey('status') && result['status'] == 'Error') {
      throw ApiException(result['message']?.toString() ?? '');
    }

    final response = ApiResponseModel<List<GlossaryModel>?>.fromJson(
      result,
      (json) {
        if (json == null || json is! List) {
          return null;
        }

        return json.map((e) => GlossaryModel.fromJson(e as JSON)).toList();
      },
    );

    if (response.dataAvailability == DataAvailability.listNotAvailable) {
      throw const GlossaryNotAvailableException();
    }

    return response;
  }
}
