import 'package:stadata_flutter_sdk/src/base/usecase.dart';
import 'package:stadata_flutter_sdk/src/core/core.dart';
import 'package:stadata_flutter_sdk/src/features/features.dart';
import 'package:stadata_flutter_sdk/src/shared/shared.dart';

class GetDetailDerivedPeriod
    implements
        UseCase<
          ApiResponse<DerivedPeriod>,
          GetDetailDerivedPeriodParam,
          DerivedPeriodRepository
        > {
  @override
  Future<Result<Failure, ApiResponse<DerivedPeriod>>> call(
    GetDetailDerivedPeriodParam param,
  ) => repo.detail(id: param.id, lang: param.lang, domain: param.domain);

  @override
  DerivedPeriodRepository get repo => injector.get<DerivedPeriodRepository>();
}

class const GetDetailDerivedPeriodParam({
  required final int id,
  required final String domain,
  final DataLanguage lang = DataLanguage.id,
}) extends BaseEntity {
  @override
  List<Object> get props => [id, domain, lang];
}
