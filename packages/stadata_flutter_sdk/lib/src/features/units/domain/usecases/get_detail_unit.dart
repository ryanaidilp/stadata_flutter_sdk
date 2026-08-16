import 'package:stadata_flutter_sdk/src/base/usecase.dart';
import 'package:stadata_flutter_sdk/src/core/core.dart';
import 'package:stadata_flutter_sdk/src/features/features.dart';
import 'package:stadata_flutter_sdk/src/shared/shared.dart';

class GetDetailUnit
    implements
        UseCase<ApiResponse<UnitData>, GetDetailUnitParam, UnitDataRepository> {
  @override
  Future<Result<Failure, ApiResponse<UnitData>>> call(
    GetDetailUnitParam param,
  ) => repo.detail(id: param.id, lang: param.lang, domain: param.domain);

  @override
  UnitDataRepository get repo => injector.get<UnitDataRepository>();
}

class const GetDetailUnitParam({
  required final int id,
  required final String domain,
  final DataLanguage lang = DataLanguage.id,
}) extends BaseEntity {
  @override
  List<Object> get props => [id, domain, lang];
}
