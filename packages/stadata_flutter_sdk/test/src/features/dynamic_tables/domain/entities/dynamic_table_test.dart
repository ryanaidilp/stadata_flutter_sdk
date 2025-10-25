import 'package:flutter_test/flutter_test.dart';
import 'package:stadata_flutter_sdk/src/core/core.dart';
import 'package:stadata_flutter_sdk/src/features/features.dart';

void main() {
  const tData = [
    DynamicTableData(
      period: '2023',
      values: {'1234': '75.5', '5678': '82.3'},
    ),
    DynamicTableData(
      period: '2022',
      values: {'1234': '72.1', '5678': '80.0'},
    ),
  ];

  const tDynamicTable = DynamicTable(
    variableID: 123,
    title: 'GDP by Province',
    subjectID: 45,
    subjectName: 'National Account',
    notes: 'Annual GDP data for provinces',
    unit: 'Billion Rupiah',
    verticalVariableID: 67,
    domain: '7200',
    csaSubjectID: 10,
    csaSubjectName: 'Economic Statistics',
    graphID: 5,
    graphName: 'GDP Growth Chart',
    data: tData,
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
          123,
          'GDP by Province',
          45,
          'National Account',
          'Annual GDP data for provinces',
          'Billion Rupiah',
          67,
          '7200',
          10,
          'Economic Statistics',
          5,
          'GDP Growth Chart',
          tData,
        ],
      );
    });

    test('should support equality comparison', () {
      // arrange
      const anotherDynamicTable = DynamicTable(
        variableID: 123,
        title: 'GDP by Province',
        subjectID: 45,
        subjectName: 'National Account',
        notes: 'Annual GDP data for provinces',
        unit: 'Billion Rupiah',
        verticalVariableID: 67,
        domain: '7200',
        csaSubjectID: 10,
        csaSubjectName: 'Economic Statistics',
        graphID: 5,
        graphName: 'GDP Growth Chart',
        data: tData,
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
        variableID: 123,
        title: 'GDP by Province',
        subjectID: 45,
        subjectName: 'National Account',
        notes: 'Annual GDP data',
        unit: 'Billion Rupiah',
        verticalVariableID: 67,
        domain: '7200',
      );

      // assert
      expect(tableWithNullOptionals.csaSubjectID, isNull);
      expect(tableWithNullOptionals.csaSubjectName, isNull);
      expect(tableWithNullOptionals.graphID, isNull);
      expect(tableWithNullOptionals.graphName, isNull);
      expect(tDynamicTable.csaSubjectID, 10);
      expect(tDynamicTable.csaSubjectName, 'Economic Statistics');
    });

    test('should handle empty data list', () {
      // arrange
      const tableWithEmptyData = DynamicTable(
        variableID: 123,
        title: 'GDP by Province',
        subjectID: 45,
        subjectName: 'National Account',
        notes: 'Annual GDP data',
        unit: 'Billion Rupiah',
        verticalVariableID: 67,
        domain: '7200',
      );

      // assert
      expect(tableWithEmptyData.data, isEmpty);
      expect(tDynamicTable.data, isNotEmpty);
      expect(tDynamicTable.data.length, 2);
    });
  });

  group('DynamicTableData', () {
    const tTableData = DynamicTableData(
      period: '2023',
      values: {'1234': '75.5', '5678': '82.3'},
    );

    test('should be a subclass of BaseEntity', () {
      // assert
      expect(tTableData, isA<BaseEntity>());
    });

    test('should return correct props', () {
      // act
      final props = tTableData.props;

      // assert
      expect(
        props,
        [
          '2023',
          {'1234': '75.5', '5678': '82.3'},
        ],
      );
    });

    test('should support equality comparison', () {
      // arrange
      const anotherTableData = DynamicTableData(
        period: '2023',
        values: {'1234': '75.5', '5678': '82.3'},
      );

      // assert
      expect(tTableData, equals(anotherTableData));
    });

    test('should not be equal when properties differ', () {
      // arrange
      const differentTableData = DynamicTableData(
        period: '2022',
        values: {'1234': '72.1'},
      );

      // assert
      expect(tTableData, isNot(equals(differentTableData)));
    });

    test('should handle empty values map', () {
      // arrange
      const tableDataWithEmptyValues = DynamicTableData(
        period: '2023',
        values: {},
      );

      // assert
      expect(tableDataWithEmptyValues.values, isEmpty);
      expect(tTableData.values, isNotEmpty);
    });
  });
}
