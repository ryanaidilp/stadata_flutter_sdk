import 'package:flutter_test/flutter_test.dart';
import 'package:stadata_flutter_sdk/src/features/dynamic_tables/domain/entities/data_key.dart';

void main() {
  group('DataContentKey', () {
    test('parse should extract each part from known value sets', () {
      final result = DataContentKey.parse(
        '7315310990',
        vervarValues: const <int>[7315],
        varValues: const <int>[31],
        turvarValues: const <int>[0],
        tahunValues: const <int>[99],
        turtahunValues: const <int>[0],
      );

      expect(result.compositeKey, '7315310990');
      expect(result.verticalVariable, 7315);
      expect(result.variable, 31);
      expect(result.derivedVariable, 0);
      expect(result.period, 99);
      expect(result.derivedPeriod, 0);
    });

    test('parse should fall back to zero values when no match found', () {
      final result = DataContentKey.parse(
        '999999',
        vervarValues: const <int>[7315],
        varValues: const <int>[31],
        turvarValues: const <int>[0],
        tahunValues: const <int>[99],
        turtahunValues: const <int>[0],
      );

      expect(result.verticalVariable, 0);
      expect(result.variable, 0);
      expect(result.derivedVariable, 0);
      expect(result.period, 0);
      expect(result.derivedPeriod, 0);
    });

    test('toString should include parsed dimensions', () {
      const dataKey = DataContentKey(
        compositeKey: '7315310990',
        verticalVariable: 7315,
        variable: 31,
        derivedVariable: 0,
        period: 99,
        derivedPeriod: 0,
      );

      expect(
        dataKey.toString(),
        'DataContentKey(vervar: 7315, var: 31, turvar: 0, tahun: 99, turtahun: 0)',
      );
    });

    test('props should support equality', () {
      const keyA = DataContentKey(
        compositeKey: '7315310990',
        verticalVariable: 7315,
        variable: 31,
        derivedVariable: 0,
        period: 99,
        derivedPeriod: 0,
      );
      const keyB = DataContentKey(
        compositeKey: '7315310990',
        verticalVariable: 7315,
        variable: 31,
        derivedVariable: 0,
        period: 99,
        derivedPeriod: 0,
      );

      expect(keyA, keyB);
    });
  });
}
