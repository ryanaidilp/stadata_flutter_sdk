import 'package:flutter_test/flutter_test.dart';
import 'package:stadata_flutter_sdk/src/core/core.dart';
import 'package:stadata_flutter_sdk/src/features/features.dart';

void main() {
  const tVariables = [
    VariableInfo(
      value: 31,
      label: 'Jumlah Penduduk',
      unit: 'Jiwa',
      subject: 'Kependudukan',
    ),
  ];

  const tVerticalVariables = [
    VerticalVariableInfo(
      value: 7315,
      label: 'Pinrang',
    ),
  ];

  const tPeriods = [
    PeriodInfo(value: 99, label: '1999'),
    PeriodInfo(value: 100, label: '2000'),
    PeriodInfo(value: 101, label: '2001'),
  ];

  const tDerivedVariables = [
    VerticalVariableInfo(value: 0, label: 'Tidak Ada'),
  ];

  const tDerivedPeriods = [
    VerticalVariableInfo(value: 0, label: 'Tahun'),
  ];

  const tDataContent = {
    '7315310990': 308669,
    '73153101000': 311595,
    '73153101010': 312473,
  };

  const tDynamicTable = DynamicTable(
    variableID: 31,
    title: 'Jumlah Penduduk',
    subjectID: 0,
    subjectName: 'Kependudukan',
    notes: '',
    unit: 'Jiwa',
    verticalVariableID: 7315,
    domain: '7315',
    variables: tVariables,
    verticalVariables: tVerticalVariables,
    periods: tPeriods,
    derivedVariables: tDerivedVariables,
    derivedPeriods: tDerivedPeriods,
    verticalVariableLabel: 'Kecamatan',
    dataContent: tDataContent,
  );

  group('DynamicTable', () {
    test('should be a subclass of BaseEntity', () {
      // assert
      expect(tDynamicTable, isA<BaseEntity>());
    });

    test('should return correct props', () {
      // act
      final props = tDynamicTable.props;

      // assert
      expect(
        props,
        [
          31,
          'Jumlah Penduduk',
          0,
          'Kependudukan',
          '',
          'Jiwa',
          7315,
          '7315',
          null,
          null,
          null,
          null,
          tVariables,
          tVerticalVariables,
          tPeriods,
          tDerivedVariables,
          tDerivedPeriods,
          'Kecamatan',
          tDataContent,
        ],
      );
    });

    test('should support equality comparison', () {
      // arrange
      const anotherDynamicTable = DynamicTable(
        variableID: 31,
        title: 'Jumlah Penduduk',
        subjectID: 0,
        subjectName: 'Kependudukan',
        notes: '',
        unit: 'Jiwa',
        verticalVariableID: 7315,
        domain: '7315',
        variables: tVariables,
        verticalVariables: tVerticalVariables,
        periods: tPeriods,
        derivedVariables: tDerivedVariables,
        derivedPeriods: tDerivedPeriods,
        verticalVariableLabel: 'Kecamatan',
        dataContent: tDataContent,
      );

      // assert
      expect(tDynamicTable, equals(anotherDynamicTable));
    });

    test('should not be equal when properties differ', () {
      // arrange
      const differentDynamicTable = DynamicTable(
        variableID: 456,
        title: 'Different Table',
        subjectID: 46,
        subjectName: 'Different Subject',
        notes: 'Different notes',
        unit: 'Different Unit',
        verticalVariableID: 68,
        domain: '7201',
      );

      // assert
      expect(tDynamicTable, isNot(equals(differentDynamicTable)));
    });

    test('should handle nullable optional fields', () {
      // arrange
      const tableWithNullOptionals = DynamicTable(
        variableID: 31,
        title: 'Jumlah Penduduk',
        subjectID: 0,
        subjectName: 'Kependudukan',
        notes: '',
        unit: 'Jiwa',
        verticalVariableID: 7315,
        domain: '7315',
      );

      // assert
      expect(tableWithNullOptionals.csaSubjectID, isNull);
      expect(tableWithNullOptionals.csaSubjectName, isNull);
      expect(tableWithNullOptionals.graphID, isNull);
      expect(tableWithNullOptionals.graphName, isNull);
      expect(tableWithNullOptionals.verticalVariableLabel, isNull);
      expect(tDynamicTable.verticalVariableLabel, 'Kecamatan');
    });

    test('should handle empty metadata arrays', () {
      // arrange
      const tableWithEmptyArrays = DynamicTable(
        variableID: 31,
        title: 'Jumlah Penduduk',
        subjectID: 0,
        subjectName: 'Kependudukan',
        notes: '',
        unit: 'Jiwa',
        verticalVariableID: 7315,
        domain: '7315',
      );

      // assert
      expect(tableWithEmptyArrays.variables, isEmpty);
      expect(tableWithEmptyArrays.verticalVariables, isEmpty);
      expect(tableWithEmptyArrays.periods, isEmpty);
      expect(tableWithEmptyArrays.derivedVariables, isEmpty);
      expect(tableWithEmptyArrays.derivedPeriods, isEmpty);
      expect(tableWithEmptyArrays.dataContent, isEmpty);
      expect(tDynamicTable.variables, isNotEmpty);
      expect(tDynamicTable.verticalVariables, isNotEmpty);
      expect(tDynamicTable.periods.length, 3);
    });
  });

  group('VariableInfo', () {
    const tVariableInfo = VariableInfo(
      value: 31,
      label: 'Jumlah Penduduk',
      unit: 'Jiwa',
      subject: 'Kependudukan',
      definition: 'Total population',
      notes: 'Annual census data',
    );

    test('should be a subclass of BaseEntity', () {
      // assert
      expect(tVariableInfo, isA<BaseEntity>());
    });

    test('should return correct props', () {
      // act
      final props = tVariableInfo.props;

      // assert
      expect(
        props,
        [
          31,
          'Jumlah Penduduk',
          'Jiwa',
          'Kependudukan',
          'Total population',
          'Annual census data',
        ],
      );
    });

    test('should support equality comparison', () {
      // arrange
      const anotherVariableInfo = VariableInfo(
        value: 31,
        label: 'Jumlah Penduduk',
        unit: 'Jiwa',
        subject: 'Kependudukan',
        definition: 'Total population',
        notes: 'Annual census data',
      );

      // assert
      expect(tVariableInfo, equals(anotherVariableInfo));
    });

    test('should handle empty definition and notes', () {
      // arrange
      const minimalVariableInfo = VariableInfo(
        value: 31,
        label: 'Jumlah Penduduk',
        unit: 'Jiwa',
        subject: 'Kependudukan',
      );

      // assert
      expect(minimalVariableInfo.definition, isEmpty);
      expect(minimalVariableInfo.notes, isEmpty);
    });
  });

  group('VerticalVariableInfo', () {
    const tVerticalVariableInfo = VerticalVariableInfo(
      value: 7315,
      label: 'Pinrang',
    );

    test('should be a subclass of BaseEntity', () {
      // assert
      expect(tVerticalVariableInfo, isA<BaseEntity>());
    });

    test('should return correct props', () {
      // act
      final props = tVerticalVariableInfo.props;

      // assert
      expect(props, [7315, 'Pinrang']);
    });

    test('should support equality comparison', () {
      // arrange
      const anotherVerticalVariableInfo = VerticalVariableInfo(
        value: 7315,
        label: 'Pinrang',
      );

      // assert
      expect(tVerticalVariableInfo, equals(anotherVerticalVariableInfo));
    });

    test('should handle dynamic value type', () {
      // arrange
      const intValue = VerticalVariableInfo(value: 7315, label: 'Pinrang');
      const stringValue = VerticalVariableInfo(value: '7315', label: 'Pinrang');

      // assert
      expect(intValue.value, isA<int>());
      expect(stringValue.value, isA<String>());
    });
  });

  group('PeriodInfo', () {
    const tPeriodInfo = PeriodInfo(value: 99, label: '1999');

    test('should be a subclass of BaseEntity', () {
      // assert
      expect(tPeriodInfo, isA<BaseEntity>());
    });

    test('should return correct props', () {
      // act
      final props = tPeriodInfo.props;

      // assert
      expect(props, [99, '1999']);
    });

    test('should support equality comparison', () {
      // arrange
      const anotherPeriodInfo = PeriodInfo(value: 99, label: '1999');

      // assert
      expect(tPeriodInfo, equals(anotherPeriodInfo));
    });

    test('should handle dynamic value type', () {
      // arrange
      const intValue = PeriodInfo(value: 99, label: '1999');
      const stringValue = PeriodInfo(value: '99', label: '1999');

      // assert
      expect(intValue.value, isA<int>());
      expect(stringValue.value, isA<String>());
    });
  });
}
