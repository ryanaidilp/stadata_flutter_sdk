import 'package:equatable/equatable.dart';

/// `Variable` is a data entity class that represents a statistical variable
/// from the Badan Pusat Statistik (BPS) API.
///
/// This class maps the response from the BPS API, particularly from the
/// dynamic data service which provides various statistical data.
///
/// Each `Variable` object contains detailed information about a specific
/// statistical variable, including its identification, names, titles, and
/// related metadata.
///
/// See: https://webapi.bps.go.id/documentation/#dynamicdata_6 for more
/// information about the API response structure.
class Variable extends Equatable {
  /// Constructor for creating a new `Variable` instance.
  /// Required fields must be provided.
  const Variable({
    required this.id,
    required this.graphName,
    required this.notes,
    required this.subjectID,
    required this.subjectName,
    required this.title,
    required this.unit,
    required this.verticalVariableID,
    this.csaSubjectName,
    this.csaSubjectID,
    this.type,
    this.derivedPeriodID,
    this.derivedVariableID,
  });

  /// The unique identifier for the variable.
  final int id;

  /// A descriptive name used for graphing purposes.
  final String graphName;

  /// Additional notes or descriptions about the variable.
  final String notes;

  /// An identifier for the sub-category of the variable.
  final int subjectID;

  /// The name of the subject to which the variable belongs.
  final String subjectName;

  /// The official title or label of the variable.
  final String title;

  /// The measurement unit of the variable.
  final String unit;

  /// An identifier for the vertical variable.
  final int verticalVariableID;

  /// (Optional) The name of the cross-sectional subject related to
  /// the variable, if applicable.
  final String? csaSubjectName;

  /// (Optional) The identifier for the cross-sectional subject related to the
  /// variable, if applicable.
  final int? csaSubjectID;

  /// (Optional) The type of the variable, if applicable.
  final int? type;

  /// (Optional) The identifier for the derived period, if applicable.
  final int? derivedPeriodID;

  /// (Optional) The identifier for the derived variable, if applicable.
  final int? derivedVariableID;

  @override

  /// A method from `Equatable` used to determine if two instances are equal.
  /// It compares all properties of the class.
  ///
  /// Returns a list of properties that should be used for comparison.
  List<Object?> get props {
    return [
      id,
      graphName,
      notes,
      subjectID,
      subjectName,
      title,
      unit,
      verticalVariableID,
      csaSubjectName,
      csaSubjectID,
      type,
      derivedPeriodID,
      derivedVariableID,
    ];
  }
}
