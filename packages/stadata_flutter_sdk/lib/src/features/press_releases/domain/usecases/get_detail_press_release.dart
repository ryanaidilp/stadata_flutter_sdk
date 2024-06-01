// ignore_for_file: public_member_api_docs

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:stadata_flutter_sdk/src/base/usecase.dart';
import 'package:stadata_flutter_sdk/src/core/core.dart';
import 'package:stadata_flutter_sdk/src/features/features.dart';
import 'package:stadata_flutter_sdk/src/shared/shared.dart';

class GetDetailPressRelease
    implements
        UseCase<ApiResponse<PressRelease>, GetDetailPressReleaseParam,
            PressReleaseRepository> {
  @override
  Future<Either<Failure, ApiResponse<PressRelease>>> call(
    GetDetailPressReleaseParam param,
  ) =>
      repo.detail(
        id: param.id,
        lang: param.lang,
        domain: param.domain,
      );

  @override
  PressReleaseRepository get repo => injector.get<PressReleaseRepository>();
}

class GetDetailPressReleaseParam extends Equatable {
  const GetDetailPressReleaseParam({
    required this.id,
    required this.domain,
    this.lang = DataLanguage.id,
  });

  final int id;
  final String domain;
  final DataLanguage lang;

  @override
  List<Object> get props => [id, domain, lang];
}
