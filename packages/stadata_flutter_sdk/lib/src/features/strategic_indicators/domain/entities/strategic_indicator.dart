import 'package:stadata_flutter_sdk/src/core/core.dart';

/// Represents a Strategic Indicator retrieved from the BPS API.
///
/// This class models the data structure for the Strategic Indicator endpoint
/// as documented in the BPS API documentation:
/// [Strategic Indicator API Documentation](https://webapi.bps.go.id/documentation/#strategicindicator)
class StrategicIndicator extends BaseEntity {
  /// Creates a [StrategicIndicator].
  ///
  /// [id], [title], [name], [dataSource], [value], [unit], [period],
  /// [hashID], [categoryID], [variableID], and [csaSubjectID] are required
  /// parameters for the Strategic Indicator.
  const StrategicIndicator({
    required this.id,
    required this.title,
    required this.name,
    required this.dataSource,
    required this.value,
    required this.unit,
    required this.period,
    required this.hashID,
    required this.categoryID,
    required this.variableID,
    this.csaSubjectID,
  });

  /// The unique identifier for the Strategic Indicator.
  final int id;

  /// The title of the Strategic Indicator.
  final String title;

  /// The name of the Strategic Indicator.
  final String name;

  /// The data source for the Strategic Indicator.
  final String dataSource;

  /// The value of the Strategic Indicator.
  final double value;

  /// The unit associated with the Strategic Indicator value.
  final String unit;

  /// The period associated with the Strategic Indicator.
  final String period;

  /// The hash identifier for the Strategic Indicator.
  final String hashID;

  /// The category identifier for the Strategic Indicator.
  final int categoryID;

  /// The variable identifier for the Strategic Indicator.
  final int variableID;

  /// The CSA (Central Statistics Agency) subject identifier for the Strategic
  /// Indicator.
  final int? csaSubjectID;

  @override
  List<Object?> get props => [
    id,
    title,
    name,
    dataSource,
    value,
    unit,
    period,
    hashID,
    categoryID,
    variableID,
    csaSubjectID,
  ];
}
