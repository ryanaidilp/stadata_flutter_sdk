import 'package:stadata_flutter_sdk/src/base/usecase.dart';
import 'package:stadata_flutter_sdk/src/core/core.dart';
import 'package:stadata_flutter_sdk/src/features/features.dart';
import 'package:stadata_flutter_sdk/src/shared/shared.dart';

class GetDetailVerticalVariable
    implements
        UseCase<
          ApiResponse<VerticalVariable>,
          GetDetailVerticalVariableParam,
          VerticalVariableRepository
        > {
  @override
  Future<Result<Failure, ApiResponse<VerticalVariable>>> call(
    GetDetailVerticalVariableParam param,
  ) => repo.detail(id: param.id, lang: param.lang, domain: param.domain);

  @override
  VerticalVariableRepository get repo =>
      injector.get<VerticalVariableRepository>();
}

class GetDetailVerticalVariableParam extends BaseEntity {
  const GetDetailVerticalVariableParam({
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
