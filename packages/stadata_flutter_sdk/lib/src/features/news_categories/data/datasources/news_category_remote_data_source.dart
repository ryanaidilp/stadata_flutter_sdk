import 'package:stadata_flutter_sdk/src/core/core.dart';
import 'package:stadata_flutter_sdk/src/features/features.dart';
import 'package:stadata_flutter_sdk/src/shared/shared.dart';

abstract class NewsCategoryRemoteDataSource {
  Future<ApiResponseModel<List<NewsCategoryModel>?>> get({
    required String domain,
    DataLanguage lang = DataLanguage.id,
  });
}

class NewsCategoryRemoteDataSourceImpl implements NewsCategoryRemoteDataSource {
  final _listClient = injector.get<NetworkClient>(instanceName: 'listClient');

  @override
  Future<ApiResponseModel<List<NewsCategoryModel>?>> get({
    required String domain,
    DataLanguage lang = DataLanguage.id,
  }) async {
    final result = await _listClient.get<JSON>(
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
