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
}

class SubjectRemoteDataSourceImpl implements SubjectRemoteDataSource {
  final _listHttpModule = injector.get<StadataListHttpModule>();

  @override
  Future<ApiResponseModel<List<SubjectModel>?>> get({
    required String domain,
    int? subjectCategoryID,
    DataLanguage lang = DataLanguage.id,
    int page = 1,
  }) async {
    final result = await _listHttpModule.get(
      ApiEndpoint.subjects(
        lang: lang,
        page: page,
        domain: domain,
        subjectCategoryID: subjectCategoryID,
      ),
    );

    final response = ApiResponseModel<List<SubjectModel>?>.fromJson(
      result,
      (json) {
        if (json == null || json is! List) {
          return null;
        }

        return json.map((e) => SubjectModel.fromJson(e as JSON)).toList();
      },
    );

    if (response.dataAvailability == DataAvailability.listNotAvailable) {
      throw const SubjectNotAvailableException();
    }

    return response;
  }
}
