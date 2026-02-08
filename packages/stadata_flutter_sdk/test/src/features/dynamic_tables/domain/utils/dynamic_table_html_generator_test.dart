import 'package:flutter_test/flutter_test.dart';
import 'package:stadata_flutter_sdk/src/features/dynamic_tables/domain/entities/entities.dart';
import 'package:stadata_flutter_sdk/src/features/dynamic_tables/domain/utils/dynamic_table_html_generator.dart';

void main() {
  group('DynamicTableHtmlGenerator', () {
    late DynamicTable testTable;

    setUp(() {
      testTable = const DynamicTable(
        variableID: 31,
        title: 'Jumlah Penduduk',
        subjectID: 0,
        subjectName: 'Kependudukan',
        notes: '',
        unit: 'Jiwa',
        verticalVariableID: 7315,
        domain: '7315',
        variables: [
          VariableInfo(
            value: 31,
            label: 'Jumlah Penduduk',
            unit: 'Jiwa',
            subject: 'Kependudukan',
          ),
        ],
        verticalVariables: [
          VerticalVariableInfo(value: 7315, label: 'Pinrang'),
        ],
        periods: [
          PeriodInfo(value: 99, label: '1999'),
          PeriodInfo(value: 100, label: '2000'),
          PeriodInfo(value: 101, label: '2001'),
        ],
        derivedVariables: [
          VerticalVariableInfo(value: 0, label: 'Tidak Ada'),
        ],
        derivedPeriods: [
          VerticalVariableInfo(value: 0, label: 'Tahun'),
        ],
        verticalVariableLabel: 'Kecamatan',
        dataContent: {
          '7315310990': 308669,
          '73153101000': 311595,
          '73153101010': 312473,
        },
      );
    });

    group('generate', () {
      test('should generate valid HTML table structure', () {
        // act
        final html = DynamicTableHtmlGenerator.generate(testTable);

        // assert
        expect(html, contains('<table>'));
        expect(html, contains('</table>'));
        expect(html, contains('<thead>'));
        expect(html, contains('</thead>'));
        expect(html, contains('<tbody>'));
        expect(html, contains('</tbody>'));
      });

      test('should include vertical variable label in header', () {
        // act
        final html = DynamicTableHtmlGenerator.generate(testTable);

        // assert - now includes rowspan and style for proper formatting
        expect(html, contains('Kecamatan'));
      });

      test('should include year columns in header', () {
        // act
        final html = DynamicTableHtmlGenerator.generate(testTable);

        // assert
        expect(html, contains('1999'));
        expect(html, contains('2000'));
        expect(html, contains('2001'));
      });

      test('should include vervar labels in rows', () {
        // act
        final html = DynamicTableHtmlGenerator.generate(testTable);

        // assert - now includes font-weight: bold style
        expect(html, contains('Pinrang'));
      });

      test(
        'should populate data cells with correct values from dataContent',
        () {
          // act
          final html = DynamicTableHtmlGenerator.generate(testTable);

          // assert - values should be formatted with thousand separators
          expect(html, contains('308,669'));
          expect(html, contains('311,595'));
          expect(html, contains('312,473'));
        },
      );

      test('should not add derived variable column when turvar value is 0', () {
        // act
        final html = DynamicTableHtmlGenerator.generate(testTable);

        // assert
        expect(html, isNot(contains('<th>Turunan Variable</th>')));
      });

      test('should not add derived period column when turtahun value is 0', () {
        // act
        final html = DynamicTableHtmlGenerator.generate(testTable);

        // assert
        expect(html, isNot(contains('<th>Turunan Tahun</th>')));
      });

      test(
        'should add derived variable column when turvar has multiple items',
        () {
          // arrange
          final tableWithTurvar = DynamicTable(
            variableID: testTable.variableID,
            title: testTable.title,
            subjectID: testTable.subjectID,
            subjectName: testTable.subjectName,
            notes: testTable.notes,
            unit: testTable.unit,
            verticalVariableID: testTable.verticalVariableID,
            domain: testTable.domain,
            variables: testTable.variables,
            verticalVariables: testTable.verticalVariables,
            periods: testTable.periods,
            derivedPeriods: testTable.derivedPeriods,
            verticalVariableLabel: testTable.verticalVariableLabel,
            dataContent: testTable.dataContent,
            derivedVariables: const [
              VerticalVariableInfo(value: 1, label: 'Derived 1'),
              VerticalVariableInfo(value: 2, label: 'Derived 2'),
            ],
          );

          // act
          final html = DynamicTableHtmlGenerator.generate(tableWithTurvar);

          // assert - derived variables are now headers with colspan for periods
          expect(html, contains('Derived 1'));
          expect(html, contains('Derived 2'));
        },
      );

      test('should handle missing data values with dash', () {
        // arrange
        final tableWithMissingData = DynamicTable(
          variableID: testTable.variableID,
          title: testTable.title,
          subjectID: testTable.subjectID,
          subjectName: testTable.subjectName,
          notes: testTable.notes,
          unit: testTable.unit,
          verticalVariableID: testTable.verticalVariableID,
          domain: testTable.domain,
          variables: testTable.variables,
          verticalVariables: testTable.verticalVariables,
          periods: testTable.periods,
          derivedVariables: testTable.derivedVariables,
          derivedPeriods: testTable.derivedPeriods,
          verticalVariableLabel: testTable.verticalVariableLabel,
          dataContent: const {'7315310990': 308669},
        );

        // act
        final html = DynamicTableHtmlGenerator.generate(tableWithMissingData);

        // assert
        expect(html, contains('308,669'));
        expect(html, contains('-')); // Missing values shown as dash
      });

      test(
        'should use Variable as default label when verticalVariableLabel is null',
        () {
          // arrange
          final tableWithoutLabel = DynamicTable(
            variableID: testTable.variableID,
            title: testTable.title,
            subjectID: testTable.subjectID,
            subjectName: testTable.subjectName,
            notes: testTable.notes,
            unit: testTable.unit,
            verticalVariableID: testTable.verticalVariableID,
            domain: testTable.domain,
            variables: testTable.variables,
            verticalVariables: testTable.verticalVariables,
            periods: testTable.periods,
            derivedVariables: testTable.derivedVariables,
            derivedPeriods: testTable.derivedPeriods,
            dataContent: testTable.dataContent,
          );

          // act
          final html = DynamicTableHtmlGenerator.generate(tableWithoutLabel);

          // assert - now uses rowspan and style for proper header formatting
          expect(
            html,
            contains(
              '<th rowspan="2" style="vertical-align: middle;">Variable</th>',
            ),
          );
        },
      );
    });

    group('wrapWithStyling', () {
      test('should wrap HTML with all_stats CSS styling', () {
        // arrange
        const tableHtml = '<table><tr><td>Test</td></tr></table>';

        // act
        final wrapped = DynamicTableHtmlGenerator.wrapWithStyling(tableHtml);

        // assert
        expect(wrapped, contains('<!DOCTYPE html>'));
        expect(wrapped, contains('<html lang="en">'));
        expect(wrapped, contains('Plus Jakarta Sans'));
        expect(wrapped, contains('#0077EF')); // BPS blue color
        expect(wrapped, contains(tableHtml));
        expect(wrapped, contains('_flutter_target_do_not_delete'));
      });

      test('should include viewport meta tag', () {
        // arrange
        const tableHtml = '<table></table>';

        // act
        final wrapped = DynamicTableHtmlGenerator.wrapWithStyling(tableHtml);

        // assert
        expect(
          wrapped,
          contains(
            '<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=5.0, user-scalable=yes">',
          ),
        );
      });

      test('should include ResizeObserver script for height calculation', () {
        // arrange
        const tableHtml = '<table></table>';

        // act
        final wrapped = DynamicTableHtmlGenerator.wrapWithStyling(tableHtml);

        // assert
        expect(wrapped, contains('ResizeObserver'));
        expect(wrapped, contains('outputsize'));
        expect(wrapped, contains('window.postMessage'));
      });

      test('should include proper table styling', () {
        // arrange
        const tableHtml = '<table></table>';

        // act
        final wrapped = DynamicTableHtmlGenerator.wrapWithStyling(tableHtml);

        // assert
        expect(wrapped, contains('border-collapse: collapse'));
        expect(wrapped, contains('background-color: #0077EF'));
        expect(wrapped, contains('color: #FFFFFF'));
        expect(wrapped, contains('text-align: right'));
        expect(wrapped, contains('text-align: center'));
      });
    });

    group('_formatNumber', () {
      test('should format integer with thousand separators', () {
        // Create a simple table to test formatting
        final html = DynamicTableHtmlGenerator.generate(testTable);

        // The values 308669, 311595, 312473 should be formatted
        expect(html, contains('308,669'));
        expect(html, contains('311,595'));
        expect(html, contains('312,473'));
      });

      test('should handle decimal values', () {
        // arrange
        final tableWithDecimals = DynamicTable(
          variableID: testTable.variableID,
          title: testTable.title,
          subjectID: testTable.subjectID,
          subjectName: testTable.subjectName,
          notes: testTable.notes,
          unit: testTable.unit,
          verticalVariableID: testTable.verticalVariableID,
          domain: testTable.domain,
          variables: testTable.variables,
          verticalVariables: testTable.verticalVariables,
          periods: testTable.periods,
          derivedVariables: testTable.derivedVariables,
          derivedPeriods: testTable.derivedPeriods,
          verticalVariableLabel: testTable.verticalVariableLabel,
          dataContent: const {
            '7315310990': 308669.45,
            '73153101000': 311595.99,
          },
        );

        // act
        final html = DynamicTableHtmlGenerator.generate(tableWithDecimals);

        // assert
        // Decimals should be formatted with 2 decimal places
        expect(html, contains('308,669.45'));
        expect(html, contains('311,595.99'));
      });
    });
  });
}
