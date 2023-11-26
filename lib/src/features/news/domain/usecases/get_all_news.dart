// ignore_for_file: public_member_api_docs

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:stadata_flutter_sdk/src/base/usecase.dart';
import 'package:stadata_flutter_sdk/src/core/di/service_locator.dart';
import 'package:stadata_flutter_sdk/src/core/failures/failures.dart';
import 'package:stadata_flutter_sdk/src/features/news/domain/repositories/news_repository.dart';
import 'package:stadata_flutter_sdk/src/shared/domain/entities/api_response.dart';

import 'package:stadata_flutter_sdk/stadata_flutter_sdk.dart';

@LazySingleton()
class GetAllNews
    implements
        UseCase<ApiResponse<List<News>>, GetAllNewsParam, NewsRepository> {
  @override
  Future<Either<Failure, ApiResponse<List<News>>>> call(
    GetAllNewsParam param,
  ) =>
      repo.get(
        lang: param.lang,
        page: param.page,
        year: param.year,
        month: param.month,
        domain: param.domain,
        keyword: param.keyword,
        newsCategoryID: param.newsCategoryID,
      );

  @override
  NewsRepository get repo => getIt<NewsRepository>();
}

class GetAllNewsParam extends Equatable {
  const GetAllNewsParam({
    required this.domain,
    this.lang = DataLanguage.id,
    this.page = 1,
    this.newsCategoryID,
    this.month,
    this.year,
    this.keyword,
  });
  final String domain;
  final DataLanguage lang;
  final int page;
  final String? newsCategoryID;
  final int? month;
  final int? year;
  final String? keyword;

  @override
  List<Object?> get props =>
      [domain, lang, page, newsCategoryID, month, year, keyword];
}
