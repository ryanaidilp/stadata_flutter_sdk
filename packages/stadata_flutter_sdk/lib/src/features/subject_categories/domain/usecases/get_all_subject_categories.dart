// ignore_for_file: public_member_api_docs

import 'package:dartz/dartz.dart';

import 'package:stadata_flutter_sdk/src/base/usecase.dart';
import 'package:stadata_flutter_sdk/src/core/core.dart';
import 'package:stadata_flutter_sdk/src/features/features.dart';
import 'package:stadata_flutter_sdk/src/shared/shared.dart';

class GetAllSubjectCategories
    implements
        UseCase<ApiResponse<List<SubjectCategory>>,
            GetAllSubjectCategoriesParam, SubjectCategoryRepository> {
  @override
  Future<Either<Failure, ApiResponse<List<SubjectCategory>>>> call(
    GetAllSubjectCategoriesParam param,
  ) =>
      repo.get(
        domain: param.domain,
        lang: param.lang,
        page: param.page,
      );

  @override
  SubjectCategoryRepository get repo =>
      injector.get<SubjectCategoryRepository>();
}

class GetAllSubjectCategoriesParam extends BaseEntity {
  const GetAllSubjectCategoriesParam({
    required this.domain,
    this.lang = DataLanguage.id,
    this.page = 1,
  });
  final String domain;
  final DataLanguage lang;
  final int page;
  @override
  List<Object> get props => [domain, lang, page];
}
