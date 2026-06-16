import 'package:stadata_flutter_sdk/src/core/core.dart';
import 'package:stadata_flutter_sdk/src/features/features.dart';
import 'package:stadata_flutter_sdk/src/shared/shared.dart';

abstract class SubjectCategoryRemoteDataSource {
  Future<ApiResponseModel<List<SubjectCategoryModel>?>> get({
    required String domain,
    DataLanguage lang = DataLanguage.id,
    int page = 1,
  });
  Future<ApiResponseModel<SubjectCategoryModel?>> detail({
    required int id,
    required String domain,
    DataLanguage lang = DataLanguage.id,
  });
}

class SubjectCategoryRemoteDataSourceImpl
    implements SubjectCategoryRemoteDataSource {
  final NetworkClient _listHttpModule = injector.get<NetworkClient>(
    instanceName: InjectorConstant.listClient,
  );
  final NetworkClient _detailClient = injector.get<NetworkClient>(
    instanceName: InjectorConstant.viewClient,
  );

  @override
  Future<ApiResponseModel<SubjectCategoryModel?>> detail({
    required int id,
    required String domain,
    DataLanguage lang = DataLanguage.id,
  }) async {
    final result = await _detailClient.get<JSON>(
      ApiEndpoint.subjectCategory,
      queryParams: {
        QueryParamConstant.id: id,
        QueryParamConstant.domain: domain,
        QueryParamConstant.lang: lang.value,
      },
    );

    if (result.containsKey('status') && result['status'] == 'Error') {
      throw ApiException(result['message']?.toString() ?? '');
    }

    final response = ApiResponseModel<SubjectCategoryModel?>.fromJson(
      result,
      (json) {
        if (json == null) {
          return null;
        }

        return SubjectCategoryModel.fromJson(json as JSON);
      },
    );

    if (response.dataAvailability == DataAvailability.notAvailable) {
      throw const SubjectCategoryNotAvailableException();
    }

    return response;
  }

  @override
  Future<ApiResponseModel<List<SubjectCategoryModel>?>> get({
    required String domain,
    DataLanguage lang = DataLanguage.id,
    int page = 1,
  }) async {
    final result = await _listHttpModule.get<JSON>(
      ApiEndpoint.subjectCategory,
      queryParams: {
        QueryParamConstant.page: page,
        QueryParamConstant.domain: domain,
        QueryParamConstant.lang: lang.value,
      },
    );

    if (result.containsKey('status') && result['status'] == 'Error') {
      throw ApiException(result['message']?.toString() ?? '');
    }

    final response = ApiResponseModel<List<SubjectCategoryModel>?>.fromJson(
      result,
      (json) {
        if (json == null || json is! List) {
          return null;
        }

        return json
            .map((e) => SubjectCategoryModel.fromJson(e as JSON))
            .toList();
      },
    );

    if (response.dataAvailability == DataAvailability.listNotAvailable) {
      throw const SubjectCategoryNotAvailableException();
    }

    return response;
  }
}
