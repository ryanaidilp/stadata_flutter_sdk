import 'package:stadata_flutter_sdk/src/core/core.dart';
import 'package:stadata_flutter_sdk/stadata_flutter_sdk.dart';

/// Entity class representing statistical subjects from BPS Web API.
///
/// This class maps to the subjects endpoint:
/// `https://webapi.bps.go.id/v1/api/list/subject`
///
/// Statistical subjects represent specific domains or areas of statistical
/// activity within the broader subject categories. They provide the primary
/// organizational structure for BPS data collection, analysis, and dissemination
/// activities across Indonesia's official statistics system.
///
/// Subjects serve multiple organizational purposes:
/// - Define scope and boundaries for statistical programs
/// - Organize related datasets, tables, and publications
/// - Enable systematic data discovery and navigation
/// - Support thematic analysis and cross-domain comparisons
/// - Facilitate coordination between different statistical activities
///
/// Examples of statistical subjects include:
/// - Kependudukan (Population and Demographics)
/// - Ketenagakerjaan (Employment and Labor Force)
/// - Kemiskinan (Poverty and Social Welfare)
/// - Perdagangan (Trade and Commerce)
/// - Industri Pengolahan (Manufacturing Industry)
/// - Pertanian Tanaman Pangan (Food Crop Agriculture)
///
/// Each subject typically contains multiple static tables, publications,
/// and related datasets that collectively provide comprehensive coverage
/// of the statistical domain.
///
/// Documentation: https://webapi.bps.go.id/documentation/#subject
class Subject extends BaseEntity {
  /// Creates a new [Subject] instance.
  const Subject({
    required this.id,
    required this.name,
    this.category,
    this.nTable,
  });

  /// Unique identifier for the statistical subject within BPS system
  final int id;

  /// Descriptive name of the statistical subject in Indonesian
  ///
  /// Provides the official name of the statistical domain or area of activity.
  /// Examples: "Kependudukan", "Ketenagakerjaan", "Kemiskinan", "Perdagangan",
  /// "Industri Pengolahan", "Pertanian Tanaman Pangan"
  final String name;

  /// Parent subject category that this subject belongs to
  ///
  /// Links this subject to its broader thematic category, providing
  /// hierarchical organization within the BPS statistical system.
  final SubjectCategory? category;

  /// Total number of static tables available within this subject area
  ///
  /// Indicates the volume of tabular data resources associated with
  /// this subject, helping users understand data availability and scope.
  final int? nTable;

  @override
  List<Object?> get props => [id, name, category, nTable];
}
