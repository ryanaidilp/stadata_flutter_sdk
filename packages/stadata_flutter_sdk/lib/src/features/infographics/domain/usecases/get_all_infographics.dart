import 'package:stadata_flutter_sdk/src/base/usecase.dart';
import 'package:stadata_flutter_sdk/src/core/core.dart';
import 'package:stadata_flutter_sdk/src/features/features.dart';
import 'package:stadata_flutter_sdk/src/shared/shared.dart';

class GetAllInfographics
    implements
        UseCase<
          ApiResponse<List<Infographic>>,
          GetAllInfographicParam,
          InfographicRepository
        > {
  @override
  Future<Result<Failure, ApiResponse<List<Infographic>>>> call(
    GetAllInfographicParam param,
  ) => repo.get(
    domain: param.domain,
    lang: param.lang,
    keyword: param.keyword,
    page: param.page,
  );

  @override
  InfographicRepository get repo => injector.get<InfographicRepository>();
}

class const GetAllInfographicParam({
  required final String domain,
  final DataLanguage lang = DataLanguage.id,
  final int page = 1,
  final String? keyword,
}) extends BaseEntity {
  @override
  List<Object?> get props => [domain, lang, page, keyword];
}
