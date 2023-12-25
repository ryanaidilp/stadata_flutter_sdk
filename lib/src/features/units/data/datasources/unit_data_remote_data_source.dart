// ignore_for_file: public_member_api_docs

import 'package:injectable/injectable.dart';
import 'package:stadata_flutter_sdk/src/core/di/service_locator.dart';
import 'package:stadata_flutter_sdk/src/core/network/api_endpoint.dart';
import 'package:stadata_flutter_sdk/src/core/network/http/modules/stadata_list_http_module.dart';
import 'package:stadata_flutter_sdk/src/core/typedef/typedef.dart';
import 'package:stadata_flutter_sdk/src/features/units/data/models/unit_data_model.dart';
import 'package:stadata_flutter_sdk/src/shared/data/models/api_response_model.dart';
import 'package:stadata_flutter_sdk/stadata_flutter_sdk.dart';

abstract class UnitDataRemoteDataSource {
  Future<ApiResponseModel<List<UnitDataModel>?>> get({
    required String domain,
    DataLanguage lang = DataLanguage.id,
    int page = 1,
    int? variableID,
  });
}

@LazySingleton(as: UnitDataRemoteDataSource)
class UnitDataRemoteDataSourceImpl implements UnitDataRemoteDataSource {
  final _listHttpModule = getIt<StadataListHttpModule>();

  @override
  Future<ApiResponseModel<List<UnitDataModel>?>> get({
    required String domain,
    DataLanguage lang = DataLanguage.id,
    int page = 1,
    int? variableID,
  }) async {
    final result = await _listHttpModule.get(
      ApiEndpoint.units(
        lang: lang,
        page: page,
        domain: domain,
        variableID: variableID,
      ),
    );

    final response = ApiResponseModel<List<UnitDataModel>?>.fromJson(
      result,
      (json) {
        if (json == null || json is! List) {
          return null;
        }

        return json.map((e) => UnitDataModel.fromJson(e as JSON)).toList();
      },
    );

    if (response.dataAvailability == DataAvailability.listNotAvailable) {
      throw const UnitNotAvailableException();
    }

    return response;
  }
}
