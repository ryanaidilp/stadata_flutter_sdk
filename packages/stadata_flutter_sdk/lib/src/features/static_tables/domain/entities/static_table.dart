import 'package:stadata_flutter_sdk/src/core/core.dart';

/// Represents a static table data structure.
///
/// A [StaticTable] holds information about a table, including its properties
/// such as [id], [title], [size], [updatedAt], [excel], and optional
/// properties like [subjectID], [subject], [table], and [createdAt].
///
/// The [id] uniquely identifies the table, while [title] describes its title.
/// The [size] property specifies the file size, and [updatedAt] stores
/// the date and time when the table was last updated.
///
/// The [excel] property provides a link or reference to the Excel file
/// associated with this table.
///
/// Optionally, the [subjectID], [subject], [table], and [createdAt]
/// properties can be provided to provide additional context and information
/// about the table.
class StaticTable extends BaseEntity {
  /// Constructor of [StaticTable]
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

  /// The unique identifier of the table.
  final int id;

  /// The title or name of the table.
  final String title;

  /// The optional subject identifier associated with the table.
  int get subjectId => subjectID;

  /// The optional subject identifier associated with the table.
  final int subjectID;

  /// The optional subject name or description.
  final String? subject;

  /// The file size.
  final String size;

  /// The html representation of the table.
  final String? table;

  /// The date and time when the table was last updated.
  final DateTime updatedAt;

  /// The optional date and time when the table was created.
  final DateTime? createdAt;

  /// A link or reference to the associated Excel file for the table.
  final String excel;

  @override
  List<Object?> get props => [
    id,
    title,
    subjectId,
    subject,
    size,
    table,
    updatedAt,
    createdAt,
    excel,
  ];
}
