// ignore_for_file: public_member_api_docs

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:stadata_flutter_sdk/src/features/variables/domain/entities/variable.dart';

part 'variable_model.freezed.dart';
part 'variable_model.g.dart';

@freezed
abstract class VariableModel with _$VariableModel {
  factory VariableModel({
    @JsonKey(name: 'var_id') required int id,
    @JsonKey() required String notes, @JsonKey(name: 'sub_id') required int subjectID, @JsonKey(name: 'sub_name') required String subjectName, @JsonKey() required String title, @JsonKey(name: 'vertical') required int verticalVariableID, @JsonKey(defaultValue: '') String? graphName,
    @JsonKey(defaultValue: '')  String? unit,
    @JsonKey(name: 'subcsa_id') int? csaSubjectID,
    @JsonKey(name: 'subcsa_name') String? csaSubjectName,
    @JsonKey() int? type,
    @JsonKey(name: 'turth') int? derivedPeriodID,
    @JsonKey(name: 'turvar') int? derivedVariableID,
  }) = _VariableModel;
  factory VariableModel.fromJson(Map<String, dynamic> json) =>
      _$VariableModelFromJson(json);
}

extension VariableModelX on VariableModel {
  Variable toEntity() => Variable(
        id: id,
        graphName: graphName ?? '',
        notes: notes,
        subjectID: subjectID,
        subjectName: subjectName,
        title: title,
        unit: unit ?? '',
        verticalVariableID: verticalVariableID,
        type: type,
        csaSubjectID: csaSubjectID,
        csaSubjectName: csaSubjectName,
        derivedPeriodID: derivedPeriodID,
        derivedVariableID: derivedVariableID,
      );
}
