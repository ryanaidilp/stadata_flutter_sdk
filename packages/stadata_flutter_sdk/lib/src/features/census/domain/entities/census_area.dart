import 'package:stadata_flutter_sdk/src/core/base/base.dart';

/// Entity class representing geographical areas covered by census events from BPS Web API.
///
/// This class maps to the census areas endpoint:
/// `https://webapi.bps.go.id/v1/api/interoperabilitas/datasource/sensus/id/39/`
///
/// Contains information about geographical areas where census data collection
/// takes place, including provinces (provinsi), regencies (kabupaten), and
/// cities (kota) across Indonesia.
class const CensusArea({
  /// Unique identifier for the geographical area
  required final int id,

  /// Official name of the geographical area (e.g., "DKI Jakarta", "Kabupaten Bogor")
  required final String name,

  /// URL-friendly slug representation of the area name for web usage
  required final String slug,

  /// MFD (Master File Data) code for administrative identification
  /// Used for linking with other BPS administrative data systems
  required final String mfdCode,
}) extends BaseEntity {
  @override
  List<Object?> get props => [id, name, slug, mfdCode];
}
