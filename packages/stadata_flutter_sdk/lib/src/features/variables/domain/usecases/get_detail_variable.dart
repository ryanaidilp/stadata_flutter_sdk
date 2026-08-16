import 'package:stadata_flutter_sdk/src/base/usecase.dart';
import 'package:stadata_flutter_sdk/src/core/core.dart';
import 'package:stadata_flutter_sdk/src/features/features.dart';
import 'package:stadata_flutter_sdk/src/shared/shared.dart';

class GetDetailVariable
    implements
        UseCase<
          ApiResponse<Variable>,
          GetDetailVariableParam,
          VariableRepository
        > {
  @override
  Future<Result<Failure, ApiResponse<Variable>>> call(
    GetDetailVariableParam param,
  ) => repo.detail(id: param.id, lang: param.lang, domain: param.domain);

  @override
  VariableRepository get repo => injector.get<VariableRepository>();
}

class const GetDetailVariableParam({
  required final int id,
  required final String domain,
  final DataLanguage lang = DataLanguage.id,
}) extends BaseEntity {
  @override
  List<Object> get props => [id, domain, lang];
}
