import 'package:stadata_flutter_sdk/src/base/usecase.dart';
import 'package:stadata_flutter_sdk/src/core/core.dart';
import 'package:stadata_flutter_sdk/src/features/features.dart';
import 'package:stadata_flutter_sdk/src/shared/shared.dart';

class GetDetailStaticTable
    implements
        UseCase<
          ApiResponse<StaticTable>,
          GetDetailStaticTableParam,
          StaticTableRepository
        > {
  @override
  Future<Result<Failure, ApiResponse<StaticTable>>> call(
    GetDetailStaticTableParam param,
  ) => repo.detail(id: param.id, domain: param.domain, lang: param.lang);

  @override
  StaticTableRepository get repo => injector.get<StaticTableRepository>();
}

class const GetDetailStaticTableParam({
  required final int id,
  required final String domain,
  final DataLanguage lang = DataLanguage.id,
}) extends BaseEntity {
  @override
  List<Object> get props => [id, domain, lang];
}
