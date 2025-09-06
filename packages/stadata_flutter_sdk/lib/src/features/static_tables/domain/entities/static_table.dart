import 'package:stadata_flutter_sdk/src/core/core.dart';

/// Entity class representing static tables from BPS Web API.
///
/// This class maps to the static tables endpoint:
/// `https://webapi.bps.go.id/v1/api/list/statictable`
///
/// Static tables are pre-defined tabular datasets maintained by BPS that
/// provide standardized statistical information in a structured format.
/// These tables contain regularly updated statistical data across various
/// domains including economic indicators, demographic statistics, and
/// regional data.
///
/// Static tables serve multiple purposes:
/// - Provide consistent data formats for regular statistical releases
/// - Enable automated data updates and maintenance
/// - Support standardized reporting and analysis workflows
/// - Offer both web display and downloadable Excel formats
/// - Maintain historical data series with version control
///
/// Each static table is organized by subject area and includes comprehensive
/// metadata about data sources, update schedules, and file formats to
/// support reliable data integration and analysis.
///
/// Documentation: https://webapi.bps.go.id/documentation/#static-table
class StaticTable extends BaseEntity {
  /// Creates a new [StaticTable] instance.
  const StaticTable({
    required this.id,
    required this.title,
    required this.size,
    required this.updatedAt,
    required this.excel,
    required this.subjectID,
    this.subject,
    this.table,
    this.createdAt,
  });

  /// Constructs a new instance of [StaticTable] using the
  /// deprecated properties.
  @Deprecated('use subjectID instead')
  factory StaticTable.deprecated({
    required int id,
    required String title,
    required String size,
    required DateTime updatedAt,
    required String excel,
    required int subjectId,
    String? subject,
    String? table,
    DateTime? createdAt,
  }) => StaticTable(
    id: id,
    title: title,
    size: size,
    updatedAt: updatedAt,
    excel: excel,
    subjectID: subjectId,
    subject: subject,
    table: table,
    createdAt: createdAt,
  );

  /// Unique identifier for the static table within BPS system
  final int id;

  /// Descriptive title of the static table
  ///
  /// Provides a clear, human-readable description of the table's content.
  /// Examples: "Indeks Harga Konsumen 2012=100", "Produk Domestik Bruto",
  /// "Jumlah Penduduk Menurut Provinsi"
  final String title;

  /// Statistical subject identifier for thematic organization
  ///
  /// Links this table to broader subject categories such as economic
  /// indicators, demographic statistics, or regional data for systematic
  /// organization and discovery.
  final int subjectID;

  /// Human-readable name of the statistical subject area
  ///
  /// Provides context about the thematic domain this table represents.
  /// Examples: "Indeks Harga", "Kependudukan", "Ekonomi Regional"
  final String? subject;

  /// File size of the downloadable table content
  ///
  /// Indicates the size in human-readable format (e.g., "156 KB", "2.3 MB")
  /// to help users estimate download time and storage requirements.
  final String size;

  /// HTML representation of the table for web display
  ///
  /// Contains formatted HTML markup for displaying the table structure
  /// and data directly in web browsers, including proper formatting
  /// and styling elements.
  final String? table;

  /// Date and time when the table data was last updated
  ///
  /// Tracks the currency of the statistical data to help users understand
  /// data freshness and update cycles for analytical purposes.
  final DateTime updatedAt;

  /// Date and time when the table was initially created
  ///
  /// Optional timestamp indicating when this static table was first
  /// established in the BPS data system for historical tracking.
  final DateTime? createdAt;

  /// Direct download URL for the Excel format of the table
  ///
  /// Provides access to the complete tabular data in Excel format (.xlsx)
  /// for offline analysis, data processing, and integration with other tools.
  final String excel;

  @override
  List<Object?> get props => [
    id,
    title,
    subjectID,
    subject,
    size,
    table,
    updatedAt,
    createdAt,
    excel,
  ];
}
