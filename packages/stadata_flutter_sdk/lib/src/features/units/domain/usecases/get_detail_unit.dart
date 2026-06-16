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

class GetDetailUnitParam extends BaseEntity {
  const GetDetailUnitParam({
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
