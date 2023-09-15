import 'package:equatable/equatable.dart';

/// Represents a static table data structure.
///
/// A [StaticTable] holds information about a table, including its properties
/// such as [id], [title], [size], [updatedAt], [excel], and optional
/// properties like [subjectId], [subject], [table], and [createdAt].
///
/// The [id] uniquely identifies the table, while [title] describes its title.
/// The [size] property specifies the file size, and [updatedAt] stores
/// the date and time when the table was last updated.
///
/// The [excel] property provides a link or reference to the Excel file
/// associated with this table.
///
/// Optionally, the [subjectId], [subject], [table], and [createdAt]
/// properties can be provided to provide additional context and information
/// about the table.
class StaticTable extends Equatable {
  /// Constructor of [StaticTable]
  const StaticTable({
    required this.id,
    required this.title,
    required this.size,
    required this.updatedAt,
    required this.excel,
    required this.subjectId,
    this.subject,
    this.table,
    this.createdAt,
  });

  /// The unique identifier of the table.
  final int id;

  /// The title or name of the table.
  final String title;

  /// The optional subject identifier associated with the table.
  final int subjectId;

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
  List<Object?> get props {
    return [
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
}
