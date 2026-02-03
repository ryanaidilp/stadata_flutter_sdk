import 'package:stadata_flutter_sdk/src/base/usecase.dart';
import 'package:stadata_flutter_sdk/src/core/core.dart';
import 'package:stadata_flutter_sdk/src/features/dynamic_tables/domain/entities/entities.dart';
import 'package:stadata_flutter_sdk/src/features/dynamic_tables/domain/repositories/dynamic_table_repository.dart';
import 'package:stadata_flutter_sdk/src/shared/shared.dart';

/// Use case for retrieving all available dynamic tables.
///
/// Fetches a paginated list of dynamic table metadata from the BPS API,
/// providing information about available variables and their table structures
/// for a specific domain and language.
///
/// Example:
/// ```dart
/// final useCase = GetAllDynamicTables();
/// final result = await useCase(
///   GetAllDynamicTablesParam(
///     domain: '7200',
///     lang: DataLanguage.en,
///   ),
/// );
/// ```
class GetAllDynamicTables
    implements
        UseCase<
          ApiResponse<List<DynamicTable>>,
          GetAllDynamicTablesParam,
          DynamicTableRepository
        > {
  @override
  Future<Result<Failure, ApiResponse<List<DynamicTable>>>> call(
    GetAllDynamicTablesParam param,
  ) => repo.getAll(
    domain: param.domain,
    page: param.page,
    lang: param.lang,
  );

  @override
  DynamicTableRepository get repo => injector.get<DynamicTableRepository>();
}

/// Parameters for the GetAllDynamicTables use case.
///
/// Encapsulates all required and optional parameters for retrieving
/// a list of dynamic tables from the BPS API.
class GetAllDynamicTablesParam extends BaseEntity {
  /// Creates a new [GetAllDynamicTablesParam] instance.
  const GetAllDynamicTablesParam({
    required this.domain,
    this.lang = DataLanguage.id,
    this.page = 1,
  });

  /// Regional domain identifier (required).
  ///
  /// Specifies the regional scope for the tables. Examples:
  /// - "7200" for national level
  /// - "3200" for West Java province
  final String domain;

  /// Data language preference (default: Indonesian).
  ///
  /// Determines the language for table metadata and labels.
  final DataLanguage lang;

  /// Page number for pagination (default: 1).
  ///
  /// Used to retrieve specific pages in paginated results.
  final int page;

  @override
  List<Object?> get props => [domain, lang, page];
}
