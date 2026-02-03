import 'package:stadata_flutter_sdk/src/base/usecase.dart';
import 'package:stadata_flutter_sdk/src/core/core.dart';
import 'package:stadata_flutter_sdk/src/features/features.dart';
import 'package:stadata_flutter_sdk/src/shared/shared.dart';

/// Use case for retrieving all periods from the BPS API.
///
/// This use case orchestrates the business logic for fetching period data,
/// delegating to the repository for actual data retrieval.
class GetAllPeriods
    implements
        UseCase<
          ApiResponse<List<Period>>,
          GetAllPeriodsParam,
          PeriodRepository
        > {
  @override
  Future<Result<Failure, ApiResponse<List<Period>>>> call(
    GetAllPeriodsParam param,
  ) => repo.get(
    lang: param.lang,
    page: param.page,
    domain: param.domain,
    variableID: param.variableID,
  );

  @override
  PeriodRepository get repo => injector.get<PeriodRepository>();
}

/// Parameters for the [GetAllPeriods] use case.
///
/// Encapsulates all input parameters required to fetch periods.
class GetAllPeriodsParam extends BaseEntity {
  /// Creates parameters for fetching periods.
  const GetAllPeriodsParam({
    required this.domain,
    this.lang = DataLanguage.id,
    this.page = 1,
    this.variableID,
  });

  /// The area code for which to fetch periods
  final String domain;

  /// Language preference for the data
  final DataLanguage lang;

  /// Page number for pagination
  final int page;

  /// Optional variable ID to filter periods
  final int? variableID;

  @override
  List<Object?> get props => [domain, lang, page, variableID];
}
