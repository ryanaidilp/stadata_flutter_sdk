import 'package:stadata_flutter_sdk/src/base/usecase.dart';
import 'package:stadata_flutter_sdk/src/core/core.dart';
import 'package:stadata_flutter_sdk/src/features/features.dart';
import 'package:stadata_flutter_sdk/src/shared/shared.dart';

class GetAllVerticalVariables
    implements
        UseCase<
          ApiResponse<List<VerticalVariable>>,
          GetAllVerticalVariablesParam,
          VerticalVariableRepository
        > {
  @override
  Future<Result<Failure, ApiResponse<List<VerticalVariable>>>> call(
    GetAllVerticalVariablesParam param,
  ) => repo.get(
    domain: param.domain,
    lang: param.lang,
    page: param.page,
    variableID: param.variableID,
  );

  @override
  VerticalVariableRepository get repo =>
      injector.get<VerticalVariableRepository>();
}

class const GetAllVerticalVariablesParam({
  required final String domain,
  final int page = 1,
  final DataLanguage lang = DataLanguage.id,
  final int? variableID,
}) extends BaseEntity {
  @override
  List<Object?> get props => [domain, page, lang, variableID];
}
