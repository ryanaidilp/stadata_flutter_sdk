// ignore_for_file: public_member_api_docs

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:stadata_flutter_sdk/src/base/usecase.dart';
import 'package:stadata_flutter_sdk/src/core/di/service_locator.dart';
import 'package:stadata_flutter_sdk/src/core/failures/failures.dart';
import 'package:stadata_flutter_sdk/src/features/static_tables/domain/entities/static_table.dart';
import 'package:stadata_flutter_sdk/src/features/static_tables/domain/repositories/static_table_repository.dart';
import 'package:stadata_flutter_sdk/src/shared/domain/entities/api_response.dart';

import 'package:stadata_flutter_sdk/src/shared/domain/enums/data_language.dart';

@LazySingleton()
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
  StaticTableRepository get repo => getIt<StaticTableRepository>();
}

class GetDetailStaticTableParam extends Equatable {
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
