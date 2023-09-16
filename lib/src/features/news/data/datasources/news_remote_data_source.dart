// ignore_for_file: public_member_api_docs

import 'package:injectable/injectable.dart';
import 'package:stadata_flutter_sdk/src/core/di/service_locator.dart';
import 'package:stadata_flutter_sdk/src/core/exceptions/exceptions.dart';
import 'package:stadata_flutter_sdk/src/core/network/api_endpoint.dart';
import 'package:stadata_flutter_sdk/src/core/network/http/modules/stadata_list_http_module.dart';
import 'package:stadata_flutter_sdk/src/core/network/http/modules/stadata_view_http_module.dart';
import 'package:stadata_flutter_sdk/src/core/typedef/typedef.dart';
import 'package:stadata_flutter_sdk/src/features/news/data/models/news_model.dart';
import 'package:stadata_flutter_sdk/src/shared/data/models/api_response_model.dart';
import 'package:stadata_flutter_sdk/src/shared/domain/enums/data_availability.dart';
import 'package:stadata_flutter_sdk/src/shared/domain/enums/data_language.dart';

abstract class NewsRemoteDataSource {
  Future<ApiResponseModel<List<NewsModel>?>> get({
    required String domain,
    DataLanguage lang = DataLanguage.id,
    int page = 1,
    String? newsCategoryId,
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

@LazySingleton(as: NewsRemoteDataSource)
class NewsRemoteDataSourceImpl implements NewsRemoteDataSource {
  final _listClient = getIt<StadataListHttpModule>();
  final _detailClient = getIt<StadataViewHttpModule>();
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
    String? newsCategoryId,
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
        newsCategoryId: newsCategoryId,
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
