import 'package:stadata_flutter_sdk/src/core/core.dart';
import 'package:stadata_flutter_sdk/src/features/features.dart';

const _regionIDKey = 'id_wilayah';
const _regionCodeKey = 'kode_wilayah';
const _regionNameKey = 'nama_wilayah';
const _regionLevelKey = 'level_wilayah';
const _indicatorIDKey = 'id_indikator';
const _indicatorNameKey = 'nama_indikator';
const _periodKey = 'period';
const _valueKey = 'nilai';

class CensusDataModel extends CensusData {
  const CensusDataModel({
    required super.regionID,
    required super.regionCode,
    required super.regionName,
    required super.indicatorID,
    required super.indicatorName,
    required super.categories,
    required super.period,
    required super.value,
    super.regionLevel,
  });

  CensusDataModel copyWith({
    String? regionID,
    String? regionCode,
    String? regionName,
    String? regionLevel,
    String? indicatorID,
    String? indicatorName,
    List<CensusCategory>? categories,
    String? period,
    num? value,
  }) => CensusDataModel(
    regionID: regionID ?? this.regionID,
    regionCode: regionCode ?? this.regionCode,
    regionName: regionName ?? this.regionName,
    indicatorID: indicatorID ?? this.indicatorID,
    indicatorName: indicatorName ?? this.indicatorName,
    categories: categories ?? this.categories,
    period: period ?? this.period,
    value: value ?? this.value,
    regionLevel: regionLevel ?? this.regionLevel,
  );

  CensusDataModel.fromJson(JSON json)
    : super(
        regionID: json[_regionIDKey] as String,
        regionCode: json[_regionCodeKey] as String,
        regionName: json[_regionNameKey] as String,
        indicatorID: json[_indicatorIDKey] as String,
        indicatorName: json[_indicatorNameKey] as String,
        categories: _parseCategories(json),
        period: json[_periodKey] as String,
        value: json[_valueKey] as num,
        regionLevel: json[_regionLevelKey]?.toString(),
      );

  /// Parses categories from JSON, handling up to 5 categories
  static List<CensusCategory> _parseCategories(JSON json) {
    final categories = <CensusCategory>[];

    for (int i = 1; i <= 5; i++) {
      final categoryID = json['id_kategori_$i'] as String?;
      final categoryName = json['nama_kategori_$i'] as String?;
      final itemID = json['id_item_kategori_$i'] as String?;
      final itemCode = json['kode_item_kategori_$i'] as String?;
      final itemName = json['nama_item__kategori_$i'] as String?;

      // If any required field is null or empty, skip this category
      if (categoryID == null ||
          categoryName == null ||
          itemID == null ||
          itemCode == null ||
          itemName == null ||
          categoryID.isEmpty ||
          categoryName.isEmpty ||
          itemID.isEmpty ||
          itemCode.isEmpty ||
          itemName.isEmpty) {
        continue;
      }

      categories.add(
        CensusCategoryModel(
          id: categoryID,
          name: categoryName,
          itemID: itemID,
          itemCode: itemCode,
          itemName: itemName,
        ),
      );
    }

    return categories;
  }

  JSON toJson() => {
    _regionIDKey: regionID,
    _regionCodeKey: regionCode,
    _regionNameKey: regionName,
    _regionLevelKey: regionLevel,
    _indicatorIDKey: indicatorID,
    _indicatorNameKey: indicatorName,
    _periodKey: period,
    _valueKey: value,
    // Categories would need to be serialized back to individual fields
    // if needed for API calls
  };

  CensusDataModel.fromEntity(CensusData entity)
    : super(
        regionID: entity.regionID,
        regionCode: entity.regionCode,
        regionName: entity.regionName,
        indicatorID: entity.indicatorID,
        indicatorName: entity.indicatorName,
        categories: entity.categories,
        period: entity.period,
        value: entity.value,
        regionLevel: entity.regionLevel,
      );
}
