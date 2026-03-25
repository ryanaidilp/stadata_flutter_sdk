import 'package:flutter_test/flutter_test.dart';
import 'package:stadata_flutter_sdk/src/features/tables/domain/enums/table_type.dart';

void main() {
  group('TableType', () {
    group('fromString', () {
      test('should return static for static variations', () {
        expect(TableType.fromString('static'), TableType.static);
        expect(TableType.fromString('statis'), TableType.static);
        expect(TableType.fromString('1'), TableType.static);
      });

      test('should return dynamic for dynamic variations', () {
        expect(TableType.fromString('dynamic'), TableType.dynamic);
        expect(TableType.fromString('dinamis'), TableType.dynamic);
        expect(TableType.fromString('2'), TableType.dynamic);
      });

      test('should return simdasi for simdasi variations', () {
        expect(TableType.fromString('simdasi'), TableType.simdasi);
        expect(TableType.fromString('3'), TableType.simdasi);
      });

      test(
        'should return unknown for null, empty, and unrecognized values',
        () {
          expect(TableType.fromString(null), TableType.unknown);
          expect(TableType.fromString(''), TableType.unknown);
          expect(TableType.fromString('  '), TableType.unknown);
          expect(TableType.fromString('other'), TableType.unknown);
        },
      );

      test('should normalize case and whitespace', () {
        expect(TableType.fromString('  STATIC  '), TableType.static);
        expect(TableType.fromString(' Dynamic '), TableType.dynamic);
      });
    });

    group('toApiValue', () {
      test('should return static api values', () {
        expect(TableType.static.toApiValue(), 'static');
      });

      test('should return dynamic api values', () {
        expect(TableType.dynamic.toApiValue(), 'dynamic');
      });

      test('should return simdasi api values', () {
        expect(TableType.simdasi.toApiValue(), 'simdasi');
      });

      test('should return unknown api values', () {
        expect(TableType.unknown.toApiValue(), 'unknown');
      });
    });
  });
}
