import 'package:stadata_flutter_sdk/src/base/usecase.dart';
import 'package:stadata_flutter_sdk/src/core/core.dart';
import 'package:stadata_flutter_sdk/src/features/features.dart';
import 'package:stadata_flutter_sdk/src/shared/shared.dart';

class GetAllStrategicIndicators
    implements
        UseCase<
          ApiResponse<List<StrategicIndicator>>,
          GetAllStrategicIndicatorsParam,
          StrategicIndicatorRepository
        > {
  @override
  Future<Result<Failure, ApiResponse<List<StrategicIndicator>>>> call(
    GetAllStrategicIndicatorsParam param,
  ) => repo.get(
    page: param.page,
    lang: param.lang,
    domain: param.domain,
    variableID: param.variableID,
  );

  @override
  StrategicIndicatorRepository get repo =>
      injector.get<StrategicIndicatorRepository>();
}

class const GetAllStrategicIndicatorsParam({
  required final String domain,
  final int page = 1,
  final DataLanguage lang = DataLanguage.id,
  final int? variableID,
}) extends BaseEntity {
  @override
  List<Object?> get props => [domain, lang, variableID, page];
}
