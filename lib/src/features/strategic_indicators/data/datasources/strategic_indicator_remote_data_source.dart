// ignore_for_file: public_member_api_docs

import 'package:stadata_flutter_sdk/src/core/di/injector.dart';
import 'package:stadata_flutter_sdk/src/core/network/api_endpoint.dart';
import 'package:stadata_flutter_sdk/src/core/network/http/modules/stadata_list_http_module.dart';
import 'package:stadata_flutter_sdk/src/core/typedef/typedef.dart';
import 'package:stadata_flutter_sdk/src/features/strategic_indicators/data/models/strategic_indicator_model.dart';
import 'package:stadata_flutter_sdk/src/shared/data/models/api_response_model.dart';
import 'package:stadata_flutter_sdk/stadata_flutter_sdk.dart';

abstract interface class StrategicIndicatorRemoteDataSource {
  Future<ApiResponseModel<List<StrategicIndicatorModel>?>> get({
    required String domain,
    DataLanguage lang = DataLanguage.id,
    int page = 1,
    int? variableID,
  });
}

class StrategicIndicatorRemoteDataSourceImpl
    implements StrategicIndicatorRemoteDataSource {
  final _listClient = injector.get<StadataListHttpModule>();

  @override
  Future<ApiResponseModel<List<StrategicIndicatorModel>?>> get({
    required String domain,
    DataLanguage lang = DataLanguage.id,
    int page = 1,
    int? variableID,
  }) async {
    final result = await _listClient.get(
      ApiEndpoint.strategicIndicators(
        page: page,
        lang: lang,
        domain: domain,
        variableID: variableID,
      ),
    );

    final response = ApiResponseModel<List<StrategicIndicatorModel>?>.fromJson(
      result,
      (json) {
        if (json == null || json is! List) {
          return null;
        }

        return json
            .map((e) => StrategicIndicatorModel.fromJson(e as JSON))
            .toList();
      },
    );

    if (response.dataAvailability == DataAvailability.listNotAvailable) {
      throw const StrategicIndicatorNotAvailableException();
    }

    return response;
  }
}
