import 'package:stadata_flutter_sdk/src/core/core.dart';

/// Entity class representing subject categories from BPS Web API.
///
/// This class maps to the subject categories endpoint:
/// `https://webapi.bps.go.id/v1/api/list/subjectcategory`
///
/// Subject categories provide high-level thematic organization for statistical
/// subjects within the BPS data ecosystem. They serve as the top-level
/// classification system that groups related statistical domains and facilitate
/// systematic organization of Indonesia's official statistics.
///
/// Common subject categories include:
/// - Sosial (Social) - Demographics, education, health, welfare
/// - Ekonomi (Economic) - GDP, trade, industry, labor, prices
/// - Pertanian (Agriculture) - Farming, fisheries, forestry, livestock
/// - Lingkungan (Environment) - Natural resources, climate, sustainability
/// - Infrastruktur (Infrastructure) - Transportation, communications, utilities
/// - Pemerintahan (Governance) - Public administration, regional government
///
/// Subject categories enable users to navigate the statistical system
/// hierarchically, starting from broad thematic areas and drilling down
/// to specific statistical topics and datasets.
///
/// Documentation: https://webapi.bps.go.id/documentation/#subjectcategories

class SubjectCategory extends BaseEntity {
  /// Creates a new [SubjectCategory] instance.
  const SubjectCategory({required this.id, required this.name});

  /// Unique identifier for the subject category within BPS classification system
  final int id;

  /// Descriptive name of the subject category in Indonesian
  ///
  /// Represents the broad thematic area that encompasses related statistical
  /// subjects and domains. Examples: "Sosial", "Ekonomi", "Pertanian",
  /// "Lingkungan", "Infrastruktur", "Pemerintahan"
  final String name;
  @override
  List<Object> get props => [id, name];
}
