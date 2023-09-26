import 'package:equatable/equatable.dart';

/// Represents a Subject Category, including its unique identifier and name.
///
/// docs: https://webapi.bps.go.id/documentation/#subjectcategories

class SubjectCategory extends Equatable {
  /// Constructs a new instance of [SubjectCategory]
  ///
  /// - [id]: The unique identifier for the news category.
  /// - [name]: The name of the subject category.
  const SubjectCategory({
    required this.id,
    required this.name,
  });

  /// id of the subject category
  final int id;

  /// name of the subject category
  final String name;
  @override
  List<Object> get props => [id, name];
}
