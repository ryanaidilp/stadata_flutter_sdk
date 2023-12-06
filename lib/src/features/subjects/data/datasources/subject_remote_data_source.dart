// ignore_for_file: public_member_api_docs

import 'package:injectable/injectable.dart';
import 'package:stadata_flutter_sdk/src/core/di/service_locator.dart';
import 'package:stadata_flutter_sdk/src/core/network/api_endpoint.dart';
import 'package:stadata_flutter_sdk/src/core/network/http/modules/stadata_list_http_module.dart';
import 'package:stadata_flutter_sdk/src/core/typedef/typedef.dart';
import 'package:stadata_flutter_sdk/src/features/subjects/data/models/subject_model.dart';
import 'package:stadata_flutter_sdk/src/shared/data/models/api_response_model.dart';
import 'package:stadata_flutter_sdk/stadata_flutter_sdk.dart';

abstract class SubjectRemoteDataSource {
  Future<ApiResponseModel<List<SubjectModel>?>> get({
    required String domain,
    int? subjectCategoryID,
    DataLanguage lang = DataLanguage.id,
    int page = 1,
  });
}

@LazySingleton(as: SubjectRemoteDataSource)
class SubjectModelRemoteDataSourceImpl implements SubjectRemoteDataSource {
  final _listHttpModule = getIt<StadataListHttpModule>();

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
