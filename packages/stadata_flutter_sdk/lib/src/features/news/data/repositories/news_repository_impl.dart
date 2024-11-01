// ignore_for_file: public_member_api_docs

import 'dart:developer';

import 'package:stadata_flutter_sdk/src/core/core.dart';
import 'package:stadata_flutter_sdk/src/features/features.dart';
import 'package:stadata_flutter_sdk/src/shared/shared.dart';

class NewsRepositoryImpl implements NewsRepository {
  final _remoteDataSource = injector.get<NewsRemoteDataSource>();

  @override
  Future<Result<Failure, ApiResponse<News>>> detail({
    required int id,
    required String domain,
    DataLanguage lang = DataLanguage.id,
  }) async {
    try {
      final result = await _remoteDataSource.detail(
        id: id,
        lang: lang,
        domain: domain,
      );

      if (result.data == null) {
        throw const NewsNotAvailableException();
      }

      return Result.success(
        ApiResponse<News>(
          data: result.data,
          status: result.status,
          message: result.message,
          pagination: result.pagination,
          dataAvailability: result.dataAvailability,
        ),
      );
    } catch (e) {
      log(e.toString(), name: 'StadataException');
      return Result.failure(NewsFailure(message: e.toString()));
    }
  }

  @override
  Future<Result<Failure, ApiResponse<List<News>>>> get({
    required String domain,
    DataLanguage lang = DataLanguage.id,
    int page = 1,
    String? newsCategoryID,
    int? month,
    int? year,
    String? keyword,
  }) async {
    try {
      final result = await _remoteDataSource.get(
        lang: lang,
        page: page,
        year: year,
        month: month,
        domain: domain,
        keyword: keyword,
        newsCategoryID: newsCategoryID,
      );

      if (result.data == null) {
        throw const NewsNotAvailableException();
      }

      final data = result.data ?? [];

      return Result.success(
        ApiResponse<List<News>>(
          data: data,
          status: result.status,
          message: result.message,
          pagination: result.pagination,
          dataAvailability: result.dataAvailability,
        ),
      );
    } catch (e) {
      log(e.toString(), name: 'StadataException');
      return Result.failure(NewsFailure(message: e.toString()));
    }
  }
}
