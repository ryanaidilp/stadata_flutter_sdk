import 'package:stadata_flutter_sdk/src/core/core.dart';
import 'package:stadata_flutter_sdk/src/features/dynamic_tables/domain/entities/structured_data.dart';
import 'package:stadata_flutter_sdk/src/features/dynamic_tables/domain/entities/variable_info.dart';

/// Entity representing a dynamic statistical table from BPS Web API.
///
/// For **list** endpoint, contains basic variable metadata.
/// For **detail** endpoint, includes comprehensive data with multiple dimensions.
///
/// API endpoints:
/// - List: `/api/list/model/data/{domain}`
/// - Detail: `/api/list/model/data/{domain}/var/{var}/th/{th}`
class DynamicTable extends BaseEntity {
  /// Creates a [DynamicTable] instance for list responses.
  const DynamicTable({
    required this.variableID,
    required this.title,
    required this.subjectID,
    required this.subjectName,
    required this.notes,
    required this.unit,
    required this.verticalVariableID,
    required this.domain,
    this.csaSubjectID,
    this.csaSubjectName,
    this.graphID,
    this.graphName,
    this.variables = const [],
    this.verticalVariables = const [],
    this.periods = const [],
    this.derivedVariables = const [],
    this.derivedPeriods = const [],
    this.verticalVariableLabel,
    this.dataContent = const {},
  });

  /// Creates a [DynamicTable] for detail responses with full data.
  const DynamicTable.withData({
    required this.variableID,
    required this.title,
    required this.subjectID,
    required this.subjectName,
    required this.notes,
    required this.unit,
    required this.verticalVariableID,
    required this.domain,
    this.csaSubjectID,
    this.csaSubjectName,
    this.graphID,
    this.graphName,
    this.variables = const [],
    this.verticalVariables = const [],
    this.periods = const [],
    this.derivedVariables = const [],
    this.derivedPeriods = const [],
    this.verticalVariableLabel,
    this.dataContent = const {},
  });

  /// Variable ID.
  final int variableID;

  /// Variable title/label.
  final String title;

  /// Subject category ID.
  final int subjectID;

  /// Subject category name.
  final String subjectName;

  /// Methodological notes.
  final String notes;

  /// Unit of measurement.
  final String unit;

  /// Vertical variable ID for dimensional breakdown.
  final int verticalVariableID;

  /// Domain code (regional scope).
  final String domain;

  /// Cross-sectional analysis subject ID.
  final int? csaSubjectID;

  /// Cross-sectional analysis subject name.
  final String? csaSubjectName;

  /// Graph/visualization configuration ID.
  final int? graphID;

  /// Graph/visualization name.
  final String? graphName;

  // Detail response fields (populated only for detail endpoint)

  /// Variable metadata (from 'var' field in detail response).
  final List<VariableInfo> variables;

  /// Vertical variable values (from 'vervar' field).
  final List<VerticalVariableInfo> verticalVariables;

  /// Time periods (from 'tahun' field).
  final List<PeriodInfo> periods;

  /// Derived variables (from 'turvar' field).
  final List<VerticalVariableInfo> derivedVariables;

  /// Derived periods (from 'turtahun' field).
  final List<VerticalVariableInfo> derivedPeriods;

  /// Label for vertical variable dimension (from 'labelvervar' field).
  final String? verticalVariableLabel;

  /// Raw data content as key-value pairs (from 'datacontent' field).
  ///
  /// Keys are composite: "{vervar}{var}{turvar}{tahun}{turtahun}".
  /// Values are the statistical measurements.
  final Map<String, dynamic> dataContent;

  /// Gets a data value using composite key.
  ///
  /// The composite key format is: {vervar}{var}{turvar}{tahun}{turtahun}
  ///
  /// - [vervarValue] - Vertical variable value
  /// - [varValue] - Variable value
  /// - [turvarValue] - Derived variable value (0 if none)
  /// - [tahunValue] - Period value
  /// - [turtahunValue] - Derived period value (0 if none)
  ///
  /// Returns the data value or null if not found.
  dynamic getDataValue({
    required dynamic vervarValue,
    required dynamic varValue,
    required dynamic turvarValue,
    required dynamic tahunValue,
    required dynamic turtahunValue,
  }) {
    final key = '$vervarValue$varValue$turvarValue$tahunValue$turtahunValue';
    return dataContent[key];
  }

  /// Checks if derived variables are actually used (not just placeholder).
  bool get hasDerivedVariables =>
      derivedVariables.length > 1 ||
      (derivedVariables.isNotEmpty &&
          derivedVariables.first.value != 0 &&
          derivedVariables.first.value != '0');

  /// Checks if derived periods are actually used (not just placeholder).
  bool get hasDerivedPeriods =>
      derivedPeriods.length > 1 ||
      (derivedPeriods.isNotEmpty &&
          derivedPeriods.first.value != 0 &&
          derivedPeriods.first.value != '0');

  /// Transforms the data into a universal structured format
  /// suitable for tables, charts, exports (CSV, Excel), and other consumers.
  ///
  /// Structure adapts based on what dimensions exist:
  /// - L1: Vertical variables (always)
  /// - L2: Derived variables (if exist) OR Periods (if no derived variables)
  /// - L3: Periods (if derived variables exist) OR Derived periods (if exist)
  /// - L4: Derived periods (if both derived variables and derived periods exist)
  ///
  /// Returns a [DynamicTableStructuredData] with nested hierarchy.
  DynamicTableStructuredData toStructuredData() {
    final variable = variables.isNotEmpty ? variables.first : null;
    final varValue = variable?.value ?? 0;

    // L1: Vertical variables (always present)
    final data =
        verticalVariables.map((vervar) {
          if (hasDerivedVariables) {
            // L2: Derived variables
            return StructuredDataLevel1(
              id: vervar.value,
              label: vervar.label,
              data:
                  derivedVariables.map((turvar) {
                    // L3: Periods
                    return StructuredDataLevel2(
                      id: turvar.value,
                      label: turvar.label,
                      data:
                          periods.map((period) {
                            if (hasDerivedPeriods) {
                              // L4: Derived periods
                              return StructuredDataLevel3(
                                id: period.value,
                                label: period.label,
                                data:
                                    derivedPeriods
                                        .map(
                                          (turtahun) => StructuredDataLevel4(
                                            id: turtahun.value,
                                            label: turtahun.label,
                                            value: getDataValue(
                                              vervarValue: vervar.value,
                                              varValue: varValue,
                                              turvarValue: turvar.value,
                                              tahunValue: period.value,
                                              turtahunValue: turtahun.value,
                                            ),
                                          ),
                                        )
                                        .toList(),
                              );
                            } else {
                              // No derived periods - value at period level
                              return StructuredDataLevel3(
                                id: period.value,
                                label: period.label,
                                value: getDataValue(
                                  vervarValue: vervar.value,
                                  varValue: varValue,
                                  turvarValue: turvar.value,
                                  tahunValue: period.value,
                                  turtahunValue:
                                      derivedPeriods.isNotEmpty
                                          ? derivedPeriods.first.value
                                          : 0,
                                ),
                              );
                            }
                          }).toList(),
                    );
                  }).toList(),
            );
          } else {
            // No derived variables
            // L2: Periods
            return StructuredDataLevel1(
              id: vervar.value,
              label: vervar.label,
              data:
                  periods.map((period) {
                    // L3: Derived periods (if exist) or value
                    return StructuredDataLevel2(
                      id: period.value,
                      label: period.label,
                      data:
                          hasDerivedPeriods
                              ? derivedPeriods
                                  .map(
                                    (turtahun) => StructuredDataLevel3(
                                      id: turtahun.value,
                                      label: turtahun.label,
                                      value: getDataValue(
                                        vervarValue: vervar.value,
                                        varValue: varValue,
                                        turvarValue: 0,
                                        tahunValue: period.value,
                                        turtahunValue: turtahun.value,
                                      ),
                                    ),
                                  )
                                  .toList()
                              : [
                                StructuredDataLevel3(
                                  id: period.value,
                                  label: period.label,
                                  value: getDataValue(
                                    vervarValue: vervar.value,
                                    varValue: varValue,
                                    turvarValue: 0,
                                    tahunValue: period.value,
                                    turtahunValue:
                                        derivedPeriods.isNotEmpty
                                            ? derivedPeriods.first.value
                                            : 0,
                                  ),
                                ),
                              ],
                    );
                  }).toList(),
            );
          }
        }).toList();

    return DynamicTableStructuredData(
      subjectId: subjectID,
      subjectLabel: subjectName,
      variableId: variable?.value ?? variableID,
      variableLabel: variable?.label ?? title,
      variableUnit: variable?.unit ?? unit,
      verticalVariableLabel: verticalVariableLabel ?? 'Variable',
      data: data,
    );
  }

  @override
  List<Object?> get props => [
    variableID,
    title,
    subjectID,
    subjectName,
    notes,
    unit,
    verticalVariableID,
    domain,
    csaSubjectID,
    csaSubjectName,
    graphID,
    graphName,
    variables,
    verticalVariables,
    periods,
    derivedVariables,
    derivedPeriods,
    verticalVariableLabel,
    dataContent,
  ];
}
