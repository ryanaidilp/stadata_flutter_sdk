import 'package:stadata_flutter_sdk/src/base/usecase.dart';
import 'package:stadata_flutter_sdk/src/core/core.dart';
import 'package:stadata_flutter_sdk/src/features/features.dart';
import 'package:stadata_flutter_sdk/src/shared/shared.dart';

class GetAllSdgIndicators
    implements
        UseCase<
          ApiResponse<List<SdgIndicator>>,
          GetAllSdgIndicatorsParam,
          SdgRepository
        > {
  @override
  Future<Result<Failure, ApiResponse<List<SdgIndicator>>>> call(
    GetAllSdgIndicatorsParam param,
  ) => repo.get(
    domain: param.domain,
    goal: param.goal,
    lang: param.lang,
    page: param.page,
  );

  @override
  SdgRepository get repo => injector.get<SdgRepository>();
}

class const GetAllSdgIndicatorsParam({
  required final String domain,
  required final SdgGoalNumber goal,
  final DataLanguage lang = DataLanguage.id,
  final int page = 1,
}) extends BaseEntity {
  @override
  List<Object?> get props => [domain, goal, lang, page];
}
