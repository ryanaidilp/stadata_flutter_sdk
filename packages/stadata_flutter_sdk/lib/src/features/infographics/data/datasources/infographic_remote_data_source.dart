// ignore_for_file: public_member_api_docs

import 'package:stadata_flutter_sdk/src/core/di/injector.dart';
import 'package:stadata_flutter_sdk/src/core/network/api_endpoint.dart';
import 'package:stadata_flutter_sdk/src/core/network/http/modules/stadata_list_http_module.dart';
import 'package:stadata_flutter_sdk/src/core/typedef/typedef.dart';
import 'package:stadata_flutter_sdk/src/features/infographics/data/models/infographic_model.dart';
import 'package:stadata_flutter_sdk/src/shared/data/models/api_response_model.dart';
import 'package:stadata_flutter_sdk/stadata_flutter_sdk.dart';

abstract class InfographicRemoteDataSource {
  Future<ApiResponseModel<List<InfographicModel>?>> get({
    required String domain,
    DataLanguage lang = DataLanguage.id,
    int page = 1,
    String? keyword,
  });
}

class InfographicRemoteDataSourceImpl implements InfographicRemoteDataSource {
  final _client = injector.get<StadataListHttpModule>();

  @override
  Future<ApiResponseModel<List<InfographicModel>?>> get({
    required String domain,
    DataLanguage lang = DataLanguage.id,
    int page = 1,
    String? keyword,
  }) async {
    final result = await _client.get(
      ApiEndpoint.infographic(
        domain: domain,
        lang: lang,
        page: page,
        keyword: keyword,
      ),
    );

    final response = ApiResponseModel<List<InfographicModel>?>.fromJson(
      result,
      (json) {
        if (json == null || json is! List) {
          return null;
        }

        return json.map((e) => InfographicModel.fromJson(e as JSON)).toList();
      },
    );

    if (response.dataAvailability == DataAvailability.listNotAvailable) {
      throw const InfographicNotAvailableException();
    }

    return response;
  }
}
