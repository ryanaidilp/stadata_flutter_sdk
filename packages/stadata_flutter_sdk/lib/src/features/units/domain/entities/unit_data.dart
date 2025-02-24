import 'package:stadata_flutter_sdk/src/core/core.dart';

/// `UnitData` represents a data model for the units of measurement
/// returned from the BPS (Badan Pusat Statistik) API endpoint for unit data.
///
/// This class maps the JSON structure from the endpoint documented at:
/// https://webapi.bps.go.id/documentation/#dynamicdata_5
/// The API typically returns unit data, which includes fields like 'unit_id'
/// and 'unit_name'.
///
/// Fields:
/// - [id]: Corresponds to 'unit_id' in the API response, representing the
///   unique identifier of the unit.
/// - [title]: Maps to 'unit' in the API response, indicating the
///   descriptive name of the unit.
class UnitData extends BaseEntity {
  /// Constructs an instance of [UnitData].
  ///
  /// This constructor is designed to map the fields from the BPS API response
  /// to the properties of this class, providing a structured representation
  /// of unit data within the application.
  ///
  /// Parameters:
  /// - [id]: Unique identifier for the unit ('unit_id' in the API response).
  /// - [title]: Descriptive name of the unit ('unit' in the API response).
  const UnitData({required this.id, required this.title});

  /// [id]: Corresponds to 'unit_id' from the API response.
  /// Represents the unique identifier of the unit.
  final int id;

  /// [title]: Maps to 'unit' in the API response.
  /// Indicates the name or title of the unit.
  final String title;
  @override
  List<Object> get props => [id, title];
}
