// ignore_for_file: public_member_api_docs

import 'package:stadata_flutter_sdk/src/base/usecase.dart';
import 'package:stadata_flutter_sdk/src/core/core.dart';
import 'package:stadata_flutter_sdk/src/features/features.dart';
import 'package:stadata_flutter_sdk/src/shared/shared.dart';

class GetAllInfographics
    implements
        UseCase<ApiResponse<List<Infographic>>, GetAllInfographicParam,
            InfographicRepository> {
  @override
  Future<Result<Failure, ApiResponse<List<Infographic>>>> call(
    GetAllInfographicParam param,
  ) =>
      repo.get(
        domain: param.domain,
        lang: param.lang,
        keyword: param.keyword,
        page: param.page,
      );

  @override
  InfographicRepository get repo => injector.get<InfographicRepository>();
}

class GetAllInfographicParam extends BaseEntity {
  const GetAllInfographicParam({
    required this.domain,
    this.lang = DataLanguage.id,
    this.page = 1,
    this.keyword,
  });

  final String domain;
  final DataLanguage lang;
  final int page;
  final String? keyword;

  @override
  List<Object?> get props => [domain, lang, page, keyword];
}
