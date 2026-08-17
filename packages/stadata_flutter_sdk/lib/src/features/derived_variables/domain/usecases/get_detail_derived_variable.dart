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

class const GetDetailDerivedVariableParam({
  required final int id,
  required final String domain,
  final DataLanguage lang = DataLanguage.id,
}) extends BaseEntity {
  @override
  List<Object> get props => [id, domain, lang];
}
