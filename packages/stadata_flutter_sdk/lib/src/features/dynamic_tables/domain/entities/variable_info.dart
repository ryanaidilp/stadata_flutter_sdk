import 'package:stadata_flutter_sdk/src/core/core.dart';

/// Represents variable metadata in a dynamic table detail response.
///
/// Contains comprehensive information about the statistical variable
/// including its identifier, label, unit, subject, and notes.
class VariableInfo extends BaseEntity {
  /// Creates a new [VariableInfo] instance.
  const VariableInfo({
    required this.value,
    required this.label,
    required this.unit,
    required this.subject,
    this.definition = '',
    this.notes = '',
  });

  /// Numeric identifier for the variable.
  final int value;

  /// Display label for the variable.
  final String label;

  /// Unit of measurement (e.g., "Jiwa", "Rupiah").
  final String unit;

  /// Subject area this variable belongs to.
  final String subject;

  /// Definition or description of the variable.
  final String definition;

  /// Additional notes about the variable.
  final String notes;

  @override
  List<Object?> get props => [
        value,
        label,
        unit,
        subject,
        definition,
        notes,
      ];
}

/// Represents a vertical variable (dimensional breakdown) in dynamic table data.
///
/// Vertical variables provide categorical breakdowns such as regions,
/// age groups, industries, etc.
class VerticalVariableInfo extends BaseEntity {
  /// Creates a new [VerticalVariableInfo] instance.
  const VerticalVariableInfo({
    required this.value,
    required this.label,
  });

  /// Numeric or string identifier for this vertical variable value.
  final dynamic value;

  /// Display label for this vertical variable value.
  final String label;

  @override
  List<Object?> get props => [value, label];
}

/// Represents a period/year entry in dynamic table data.
class PeriodInfo extends BaseEntity {
  /// Creates a new [PeriodInfo] instance.
  const PeriodInfo({
    required this.value,
    required this.label,
  });

  /// Numeric or string identifier for the period.
  final dynamic value;

  /// Display label for the period (e.g., "2023", "Q1 2023").
  final String label;

  @override
  List<Object?> get props => [value, label];
}
