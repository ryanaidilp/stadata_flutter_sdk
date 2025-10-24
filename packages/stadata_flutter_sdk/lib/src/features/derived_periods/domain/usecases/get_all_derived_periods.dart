import 'package:stadata_flutter_sdk/src/base/usecase.dart';
import 'package:stadata_flutter_sdk/src/core/core.dart';
import 'package:stadata_flutter_sdk/src/features/features.dart';
import 'package:stadata_flutter_sdk/src/shared/shared.dart';

/// Use case for retrieving all derived periods from the BPS API.
class GetAllDerivedPeriods
    implements
        UseCase<
          ApiResponse<List<DerivedPeriod>>,
          GetAllDerivedPeriodsParam,
          DerivedPeriodRepository
        > {
  @override
  Future<Result<Failure, ApiResponse<List<DerivedPeriod>>>> call(
    GetAllDerivedPeriodsParam param,
  ) => repo.get(
    lang: param.lang,
    page: param.page,
    domain: param.domain,
    variableID: param.variableID,
  );

  @override
  DerivedPeriodRepository get repo => injector.get<DerivedPeriodRepository>();
}

/// Parameters for the [GetAllDerivedPeriods] use case.
class GetAllDerivedPeriodsParam extends BaseEntity {
  /// Creates parameters for fetching derived periods.
  const GetAllDerivedPeriodsParam({
    required this.domain,
    this.lang = DataLanguage.id,
    this.page = 1,
    this.variableID,
  });

  /// The area code for which to fetch derived periods
  final String domain;

  /// Language preference for the data
  final DataLanguage lang;

  /// Page number for pagination
  final int page;

  /// Optional variable ID to filter derived periods
  final int? variableID;

  @override
  List<Object?> get props => [domain, lang, page, variableID];
}
