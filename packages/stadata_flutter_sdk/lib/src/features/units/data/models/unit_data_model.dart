// ignore_for_file: public_member_api_docs

import 'package:stadata_flutter_sdk/src/core/core.dart';
import 'package:stadata_flutter_sdk/src/features/features.dart';

const _idKey = 'unit_id';
const _unitKey = 'unit';

class UnitDataModel extends UnitData {
  const UnitDataModel({
    required super.id,
    required super.title,
  });

  factory UnitDataModel.fromJson(JSON json) => UnitDataModel(
        id: json[_idKey] as int,
        title: json[_unitKey] as String,
      );

  UnitDataModel copyWith({
    int? id,
    String? title,
  }) =>
      UnitDataModel(
        id: id ?? this.id,
        title: title ?? this.title,
      );
}
