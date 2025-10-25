import 'package:stadata_flutter_sdk/src/base/usecase.dart';
import 'package:stadata_flutter_sdk/src/core/core.dart';
import 'package:stadata_flutter_sdk/src/features/features.dart';
import 'package:stadata_flutter_sdk/src/shared/shared.dart';

/// Use case for retrieving all derived variables from the BPS API.
class GetAllDerivedVariables
    implements
        UseCase<
          ApiResponse<List<DerivedVariable>>,
          GetAllDerivedVariablesParam,
          DerivedVariableRepository
        > {
  @override
  Future<Result<Failure, ApiResponse<List<DerivedVariable>>>> call(
    GetAllDerivedVariablesParam param,
  ) => repo.get(
    lang: param.lang,
    page: param.page,
    domain: param.domain,
    variableID: param.variableID,
    verticalGroup: param.verticalGroup,
  );

  @override
  DerivedVariableRepository get repo =>
      injector.get<DerivedVariableRepository>();
}

/// Parameters for the [GetAllDerivedVariables] use case.
class GetAllDerivedVariablesParam extends BaseEntity {
  /// Creates parameters for fetching derived variables.
  const GetAllDerivedVariablesParam({
    required this.domain,
    this.lang = DataLanguage.id,
    this.page = 1,
    this.variableID,
    this.verticalGroup,
  });

  /// The area code for which to fetch derived variables
  final String domain;

  /// Language preference for the data
  final DataLanguage lang;

  /// Page number for pagination
  final int page;

  /// Optional variable ID to filter derived variables
  final int? variableID;

  /// Optional vertical group filter
  final int? verticalGroup;

  @override
  List<Object?> get props => [domain, lang, page, variableID, verticalGroup];
}
