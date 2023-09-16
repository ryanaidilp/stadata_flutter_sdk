// ignore_for_file: public_member_api_docs

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:stadata_flutter_sdk/src/base/usecase.dart';
import 'package:stadata_flutter_sdk/src/core/di/service_locator.dart';
import 'package:stadata_flutter_sdk/src/core/failures/failures.dart';
import 'package:stadata_flutter_sdk/src/features/news/domain/entities/news.dart';
import 'package:stadata_flutter_sdk/src/features/news/domain/repositories/news_repository.dart';
import 'package:stadata_flutter_sdk/src/shared/domain/entities/api_response.dart';

import 'package:stadata_flutter_sdk/stadata_flutter_sdk.dart';

@LazySingleton()
class GetDetailNews
    implements UseCase<ApiResponse<News>, GetDetailNewsParam, NewsRepository> {
  @override
  Future<Either<Failure, ApiResponse<News>>> call(
    GetDetailNewsParam param,
  ) =>
      repo.detail(
        id: param.id,
        lang: param.lang,
        domain: param.domain,
      );

  @override
  NewsRepository get repo => getIt<NewsRepository>();
}

class GetDetailNewsParam extends Equatable {
  const GetDetailNewsParam({
    required this.id,
    required this.domain,
    this.lang = DataLanguage.id,
  });
  final int id;
  final String domain;
  final DataLanguage lang;

  @override
  List<Object> get props => [id, domain, lang];
}
