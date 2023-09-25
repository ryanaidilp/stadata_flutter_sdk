// ignore_for_file: public_member_api_docs

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:stadata_flutter_sdk/src/base/usecase.dart';
import 'package:stadata_flutter_sdk/src/core/di/service_locator.dart';
import 'package:stadata_flutter_sdk/src/core/failures/failures.dart';
import 'package:stadata_flutter_sdk/src/features/subject_categories/domain/repositories/subject_category_repository.dart';
import 'package:stadata_flutter_sdk/src/shared/domain/entities/api_response.dart';

import 'package:stadata_flutter_sdk/stadata_flutter_sdk.dart';

@LazySingleton()
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
  SubjectCategoryRepository get repo => getIt<SubjectCategoryRepository>();
}

class GetAllSubjectCategoriesParam extends Equatable {
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
