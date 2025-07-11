import 'package:stadata_flutter_sdk/src/core/core.dart';
import 'package:stadata_flutter_sdk/src/features/features.dart';
import 'package:stadata_flutter_sdk/src/shared/shared.dart';

abstract class SubjectCategoryRemoteDataSource {
  Future<ApiResponseModel<List<SubjectCategoryModel>?>> get({
    required String domain,
    DataLanguage lang = DataLanguage.id,
    int page = 1,
  });
}

class SubjectCategoryRemoteDataSourceImpl
    implements SubjectCategoryRemoteDataSource {
  final NetworkClient _listHttpModule = injector.get<NetworkClient>(
    instanceName: InjectorConstant.listClient,
  );

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
