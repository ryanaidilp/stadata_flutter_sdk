import 'package:stadata_flutter_sdk/src/core/core.dart';
import 'package:stadata_flutter_sdk/src/features/dynamic_tables/domain/entities/entities.dart';

const _valKey = 'val';
const _labelKey = 'label';
const _unitKey = 'unit';
const _subjKey = 'subj';
const _defKey = 'def';
const _noteKey = 'note';

/// Data model for [VariableInfo].
///
/// Handles JSON serialization for variable metadata from BPS API.
class VariableInfoModel extends VariableInfo {
  /// Creates a [VariableInfoModel].
  const VariableInfoModel({
    required super.value,
    required super.label,
    required super.unit,
    required super.subject,
    super.definition = '',
    super.notes = '',
  });

  /// Creates a [VariableInfoModel] from JSON.
  ///
  /// Expected structure:
  /// ```json
  /// {
  ///   "val": 31,
  ///   "label": "Jumlah Penduduk",
  ///   "unit": "Jiwa",
  ///   "subj": "Kependudukan",
  ///   "def": "",
  ///   "note": ""
  /// }
  /// ```
  factory VariableInfoModel.fromJson(JSON json) => VariableInfoModel(
    value: json[_valKey] as int,
    label: json[_labelKey] as String,
    unit: json[_unitKey] as String,
    subject: json[_subjKey] as String,
    definition: json[_defKey] as String? ?? '',
    notes: json[_noteKey] as String? ?? '',
  );

  /// Converts to JSON.
  JSON toJson() => {
    _valKey: value,
    _labelKey: label,
    _unitKey: unit,
    _subjKey: subject,
    _defKey: definition,
    _noteKey: notes,
  };

  /// Creates a copy with replaced fields.
  VariableInfoModel copyWith({
    int? value,
    String? label,
    String? unit,
    String? subject,
    String? definition,
    String? notes,
  }) => VariableInfoModel(
    value: value ?? this.value,
    label: label ?? this.label,
    unit: unit ?? this.unit,
    subject: subject ?? this.subject,
    definition: definition ?? this.definition,
    notes: notes ?? this.notes,
  );
}

/// Data model for [VerticalVariableInfo] and similar value/label pairs.
///
/// Used for vervar, turvar, tahun, turtahun arrays.
class VerticalVariableInfoModel extends VerticalVariableInfo {
  /// Creates a [VerticalVariableInfoModel].
  const VerticalVariableInfoModel({
    required super.value,
    required super.label,
  });

  /// Creates from JSON.
  ///
  /// Expected structure:
  /// ```json
  /// {
  ///   "val": 7315,
  ///   "label": "Pinrang"
  /// }
  /// ```
  factory VerticalVariableInfoModel.fromJson(JSON json) =>
      VerticalVariableInfoModel(
        value: json[_valKey],
        label: json[_labelKey] as String,
      );

  /// Converts to JSON.
  JSON toJson() => {
    _valKey: value,
    _labelKey: label,
  };

  /// Creates a copy with replaced fields.
  VerticalVariableInfoModel copyWith({
    dynamic value,
    String? label,
  }) => VerticalVariableInfoModel(
    value: value ?? this.value,
    label: label ?? this.label,
  );
}

/// Data model for [PeriodInfo].
///
/// Alias for [VerticalVariableInfoModel] with semantic naming.
class PeriodInfoModel extends PeriodInfo {
  /// Creates a [PeriodInfoModel].
  const PeriodInfoModel({
    required super.value,
    required super.label,
  });

  /// Creates from JSON.
  factory PeriodInfoModel.fromJson(JSON json) => PeriodInfoModel(
    value: json[_valKey],
    label: json[_labelKey] as String,
  );

  /// Converts to JSON.
  JSON toJson() => {
    _valKey: value,
    _labelKey: label,
  };

  /// Creates a copy with replaced fields.
  PeriodInfoModel copyWith({
    dynamic value,
    String? label,
  }) => PeriodInfoModel(
    value: value ?? this.value,
    label: label ?? this.label,
  );
}
