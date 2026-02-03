import 'package:stadata_flutter_sdk/src/core/base/base_entity.dart';

/// Entity class representing individual items within statistical classifications from BPS Web API.
///
/// This class represents specific codes and definitions within broader statistical
/// classification systems. Classification items are the building blocks that make up
/// comprehensive coding schemes like KBLI, KBJI, ISIC, and other standardized
/// taxonomies used by BPS for organizing statistical data.
///
/// Each classification item provides:
/// - Standardized codes for consistent data collection and reporting
/// - Precise definitions to ensure uniform interpretation
/// - Hierarchical organization within broader classification systems
/// - Support for data aggregation and international comparisons
///
/// Classification items enable users to properly code survey responses,
/// administrative records, and other statistical data according to established
/// national and international standards.
///
/// Documentation: https://webapi.bps.go.id/documentation/#sc
class ClassificationItem extends BaseEntity {
  /// Standardized alphanumeric code for the classification item
  ///
  /// Unique identifier within the classification system that follows
  /// established coding conventions. Examples: "01111" (KBLI code for
  /// rice farming), "2422" (ISIC code for steel production)
  final String code;

  /// Concise descriptive title of the classification item
  ///
  /// Short, standardized name that identifies the specific category.
  /// Examples: "Tanaman Padi" (Rice Cultivation), "Produksi Baja"
  /// (Steel Production), "Teknisi Komputer" (Computer Technician)
  final String title;

  /// Comprehensive definition and scope of the classification item
  ///
  /// Detailed explanation that defines exactly what activities, products,
  /// or characteristics are included or excluded from this classification
  /// code, ensuring consistent application across statistical uses.
  final String description;

  /// Creates a new instance of `ClassificationItem`.
  const ClassificationItem({
    required this.code,
    required this.title,
    required this.description,
  });

  @override
  List<Object> get props => [code, title, description];
}
