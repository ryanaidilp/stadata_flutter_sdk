import 'package:stadata_flutter_sdk/src/base/usecase.dart';
import 'package:stadata_flutter_sdk/src/core/core.dart';
import 'package:stadata_flutter_sdk/src/features/features.dart';
import 'package:stadata_flutter_sdk/src/shared/shared.dart';

class GetAllNews
    implements
        UseCase<ApiResponse<List<News>>, GetAllNewsParam, NewsRepository> {
  @override
  Future<Result<Failure, ApiResponse<List<News>>>> call(
    GetAllNewsParam param,
  ) => repo.get(
    lang: param.lang,
    page: param.page,
    year: param.year,
    month: param.month,
    domain: param.domain,
    keyword: param.keyword,
    newsCategoryID: param.newsCategoryID,
  );

  @override
  NewsRepository get repo => injector.get<NewsRepository>();
}

class const GetAllNewsParam({
  required final String domain,
  final DataLanguage lang = DataLanguage.id,
  final int page = 1,
  final String? newsCategoryID,
  final int? month,
  final int? year,
  final String? keyword,
}) extends BaseEntity {
  @override
  List<Object?> get props => [
    domain,
    lang,
    page,
    newsCategoryID,
    month,
    year,
    keyword,
  ];
}
