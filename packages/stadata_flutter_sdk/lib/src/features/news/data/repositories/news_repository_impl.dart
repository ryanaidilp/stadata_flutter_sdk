// ignore_for_file: public_member_api_docs

import 'dart:developer';

import 'package:dartz/dartz.dart';

import 'package:stadata_flutter_sdk/src/core/di/injector.dart';
import 'package:stadata_flutter_sdk/src/core/exceptions/exceptions.dart';
import 'package:stadata_flutter_sdk/src/core/failures/failures.dart';
import 'package:stadata_flutter_sdk/src/features/news/data/datasources/news_remote_data_source.dart';
import 'package:stadata_flutter_sdk/src/features/news/data/models/news_model.dart';
import 'package:stadata_flutter_sdk/src/features/news/domain/entities/news.dart';
import 'package:stadata_flutter_sdk/src/features/news/domain/repositories/news_repository.dart';
import 'package:stadata_flutter_sdk/src/shared/data/models/pagination_model.dart';
import 'package:stadata_flutter_sdk/src/shared/domain/entities/api_response.dart';
import 'package:stadata_flutter_sdk/src/shared/domain/enums/data_language.dart';

class NewsRepositoryImpl implements NewsRepository {
  final _remoteDataSource = injector.get<NewsRemoteDataSource>();

  @override
  Future<Either<Failure, ApiResponse<News>>> detail({
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

      return Right(
        ApiResponse<News>(
          data: result.data?.toEntity(),
          status: result.status,
          message: result.message,
          dataAvailability: result.dataAvailability,
          pagination: result.pagination?.toEntity(),
        ),
      );
    } catch (e) {
      log(e.toString(), name: 'StadataException');
      return Left(NewsFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, ApiResponse<List<News>>>> get({
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

      final data = result.data?.map((e) => e.toEntity()).toList() ?? [];

      return Right(
        ApiResponse<List<News>>(
          data: data,
          status: result.status,
          message: result.message,
          dataAvailability: result.dataAvailability,
          pagination: result.pagination?.toEntity(),
        ),
      );
    } catch (e) {
      log(e.toString(), name: 'StadataException');
      return Left(NewsFailure(message: e.toString()));
    }
  }
}
