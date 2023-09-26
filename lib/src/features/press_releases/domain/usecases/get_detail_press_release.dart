// ignore_for_file: public_member_api_docs

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:stadata_flutter_sdk/src/base/usecase.dart';
import 'package:stadata_flutter_sdk/src/core/di/service_locator.dart';
import 'package:stadata_flutter_sdk/src/core/failures/failures.dart';
import 'package:stadata_flutter_sdk/src/features/press_releases/domain/repositories/press_release_repository.dart';
import 'package:stadata_flutter_sdk/src/shared/domain/entities/api_response.dart';

import 'package:stadata_flutter_sdk/stadata_flutter_sdk.dart';

@LazySingleton()
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
  PressReleaseRepository get repo => getIt<PressReleaseRepository>();
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
