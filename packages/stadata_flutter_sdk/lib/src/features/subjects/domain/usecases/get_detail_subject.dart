import 'package:stadata_flutter_sdk/src/base/usecase.dart';
import 'package:stadata_flutter_sdk/src/core/core.dart';
import 'package:stadata_flutter_sdk/src/features/features.dart';
import 'package:stadata_flutter_sdk/src/shared/shared.dart';

class GetDetailSubject
    implements
        UseCase<
          ApiResponse<Subject>,
          GetDetailSubjectParam,
          SubjectRepository
        > {
  @override
  Future<Result<Failure, ApiResponse<Subject>>> call(
    GetDetailSubjectParam param,
  ) => repo.detail(id: param.id, lang: param.lang, domain: param.domain);

  @override
  SubjectRepository get repo => injector.get<SubjectRepository>();
}

class const GetDetailSubjectParam({
  required final int id,
  required final String domain,
  final DataLanguage lang = DataLanguage.id,
}) extends BaseEntity {
  @override
  List<Object> get props => [id, domain, lang];
}
