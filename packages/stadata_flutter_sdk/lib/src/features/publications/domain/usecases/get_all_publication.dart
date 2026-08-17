import 'package:stadata_flutter_sdk/src/base/usecase.dart';
import 'package:stadata_flutter_sdk/src/core/core.dart';
import 'package:stadata_flutter_sdk/src/features/features.dart';
import 'package:stadata_flutter_sdk/src/shared/shared.dart';

/// A use case for fetching a list of publications.

class GetAllPublication
    implements
        UseCase<
          ApiResponse<List<Publication>>,
          GetPublicationParam,
          PublicationRepository
        > {
  @override
  Future<Result<Failure, ApiResponse<List<Publication>>>> call(
    GetPublicationParam param,
  ) => repo.get(
    domain: param.domain,
    keyword: param.keyword,
    lang: param.lang,
    month: param.month,
    page: param.page,
    year: param.year,
  );

  @override
  PublicationRepository get repo => injector.get<PublicationRepository>();
}

/// Parameters for fetching publications.
class const GetPublicationParam({
  /// The domain for which publications are requested.
  required final String domain,

  /// The data language for the request.
  final DataLanguage lang = DataLanguage.id,

  /// The page number to retrieve.
  final int page = 1,

  /// A keyword to filter publications by.
  final String? keyword,

  /// The month to filter publications by.
  final int? month,

  /// The year to filter publications by.
  final int? year,
}) extends BaseEntity {
  @override
  List<Object?> get props {
    return [domain, lang, page, keyword, month, year];
  }
}
