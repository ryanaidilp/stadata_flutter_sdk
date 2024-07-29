// ignore_for_file: public_member_api_docs

import 'package:dartz/dartz.dart';

import 'package:stadata_flutter_sdk/src/base/usecase.dart';
import 'package:stadata_flutter_sdk/src/core/core.dart';
import 'package:stadata_flutter_sdk/src/features/features.dart';
import 'package:stadata_flutter_sdk/src/shared/shared.dart';

class GetAllVariables
    implements
        UseCase<ApiResponse<List<Variable>>, GetAllVariablesParam,
            VariableRepository> {
  @override
  Future<Either<Failure, ApiResponse<List<Variable>>>> call(
    GetAllVariablesParam param,
  ) =>
      repo.get(
        lang: param.lang,
        page: param.page,
        year: param.year,
        domain: param.domain,
        subjectID: param.subjectID,
        showExistingVariables: param.showExistingVariables,
      );

  @override
  VariableRepository get repo => injector.get<VariableRepository>();
}

class GetAllVariablesParam extends BaseEntity {
  const GetAllVariablesParam({
    required this.domain,
    this.lang = DataLanguage.id,
    this.page = 1,
    this.showExistingVariables = false,
    this.year,
    this.subjectID,
  });
  final String domain;
  final DataLanguage lang;
  final int page;
  final bool showExistingVariables;
  final int? year;
  final int? subjectID;

  @override
  List<Object?> get props {
    return [
      domain,
      lang,
      page,
      showExistingVariables,
      year,
      subjectID,
    ];
  }
}
