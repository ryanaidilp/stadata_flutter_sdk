import 'package:stadata_flutter_sdk/src/core/core.dart';
import 'package:stadata_flutter_sdk/src/features/features.dart';
import 'package:stadata_flutter_sdk/src/shared/shared.dart';

abstract class PublicationRemoteDataSource {
  /// Fetches a list of publications based on the specified parameters.
  ///
  /// Returns a [Future] that can yield an [ApiResponseModel]
  /// containing a list of [PublicationModel].
  ///
  /// - [domain]: The domain for which publications are requested.
  /// - [lang]: The data language to request (default is [DataLanguage.id]).
  /// - [page]: The page number to retrieve (default is 1).
  /// - [keyword]: A keyword to filter publications by (optional).
  /// - [month]: The month to filter publications by (optional).
  /// - [year]: The year to filter publications by (optional).
  ///
  Future<ApiResponseModel<List<PublicationModel>?>> get({
    required String domain,
    DataLanguage lang = DataLanguage.id,
    int page = 1,
    String? keyword,
    int? month,
    int? year,
  });

  /// Fetches detailed information about a specific publication.
  ///
  /// Returns a [Future] that can yield Result an [ApiResponseModel]
  /// containing a single [PublicationModel].
  ///
  /// - [id]: The unique identifier of the publication.
  /// - [domain]: The domain for which the publication detail is requested.
  /// - [lang]: The data language to request (default is [DataLanguage.id]).

  Future<ApiResponseModel<PublicationModel?>> detail({
    required String id,
    required String domain,
    DataLanguage lang = DataLanguage.id,
  });
}

class PublicationRemoteDataSourceImpl implements PublicationRemoteDataSource {
  final listClient = injector.get<NetworkClient>(
    instanceName: InjectorConstant.listClient,
  );
  final detailClient = injector.get<NetworkClient>(
    instanceName: InjectorConstant.viewClient,
  );

  @override
  Future<ApiResponseModel<PublicationModel?>> detail({
    required String id,
    required String domain,
    DataLanguage lang = DataLanguage.id,
  }) async {
    final result = await detailClient.get<JSON>(
      ApiEndpoint.publication,
      queryParams: {
        QueryParamConstant.id: id,
        QueryParamConstant.domain: domain,
        QueryParamConstant.lang: lang.value,
      },
    );

    if (result.containsKey('status') && result['status'] == 'Error') {
      throw ApiException(result['message']?.toString() ?? '');
    }

    final response = ApiResponseModel<PublicationModel?>.fromJson(result, (
      json,
    ) {
      if (json == null) {
        return null;
      }

      return PublicationModel.fromJson(json as JSON);
    });

    if (response.dataAvailability == DataAvailability.notAvailable) {
      throw const PublicationNotAvailableException();
    }

    return response;
  }

  @override
  Future<ApiResponseModel<List<PublicationModel>?>> get({
    required String domain,
    DataLanguage lang = DataLanguage.id,
    int page = 1,
    String? keyword,
    int? month,
    int? year,
  }) async {
    final result = await listClient.get<JSON>(
      ApiEndpoint.publication,
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

    if (result.containsKey('status') && result['status'] == 'Error') {
      throw ApiException(result['message']?.toString() ?? '');
    }

    final response = ApiResponseModel<List<PublicationModel>?>.fromJson(
      result,
      (json) {
        if (json == null || json is! List) {
          return null;
        }

        return json.map((e) => PublicationModel.fromJson(e as JSON)).toList();
      },
    );

    if (response.dataAvailability == DataAvailability.listNotAvailable) {
      throw const PublicationNotAvailableException();
    }

    return response;
  }
}
