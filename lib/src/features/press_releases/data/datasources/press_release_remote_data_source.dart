// ignore_for_file: public_member_api_docs

import 'package:injectable/injectable.dart';
import 'package:stadata_flutter_sdk/src/core/di/service_locator.dart';
import 'package:stadata_flutter_sdk/src/core/network/api_endpoint.dart';
import 'package:stadata_flutter_sdk/src/core/network/http/modules/stadata_list_http_module.dart';
import 'package:stadata_flutter_sdk/src/core/network/http/modules/stadata_view_http_module.dart';
import 'package:stadata_flutter_sdk/src/core/typedef/typedef.dart';
import 'package:stadata_flutter_sdk/src/features/press_releases/data/models/press_release_model.dart';
import 'package:stadata_flutter_sdk/src/shared/data/models/api_response_model.dart';
import 'package:stadata_flutter_sdk/stadata_flutter_sdk.dart';

abstract class PressReleaseRemoteDataSource {
  Future<ApiResponseModel<List<PressReleaseModel>?>> get({
    required String domain,
    DataLanguage lang = DataLanguage.id,
    int page = 1,
    String? newsCategoryId,
    int? month,
    int? year,
    String? keyword,
  });
  Future<ApiResponseModel<PressReleaseModel?>> detail({
    required int id,
    required String domain,
    DataLanguage lang = DataLanguage.id,
  });
}

@LazySingleton(as: PressReleaseRemoteDataSource)
class PressReleaseRemoteDataSourceImpl implements PressReleaseRemoteDataSource {
  final _listClient = getIt<StadataListHttpModule>();
  final _detailClient = getIt<StadataViewHttpModule>();

  @override
  Future<ApiResponseModel<PressReleaseModel?>> detail({
    required int id,
    required String domain,
    DataLanguage lang = DataLanguage.id,
  }) async {
    final result = await _detailClient.get(
      ApiEndpoint.pressReleaseDetail(
        id: id,
        lang: lang,
        domain: domain,
      ),
    );

    final response = ApiResponseModel<PressReleaseModel?>.fromJson(
      result,
      (json) {
        if (json == null) {
          return null;
        }

        return PressReleaseModel.fromJson(json as JSON);
      },
    );

    if (response.dataAvailability == DataAvailability.notAvailable) {
      throw const PressReleaseNotAvailableException();
    }

    return response;
  }

  @override
  Future<ApiResponseModel<List<PressReleaseModel>?>> get({
    required String domain,
    DataLanguage lang = DataLanguage.id,
    int page = 1,
    String? newsCategoryId,
    int? month,
    int? year,
    String? keyword,
  }) async {
    final result = await _listClient.get(
      ApiEndpoint.pressReleases(
        page: page,
        lang: lang,
        year: year,
        month: month,
        domain: domain,
        keyword: keyword,
      ),
    );

    final response = ApiResponseModel<List<PressReleaseModel>?>.fromJson(
      result,
      (json) {
        if (json == null) {
          return null;
        }

        if (json is! List) {
          return null;
        }

        return json.map((e) => PressReleaseModel.fromJson(e as JSON)).toList();
      },
    );

    if (response.dataAvailability == DataAvailability.listNotAvailable) {
      throw const PressReleaseNotAvailableException();
    }

    return response;
  }
}
