import 'package:stadata_flutter_sdk/src/base/usecase.dart';
import 'package:stadata_flutter_sdk/src/core/core.dart';
import 'package:stadata_flutter_sdk/src/features/features.dart';
import 'package:stadata_flutter_sdk/src/shared/shared.dart';

class GetDetailNewsCategory
    implements
        UseCase<
          ApiResponse<NewsCategory>,
          GetDetailNewsCategoryParam,
          NewsCategoryRepository
        > {
  @override
  Future<Result<Failure, ApiResponse<NewsCategory>>> call(
    GetDetailNewsCategoryParam param,
  ) => repo.detail(id: param.id, lang: param.lang, domain: param.domain);

  @override
  NewsCategoryRepository get repo => injector.get<NewsCategoryRepository>();
}

class GetDetailNewsCategoryParam extends BaseEntity {
  const GetDetailNewsCategoryParam({
    required this.id,
    required this.domain,
    this.lang = DataLanguage.id,
  });
  final String id;
  final String domain;
  final DataLanguage lang;

  @override
  List<Object> get props => [id, domain, lang];
}
