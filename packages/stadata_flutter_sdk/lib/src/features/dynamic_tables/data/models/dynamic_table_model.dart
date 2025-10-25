import 'package:flutter/material.dart';
import 'package:stadata_flutter_sdk/src/core/core.dart';
import 'package:stadata_flutter_sdk/src/features/dynamic_tables/data/models/dynamic_table_data_model.dart';
import 'package:stadata_flutter_sdk/src/features/dynamic_tables/domain/entities/entities.dart';
import 'package:stadata_flutter_sdk/src/features/variables/data/data.dart';

const _variableIDKey = 'var';
const _titleKey = 'label';
const _subjectIDKey = 'subj';
const _subjectNameKey = 'subj_label';
const _notesKey = 'notes';
const _unitKey = 'unit';
const _verticalVariableIDKey = 'vervar';
const _domainKey = 'table';
const _csaSubjectIDKey = 'subcsa';
const _csaSubjectNameKey = 'subcsa_label';
const _graphIDKey = 'graph';
const _graphNameKey = 'graph_label';
const _dataContentKey = 'datacontent';

/// Data model implementation of [DynamicTable] entity.
///
/// Handles JSON serialization/deserialization for dynamic tables
/// from the BPS API. Supports both list and detail responses with
/// different JSON structures.
class DynamicTableModel extends DynamicTable {
  /// Creates a new [DynamicTableModel] instance.
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
    super.data = const [],
  });

  /// Creates a [DynamicTableModel] from list API JSON response.
  ///
  /// Used for parsing items from the `/list/model/data/{domain}` endpoint.
  ///
  /// Expects JSON structure:
  /// ```json
  /// {
  ///   "var": 123,
  ///   "label": "GDP by Province",
  ///   "subj": 45,
  ///   "subj_label": "National Account",
  ///   "notes": "Annual GDP data",
  ///   "unit": "Billion Rupiah",
  ///   "vervar": 67,
  ///   "table": "7200",
  ///   "subcsa": 10,
  ///   "subcsa_label": "Economic Statistics",
  ///   "graph": 5,
  ///   "graph_label": "GDP Growth Chart"
  /// }
  /// ```
  factory DynamicTableModel.fromJson(JSON json) => DynamicTableModel(
    variableID: json[_variableIDKey] as int,
    title: json[_titleKey] as String,
    subjectID: json[_subjectIDKey] as int,
    subjectName: json[_subjectNameKey] as String,
    notes: const NoteConverter().fromJson(json[_notesKey] as String),
    unit: json[_unitKey] as String,
    verticalVariableID: json[_verticalVariableIDKey] as int,
    domain: json[_domainKey] as String,
    csaSubjectID: json[_csaSubjectIDKey] as int?,
    csaSubjectName: json[_csaSubjectNameKey] as String?,
    graphID: json[_graphIDKey] as int?,
    graphName: json[_graphNameKey] as String?,
  );

  /// Creates a [DynamicTableModel] from detail API JSON response.
  ///
  /// Used for parsing data from the `/view/model/data/{domain}/{id}` endpoint.
  /// This includes the data array with time series information.
  ///
  /// Expects JSON structure:
  /// ```json
  /// {
  ///   "var": 123,
  ///   "label": "GDP by Province",
  ///   "subj": 45,
  ///   "subj_label": "National Account",
  ///   "notes": "Annual GDP data",
  ///   "unit": "Billion Rupiah",
  ///   "vervar": 67,
  ///   "table": "7200",
  ///   "datacontent": [
  ///     {
  ///       "label": "2023",
  ///       "datacontent": {"1234": "75.5", "5678": "82.3"}
  ///     }
  ///   ]
  /// }
  /// ```
  factory DynamicTableModel.fromDetailJson(JSON json) {
    final dataJson = json[_dataContentKey] as List<dynamic>? ?? [];
    final dataModels =
        dataJson
            .map(
              (e) => DynamicTableDataModel.fromJson(e as Map<String, dynamic>),
            )
            .toList();

    return DynamicTableModel(
      variableID: json[_variableIDKey] as int,
      title: json[_titleKey] as String,
      subjectID: json[_subjectIDKey] as int,
      subjectName: json[_subjectNameKey] as String,
      notes: const NoteConverter().fromJson(json[_notesKey] as String),
      unit: json[_unitKey] as String,
      verticalVariableID: json[_verticalVariableIDKey] as int,
      domain: json[_domainKey] as String,
      csaSubjectID: json[_csaSubjectIDKey] as int?,
      csaSubjectName: json[_csaSubjectNameKey] as String?,
      graphID: json[_graphIDKey] as int?,
      graphName: json[_graphNameKey] as String?,
      data: dataModels,
    );
  }

  /// Converts this model to JSON format for list responses.
  JSON toJson() => {
    _variableIDKey: variableID,
    _titleKey: title,
    _subjectIDKey: subjectID,
    _subjectNameKey: subjectName,
    _notesKey: const NoteConverter().toJson(notes),
    _unitKey: unit,
    _verticalVariableIDKey: verticalVariableID,
    _domainKey: domain,
    _csaSubjectIDKey: csaSubjectID,
    _csaSubjectNameKey: csaSubjectName,
    _graphIDKey: graphID,
    _graphNameKey: graphName,
  };

  /// Converts this model to JSON format including data array.
  JSON toDetailJson() => {
    ...toJson(),
    _dataContentKey:
        data.map((e) => (e as DynamicTableDataModel).toJson()).toList(),
  };

  /// Creates a copy of this model with the given fields replaced.
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
    List<DynamicTableData>? data,
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
    data: data ?? this.data,
  );
}
