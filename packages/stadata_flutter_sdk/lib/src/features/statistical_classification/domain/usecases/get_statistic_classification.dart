import 'package:stadata_flutter_sdk/src/base/usecase.dart';
import 'package:stadata_flutter_sdk/src/core/core.dart';
import 'package:stadata_flutter_sdk/src/features/features.dart';
import 'package:stadata_flutter_sdk/src/shared/shared.dart';

class GetStatisticClassification
    implements
        UseCase<
          ApiResponse<List<StatisticClassification>>,
          GetStatisticClassificationParam,
          StatisticClassificationRepository
        > {
  @override
  Future<Result<Failure, ApiResponse<List<StatisticClassification>>>> call(
    GetStatisticClassificationParam param,
  ) => repo.get(
    type: param.type,
    level: param.level,
    lang: param.lang,
    page: param.page,
    perPage: param.perPage,
  );

  @override
  StatisticClassificationRepository get repo =>
      injector.get<StatisticClassificationRepository>();
}

class const GetStatisticClassificationParam({
  required final ClassificationType type,
  final ClassificationLevel? level,
  final DataLanguage lang = DataLanguage.id,
  final int page = 1,
  final int perPage = 10,
}) extends BaseEntity {
  @override
  List<Object?> get props => [type, level, lang, page, perPage];
}
