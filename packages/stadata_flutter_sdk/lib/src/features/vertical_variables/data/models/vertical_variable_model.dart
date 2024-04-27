// ignore_for_file: public_member_api_docs

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:stadata_flutter_sdk/stadata_flutter_sdk.dart';

part 'vertical_variable_model.freezed.dart';
part 'vertical_variable_model.g.dart';

@freezed
abstract class VerticalVariableModel with _$VerticalVariableModel {
  factory VerticalVariableModel({
    @JsonKey(name: 'kode_ver_id') required int id,
    @JsonKey(name: 'vervar') required String title,
    @JsonKey(name: 'item_ver_id') required int itemID,
    @JsonKey(name: 'group_ver_id') int? groupID,
    @JsonKey(name: 'name_group_ver_id') String? groupName,
  }) = _VerticalVariableModel;
  factory VerticalVariableModel.fromJson(Map<String, dynamic> json) =>
      _$VerticalVariableModelFromJson(json);
}

extension VerticalVariableModelX on VerticalVariableModel {
  VerticalVariable toEntity() => VerticalVariable(
        id: id,
        title: title,
        itemID: itemID,
        groupID: groupID,
        groupName: groupName,
      );
}
