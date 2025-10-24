import 'package:stadata_flutter_sdk/src/core/core.dart';

/// Entity class representing related publications from BPS Web API.
///
/// Related publications are other publications that are thematically or
/// temporally connected to the current publication, typically including:
/// - Previous editions or versions of the same publication series
/// - Publications covering similar topics or indicators
/// - Updated or revised versions
///
/// This helps users discover relevant publications and track publication
/// series over time.
class RelatedPublication extends BaseEntity {
  /// Creates a new [RelatedPublication] instance.
  const RelatedPublication({
    required this.id,
    required this.title,
    required this.releaseDate,
    required this.url,
    required this.cover,
  });

  /// Unique identifier for the related publication
  final String id;

  /// Title of the related publication
  final String title;

  /// Release date of the related publication
  final DateTime releaseDate;

  /// Direct URL to access the related publication on BPS website
  ///
  /// This URL points to the publication detail page where users can
  /// view metadata and download the publication.
  final String url;

  /// URL of the publication's cover image
  ///
  /// Points to the cover image file for visual identification of
  /// the related publication.
  final String cover;

  @override
  List<Object?> get props => [
    id,
    title,
    releaseDate,
    url,
    cover,
  ];
}
