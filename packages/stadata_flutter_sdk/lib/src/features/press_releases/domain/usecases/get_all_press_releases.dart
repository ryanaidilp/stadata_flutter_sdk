// ignore_for_file: public_member_api_docs

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:stadata_flutter_sdk/src/base/usecase.dart';
import 'package:stadata_flutter_sdk/src/core/core.dart';
import 'package:stadata_flutter_sdk/src/features/features.dart';
import 'package:stadata_flutter_sdk/src/shared/shared.dart';

class GetAllPressReleases
    implements
        UseCase<ApiResponse<List<PressRelease>>, GetAllPressReleasesParam,
            PressReleaseRepository> {
  @override
  Future<Either<Failure, ApiResponse<List<PressRelease>>>> call(
    GetAllPressReleasesParam param,
  ) =>
      repo.get(
        page: param.page,
        year: param.year,
        lang: param.lang,
        month: param.month,
        domain: param.domain,
        keyword: param.keyword,
      );

  @override
  PressReleaseRepository get repo => injector.get<PressReleaseRepository>();
}

class GetAllPressReleasesParam extends Equatable {
  const GetAllPressReleasesParam({
    required this.domain,
    this.lang = DataLanguage.id,
    this.page = 1,
    this.month,
    this.year,
    this.keyword,
  });

  final String domain;
  final DataLanguage lang;
  final int page;
  final int? month;
  final int? year;
  final String? keyword;

  @override
  List<Object?> get props => [domain, lang, page, month, year, keyword];
}
