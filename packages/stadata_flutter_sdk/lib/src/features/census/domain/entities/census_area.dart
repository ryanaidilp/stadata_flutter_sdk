import 'package:stadata_flutter_sdk/src/core/base/base.dart';

/// Represents a geographical area covered by a census event
///
/// This entity contains information about geographical areas where census
/// data collection takes place, including provinces, regencies, and cities.
///
/// Reference: https://webapi.bps.go.id/documentation/#census
class CensusArea extends BaseEntity {
  /// Creates a [CensusArea] with the specified properties
  const CensusArea({
    required this.id,
    required this.name,
    required this.slug,
    required this.mfdCode,
  });

  /// Unique identifier for the census area
  final int id;

  /// Name of the geographical area
  final String name;

  /// URL-friendly slug representation of the area name
  final String slug;

  /// MFD (Master File Data) code for the area
  final String mfdCode;

  @override
  List<Object?> get props => [id, name, slug, mfdCode];
}
