// ignore_for_file: public_member_api_docs

import 'package:dartz/dartz.dart';

import 'package:stadata_flutter_sdk/src/base/usecase.dart';
import 'package:stadata_flutter_sdk/src/core/core.dart';
import 'package:stadata_flutter_sdk/src/features/features.dart';
import 'package:stadata_flutter_sdk/src/shared/shared.dart';

class GetDetailStaticTable
    implements
        UseCase<ApiResponse<StaticTable>, GetDetailStaticTableParam,
            StaticTableRepository> {
  @override
  Future<Either<Failure, ApiResponse<StaticTable>>> call(
    GetDetailStaticTableParam param,
  ) =>
      repo.detail(
        id: param.id,
        domain: param.domain,
        lang: param.lang,
      );

  @override
  StaticTableRepository get repo => injector.get<StaticTableRepository>();
}

class GetDetailStaticTableParam extends BaseEntity {
  const GetDetailStaticTableParam({
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
