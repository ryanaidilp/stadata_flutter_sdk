import 'package:stadata_flutter_sdk/src/base/usecase.dart';
import 'package:stadata_flutter_sdk/src/core/core.dart';
import 'package:stadata_flutter_sdk/src/features/features.dart';
import 'package:stadata_flutter_sdk/src/shared/shared.dart';

class GetDetailPeriod
    implements
        UseCase<ApiResponse<Period>, GetDetailPeriodParam, PeriodRepository> {
  @override
  Future<Result<Failure, ApiResponse<Period>>> call(
    GetDetailPeriodParam param,
  ) => repo.detail(id: param.id, lang: param.lang, domain: param.domain);

  @override
  PeriodRepository get repo => injector.get<PeriodRepository>();
}

class GetDetailPeriodParam extends BaseEntity {
  const GetDetailPeriodParam({
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
