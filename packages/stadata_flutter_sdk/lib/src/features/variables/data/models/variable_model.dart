import 'package:flutter/material.dart';
import 'package:stadata_flutter_sdk/src/core/core.dart';
import 'package:stadata_flutter_sdk/src/features/features.dart';

const _idKey = 'var_id';
const _notesKey = 'notes';
const _subjectIDKey = 'sub_id';
const _subjectNameKey = 'sub_name';
const _titleKey = 'title';
const _verticalVariableIDKey = 'vertical';
const _graphNameKey = 'graph_name';
const _unitKey = 'unit';
const _csaSubjectIDKey = 'subcsa_id';
const _csaSubjectNameKey = 'subcsa_name';
const _typeKey = 'type';
const _derivedPeriodKey = 'turth';
const _derivedVariableIDKey = 'turvar';

class VariableModel extends Variable {
  const VariableModel({
    required super.id,
    required super.notes,
    required super.subjectID,
    required super.subjectName,
    required super.title,
    required super.verticalVariableID,
    super.graphName = '',
    super.unit = '',
    super.csaSubjectID,
    super.csaSubjectName,
    super.type,
    super.derivedPeriodID,
    super.derivedVariableID,
  });

  factory VariableModel.fromJson(JSON json) => VariableModel(
        id: json[_idKey] as int,
        notes: const NoteConverter().fromJson(
          json[_notesKey] as String,
        ),
        subjectID: json[_subjectIDKey] as int,
        subjectName: json[_subjectNameKey] as String,
        title: json[_titleKey] as String,
        verticalVariableID: json[_verticalVariableIDKey] as int,
        graphName: json[_graphNameKey] as String? ?? '',
        unit: json[_unitKey] as String? ?? '',
        csaSubjectID: json[_csaSubjectIDKey] as int?,
        csaSubjectName: json[_csaSubjectNameKey] as String?,
        type: json[_typeKey] as int?,
        derivedPeriodID: json[_derivedPeriodKey] as int?,
        derivedVariableID: json[_derivedVariableIDKey] as int?,
      );

  JSON toJson() => {
        _idKey: id,
        _notesKey: const NoteConverter().toJson(notes),
        _subjectIDKey: subjectID,
        _subjectNameKey: subjectName,
        _titleKey: title,
        _verticalVariableIDKey: verticalVariableID,
        _graphNameKey: graphName,
        _unitKey: unit,
        _csaSubjectIDKey: csaSubjectID,
        _csaSubjectNameKey: csaSubjectName,
        _typeKey: type,
        _derivedPeriodKey: derivedPeriodID,
        _derivedVariableIDKey: derivedVariableID,
      };

  VariableModel copyWith({
    int? id,
    String? graphName,
    String? notes,
    int? subjectID,
    String? subjectName,
    String? title,
    String? unit,
    int? verticalVariableID,
    ValueGetter<String?>? csaSubjectName,
    ValueGetter<int?>? csaSubjectID,
    ValueGetter<int?>? type,
    ValueGetter<int?>? derivedPeriodID,
    ValueGetter<int?>? derivedVariableID,
  }) =>
      VariableModel(
        id: id ?? this.id,
        graphName: graphName ?? this.graphName,
        notes: notes ?? this.notes,
        subjectID: subjectID ?? this.subjectID,
        subjectName: subjectName ?? this.subjectName,
        title: title ?? this.title,
        unit: unit ?? this.unit,
        verticalVariableID: verticalVariableID ?? this.verticalVariableID,
        csaSubjectName:
            csaSubjectName != null ? csaSubjectName() : this.csaSubjectName,
        csaSubjectID: csaSubjectID != null ? csaSubjectID() : this.csaSubjectID,
        type: type != null ? type() : this.type,
        derivedPeriodID:
            derivedPeriodID != null ? derivedPeriodID() : this.derivedPeriodID,
        derivedVariableID: derivedVariableID != null
            ? derivedVariableID()
            : this.derivedVariableID,
      );
}
