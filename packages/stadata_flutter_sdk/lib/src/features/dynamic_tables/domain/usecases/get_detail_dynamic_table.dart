import 'package:stadata_flutter_sdk/src/base/usecase.dart';
import 'package:stadata_flutter_sdk/src/core/core.dart';
import 'package:stadata_flutter_sdk/src/features/dynamic_tables/domain/entities/entities.dart';
import 'package:stadata_flutter_sdk/src/features/dynamic_tables/domain/repositories/dynamic_table_repository.dart';
import 'package:stadata_flutter_sdk/src/shared/shared.dart';

/// Use case for retrieving detailed dynamic table data.
///
/// Fetches complete dynamic table information including time series data,
/// vertical variable breakdowns, and all associated metadata for a specific
/// statistical variable.
///
/// Example:
/// ```dart
/// final useCase = GetDetailDynamicTable();
/// final result = await useCase(
///   GetDetailDynamicTableParam(
///     variableID: 123,
///     domain: '7200',
///     period: '2023',
///     lang: DataLanguage.id,
///   ),
/// );
/// ```
class GetDetailDynamicTable
    implements
        UseCase<
          DynamicTable,
          GetDetailDynamicTableParam,
          DynamicTableRepository
        > {
  @override
  Future<Result<Failure, DynamicTable>> call(
    GetDetailDynamicTableParam param,
  ) => repo.detail(
    variableID: param.variableID,
    domain: param.domain,
    period: param.period,
    lang: param.lang,
  );

  @override
  DynamicTableRepository get repo => injector.get<DynamicTableRepository>();
}

/// Parameters for the GetDetailDynamicTable use case.
///
/// Encapsulates all required and optional parameters for retrieving
/// detailed dynamic table data from the BPS API.
class GetDetailDynamicTableParam extends BaseEntity {
  /// Creates a new [GetDetailDynamicTableParam] instance.
  const GetDetailDynamicTableParam({
    required this.variableID,
    required this.domain,
    this.period,
    this.lang = DataLanguage.id,
  });

  /// The unique identifier of the statistical variable (required).
  ///
  /// References the specific variable for which to retrieve table data.
  final int variableID;

  /// Regional domain identifier (required).
  ///
  /// Specifies the regional scope for the table data. Examples:
  /// - "7200" for national level
  /// - "3200" for West Java province
  final String domain;

  /// Time period filter (optional).
  ///
  /// Filters the table data to a specific time period. Format depends
  /// on the variable's periodicity. Examples:
  /// - "2023" for annual data
  /// - "2023Q1" for quarterly data
  /// - "202301" for monthly data
  final String? period;

  /// Data language preference (default: Indonesian).
  ///
  /// Determines the language for table metadata and labels.
  final DataLanguage lang;

  @override
  List<Object?> get props => [variableID, domain, period, lang];
}
