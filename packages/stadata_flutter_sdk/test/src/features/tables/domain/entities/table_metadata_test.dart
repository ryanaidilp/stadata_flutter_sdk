import 'package:flutter_test/flutter_test.dart';
import 'package:stadata_flutter_sdk/src/features/tables/domain/entities/table_metadata.dart';
import 'package:stadata_flutter_sdk/src/features/tables/domain/enums/table_type.dart';

void main() {
  group('TableMetadata', () {
    test('should return isDynamic true for dynamic table type', () {
      const metadata = TableMetadata(
        id: '11',
        title: 'Dynamic Table',
        type: TableType.dynamic,
      );

      expect(metadata.isDynamic, isTrue);
      expect(metadata.isStatic, isFalse);
      expect(metadata.isSimdasi, isFalse);
    });

    test('should return isStatic true for static table type', () {
      const metadata = TableMetadata(
        id: '12',
        title: 'Static Table',
        type: TableType.static,
      );

      expect(metadata.isStatic, isTrue);
      expect(metadata.isDynamic, isFalse);
      expect(metadata.isSimdasi, isFalse);
    });

    test('should return isSimdasi true for simdasi table type', () {
      const metadata = TableMetadata(
        id: '13',
        title: 'Simdasi Table',
        type: TableType.simdasi,
      );

      expect(metadata.isSimdasi, isTrue);
      expect(metadata.isDynamic, isFalse);
      expect(metadata.isStatic, isFalse);
    });

    test('should include all values in props for equality', () {
      final metadataA = TableMetadata(
        id: '14',
        title: 'Table',
        type: TableType.static,
        subjectID: 1,
        subjectName: 'Subject',
        domain: '0000',
        tableSource: '1',
        updatedAt: DateTime(2026),
      );

      final metadataB = TableMetadata(
        id: '14',
        title: 'Table',
        type: TableType.static,
        subjectID: 1,
        subjectName: 'Subject',
        domain: '0000',
        tableSource: '1',
        updatedAt: DateTime(2026),
      );

      expect(metadataA, metadataB);
    });
  });
}
