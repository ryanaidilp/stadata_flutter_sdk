// ignore_for_file: public_member_api_docs

import 'package:stadata_flutter_sdk/src/core/core.dart';
import 'package:stadata_flutter_sdk/src/features/features.dart';
import 'package:stadata_flutter_sdk/src/shared/shared.dart';

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
