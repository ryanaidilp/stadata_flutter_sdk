// ignore_for_file: public_member_api_docs

import 'package:stadata_flutter_sdk/src/core/core.dart';
import 'package:stadata_flutter_sdk/src/features/features.dart';
import 'package:stadata_flutter_sdk/src/shared/shared.dart';

abstract class NewsRemoteDataSource {
  Future<ApiResponseModel<List<NewsModel>?>> get({
    required String domain,
    DataLanguage lang = DataLanguage.id,
    int page = 1,
    String? newsCategoryID,
    int? month,
    int? year,
    String? keyword,
  });
  Future<ApiResponseModel<NewsModel?>> detail({
    required int id,
    required String domain,
    DataLanguage lang = DataLanguage.id,
  });
}

class NewsRemoteDataSourceImpl implements NewsRemoteDataSource {
  final _listClient = injector.get<StadataListHttpModule>();
  final _detailClient = injector.get<StadataViewHttpModule>();
  @override
  Future<ApiResponseModel<NewsModel?>> detail({
    required int id,
    required String domain,
    DataLanguage lang = DataLanguage.id,
  }) async {
    final result = await _detailClient.get(
      ApiEndpoint.newsDetail(
        id: id,
        lang: lang,
        domain: domain,
      ),
    );

    final response = ApiResponseModel<NewsModel?>.fromJson(
      result,
      (json) {
        if (json == null) {
          return null;
        }

        return NewsModel.fromJson(json as JSON);
      },
    );

    if (response.dataAvailability == DataAvailability.notAvailable) {
      throw const NewsNotAvailableException();
    }

    return response;
  }

  @override
  Future<ApiResponseModel<List<NewsModel>?>> get({
    required String domain,
    DataLanguage lang = DataLanguage.id,
    int page = 1,
    String? newsCategoryID,
    int? month,
    int? year,
    String? keyword,
  }) async {
    final result = await _listClient.get(
      ApiEndpoint.news(
        page: page,
        lang: lang,
        year: year,
        month: month,
        domain: domain,
        keyword: keyword,
        newsCategoryID: newsCategoryID,
      ),
    );

    final response = ApiResponseModel<List<NewsModel>?>.fromJson(
      result,
      (json) {
        if (json == null) {
          return null;
        }

        if (json is! List) {
          return null;
        }

        return json.map((e) => NewsModel.fromJson(e as JSON)).toList();
      },
    );

    if (response.dataAvailability == DataAvailability.listNotAvailable) {
      throw const NewsNotAvailableException();
    }

    return response;
  }
}
