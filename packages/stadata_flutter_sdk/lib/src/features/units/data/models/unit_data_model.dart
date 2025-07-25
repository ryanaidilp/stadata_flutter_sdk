import 'package:stadata_flutter_sdk/src/core/core.dart';
import 'package:stadata_flutter_sdk/src/features/features.dart';

const _idKey = 'unit_id';
const _unitKey = 'unit';

class UnitDataModel extends UnitData {
  const UnitDataModel({required super.id, required super.title});

  factory UnitDataModel.fromJson(JSON json) => UnitDataModel(
    id: json[_idKey] as int,
    title: json[_unitKey] as String? ?? '-',
  );

  JSON toJson() => {_idKey: id, _unitKey: title};

  UnitDataModel copyWith({int? id, String? title}) =>
      UnitDataModel(id: id ?? this.id, title: title ?? this.title);
}
