import 'package:stadata_flutter_sdk/src/base/usecase.dart';
import 'package:stadata_flutter_sdk/src/core/core.dart';
import 'package:stadata_flutter_sdk/src/features/features.dart';
import 'package:stadata_flutter_sdk/src/shared/shared.dart';

class GetDetailStrategicIndicator
    implements
        UseCase<
          ApiResponse<StrategicIndicator>,
          GetDetailStrategicIndicatorParam,
          StrategicIndicatorRepository
        > {
  @override
  Future<Result<Failure, ApiResponse<StrategicIndicator>>> call(
    GetDetailStrategicIndicatorParam param,
  ) => repo.detail(id: param.id, lang: param.lang, domain: param.domain);

  @override
  StrategicIndicatorRepository get repo =>
      injector.get<StrategicIndicatorRepository>();
}

class GetDetailStrategicIndicatorParam extends BaseEntity {
  const GetDetailStrategicIndicatorParam({
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
