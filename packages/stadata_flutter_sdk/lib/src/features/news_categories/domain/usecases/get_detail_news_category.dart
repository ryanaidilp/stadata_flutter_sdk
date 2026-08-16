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

class const GetDetailNewsCategoryParam({
  required final String id,
  required final String domain,
  final DataLanguage lang = DataLanguage.id,
}) extends BaseEntity {
  @override
  List<Object> get props => [id, domain, lang];
}
