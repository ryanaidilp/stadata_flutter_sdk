// ignore_for_file: public_member_api_docs

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:stadata_flutter_sdk/src/features/features.dart';

part 'unit_data_model.freezed.dart';
part 'unit_data_model.g.dart';

@freezed
abstract class UnitDataModel with _$UnitDataModel {
  factory UnitDataModel({
    @JsonKey(name: 'unit_id') required int id,
    @JsonKey(name: 'unit', defaultValue: '-') required String title,
  }) = _UnitDataModel;
  factory UnitDataModel.fromJson(Map<String, dynamic> json) =>
      _$UnitDataModelFromJson(json);
}

extension UnitDataModelX on UnitDataModel {
  UnitData toEntity() => UnitData(id: id, title: title);
}
