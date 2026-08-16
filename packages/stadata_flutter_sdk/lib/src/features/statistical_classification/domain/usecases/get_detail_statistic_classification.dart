import 'package:stadata_flutter_sdk/src/base/usecase.dart';
import 'package:stadata_flutter_sdk/src/core/core.dart';
import 'package:stadata_flutter_sdk/src/features/features.dart';
import 'package:stadata_flutter_sdk/src/shared/shared.dart';

class GetDetailStatisticClassification
    implements
        UseCase<
          ApiResponse<List<StatisticClassification>>,
          GetDetailStatisticClassificationParam,
          StatisticClassificationRepository
        > {
  @override
  Future<Result<Failure, ApiResponse<List<StatisticClassification>>>> call(
    GetDetailStatisticClassificationParam param,
  ) => repo.detail(
    id: param.id,
    type: param.type,
    lang: param.lang,
    page: param.page,
    perPage: param.perPage,
  );

  @override
  StatisticClassificationRepository get repo =>
      injector.get<StatisticClassificationRepository>();
}

class const GetDetailStatisticClassificationParam({
  required final String id,
  required final ClassificationType type,
  final DataLanguage lang = DataLanguage.id,
  final int page = 1,
  final int perPage = 10,
}) extends BaseEntity {
  @override
  List<Object?> get props => [id, type, lang, page, perPage];
}
