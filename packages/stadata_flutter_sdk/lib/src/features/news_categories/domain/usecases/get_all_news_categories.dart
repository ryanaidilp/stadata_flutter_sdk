// ignore_for_file: public_member_api_docs

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import 'package:stadata_flutter_sdk/src/base/usecase.dart';
import 'package:stadata_flutter_sdk/src/core/di/injector.dart';
import 'package:stadata_flutter_sdk/src/core/failures/failures.dart';
import 'package:stadata_flutter_sdk/src/features/news_categories/domain/respositories/news_category_repository.dart';
import 'package:stadata_flutter_sdk/src/shared/domain/entities/api_response.dart';

import 'package:stadata_flutter_sdk/stadata_flutter_sdk.dart';

class GetAllNewsCategories
    implements
        UseCase<ApiResponse<List<NewsCategory>>, GetAllNewsCategoriesParam,
            NewsCategoryRepository> {
  @override
  Future<Either<Failure, ApiResponse<List<NewsCategory>>>> call(
    GetAllNewsCategoriesParam param,
  ) =>
      repo.get(
        lang: param.lang,
        domain: param.domain,
      );

  @override
  NewsCategoryRepository get repo => injector.get<NewsCategoryRepository>();
}

class GetAllNewsCategoriesParam extends Equatable {
  const GetAllNewsCategoriesParam({
    required this.domain,
    this.lang = DataLanguage.id,
  });
  final String domain;
  final DataLanguage lang;
  @override
  List<Object> get props => [domain, lang];
}
