import 'package:flutter/material.dart';
import 'package:stadata_flutter_sdk/src/core/core.dart';
import 'package:stadata_flutter_sdk/src/features/dynamic_tables/data/models/variable_info_model.dart';
import 'package:stadata_flutter_sdk/src/features/dynamic_tables/domain/entities/entities.dart';

const _varKey = 'var';
const _labelKey = 'label';
const _subjKey = 'subj';
const _notesKey = 'notes';
const _unitKey = 'unit';
const _vervarKey = 'vervar';
const _tableKey = 'table';
const _subcsakey = 'subcsa';
const _subcsakeyLabel = 'subcsa_label';
const _graphKey = 'graph';
const _graphLabelKey = 'graph_label';
const _turvarKey = 'turvar';
const _tahunKey = 'tahun';
const _turtahunKey = 'turtahun';
const _labelvervarKey = 'labelvervar';
const _datacontentKey = 'datacontent';

/// Data model for [DynamicTable].
///
/// Handles JSON serialization for both list and detail API responses.
class DynamicTableModel extends DynamicTable {
  /// Creates a [DynamicTableModel] for list responses.
  const DynamicTableModel({
    required super.variableID,
    required super.title,
    required super.subjectID,
    required super.subjectName,
    required super.notes,
    required super.unit,
    required super.verticalVariableID,
    required super.domain,
    super.csaSubjectID,
    super.csaSubjectName,
    super.graphID,
    super.graphName,
    super.variables = const [],
    super.verticalVariables = const [],
    super.periods = const [],
    super.derivedVariables = const [],
    super.derivedPeriods = const [],
    super.verticalVariableLabel,
    super.dataContent = const {},
  });

  /// Creates from list API JSON response.
  ///
  /// Expected structure from `/api/list/model/data/{domain}`:
  /// ```json
  /// {
  ///   "var": 123,
  ///   "label": "Variable Name",
  ///   "subj": 45,
  ///   "subj_label": "Subject Name",
  ///   "notes": "Description",
  ///   "unit": "Unit",
  ///   "vervar": 67,
  ///   "table": "7200",
  ///   "subcsa": 10,
  ///   "subcsa_label": "CSA Name",
  ///   "graph": 5,
  ///   "graph_label": "Graph Name"
  /// }
  /// ```
  factory DynamicTableModel.fromJson(JSON json) {
    final varValue = json[_varKey];
    final subjValue = json[_subjKey];

    return DynamicTableModel(
      variableID: varValue is int ? varValue : int.parse(varValue.toString()),
      title: json[_labelKey] as String,
      subjectID: subjValue is int ? subjValue : int.parse(subjValue.toString()),
      subjectName: json['subj_label'] as String? ?? '',
      notes: json[_notesKey] as String? ?? '',
      unit: json[_unitKey] as String? ?? '',
      verticalVariableID: json[_vervarKey] as int? ?? 0,
      domain: json[_tableKey] as String,
      csaSubjectID: json[_subcsakey] as int?,
      csaSubjectName: json[_subcsakeyLabel] as String?,
      graphID: json[_graphKey] as int?,
      graphName: json[_graphLabelKey] as String?,
    );
  }

  /// Creates from detail API JSON response.
  ///
  /// Expected structure from `/api/list/model/data/{domain}/var/{var}`:
  /// ```json
  /// {
  ///   "status": "OK",
  ///   "data-availability": "available",
  ///   "var": [{...}],
  ///   "turvar": [{...}],
  ///   "labelvervar": "Kecamatan",
  ///   "vervar": [{...}],
  ///   "tahun": [{...}],
  ///   "turtahun": [{...}],
  ///   "datacontent": {"key": value}
  /// }
  /// ```
  factory DynamicTableModel.fromDetailJson(JSON json) {
    // Parse variable metadata (first item from var array)
    final varArray = json[_varKey] as List<dynamic>? ?? [];
    final varInfo =
        varArray.isNotEmpty
            ? VariableInfoModel.fromJson(varArray.first as JSON)
            : const VariableInfoModel(
              value: 0,
              label: '',
              unit: '',
              subject: '',
            );

    // Parse vertical variables
    final vervarArray = json[_vervarKey] as List<dynamic>? ?? [];
    final vervarList =
        vervarArray
            .map((e) => VerticalVariableInfoModel.fromJson(e as JSON))
            .toList();

    // Parse periods
    final tahunArray = json[_tahunKey] as List<dynamic>? ?? [];
    final tahunList =
        tahunArray.map((e) => PeriodInfoModel.fromJson(e as JSON)).toList();

    // Parse derived variables
    final turvarArray = json[_turvarKey] as List<dynamic>? ?? [];
    final turvarList =
        turvarArray
            .map((e) => VerticalVariableInfoModel.fromJson(e as JSON))
            .toList();

    // Parse derived periods
    final turtahunArray = json[_turtahunKey] as List<dynamic>? ?? [];
    final turtahunList =
        turtahunArray
            .map((e) => VerticalVariableInfoModel.fromJson(e as JSON))
            .toList();

    // Parse datacontent map
    final datacontentJson =
        json[_datacontentKey] as Map<String, dynamic>? ?? {};

    return DynamicTableModel(
      variableID: varInfo.value,
      title: varInfo.label,
      subjectID: 0, // Not provided in detail response
      subjectName: varInfo.subject,
      notes: varInfo.notes,
      unit: varInfo.unit,
      verticalVariableID:
          vervarList.isNotEmpty
              ? int.tryParse(vervarList.first.value.toString()) ?? 0
              : 0,
      domain: '', // Extract from context if needed
      variables: [varInfo],
      verticalVariables: vervarList,
      periods: tahunList,
      derivedVariables: turvarList,
      derivedPeriods: turtahunList,
      verticalVariableLabel: json[_labelvervarKey] as String?,
      dataContent: datacontentJson,
    );
  }

  /// Converts to JSON (list format).
  JSON toJson() => {
    _varKey: variableID,
    _labelKey: title,
    _subjKey: subjectID,
    'subj_label': subjectName,
    _notesKey: notes,
    _unitKey: unit,
    _vervarKey: verticalVariableID,
    _tableKey: domain,
    _subcsakey: csaSubjectID,
    _subcsakeyLabel: csaSubjectName,
    _graphKey: graphID,
    _graphLabelKey: graphName,
  };

  /// Converts to JSON (detail format with data).
  JSON toDetailJson() => {
    _varKey: variables.map((e) => (e as VariableInfoModel).toJson()).toList(),
    _turvarKey:
        derivedVariables
            .map((e) => (e as VerticalVariableInfoModel).toJson())
            .toList(),
    _labelvervarKey: verticalVariableLabel,
    _vervarKey:
        verticalVariables
            .map((e) => (e as VerticalVariableInfoModel).toJson())
            .toList(),
    _tahunKey: periods.map((e) => (e as PeriodInfoModel).toJson()).toList(),
    _turtahunKey:
        derivedPeriods
            .map((e) => (e as VerticalVariableInfoModel).toJson())
            .toList(),
    _datacontentKey: dataContent,
  };

  /// Creates a copy with replaced fields.
  DynamicTableModel copyWith({
    int? variableID,
    String? title,
    int? subjectID,
    String? subjectName,
    String? notes,
    String? unit,
    int? verticalVariableID,
    String? domain,
    ValueGetter<int?>? csaSubjectID,
    ValueGetter<String?>? csaSubjectName,
    ValueGetter<int?>? graphID,
    ValueGetter<String?>? graphName,
    List<VariableInfo>? variables,
    List<VerticalVariableInfo>? verticalVariables,
    List<PeriodInfo>? periods,
    List<VerticalVariableInfo>? derivedVariables,
    List<VerticalVariableInfo>? derivedPeriods,
    ValueGetter<String?>? verticalVariableLabel,
    Map<String, dynamic>? dataContent,
  }) => DynamicTableModel(
    variableID: variableID ?? this.variableID,
    title: title ?? this.title,
    subjectID: subjectID ?? this.subjectID,
    subjectName: subjectName ?? this.subjectName,
    notes: notes ?? this.notes,
    unit: unit ?? this.unit,
    verticalVariableID: verticalVariableID ?? this.verticalVariableID,
    domain: domain ?? this.domain,
    csaSubjectID: csaSubjectID != null ? csaSubjectID() : this.csaSubjectID,
    csaSubjectName:
        csaSubjectName != null ? csaSubjectName() : this.csaSubjectName,
    graphID: graphID != null ? graphID() : this.graphID,
    graphName: graphName != null ? graphName() : this.graphName,
    variables: variables ?? this.variables,
    verticalVariables: verticalVariables ?? this.verticalVariables,
    periods: periods ?? this.periods,
    derivedVariables: derivedVariables ?? this.derivedVariables,
    derivedPeriods: derivedPeriods ?? this.derivedPeriods,
    verticalVariableLabel:
        verticalVariableLabel != null
            ? verticalVariableLabel()
            : this.verticalVariableLabel,
    dataContent: dataContent ?? this.dataContent,
  );
}
