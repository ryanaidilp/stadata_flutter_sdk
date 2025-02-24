import 'package:stadata_flutter_sdk/src/base/usecase.dart';
import 'package:stadata_flutter_sdk/src/core/core.dart';
import 'package:stadata_flutter_sdk/src/features/features.dart';
import 'package:stadata_flutter_sdk/src/shared/shared.dart';

class GetAllNewsCategories
    implements
        UseCase<
          ApiResponse<List<NewsCategory>>,
          GetAllNewsCategoriesParam,
          NewsCategoryRepository
        > {
  @override
  Future<Result<Failure, ApiResponse<List<NewsCategory>>>> call(
    GetAllNewsCategoriesParam param,
  ) => repo.get(lang: param.lang, domain: param.domain);

  @override
  NewsCategoryRepository get repo => injector.get<NewsCategoryRepository>();
}

class GetAllNewsCategoriesParam extends BaseEntity {
  const GetAllNewsCategoriesParam({
    required this.domain,
    this.lang = DataLanguage.id,
  });
  final String domain;
  final DataLanguage lang;
  @override
  List<Object> get props => [domain, lang];
}
