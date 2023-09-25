// ignore_for_file: public_member_api_docs

import 'package:injectable/injectable.dart';
import 'package:stadata_flutter_sdk/src/core/di/service_locator.dart';
import 'package:stadata_flutter_sdk/src/core/network/api_endpoint.dart';
import 'package:stadata_flutter_sdk/src/core/network/http/modules/stadata_list_http_module.dart';
import 'package:stadata_flutter_sdk/src/core/typedef/typedef.dart';
import 'package:stadata_flutter_sdk/src/features/subject_categories/data/models/subject_category_model.dart';
import 'package:stadata_flutter_sdk/src/shared/data/models/api_response_model.dart';
import 'package:stadata_flutter_sdk/stadata_flutter_sdk.dart';

abstract class SubjectCategoryRemoteDataSource {
  Future<ApiResponseModel<List<SubjectCategoryModel>?>> get({
    required String domain,
    DataLanguage lang = DataLanguage.id,
    int page = 1,
  });
}

@LazySingleton(as: SubjectCategoryRemoteDataSource)
class SubjectCategoryRemoteDataSourceImpl
    implements SubjectCategoryRemoteDataSource {
  final _listHttpModule = getIt<StadataListHttpModule>();

  @override
  Future<ApiResponseModel<List<SubjectCategoryModel>?>> get({
    required String domain,
    DataLanguage lang = DataLanguage.id,
    int page = 1,
  }) async {
    final result = await _listHttpModule.get(
      ApiEndpoint.subjectCategories(
        domain: domain,
        lang: lang,
        page: page,
      ),
    );

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
