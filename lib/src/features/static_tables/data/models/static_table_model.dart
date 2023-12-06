// ignore_for_file: public_member_api_docs

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:stadata_flutter_sdk/src/features/static_tables/data/serializers/table_serializer.dart';
import 'package:stadata_flutter_sdk/stadata_flutter_sdk.dart';

part 'static_table_model.freezed.dart';
part 'static_table_model.g.dart';

@freezed
abstract class StaticTableModel with _$StaticTableModel {
  factory StaticTableModel({
    @JsonKey(name: 'table_id') required int id,
    required String title,
    @JsonKey(name: 'subj_id', readValue: _subjectIdValueReader)
    required int subjectId,
    required String size,
    @JsonKey(name: 'updt_date') required DateTime updatedAt,
    required String excel,
    @JsonKey(name: 'subj') String? subject,
    @TableSerializer() @JsonKey() String? table,
    @JsonKey(name: 'cr_date') DateTime? createdAt,
  }) = _StaticTableModel;
  factory StaticTableModel.fromJson(Map<String, dynamic> json) =>
      _$StaticTableModelFromJson(json);
}

Object? _subjectIdValueReader(Map<dynamic, dynamic> json, String key) {
  if (json[key] == null) return json['sub_id'];

  return json[key];
}

extension StaticTableModelX on StaticTableModel {
  StaticTable toEntity() => StaticTable(
        id: id,
        title: title,
        size: size,
        updatedAt: updatedAt,
        excel: excel,
        subjectID: subjectId,
        createdAt: createdAt,
        subject: subject,
        table: table,
      );
}
