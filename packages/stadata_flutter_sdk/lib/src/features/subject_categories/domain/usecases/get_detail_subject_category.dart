import 'package:stadata_flutter_sdk/src/base/usecase.dart';
import 'package:stadata_flutter_sdk/src/core/core.dart';
import 'package:stadata_flutter_sdk/src/features/features.dart';
import 'package:stadata_flutter_sdk/src/shared/shared.dart';

class GetDetailSubjectCategory
    implements
        UseCase<
          ApiResponse<SubjectCategory>,
          GetDetailSubjectCategoryParam,
          SubjectCategoryRepository
        > {
  @override
  Future<Result<Failure, ApiResponse<SubjectCategory>>> call(
    GetDetailSubjectCategoryParam param,
  ) => repo.detail(id: param.id, lang: param.lang, domain: param.domain);

  @override
  SubjectCategoryRepository get repo =>
      injector.get<SubjectCategoryRepository>();
}

class const GetDetailSubjectCategoryParam({
  required final int id,
  required final String domain,
  final DataLanguage lang = DataLanguage.id,
}) extends BaseEntity {
  @override
  List<Object> get props => [id, domain, lang];
}
