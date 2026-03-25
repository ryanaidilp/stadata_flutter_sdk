import 'package:flutter_test/flutter_test.dart';
import 'package:stadata_flutter_sdk/src/features/dynamic_tables/domain/entities/structured_data.dart';

void main() {
  group('DynamicTableStructuredData entities', () {
    test('should support equality for complete structured data', () {
      const level4 = StructuredDataLevel4(id: 0, label: 'Tahun', value: 100);
      const level3 = StructuredDataLevel3(
        id: 99,
        label: '1999',
        data: <StructuredDataLevel4>[level4],
      );
      const level2 = StructuredDataLevel2(
        id: 0,
        label: 'Turvar',
        data: <StructuredDataLevel3>[level3],
      );
      const level1 = StructuredDataLevel1(
        id: 7315,
        label: 'Pinrang',
        data: <StructuredDataLevel2>[level2],
      );

      const dataA = DynamicTableStructuredData(
        subjectId: 1,
        subjectLabel: 'Population',
        variableId: 31,
        variableLabel: 'Jumlah Penduduk',
        variableUnit: 'Jiwa',
        verticalVariableLabel: 'Kecamatan',
        data: <StructuredDataLevel1>[level1],
        lastUpdate: '2026-03-26',
      );
      const dataB = DynamicTableStructuredData(
        subjectId: 1,
        subjectLabel: 'Population',
        variableId: 31,
        variableLabel: 'Jumlah Penduduk',
        variableUnit: 'Jiwa',
        verticalVariableLabel: 'Kecamatan',
        data: <StructuredDataLevel1>[level1],
        lastUpdate: '2026-03-26',
      );

      expect(dataA, dataB);
    });

    test('level 3 should support direct value without level 4 data', () {
      const level3 = StructuredDataLevel3(id: 99, label: '1999', value: 12345);

      expect(level3.value, 12345);
      expect(level3.data, isNull);
    });
  });
}
