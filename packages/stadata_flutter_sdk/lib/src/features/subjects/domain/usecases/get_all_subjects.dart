import 'package:stadata_flutter_sdk/src/base/usecase.dart';
import 'package:stadata_flutter_sdk/src/core/core.dart';
import 'package:stadata_flutter_sdk/src/features/features.dart';
import 'package:stadata_flutter_sdk/src/shared/shared.dart';

class GetAllSubjects
    implements
        UseCase<
          ApiResponse<List<Subject>>,
          GetAllSubjectsParam,
          SubjectRepository
        > {
  @override
  Future<Result<Failure, ApiResponse<List<Subject>>>> call(
    GetAllSubjectsParam param,
  ) => repo.get(
    page: param.page,
    lang: param.lang,
    domain: param.domain,
    subjectCategoryID: param.subjectCategoryID,
  );

  @override
  SubjectRepository get repo => injector.get<SubjectRepository>();
}

class const GetAllSubjectsParam({
  required final String domain,
  final int? subjectCategoryID,
  final DataLanguage lang = DataLanguage.id,
  final int page = 1,
}) extends BaseEntity {
  @override
  List<Object?> get props => [domain, lang, page, subjectCategoryID];
}
