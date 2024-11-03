import 'package:stadata_flutter_sdk/src/base/usecase.dart';
import 'package:stadata_flutter_sdk/src/core/core.dart';
import 'package:stadata_flutter_sdk/src/features/features.dart';
import 'package:stadata_flutter_sdk/src/shared/shared.dart';

class GetDetailStatisticClassification
    implements
        UseCase<
            ApiResponse<List<StatisticClassification>>,
            GetDetailStatisticClassificationParam,
            StatisticClassificationRepository> {
  @override
  Future<Result<Failure, ApiResponse<List<StatisticClassification>>>> call(
    GetDetailStatisticClassificationParam param,
  ) =>
      repo.detail(
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

class GetDetailStatisticClassificationParam extends BaseEntity {
  final String id;
  final ClassificationType type;
  final DataLanguage lang;
  final int page;
  final int perPage;

  const GetDetailStatisticClassificationParam({
    required this.id,
    required this.type,
    this.lang = DataLanguage.id,
    this.page = 1,
    this.perPage = 10,
  });

  @override
  List<Object?> get props => [id, type, lang, page, perPage];
}
