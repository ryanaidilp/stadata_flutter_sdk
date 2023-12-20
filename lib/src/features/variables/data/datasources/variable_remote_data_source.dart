// ignore_for_file: public_member_api_docs

import 'package:injectable/injectable.dart';
import 'package:stadata_flutter_sdk/src/core/di/service_locator.dart';
import 'package:stadata_flutter_sdk/src/core/network/api_endpoint.dart';
import 'package:stadata_flutter_sdk/src/core/network/http/modules/stadata_list_http_module.dart';
import 'package:stadata_flutter_sdk/src/core/typedef/typedef.dart';
import 'package:stadata_flutter_sdk/src/features/variables/data/models/variable_model.dart';
import 'package:stadata_flutter_sdk/src/shared/data/models/api_response_model.dart';
import 'package:stadata_flutter_sdk/stadata_flutter_sdk.dart';

abstract class VariableRemoteDataSource {
  Future<ApiResponseModel<List<VariableModel>?>> get({
    required String domain,
    int page = 1,
    DataLanguage lang = DataLanguage.id,
    bool showExistingVariables = false,
    int? year,
    int? subjectID,
  });
}

@LazySingleton(as: VariableRemoteDataSource)
class VariableRemoteDataSourceImpl implements VariableRemoteDataSource {
   final _listHttpModule = getIt<StadataListHttpModule>();

  @override
  Future<ApiResponseModel<List<VariableModel>?>> get({
    required String domain,
    int page = 1,
    DataLanguage lang = DataLanguage.id,
    bool showExistingVariables = false,
    int? year,
    int? subjectID,
  }) async {
    final result = await _listHttpModule.get(
      ApiEndpoint.variables(
        lang: lang,
        page: page,
        domain: domain,
        showExistingVariables: showExistingVariables,
        year: year,
        subjectID: subjectID,
      ),
    );

    final response = ApiResponseModel<List<VariableModel>?>.fromJson(
      result,
      (json) {
        if (json == null || json is! List) {
          return null;
        }

        return json.map((e) => VariableModel.fromJson(e as JSON)).toList();
      },
    );

    if (response.dataAvailability == DataAvailability.listNotAvailable) {
      throw const VariableNotAvailableException();
    }

    return response;
  }
}
