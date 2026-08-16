import 'package:stadata_flutter_sdk/src/base/usecase.dart';
import 'package:stadata_flutter_sdk/src/core/core.dart';
import 'package:stadata_flutter_sdk/src/features/features.dart';
import 'package:stadata_flutter_sdk/src/shared/shared.dart';

class GetAllVariables
    implements
        UseCase<
          ApiResponse<List<Variable>>,
          GetAllVariablesParam,
          VariableRepository
        > {
  @override
  Future<Result<Failure, ApiResponse<List<Variable>>>> call(
    GetAllVariablesParam param,
  ) => repo.get(
    lang: param.lang,
    page: param.page,
    year: param.year,
    domain: param.domain,
    subjectID: param.subjectID,
    showExistingVariables: param.showExistingVariables,
  );

  @override
  VariableRepository get repo => injector.get<VariableRepository>();
}

class const GetAllVariablesParam({
  required final String domain,
  final DataLanguage lang = DataLanguage.id,
  final int page = 1,
  final bool showExistingVariables = false,
  final int? year,
  final int? subjectID,
}) extends BaseEntity {
  @override
  List<Object?> get props {
    return [domain, lang, page, showExistingVariables, year, subjectID];
  }
}
