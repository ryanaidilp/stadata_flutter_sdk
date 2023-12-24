// ignore_for_file: public_member_api_docs

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:stadata_flutter_sdk/src/base/usecase.dart';
import 'package:stadata_flutter_sdk/src/core/di/service_locator.dart';
import 'package:stadata_flutter_sdk/src/core/failures/failures.dart';
import 'package:stadata_flutter_sdk/src/features/vertical_variables/domain/repositories/vertical_variable_repository.dart';
import 'package:stadata_flutter_sdk/src/shared/domain/entities/api_response.dart';

import 'package:stadata_flutter_sdk/stadata_flutter_sdk.dart';

@LazySingleton()
class GetAllVerticalVariables
    implements
        UseCase<ApiResponse<List<VerticalVariable>>,
            GetAllVerticalVariablesParam, VerticalVariableRepository> {
  @override
  Future<Either<Failure, ApiResponse<List<VerticalVariable>>>> call(
    GetAllVerticalVariablesParam param,
  ) =>
      repo.get(
        domain: param.domain,
        lang: param.lang,
        page: param.page,
        variableID: param.variableID,
      );

  @override
  VerticalVariableRepository get repo => getIt<VerticalVariableRepository>();
}

class GetAllVerticalVariablesParam extends Equatable {
  const GetAllVerticalVariablesParam({
    required this.domain,
    this.page = 1,
    this.lang = DataLanguage.id,
    this.variableID,
  });
  final String domain;
  final int page;
  final DataLanguage lang;
  final int? variableID;

  @override
  List<Object?> get props => [domain, page, lang, variableID];
}
