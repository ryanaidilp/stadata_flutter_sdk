import 'package:stadata_flutter_sdk/src/base/usecase.dart';
import 'package:stadata_flutter_sdk/src/core/core.dart';
import 'package:stadata_flutter_sdk/src/features/features.dart';
import 'package:stadata_flutter_sdk/src/shared/shared.dart';

class GetAllUnits
    implements
        UseCase<
          ApiResponse<List<UnitData>>,
          GetAllUnitsParam,
          UnitDataRepository
        > {
  @override
  Future<Result<Failure, ApiResponse<List<UnitData>>>> call(
    GetAllUnitsParam param,
  ) => repo.get(
    domain: param.domain,
    page: param.page,
    lang: param.lang,
    variableID: param.variableID,
  );

  @override
  UnitDataRepository get repo => injector.get<UnitDataRepository>();
}

class const GetAllUnitsParam({
  required final String domain,
  final DataLanguage lang = DataLanguage.id,
  final int page = 1,
  final int? variableID,
}) extends BaseEntity {
  @override
  List<Object?> get props => [domain, lang, page, variableID];
}
