import 'package:stadata_flutter_sdk/src/base/usecase.dart';
import 'package:stadata_flutter_sdk/src/core/core.dart';
import 'package:stadata_flutter_sdk/src/features/features.dart';
import 'package:stadata_flutter_sdk/src/shared/shared.dart';

class GetDetailDerivedVariable
    implements
        UseCase<
          ApiResponse<DerivedVariable>,
          GetDetailDerivedVariableParam,
          DerivedVariableRepository
        > {
  @override
  Future<Result<Failure, ApiResponse<DerivedVariable>>> call(
    GetDetailDerivedVariableParam param,
  ) => repo.detail(id: param.id, lang: param.lang, domain: param.domain);

  @override
  DerivedVariableRepository get repo =>
      injector.get<DerivedVariableRepository>();
}

class GetDetailDerivedVariableParam extends BaseEntity {
  const GetDetailDerivedVariableParam({
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
