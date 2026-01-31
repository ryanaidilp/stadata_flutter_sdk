import 'package:stadata_flutter_sdk/src/base/usecase.dart';
import 'package:stadata_flutter_sdk/src/core/core.dart';
import 'package:stadata_flutter_sdk/src/features/tables/domain/entities/table_metadata.dart';
import 'package:stadata_flutter_sdk/src/features/tables/domain/repositories/table_repository.dart';
import 'package:stadata_flutter_sdk/src/shared/shared.dart';

/// Use case for retrieving table metadata.
///
/// Implements the business logic for fetching and determining table type
/// metadata. This use case is the entry point for the unified table
/// navigation pattern, allowing applications to dynamically route to
/// appropriate table views based on runtime metadata.
class GetTableMetadata
    implements UseCase<TableMetadata, GetTableMetadataParams, TableRepository> {
  @override
  Future<Result<Failure, TableMetadata>> call(
    GetTableMetadataParams param,
  ) => repo.getTableMetadata(
    id: param.id,
    domain: param.domain,
    lang: param.lang,
  );

  @override
  TableRepository get repo => injector.get<TableRepository>();
}

/// Parameters for [GetTableMetadata] use case.
///
/// Encapsulates all required information to fetch table metadata.
class GetTableMetadataParams extends BaseEntity {
  /// Creates parameters for table metadata retrieval.
  const GetTableMetadataParams({
    required this.id,
    required this.domain,
    this.lang = DataLanguage.id,
  });

  /// Unique identifier for the table.
  final String id;

  /// Regional domain identifier.
  ///
  /// Examples:
  /// - "0000" for national data
  /// - "3200" for West Java province
  /// - "3273" for Bandung city
  final String domain;

  /// Data language preference.
  final DataLanguage lang;

  @override
  List<Object?> get props => [id, domain, lang];
}
