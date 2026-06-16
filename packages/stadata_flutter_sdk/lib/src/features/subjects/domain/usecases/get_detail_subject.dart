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

class GetDetailSubjectParam extends BaseEntity {
  const GetDetailSubjectParam({
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
