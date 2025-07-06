import 'package:stadata_flutter_sdk/src/core/core.dart';

/// Entity class representing news articles from BPS Web API.
///
/// This class maps to the news endpoint:
/// `https://webapi.bps.go.id/v1/api/list/news`
///
/// News articles published by BPS provide timely information about statistical
/// data releases, economic indicators, survey results, and analytical insights
/// related to Indonesian statistics. These articles help disseminate key
/// statistical findings to the public, media, and policy makers.
///
/// News content covers various topics including:
/// - Economic indicators (GDP, inflation, trade balance)
/// - Social statistics (population, education, health)
/// - Regional statistics (provincial and local data)
/// - Survey results and methodology updates
/// - Statistical calendar and release schedules
///
/// Each news article includes rich media content with accompanying images
/// and is categorized for easy discovery and organization.
///
/// Documentation: https://webapi.bps.go.id/documentation/#news
class News extends BaseEntity {
  /// Creates a new [News] instance.
  const News({
    required this.id,
    required this.title,
    required this.content,
    required this.releaseDate,
    required this.picture,
    required this.categoryID,
    required this.category,
  });

  /// Constructs a new instance of [News] using the deprecated properties.

  factory News.deprecated({
    required int id,
    required String title,
    required String content,
    required DateTime releaseDate,
    required String picture,
    @Deprecated('use categoryID instead') required String categoryId,
    required String category,
  }) => News(
    id: id,
    title: title,
    content: content,
    releaseDate: releaseDate,
    picture: picture,
    categoryID: categoryId,
    category: category,
  );

  /// Unique identifier for the news article
  final int id;

  /// Identifier for the thematic category this news belongs to
  @Deprecated('use categoryID instead')
  String get categoryId => categoryID;

  /// Standardized category identifier for organizing news by topic
  ///
  /// Links to news categories such as economic indicators, social statistics,
  /// regional data, or methodological updates for systematic organization.
  final String categoryID;

  /// Human-readable name of the news category
  ///
  /// Examples: "Ekonomi" (Economy), "Sosial" (Social), "Kependudukan" (Population),
  /// "Metodologi" (Methodology), "Regional" (Regional Statistics)
  final String category;

  /// Headline title of the news article
  ///
  /// Concise and informative title summarizing the main statistical news.
  /// Examples: "Inflasi Februari 2024 Sebesar 0,43 Persen",
  /// "Hasil Survei Angkatan Kerja Nasional Agustus 2024"
  final String title;

  /// Complete article content in HTML format
  ///
  /// Full text of the news article including statistical data, analysis,
  /// methodology notes, and contextual information. Content may include
  /// embedded HTML formatting for proper display.
  final String content;

  /// Publication date when the news article was officially released
  ///
  /// Represents the official publication timestamp for news chronology
  /// and allows users to track the timeliness of statistical information.
  final DateTime releaseDate;

  /// URL of the featured image accompanying the news article
  ///
  /// Points to the main visual content that illustrates or summarizes
  /// the statistical information, typically charts, graphs, or infographics.
  final String picture;

  @override
  List<Object> get props => [
    id,
    categoryID,
    category,
    title,
    content,
    releaseDate,
    picture,
  ];
}
