import 'package:stadata_flutter_sdk/src/base/usecase.dart';
import 'package:stadata_flutter_sdk/src/core/core.dart';
import 'package:stadata_flutter_sdk/src/features/features.dart';
import 'package:stadata_flutter_sdk/src/shared/shared.dart';

class GetDetailNews
    implements UseCase<ApiResponse<News>, GetDetailNewsParam, NewsRepository> {
  @override
  Future<Result<Failure, ApiResponse<News>>> call(GetDetailNewsParam param) =>
      repo.detail(id: param.id, lang: param.lang, domain: param.domain);

  @override
  NewsRepository get repo => injector.get<NewsRepository>();
}

class GetDetailNewsParam extends BaseEntity {
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
