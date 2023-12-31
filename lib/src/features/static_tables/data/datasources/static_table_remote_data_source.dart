// ignore_for_file: public_member_api_docs

import 'package:injectable/injectable.dart';
import 'package:stadata_flutter_sdk/src/core/di/service_locator.dart';
import 'package:stadata_flutter_sdk/src/core/network/api_endpoint.dart';
import 'package:stadata_flutter_sdk/src/core/network/http/modules/stadata_list_http_module.dart';
import 'package:stadata_flutter_sdk/src/core/network/http/modules/stadata_view_http_module.dart';
import 'package:stadata_flutter_sdk/src/core/typedef/typedef.dart';
import 'package:stadata_flutter_sdk/src/features/static_tables/data/models/static_table_model.dart';
import 'package:stadata_flutter_sdk/src/shared/data/models/api_response_model.dart';
import 'package:stadata_flutter_sdk/stadata_flutter_sdk.dart';

abstract class StaticTableRemoteDataSource {
  Future<ApiResponseModel<List<StaticTableModel>?>> get({
    required String domain,
    int page = 1,
    DataLanguage lang = DataLanguage.id,
    int? month,
    int? year,
    String? keyword,
  });
  Future<ApiResponseModel<StaticTableModel?>> detail({
    required int id,
    required String domain,
    DataLanguage lang = DataLanguage.id,
  });
}

@LazySingleton(as: StaticTableRemoteDataSource)
class StaticTableRemoteDataSourceImpl implements StaticTableRemoteDataSource {
  final _listClient = getIt<StadataListHttpModule>();
  final _detailClient = getIt<StadataViewHttpModule>();

  @override
  Future<ApiResponseModel<StaticTableModel?>> detail({
    required int id,
    required String domain,
    DataLanguage lang = DataLanguage.id,
  }) async {
    final result = await _detailClient.get(
      ApiEndpoint.staticTableDetail(
        id: id,
        lang: lang,
        domain: domain,
      ),
    );

    final response = ApiResponseModel<StaticTableModel?>.fromJson(
      result,
      (json) {
        if (json == null) {
          return null;
        }

        return StaticTableModel.fromJson(json as JSON);
      },
    );

    if (response.dataAvailability == DataAvailability.notAvailable) {
      throw const StaticTableNotAvailableException();
    }

    return response;
  }

  @override
  Future<ApiResponseModel<List<StaticTableModel>?>> get({
    required String domain,
    int page = 1,
    DataLanguage lang = DataLanguage.id,
    int? month,
    int? year,
    String? keyword,
  }) async {
    final result = await _listClient.get(
      ApiEndpoint.staticTable(
        domain: domain,
        page: page,
        lang: lang,
        year: year,
        month: month,
        keyword: keyword,
      ),
    );

    final response = ApiResponseModel<List<StaticTableModel>?>.fromJson(
      result,
      (json) {
        if (json == null || json is! List) {
          return null;
        }

        return json.map((e) => StaticTableModel.fromJson(e as JSON)).toList();
      },
    );

    if (response.dataAvailability == DataAvailability.listNotAvailable) {
      throw const StaticTableNotAvailableException();
    }

    return response;
  }
}
