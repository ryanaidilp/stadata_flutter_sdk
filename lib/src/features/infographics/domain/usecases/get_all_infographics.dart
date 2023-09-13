// ignore_for_file: public_member_api_docs

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import 'package:stadata_flutter_sdk/src/base/usecase.dart';
import 'package:stadata_flutter_sdk/src/core/di/service_locator.dart';
import 'package:stadata_flutter_sdk/src/core/failures/failures.dart';
import 'package:stadata_flutter_sdk/src/features/infographics/domain/entities/infographic.dart';
import 'package:stadata_flutter_sdk/src/features/infographics/domain/repositories/infographic_repository.dart';
import 'package:stadata_flutter_sdk/src/shared/domain/entities/api_response.dart';
import 'package:stadata_flutter_sdk/src/shared/domain/enums/data_language.dart';

@LazySingleton()
class GetAllInfographics
    implements
        UseCase<ApiResponse<List<Infographic>>, InfographicParam,
            InfographicRepository> {
  @override
  Future<Either<Failure, ApiResponse<List<Infographic>>>> call(
    InfographicParam param,
  ) =>
      repo.get(
        domain: param.domain,
        lang: param.lang,
        keyword: param.keyword,
        page: param.page,
      );

  @override
  InfographicRepository get repo => getIt<InfographicRepository>();
}

class InfographicParam extends Equatable {
  const InfographicParam({
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
