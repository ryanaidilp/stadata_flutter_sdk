import 'package:equatable/equatable.dart';

/// Represents a news category, including its unique identifier and name.
class NewsCategory extends Equatable {
  /// Constructs a new instance of [NewsCategory].
  ///
  /// - [id]: The unique identifier for the news category.
  /// - [name]: The name of the news category.
  const NewsCategory({
    required this.id,
    required this.name,
  });

  /// Represents the unique identifier of the news category.
  final String id;

  /// Represents the name of the news category.
  final String name;

  @override
  List<Object> get props => [id, name];
}
