import 'package:stadata_flutter_sdk/src/base/usecase.dart';
import 'package:stadata_flutter_sdk/src/core/core.dart';
import 'package:stadata_flutter_sdk/src/features/features.dart';
import 'package:stadata_flutter_sdk/src/shared/shared.dart';

class GetDetailInfographic
    implements
        UseCase<
          ApiResponse<Infographic>,
          GetDetailInfographicParam,
          InfographicRepository
        > {
  @override
  Future<Result<Failure, ApiResponse<Infographic>>> call(
    GetDetailInfographicParam param,
  ) => repo.detail(id: param.id, lang: param.lang, domain: param.domain);

  @override
  InfographicRepository get repo => injector.get<InfographicRepository>();
}

class const GetDetailInfographicParam({
  required final int id,
  required final String domain,
  final DataLanguage lang = DataLanguage.id,
}) extends BaseEntity {
  @override
  List<Object> get props => [id, domain, lang];
}
