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

class GetAllSdgIndicatorsParam extends BaseEntity {
  const GetAllSdgIndicatorsParam({
    required this.domain,
    required this.goal,
    this.lang = DataLanguage.id,
    this.page = 1,
  });

  final String domain;
  final SdgGoalNumber goal;
  final DataLanguage lang;
  final int page;

  @override
  List<Object?> get props => [domain, goal, lang, page];
}
