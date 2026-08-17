import 'package:stadata_flutter_sdk/src/base/usecase.dart';
import 'package:stadata_flutter_sdk/src/core/core.dart';
import 'package:stadata_flutter_sdk/src/features/features.dart';
import 'package:stadata_flutter_sdk/src/shared/shared.dart';

class GetAllSubjectCategories
    implements
        UseCase<
          ApiResponse<List<SubjectCategory>>,
          GetAllSubjectCategoriesParam,
          SubjectCategoryRepository
        > {
  @override
  Future<Result<Failure, ApiResponse<List<SubjectCategory>>>> call(
    GetAllSubjectCategoriesParam param,
  ) => repo.get(domain: param.domain, lang: param.lang, page: param.page);

  @override
  SubjectCategoryRepository get repo =>
      injector.get<SubjectCategoryRepository>();
}

class const GetAllSubjectCategoriesParam({
  required final String domain,
  final DataLanguage lang = DataLanguage.id,
  final int page = 1,
}) extends BaseEntity {
  @override
  List<Object> get props => [domain, lang, page];
}
