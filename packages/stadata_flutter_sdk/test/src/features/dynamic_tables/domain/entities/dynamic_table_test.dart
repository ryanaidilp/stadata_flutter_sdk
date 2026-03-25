import 'package:flutter_test/flutter_test.dart';
import 'package:stadata_flutter_sdk/src/features/dynamic_tables/domain/entities/dynamic_table.dart';
import 'package:stadata_flutter_sdk/src/features/dynamic_tables/domain/entities/variable_info.dart';

void main() {
  group('DynamicTable', () {
    const baseVariables = <VariableInfo>[
      VariableInfo(
        value: 31,
        label: 'Jumlah Penduduk',
        unit: 'Jiwa',
        subject: 'Kependudukan',
      ),
    ];
    const baseVerticalVariables = <VerticalVariableInfo>[
      VerticalVariableInfo(value: 7315, label: 'Pinrang'),
    ];
    const basePeriods = <PeriodInfo>[
      PeriodInfo(value: 99, label: '1999'),
      PeriodInfo(value: 100, label: '2000'),
    ];

    test('getDataValue should return value based on composite key', () {
      const table = DynamicTable(
        variableID: 31,
        title: 'Jumlah Penduduk',
        subjectID: 1,
        subjectName: 'Kependudukan',
        notes: '',
        unit: 'Jiwa',
        verticalVariableID: 7315,
        domain: '7315',
        dataContent: <String, dynamic>{'7315310990': 308669},
      );

      final value = table.getDataValue(
        vervarValue: 7315,
        varValue: 31,
        turvarValue: 0,
        tahunValue: 99,
        turtahunValue: 0,
      );

      expect(value, 308669);
    });

    test(
      'hasDerivedVariables should be false for placeholder derived variable',
      () {
        const table = DynamicTable(
          variableID: 31,
          title: 'Jumlah Penduduk',
          subjectID: 1,
          subjectName: 'Kependudukan',
          notes: '',
          unit: 'Jiwa',
          verticalVariableID: 7315,
          domain: '7315',
          derivedVariables: <VerticalVariableInfo>[
            VerticalVariableInfo(value: 0, label: 'Tidak Ada'),
          ],
        );

        expect(table.hasDerivedVariables, isFalse);
      },
    );

    test(
      'hasDerivedVariables should be true when there are multiple items',
      () {
        const table = DynamicTable(
          variableID: 31,
          title: 'Jumlah Penduduk',
          subjectID: 1,
          subjectName: 'Kependudukan',
          notes: '',
          unit: 'Jiwa',
          verticalVariableID: 7315,
          domain: '7315',
          derivedVariables: <VerticalVariableInfo>[
            VerticalVariableInfo(value: 1, label: 'Laki-laki'),
            VerticalVariableInfo(value: 2, label: 'Perempuan'),
          ],
        );

        expect(table.hasDerivedVariables, isTrue);
      },
    );

    test('hasDerivedPeriods should be true when first value is non-zero', () {
      const table = DynamicTable(
        variableID: 31,
        title: 'Jumlah Penduduk',
        subjectID: 1,
        subjectName: 'Kependudukan',
        notes: '',
        unit: 'Jiwa',
        verticalVariableID: 7315,
        domain: '7315',
        derivedPeriods: <VerticalVariableInfo>[
          VerticalVariableInfo(value: 1, label: 'Semester 1'),
        ],
      );

      expect(table.hasDerivedPeriods, isTrue);
    });

    test(
      'toStructuredData should build hierarchy without derived variables and periods',
      () {
        const table = DynamicTable(
          variableID: 31,
          title: 'Jumlah Penduduk',
          subjectID: 1,
          subjectName: 'Kependudukan',
          notes: '',
          unit: 'Jiwa',
          verticalVariableID: 7315,
          domain: '7315',
          variables: baseVariables,
          verticalVariables: baseVerticalVariables,
          periods: basePeriods,
          derivedVariables: <VerticalVariableInfo>[
            VerticalVariableInfo(value: 0, label: 'Tidak Ada'),
          ],
          derivedPeriods: <VerticalVariableInfo>[
            VerticalVariableInfo(value: 0, label: 'Tidak Ada'),
          ],
          dataContent: <String, dynamic>{
            '7315310990': 308669,
            '73153101000': 311595,
          },
        );

        final structured = table.toStructuredData();

        expect(structured.subjectId, 1);
        expect(structured.variableId, 31);
        expect(structured.variableLabel, 'Jumlah Penduduk');
        expect(structured.verticalVariableLabel, 'Variable');
        expect(structured.data, hasLength(1));
        expect(structured.data.first.data, hasLength(2));
        expect(structured.data.first.data.first.data.first.value, 308669);
      },
    );

    test(
      'toStructuredData should build 4-level hierarchy with derived variables and periods',
      () {
        const table = DynamicTable.withData(
          variableID: 31,
          title: 'Jumlah Penduduk',
          subjectID: 1,
          subjectName: 'Kependudukan',
          notes: '',
          unit: 'Jiwa',
          verticalVariableID: 7315,
          domain: '7315',
          variables: baseVariables,
          verticalVariables: baseVerticalVariables,
          periods: basePeriods,
          derivedVariables: <VerticalVariableInfo>[
            VerticalVariableInfo(value: 1, label: 'Laki-laki'),
            VerticalVariableInfo(value: 2, label: 'Perempuan'),
          ],
          derivedPeriods: <VerticalVariableInfo>[
            VerticalVariableInfo(value: 1, label: 'Semester 1'),
            VerticalVariableInfo(value: 2, label: 'Semester 2'),
          ],
          verticalVariableLabel: 'Kecamatan',
          dataContent: <String, dynamic>{
            '7315311991': 100,
            '7315311992': 200,
            '73153111001': 300,
            '73153111002': 400,
            '7315312991': 500,
            '7315312992': 600,
            '73153121001': 700,
            '73153121002': 800,
          },
        );

        final structured = table.toStructuredData();
        final firstLevel = structured.data.first;
        final firstDerivedVar = firstLevel.data.first;
        final firstPeriod = firstDerivedVar.data.first;

        expect(structured.verticalVariableLabel, 'Kecamatan');
        expect(firstLevel.id, 7315);
        expect(firstDerivedVar.id, 1);
        expect(firstPeriod.id, 99);
        expect(firstPeriod.data, isNotNull);
        expect(firstPeriod.data, hasLength(2));
        expect(firstPeriod.data!.first.value, 100);
      },
    );

    test('props should support equality', () {
      const tableA = DynamicTable(
        variableID: 31,
        title: 'Jumlah Penduduk',
        subjectID: 1,
        subjectName: 'Kependudukan',
        notes: '',
        unit: 'Jiwa',
        verticalVariableID: 7315,
        domain: '7315',
      );
      const tableB = DynamicTable(
        variableID: 31,
        title: 'Jumlah Penduduk',
        subjectID: 1,
        subjectName: 'Kependudukan',
        notes: '',
        unit: 'Jiwa',
        verticalVariableID: 7315,
        domain: '7315',
      );

      expect(tableA, tableB);
    });
  });
}
