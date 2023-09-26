import 'package:equatable/equatable.dart';
import 'package:stadata_flutter_sdk/stadata_flutter_sdk.dart';

/// Represents a Subject, including its id, name, category, and nTable
///
/// [docs]: https://webapi.bps.go.id/documentation/#subject
class Subject extends Equatable {
  /// Constructs a new instance of [Subject]
  ///
  /// - [id]: The unique identifier for the Subject.
  /// - [name]: The name of the subject.
  /// - [category]: Category of the subject.
  /// - [nTable]: Sum of table on each subject
  const Subject({
    required this.id,
    required this.name,
    this.category,
    this.nTable,
  });

  /// Represents the unique identifier of the Subject.
  final int id;

  /// Represents the name of the Subject.
  final String name;

  /// Represent the category of the Subject.
  final SubjectCategory? category;

  /// Sum of the table on this subject.
  final int? nTable;

  @override
  List<Object?> get props => [id, name, category, nTable];
}
