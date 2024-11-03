// ignore_for_file: public_member_api_docs

import 'package:flutter/foundation.dart';
import 'package:stadata_flutter_sdk/src/core/core.dart';
import 'package:stadata_flutter_sdk/src/features/features.dart';

const _idKey = 'indicator_id';
const _varKey = 'var';
const _categoryKey = 'category';
const _nameKey = 'name';
const _titleKey = 'title';
const _dataSourceKey = 'data_source';
const _valueKey = 'value';
const _hashIDKey = 'hash_id';
const _periodKey = 'periode';
const _unitKey = 'unit';
const _subjectCsaIDKey = 'subject_csa';

class StrategicIndicatorModel extends StrategicIndicator {
  const StrategicIndicatorModel({
    required super.id,
    required super.name,
    required super.title,
    required super.variableID,
    required super.categoryID,
    required super.dataSource,
    required super.value,
    required super.hashID,
    required super.period,
    super.unit = '-',
    super.csaSubjectID,
  });

  factory StrategicIndicatorModel.fromJson(JSON json) =>
      StrategicIndicatorModel(
        id: json[_idKey] as int,
        name: json[_nameKey] as String,
        title: json[_titleKey] as String,
        variableID: json[_varKey] as int,
        categoryID: json[_categoryKey] as int,
        dataSource: json[_dataSourceKey] as String,
        value: json[_valueKey] as double,
        hashID: json[_hashIDKey] as String,
        period: json[_periodKey] as String,
        unit: json[_unitKey] as String,
        csaSubjectID: json[_subjectCsaIDKey] as int?,
      );

  JSON toJson() => {
        _idKey: id,
        _nameKey: name,
        _titleKey: title,
        _varKey: variableID,
        _categoryKey: categoryID,
        _dataSourceKey: dataSource,
        _valueKey: value,
        _hashIDKey: hashID,
        _periodKey: period,
        _unitKey: unit,
        _subjectCsaIDKey: csaSubjectID,
      };

  StrategicIndicatorModel copyWith({
    int? id,
    String? name,
    String? title,
    int? variableID,
    int? categoryID,
    String? dataSource,
    double? value,
    String? hashID,
    String? period,
    String? unit,
    ValueGetter<int?>? csaSubjectID,
  }) =>
      StrategicIndicatorModel(
        id: id ?? this.id,
        name: name ?? this.name,
        title: title ?? this.title,
        variableID: variableID ?? this.variableID,
        categoryID: categoryID ?? this.categoryID,
        dataSource: dataSource ?? this.dataSource,
        value: value ?? this.value,
        hashID: hashID ?? this.hashID,
        period: period ?? this.period,
        unit: unit ?? this.unit,
        csaSubjectID: csaSubjectID != null ? csaSubjectID() : this.csaSubjectID,
      );
}
