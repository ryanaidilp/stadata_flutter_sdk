// ignore_for_file: public_member_api_docs

import 'package:stadata_flutter_sdk/src/base/usecase.dart';
import 'package:stadata_flutter_sdk/src/core/core.dart';
import 'package:stadata_flutter_sdk/src/features/features.dart';
import 'package:stadata_flutter_sdk/src/shared/shared.dart';

class GetAllStrategicIndicators
    implements
        UseCase<ApiResponse<List<StrategicIndicator>>,
            GetAllStrategicIndicatorsParam, StrategicIndicatorRepository> {
  @override
  Future<Result<Failure, ApiResponse<List<StrategicIndicator>>>> call(
    GetAllStrategicIndicatorsParam param,
  ) =>
      repo.get(
        page: param.page,
        lang: param.lang,
        domain: param.domain,
        variableID: param.variableID,
      );

  @override
  StrategicIndicatorRepository get repo =>
      injector.get<StrategicIndicatorRepository>();
}

class GetAllStrategicIndicatorsParam extends BaseEntity {
  const GetAllStrategicIndicatorsParam({
    required this.domain,
    this.page = 1,
    this.lang = DataLanguage.id,
    this.variableID,
  });

  final int page;
  final String domain;
  final DataLanguage lang;
  final int? variableID;
  @override
  List<Object?> get props => [domain, lang, variableID, page];
}
