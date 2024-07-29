// ignore_for_file: public_member_api_docs

import 'package:dartz/dartz.dart';

import 'package:stadata_flutter_sdk/src/base/usecase.dart';
import 'package:stadata_flutter_sdk/src/core/core.dart';
import 'package:stadata_flutter_sdk/src/features/features.dart';
import 'package:stadata_flutter_sdk/src/shared/shared.dart';

class GetAllSubjects
    implements
        UseCase<ApiResponse<List<Subject>>, GetAllSubjectsParam,
            SubjectRepository> {
  @override
  Future<Either<Failure, ApiResponse<List<Subject>>>> call(
    GetAllSubjectsParam param,
  ) =>
      repo.get(
        page: param.page,
        lang: param.lang,
        domain: param.domain,
        subjectCategoryID: param.subjectCategoryID,
      );

  @override
  SubjectRepository get repo => injector.get<SubjectRepository>();
}

class GetAllSubjectsParam extends BaseEntity {
  const GetAllSubjectsParam({
    required this.domain,
    this.subjectCategoryID,
    this.lang = DataLanguage.id,
    this.page = 1,
  });
  final String domain;
  final DataLanguage lang;
  final int page;
  final int? subjectCategoryID;
  @override
  List<Object?> get props => [domain, lang, page, subjectCategoryID];
}
