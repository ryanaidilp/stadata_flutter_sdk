// ignore_for_file: public_member_api_docs

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:stadata_flutter_sdk/src/base/usecase.dart';
import 'package:stadata_flutter_sdk/src/core/di/service_locator.dart';
import 'package:stadata_flutter_sdk/src/core/failures/failures.dart';
import 'package:stadata_flutter_sdk/src/features/subjects/domain/repositories/subject_repository.dart';
import 'package:stadata_flutter_sdk/src/shared/domain/entities/api_response.dart';

import 'package:stadata_flutter_sdk/stadata_flutter_sdk.dart';

@LazySingleton()
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
  SubjectRepository get repo => getIt<SubjectRepository>();
}

class GetAllSubjectsParam extends Equatable {
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
