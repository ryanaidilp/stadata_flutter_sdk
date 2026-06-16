import 'package:stadata_flutter_sdk/src/core/core.dart';
import 'package:stadata_flutter_sdk/src/features/features.dart';
import 'package:stadata_flutter_sdk/src/shared/shared.dart';

abstract class SubjectRemoteDataSource {
  Future<ApiResponseModel<List<SubjectModel>?>> get({
    required String domain,
    int? subjectCategoryID,
    DataLanguage lang = DataLanguage.id,
    int page = 1,
  });
  Future<ApiResponseModel<SubjectModel?>> detail({
    required int id,
    required String domain,
    DataLanguage lang = DataLanguage.id,
  });
}

class SubjectRemoteDataSourceImpl implements SubjectRemoteDataSource {
  final NetworkClient _listHttpModule = injector.get<NetworkClient>(
    instanceName: InjectorConstant.listClient,
  );
  final NetworkClient _detailClient = injector.get<NetworkClient>(
    instanceName: InjectorConstant.viewClient,
  );

  @override
  Future<ApiResponseModel<SubjectModel?>> detail({
    required int id,
    required String domain,
    DataLanguage lang = DataLanguage.id,
  }) async {
    final result = await _detailClient.get<JSON>(
      ApiEndpoint.subject,
      queryParams: {
        QueryParamConstant.id: id,
        QueryParamConstant.domain: domain,
        QueryParamConstant.lang: lang.value,
      },
    );

    if (result.containsKey('status') && result['status'] == 'Error') {
      throw ApiException(result['message']?.toString() ?? '');
    }

    final response = ApiResponseModel<SubjectModel?>.fromJson(result, (json) {
      if (json == null) {
        return null;
      }

      return SubjectModel.fromJson(json as JSON);
    });

    if (response.dataAvailability == DataAvailability.notAvailable) {
      throw const SubjectNotAvailableException();
    }

    return response;
  }

  @override
  Future<ApiResponseModel<List<SubjectModel>?>> get({
    required String domain,
    int? subjectCategoryID,
    DataLanguage lang = DataLanguage.id,
    int page = 1,
  }) async {
    final result = await _listHttpModule.get<JSON>(
      ApiEndpoint.subject,
      queryParams: {
        QueryParamConstant.page: page,
        QueryParamConstant.domain: domain,
        QueryParamConstant.lang: lang.value,
        QueryParamConstant.subjectCategory: ?subjectCategoryID,
      },
    );

    if (result.containsKey('status') && result['status'] == 'Error') {
      throw ApiException(result['message']?.toString() ?? '');
    }

    final response = ApiResponseModel<List<SubjectModel>?>.fromJson(result, (
      json,
    ) {
      if (json == null || json is! List) {
        return null;
      }

      return json.map((e) => SubjectModel.fromJson(e as JSON)).toList();
    });

    if (response.dataAvailability == DataAvailability.listNotAvailable) {
      throw const SubjectNotAvailableException();
    }

    return response;
  }
}
