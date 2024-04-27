import 'package:equatable/equatable.dart';

/// A data class representing an infographic.
///
/// An infographic contains information about its ID, title, image URL,
/// description, category, and download URL.
class Infographic extends Equatable {
  /// Creates an instance of [Infographic] with the given details.
  ///
  /// - [id]: The unique identifier of the infographic.
  /// - [title]: The title or name of the infographic.
  /// - [image]: The URL of the image associated with the infographic.
  /// - [description]: A brief description  of the infographic's content.
  /// - [category]: The category or topic to which the infographic belongs.
  /// - [downloadUrl]: The URL from which the infographic can be downloaded.
  const Infographic({
    required this.id,
    required this.title,
    required this.image,
    required this.category,
    required this.downloadUrl,
    this.description,
  });

  /// The unique identifier of the infographic.
  final int id;

  /// The title or name of the infographic.
  final String title;

  /// The URL of the image associated with the infographic.
  final String image;

  /// A brief description or summary of the infographic's content.
  final String? description;

  /// The category or topic to which the infographic belongs.
  final int category;

  /// The URL from which the infographic can be downloaded.
  final String downloadUrl;

  @override
  List<Object?> get props {
    return [
      id,
      title,
      image,
      description,
      category,
      downloadUrl,
    ];
  }
}
