// ignore_for_file: public_member_api_docs

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import 'package:stadata_flutter_sdk/src/base/usecase.dart';
import 'package:stadata_flutter_sdk/src/core/di/injector.dart';
import 'package:stadata_flutter_sdk/src/core/failures/failures.dart';
import 'package:stadata_flutter_sdk/src/features/static_tables/domain/entities/static_table.dart';
import 'package:stadata_flutter_sdk/src/features/static_tables/domain/repositories/static_table_repository.dart';
import 'package:stadata_flutter_sdk/src/shared/domain/entities/api_response.dart';
import 'package:stadata_flutter_sdk/src/shared/domain/enums/data_language.dart';

class GetAllStaticTables
    implements
        UseCase<ApiResponse<List<StaticTable>>, GetAllStaticTableParams,
            StaticTableRepository> {
  @override
  Future<Either<Failure, ApiResponse<List<StaticTable>>>> call(
    GetAllStaticTableParams param,
  ) =>
      repo.get(
        domain: param.domain,
        page: param.page,
        lang: param.lang,
        month: param.month,
        year: param.year,
        keyword: param.keyword,
      );

  @override
  StaticTableRepository get repo => injector.get<StaticTableRepository>();
}

class GetAllStaticTableParams extends Equatable {
  const GetAllStaticTableParams({
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
  List<Object?> get props {
    return [
      domain,
      lang,
      page,
      month,
      year,
      keyword,
    ];
  }
}
