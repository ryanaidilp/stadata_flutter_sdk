import 'package:stadata_flutter_sdk/src/base/usecase.dart';
import 'package:stadata_flutter_sdk/src/core/core.dart';
import 'package:stadata_flutter_sdk/src/features/features.dart';
import 'package:stadata_flutter_sdk/src/shared/shared.dart';

class GetAllGlossary
    implements
        UseCase<
          ApiResponse<List<Glossary>>,
          GetAllGlossaryParam,
          GlossaryRepository
        > {
  @override
  Future<Result<Failure, ApiResponse<List<Glossary>>>> call(
    GetAllGlossaryParam param,
  ) => repo.get(
    domain: param.domain,
    lang: param.lang,
    page: param.page,
    keyword: param.keyword,
    prefix: param.prefix,
  );

  @override
  GlossaryRepository get repo => injector.get<GlossaryRepository>();
}

class GetAllGlossaryParam extends BaseEntity {
  const GetAllGlossaryParam({
    required this.domain,
    this.lang = DataLanguage.id,
    this.page = 1,
    this.keyword,
    this.prefix,
  });

  final String domain;
  final DataLanguage lang;
  final int page;
  final String? keyword;
  final String? prefix;

  @override
  List<Object?> get props => [domain, lang, page, keyword, prefix];
}
