// ignore_for_file: public_member_api_docs

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import 'package:stadata_flutter_sdk/src/base/usecase.dart';
import 'package:stadata_flutter_sdk/src/core/core.dart';
import 'package:stadata_flutter_sdk/src/features/features.dart';
import 'package:stadata_flutter_sdk/src/shared/shared.dart';

class GetAllUnits
    implements
        UseCase<ApiResponse<List<UnitData>>, GetAllUnitsParam,
            UnitDataRepository> {
  @override
  Future<Either<Failure, ApiResponse<List<UnitData>>>> call(
    GetAllUnitsParam param,
  ) =>
      repo.get(
        domain: param.domain,
        page: param.page,
        lang: param.lang,
        variableID: param.variableID,
      );

  @override
  UnitDataRepository get repo => injector.get<UnitDataRepository>();
}

class GetAllUnitsParam extends Equatable {
  const GetAllUnitsParam({
    required this.domain,
    this.lang = DataLanguage.id,
    this.page = 1,
    this.variableID,
  });
  final String domain;
  final DataLanguage lang;
  final int page;
  final int? variableID;
  @override
  List<Object?> get props => [domain, lang, page, variableID];
}
