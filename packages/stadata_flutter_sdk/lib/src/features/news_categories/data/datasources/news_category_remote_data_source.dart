// ignore_for_file: public_member_api_docs

import 'package:stadata_flutter_sdk/src/core/di/injector.dart';
import 'package:stadata_flutter_sdk/src/core/network/api_endpoint.dart';
import 'package:stadata_flutter_sdk/src/core/network/http/modules/stadata_list_http_module.dart';
import 'package:stadata_flutter_sdk/src/core/typedef/typedef.dart';
import 'package:stadata_flutter_sdk/src/features/news_categories/data/models/news_category_model.dart';
import 'package:stadata_flutter_sdk/src/shared/data/models/api_response_model.dart';
import 'package:stadata_flutter_sdk/stadata_flutter_sdk.dart';

abstract class NewsCategoryRemoteDataSource {
  Future<ApiResponseModel<List<NewsCategoryModel>?>> get({
    required String domain,
    DataLanguage lang = DataLanguage.id,
  });
}

class NewsCategoryRemoteDataSourceImpl implements NewsCategoryRemoteDataSource {
  final _listClient = injector.get<StadataListHttpModule>();

  @override
  Future<ApiResponseModel<List<NewsCategoryModel>?>> get({
    required String domain,
    DataLanguage lang = DataLanguage.id,
  }) async {
    final result = await _listClient.get(
      ApiEndpoint.newsCategory(
        lang: lang,
        domain: domain,
      ),
    );

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
