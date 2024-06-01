// ignore_for_file: public_member_api_docs

import 'package:stadata_flutter_sdk/src/core/core.dart';
import 'package:stadata_flutter_sdk/src/features/features.dart';
import 'package:stadata_flutter_sdk/src/shared/shared.dart';

abstract class VerticalVariableRemoteDataSource {
  Future<ApiResponseModel<List<VerticalVariableModel>?>> get({
    required String domain,
    int page = 1,
    DataLanguage lang = DataLanguage.id,
    int? variableID,
  });
}

class VerticalVariableRemoteDataSourceImpl
    implements VerticalVariableRemoteDataSource {
  final _listHttpModule = injector.get<StadataListHttpModule>();

  @override
  Future<ApiResponseModel<List<VerticalVariableModel>?>> get({
    required String domain,
    int page = 1,
    DataLanguage lang = DataLanguage.id,
    int? variableID,
  }) async {
    final result = await _listHttpModule.get(
      ApiEndpoint.verticalVariables(
        lang: lang,
        page: page,
        domain: domain,
        variableID: variableID,
      ),
    );

    final response = ApiResponseModel<List<VerticalVariableModel>?>.fromJson(
      result,
      (json) {
        if (json == null || json is! List) {
          return null;
        }

        return json
            .map((e) => VerticalVariableModel.fromJson(e as JSON))
            .toList();
      },
    );

    if (response.dataAvailability == DataAvailability.listNotAvailable) {
      throw const VerticalVariableNotAvailableException();
    }

    return response;
  }
}
