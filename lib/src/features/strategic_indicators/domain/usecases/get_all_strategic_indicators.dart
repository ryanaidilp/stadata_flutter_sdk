// ignore_for_file: public_member_api_docs

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:stadata_flutter_sdk/src/base/usecase.dart';
import 'package:stadata_flutter_sdk/src/core/di/service_locator.dart';
import 'package:stadata_flutter_sdk/src/core/failures/failures.dart';
import 'package:stadata_flutter_sdk/src/features/strategic_indicators/strategic_indicators.dart';
import 'package:stadata_flutter_sdk/src/shared/domain/entities/api_response.dart';

import 'package:stadata_flutter_sdk/stadata_flutter_sdk.dart';

@LazySingleton()
class GetAllStrategicIndicators
    implements
        UseCase<ApiResponse<List<StrategicIndicator>>,
            GetAllStrategicIndicatorsParam, StrategicIndicatorRepository> {
  @override
  Future<Either<Failure, ApiResponse<List<StrategicIndicator>>>> call(
    GetAllStrategicIndicatorsParam param,
  ) =>
      repo.get(
        page: param.page,
        lang: param.lang,
        domain: param.domain,
        variableID: param.variableID,
      );

  @override
  StrategicIndicatorRepository get repo =>
      getIt<StrategicIndicatorRepository>();
}

class GetAllStrategicIndicatorsParam extends Equatable {
  const GetAllStrategicIndicatorsParam({
    required this.domain,
    this.page = 1,
    this.lang = DataLanguage.id,
    this.variableID,
  });

  final int page;
  final String domain;
  final DataLanguage lang;
  final int? variableID;
  @override
  List<Object?> get props => [domain, lang, variableID, page];
}
