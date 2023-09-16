// ignore_for_file: public_member_api_docs

import 'package:injectable/injectable.dart';
import 'package:stadata_flutter_sdk/src/core/di/service_locator.dart';
import 'package:stadata_flutter_sdk/src/core/exceptions/exceptions.dart';
import 'package:stadata_flutter_sdk/src/core/network/api_endpoint.dart';
import 'package:stadata_flutter_sdk/src/core/network/http/modules/stadata_list_http_module.dart';
import 'package:stadata_flutter_sdk/src/core/network/http/modules/stadata_view_http_module.dart';
import 'package:stadata_flutter_sdk/src/core/typedef/typedef.dart';
import 'package:stadata_flutter_sdk/src/features/publications/data/models/publication_model.dart';
import 'package:stadata_flutter_sdk/src/shared/data/models/api_response_model.dart';
import 'package:stadata_flutter_sdk/src/shared/domain/enums/data_availability.dart';
import 'package:stadata_flutter_sdk/src/shared/domain/enums/data_language.dart';

// ignore: one_member_abstracts
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
  /// Returns a [Future] that can yield either an [ApiResponseModel]
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

@LazySingleton(as: PublicationRemoteDataSource)
class PublicationRemoteDataSourceImpl implements PublicationRemoteDataSource {
  final listClient = getIt<StadataListHttpModule>();
  final detailClient = getIt<StadataViewHttpModule>();

  @override
  Future<ApiResponseModel<PublicationModel?>> detail({
    required String id,
    required String domain,
    DataLanguage lang = DataLanguage.id,
  }) async {
    final result = await detailClient.get(
      ApiEndpoint.publicationDetail(
        id: id,
        domain: domain,
        lang: lang,
      ),
    );

    final response = ApiResponseModel<PublicationModel?>.fromJson(
      result,
      (json) {
        if (json == null) {
          return null;
        }

        return PublicationModel.fromJson(json as JSON);
      },
    );

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
    final result = await listClient.get(
      ApiEndpoint.publication(
        domain: domain,
        lang: lang,
        keyword: keyword,
        month: month,
        year: year,
        page: page,
      ),
    );

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
