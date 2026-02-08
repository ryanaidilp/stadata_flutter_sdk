import 'package:stadata_flutter_sdk/src/core/core.dart';

/// Entity class representing infographics from BPS Web API.
///
/// This class maps to the infographics endpoint:
/// `https://webapi.bps.go.id/v1/api/list/infographic`
///
/// Infographics are visual representations of statistical data created by BPS
/// to make complex statistics more accessible and understandable to the public.
/// They cover various topics including demographics, economy, social indicators,
/// and regional statistics.
///
/// Each infographic provides downloadable content in various formats and
/// includes metadata such as category classification for easy discovery
/// and organization of statistical visualizations.
///
/// Documentation: https://webapi.bps.go.id/documentation/#infographic
class Infographic extends BaseEntity {
  /// Creates a new [Infographic] instance.
  const Infographic({
    required this.id,
    required this.title,
    required this.image,
    required this.category,
    required this.downloadUrl,
    this.description,
  });

  /// Unique identifier for the infographic
  final int id;

  /// Descriptive title of the infographic
  ///
  /// Examples: "Jumlah Penduduk Indonesia 2023", "Inflasi Bulanan",
  /// "Tingkat Pengangguran Terbuka"
  final String title;

  /// URL of the preview image for the infographic
  ///
  /// Points to a thumbnail or preview image that represents the infographic
  /// content, typically in JPG or PNG format hosted on BPS servers.
  final String image;

  /// Optional detailed description of the infographic's content and scope
  ///
  /// Provides additional context about the data visualization,
  /// methodology, time period covered, or key insights presented.
  final String? description;

  /// Category identifier for organizing infographics by topic
  ///
  /// Links to thematic categories such as population (kependudukan),
  /// economy (ekonomi), social welfare (kesejahteraan sosial), etc.
  final int category;

  /// Direct download URL for the full infographic file
  ///
  /// Points to the high-resolution downloadable version of the infographic,
  /// typically in PDF or high-quality image format for printing and sharing.
  final String downloadUrl;

  @override
  List<Object?> get props => [
    id,
    title,
    image,
    description,
    category,
    downloadUrl,
  ];
}
