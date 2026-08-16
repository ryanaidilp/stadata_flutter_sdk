import 'package:stadata_flutter_sdk/src/core/core.dart';

/// Represents variable metadata in a dynamic table detail response.
///
/// Contains comprehensive information about the statistical variable
/// including its identifier, label, unit, subject, and notes.
class const VariableInfo({
  /// Numeric identifier for the variable.
  required final int value,

  /// Display label for the variable.
  required final String label,

  /// Unit of measurement (e.g., "Jiwa", "Rupiah").
  required final String unit,

  /// Subject area this variable belongs to.
  required final String subject,

  /// Definition or description of the variable.
  final String definition = '',

  /// Additional notes about the variable.
  final String notes = '',
}) extends BaseEntity {
  @override
  List<Object?> get props => [value, label, unit, subject, definition, notes];
}

/// Represents a vertical variable (dimensional breakdown) in dynamic table data.
///
/// Vertical variables provide categorical breakdowns such as regions,
/// age groups, industries, etc.
class const VerticalVariableInfo({
  /// Numeric or string identifier for this vertical variable value.
  required final dynamic value,

  /// Display label for this vertical variable value.
  required final String label,
}) extends BaseEntity {
  @override
  List<Object?> get props => [value, label];
}

/// Represents a period/year entry in dynamic table data.
class const PeriodInfo({
  /// Numeric or string identifier for the period.
  required final dynamic value,

  /// Display label for the period (e.g., "2023", "Q1 2023").
  required final String label,
}) extends BaseEntity {
  @override
  List<Object?> get props => [value, label];
}
