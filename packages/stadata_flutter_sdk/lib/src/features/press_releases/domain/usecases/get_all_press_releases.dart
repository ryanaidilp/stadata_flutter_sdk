import 'package:stadata_flutter_sdk/src/base/usecase.dart';
import 'package:stadata_flutter_sdk/src/core/core.dart';
import 'package:stadata_flutter_sdk/src/features/features.dart';
import 'package:stadata_flutter_sdk/src/shared/shared.dart';

class GetAllPressReleases
    implements
        UseCase<
          ApiResponse<List<PressRelease>>,
          GetAllPressReleasesParam,
          PressReleaseRepository
        > {
  @override
  Future<Result<Failure, ApiResponse<List<PressRelease>>>> call(
    GetAllPressReleasesParam param,
  ) => repo.get(
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

class const GetAllPressReleasesParam({
  required final String domain,
  final DataLanguage lang = DataLanguage.id,
  final int page = 1,
  final int? month,
  final int? year,
  final String? keyword,
}) extends BaseEntity {
  @override
  List<Object?> get props => [domain, lang, page, month, year, keyword];
}
