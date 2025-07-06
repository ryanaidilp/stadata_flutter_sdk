import 'package:stadata_flutter_sdk/src/core/core.dart';
import 'package:stadata_flutter_sdk/src/features/features.dart';

class CensusCategoryModel extends CensusCategory {
  const CensusCategoryModel({
    required super.id,
    required super.name,
    required super.itemID,
    required super.itemCode,
    required super.itemName,
  });

  CensusCategoryModel copyWith({
    String? id,
    String? name,
    String? itemID,
    String? itemCode,
    String? itemName,
  }) => CensusCategoryModel(
    id: id ?? this.id,
    name: name ?? this.name,
    itemID: itemID ?? this.itemID,
    itemCode: itemCode ?? this.itemCode,
    itemName: itemName ?? this.itemName,
  );

  /// Creates a [CensusCategoryModel] from JSON with specific index
  /// This factory is used when parsing categories from census data JSON
  CensusCategoryModel.fromJsonWithIndex(JSON json, int index)
    : super(
        id: json['id_kategori_$index'] as String? ?? '',
        name: json['nama_kategori_$index'] as String? ?? '',
        itemID: json['id_item_kategori_$index'] as String? ?? '',
        itemCode: json['kode_item_kategori_$index'] as String? ?? '',
        itemName: json['nama_item__kategori_$index'] as String? ?? '',
      );

  JSON toJson() => {
    'id': id,
    'name': name,
    'itemID': itemID,
    'itemCode': itemCode,
    'itemName': itemName,
  };

  CensusCategoryModel.fromEntity(CensusCategory entity)
    : super(
        id: entity.id,
        name: entity.name,
        itemID: entity.itemID,
        itemCode: entity.itemCode,
        itemName: entity.itemName,
      );
}
