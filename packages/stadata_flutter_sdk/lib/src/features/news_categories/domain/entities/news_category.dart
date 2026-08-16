import 'package:stadata_flutter_sdk/src/core/core.dart';

/// Entity class representing news categories from BPS Web API.
///
/// This class maps to the news categories endpoint:
/// `https://webapi.bps.go.id/v1/api/list/newscategory`
///
/// News categories provide thematic organization for BPS news articles,
/// enabling users to filter and discover statistical news by subject area.
/// Categories reflect the main domains of statistical work conducted by BPS.
///
/// Common news categories include:
/// - Ekonomi (Economy) - GDP, inflation, trade, business statistics
/// - Sosial (Social) - education, health, welfare indicators
/// - Kependudukan (Population) - demographic trends, migration, census data
/// - Pertanian (Agriculture) - agricultural production, food security
/// - Industri (Industry) - manufacturing, industrial production indices
/// - Regional - provincial and local government statistics
/// - Metodologi (Methodology) - survey methods, data quality, standards
///
/// Each category serves as a classification system that helps journalists,
/// researchers, and policymakers quickly locate relevant statistical news
/// within their areas of interest.
///
/// Documentation: https://webapi.bps.go.id/documentation/#news-category
class const NewsCategory({
  /// Unique identifier for the news category within BPS classification system
  required final String id,

  /// Descriptive name of the news category in Indonesian
  ///
  /// Category names reflect major statistical domains and help organize
  /// news content for targeted audiences. Examples include "Ekonomi", "Sosial",
  /// "Kependudukan", "Pertanian", "Industri", "Regional", "Metodologi"
  required final String name,
}) extends BaseEntity {
  @override
  List<Object> get props => [id, name];
}
