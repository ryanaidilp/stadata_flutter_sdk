// ignore_for_file: public_member_api_docs

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:stadata_flutter_sdk/stadata_flutter_sdk.dart';

part 'strategic_indicator_model.freezed.dart';
part 'strategic_indicator_model.g.dart';

@freezed
abstract class StrategicIndicatorModel with _$StrategicIndicatorModel {
  factory StrategicIndicatorModel({
    @JsonKey(name: 'indicator_id') required int id,
    @JsonKey(name: 'var') required int variableID,
    @JsonKey(name: 'subject_csa') required int csaSubjectID,
    @JsonKey(name: 'category') required int categoryID,
    required String name,
    required String title,
    required String dataSource,
    required double value,
    required String unit,
    @JsonKey(name: 'hash_id') required String hashID,
    required String period,
  }) = _StrategicIndicatorModel;
  factory StrategicIndicatorModel.fromJson(Map<String, dynamic> json) =>
      _$StrategicIndicatorModelFromJson(json);

  factory StrategicIndicatorModel.fromEntity(
    StrategicIndicator strategicIndicator,
  ) =>
      StrategicIndicatorModel(
        id: strategicIndicator.id,
        categoryID: strategicIndicator.categoryID,
        variableID: strategicIndicator.variableID,
        csaSubjectID: strategicIndicator.csaSubjectID,
        name: strategicIndicator.name,
        title: strategicIndicator.title,
        dataSource: strategicIndicator.dataSource,
        value: strategicIndicator.value,
        unit: strategicIndicator.unit,
        hashID: strategicIndicator.hashID,
        period: strategicIndicator.period,
      );
}

extension StrategicIndicatorModelX on StrategicIndicatorModel {
  StrategicIndicator toEntity() => StrategicIndicator(
        id: id,
        title: title,
        name: name,
        dataSource: dataSource,
        value: value,
        unit: unit,
        period: period,
        hashID: hashID,
        categoryID: categoryID,
        variableID: variableID,
        csaSubjectID: csaSubjectID,
      );
}
