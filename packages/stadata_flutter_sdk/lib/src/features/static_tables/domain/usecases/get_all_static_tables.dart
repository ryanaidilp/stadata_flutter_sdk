import 'package:stadata_flutter_sdk/src/base/usecase.dart';
import 'package:stadata_flutter_sdk/src/core/core.dart';
import 'package:stadata_flutter_sdk/src/features/features.dart';
import 'package:stadata_flutter_sdk/src/shared/shared.dart';

class GetAllStaticTables
    implements
        UseCase<ApiResponse<List<StaticTable>>, GetAllStaticTableParams,
            StaticTableRepository> {
  @override
  Future<Result<Failure, ApiResponse<List<StaticTable>>>> call(
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

class GetAllStaticTableParams extends BaseEntity {
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
