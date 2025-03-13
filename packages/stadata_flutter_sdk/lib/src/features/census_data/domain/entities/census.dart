import 'package:stadata_flutter_sdk/src/core/core.dart';

/// Entity class representing a census activity/event from BPS Web API.
///
/// This class maps to the census events endpoint:
/// `https://webapi.bps.go.id/v1/api/interoperabilitas/datasource/sensus/id/37/`
///
/// Example response from API:
/// ```json
/// {
///   "id": "sp2020",
///   "kegiatan": "Sensus Penduduk 2020",
///   "tahun_kegiatan": 2020
/// }
/// ```
class Census extends BaseEntity {
  /// Creates a new [Census] instance.
  ///
  /// [id] is the unique identifier for the census activity (e.g. "sp2020")
  /// [name] is the name/description of the census activity
  /// [year] is the year when the census was conducted
  const Census({required this.id, required this.name, required this.year});

  /// Unique identifier for the census activity
  final String id;

  /// Name/description of the census activity
  final String name;

  /// Year when the census was conducted
  final int year;

  @override
  List<Object?> get props => [id, name, year];
}
