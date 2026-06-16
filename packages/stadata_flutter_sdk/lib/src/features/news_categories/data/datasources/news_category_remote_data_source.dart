import 'package:stadata_flutter_sdk/src/core/core.dart';
import 'package:stadata_flutter_sdk/src/features/features.dart';
import 'package:stadata_flutter_sdk/src/shared/shared.dart';

abstract class NewsCategoryRemoteDataSource {
  Future<ApiResponseModel<List<NewsCategoryModel>?>> get({
    required String domain,
    DataLanguage lang = DataLanguage.id,
  });
  Future<ApiResponseModel<NewsCategoryModel?>> detail({
    required String id,
    required String domain,
    DataLanguage lang = DataLanguage.id,
  });
}

class NewsCategoryRemoteDataSourceImpl implements NewsCategoryRemoteDataSource {
  final NetworkClient _listClient = injector.get<NetworkClient>(
    instanceName: InjectorConstant.listClient,
  );
  final NetworkClient _detailClient = injector.get<NetworkClient>(
    instanceName: InjectorConstant.viewClient,
  );

  @override
  Future<ApiResponseModel<NewsCategoryModel?>> detail({
    required String id,
    required String domain,
    DataLanguage lang = DataLanguage.id,
  }) async {
    final result = await _detailClient.get<JSON>(
      ApiEndpoint.newsCategory,
      queryParams: {
        QueryParamConstant.id: id,
        QueryParamConstant.domain: domain,
        QueryParamConstant.lang: lang.value,
      },
    );

    if (result.containsKey('status') && result['status'] == 'Error') {
      throw ApiException(result['message']?.toString() ?? '');
    }

    final response = ApiResponseModel<NewsCategoryModel?>.fromJson(result, (
      json,
    ) {
      if (json == null) {
        return null;
      }

      return NewsCategoryModel.fromJson(json as JSON);
    });

    if (response.dataAvailability == DataAvailability.notAvailable) {
      throw const NewsCategoryNotAvailableException();
    }

    return response;
  }

  @override
  Future<ApiResponseModel<List<NewsCategoryModel>?>> get({
    required String domain,
    DataLanguage lang = DataLanguage.id,
  }) async {
    final result = await _listClient.get<JSON>(
      ApiEndpoint.newsCategory,
      queryParams: {
        QueryParamConstant.lang: lang.value,
        QueryParamConstant.domain: domain,
      },
    );

    if (result.containsKey('status') && result['status'] == 'Error') {
      throw ApiException(result['message']?.toString() ?? '');
    }

    final response = ApiResponseModel<List<NewsCategoryModel>?>.fromJson(
      result,
      (json) {
        if (json == null || json is! List) {
          return null;
        }

        return json.map((e) => NewsCategoryModel.fromJson(e as JSON)).toList();
      },
    );

    if (response.dataAvailability == DataAvailability.listNotAvailable) {
      throw const NewsCategoryNotAvailableException();
    }

    return response;
  }
}
