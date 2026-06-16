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

class GetDetailVariableParam extends BaseEntity {
  const GetDetailVariableParam({
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
