import 'package:stadata_flutter_sdk/src/core/core.dart';
import 'package:stadata_flutter_sdk/src/features/features.dart';
import 'package:stadata_flutter_sdk/src/shared/shared.dart';

abstract class PressReleaseRemoteDataSource {
  Future<ApiResponseModel<List<PressReleaseModel>?>> get({
    required String domain,
    DataLanguage lang = DataLanguage.id,
    int page = 1,
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

class PressReleaseRemoteDataSourceImpl implements PressReleaseRemoteDataSource {
  final _listClient =
      injector.get<NetworkClient>(instanceName: InjectorConstant.listClient);
  final _detailClient =
      injector.get<NetworkClient>(instanceName: InjectorConstant.viewClient);

  @override
  Future<ApiResponseModel<PressReleaseModel?>> detail({
    required int id,
    required String domain,
    DataLanguage lang = DataLanguage.id,
  }) async {
    final result = await _detailClient.get<JSON>(
      ApiEndpoint.pressRelease,
      queryParams: {
        QueryParamConstant.id: id,
        QueryParamConstant.domain: domain,
        QueryParamConstant.lang: lang.value,
      },
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
    int? month,
    int? year,
    String? keyword,
  }) async {
    final result = await _listClient.get<JSON>(
      ApiEndpoint.pressRelease,
      queryParams: {
        QueryParamConstant.page: page,
        QueryParamConstant.domain: domain,
        QueryParamConstant.lang: lang.value,
        if (year != null) QueryParamConstant.year: year,
        if (month != null) QueryParamConstant.month: month,
        if (keyword != null && keyword.isNotEmpty)
          QueryParamConstant.keyword: keyword,
      },
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
