import 'package:stadata_flutter_sdk/src/features/dynamic_tables/domain/entities/entities.dart';

/// Utility class to generate HTML tables from dynamic table data.
///
/// Based on the all_stats and Python stadata implementation,
/// this generates HTML tables by:
/// 1. Cross-joining vervar x turvar x turtahun for rows
/// 2. Creating columns for each year (tahun)
/// 3. Populating cells using composite key lookups (vervar+var+turvar+tahun+turtahun)
class DynamicTableHtmlGenerator {
  /// Generates an HTML table from a [DynamicTable] entity.
  ///
  /// The table structure matches the all_stats app:
  /// - Rows: vervar x turvar x turtahun combinations
  /// - Columns: tahun (years)
  /// - Cells: Values from datacontent using composite keys
  static String generate(DynamicTable table) {
    final buffer =
        StringBuffer()
          // Start table
          ..writeln('<table>')
          // Generate header
          ..writeln(_generateHeader(table))
          // Generate body
          ..writeln(_generateBody(table))
          // End table
          ..writeln('</table>');

    return buffer.toString();
  }

  /// Generates the table header with year columns.
  static String _generateHeader(DynamicTable table) {
    final buffer =
        StringBuffer()
          ..writeln('<thead>')
          ..writeln('<tr>')
          // First column: Variable label
          ..writeln('<th>${table.verticalVariableLabel ?? 'Variable'}</th>');

    // If there are derived variables, add column
    if (table.derivedVariables.isNotEmpty &&
        table.derivedVariables.first.value != 0) {
      buffer.writeln('<th>Turunan Variable</th>');
    }

    // If there are derived periods, add column
    if (table.derivedPeriods.isNotEmpty &&
        table.derivedPeriods.first.value != 0) {
      buffer.writeln('<th>Turunan Tahun</th>');
    }

    // Year columns
    for (final period in table.periods) {
      buffer.writeln('<th class="text-center">${period.label}</th>');
    }

    buffer
      ..writeln('</tr>')
      ..writeln('</thead>');

    return buffer.toString();
  }

  /// Generates the table body with data rows.
  static String _generateBody(DynamicTable table) {
    final buffer = StringBuffer()..writeln('<tbody>');

    // Get metadata
    final vervarList = table.verticalVariables;
    final turvarList = table.derivedVariables;
    final turtahunList = table.derivedPeriods;
    final tahunList = table.periods;
    final varValue =
        table.variables.isNotEmpty ? table.variables.first.value : 0;

    // Check if turvar and turtahun are actually used (not just placeholder with value 0)
    final hasTurvar =
        turvarList.isNotEmpty &&
        (turvarList.length > 1 || turvarList.first.value != 0);
    final hasTurtahun =
        turtahunList.isNotEmpty &&
        (turtahunList.length > 1 || turtahunList.first.value != 0);

    // Generate rows by cross-joining vervar x turvar x turtahun
    for (final vervar in vervarList) {
      final turvarItems = hasTurvar ? turvarList : [turvarList.first];

      for (final turvar in turvarItems) {
        final turtahunItems = hasTurtahun ? turtahunList : [turtahunList.first];

        for (final turtahun in turtahunItems) {
          buffer
            ..writeln('<tr>')
            // First column: vervar label
            ..writeln('<td>${vervar.label}</td>');

          // Turvar column if applicable
          if (hasTurvar) {
            buffer.writeln('<td>${turvar.label}</td>');
          }

          // Turtahun column if applicable
          if (hasTurtahun) {
            buffer.writeln('<td>${turtahun.label}</td>');
          }

          // Year columns with data
          for (final tahun in tahunList) {
            // Build composite key: vervar + var + turvar + tahun + turtahun
            final compositeKey =
                '${vervar.value}$varValue${turvar.value}${tahun.value}${turtahun.value}';

            // Lookup value in datacontent
            final value = table.dataContent[compositeKey];
            final displayValue = value != null ? _formatNumber(value) : '-';

            buffer.writeln('<td class="text-right">$displayValue</td>');
          }

          buffer.writeln('</tr>');
        }
      }
    }

    buffer.writeln('</tbody>');

    return buffer.toString();
  }

  /// Formats a number value for display.
  ///
  /// Handles both int and double, adds thousand separators.
  static String _formatNumber(dynamic value) {
    if (value == null) return '-';

    // Convert to number
    final num numValue =
        value is num ? value : num.tryParse(value.toString()) ?? 0;

    // Format with thousand separators
    final intPart = numValue.truncate();
    final decPart = numValue - intPart;

    // Add thousand separators to integer part
    final intString = intPart.toString().replaceAllMapped(
      RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
      (Match m) => '${m[1]},',
    );

    // If there's a decimal part, add it
    if (decPart > 0) {
      final decString = decPart.toStringAsFixed(2).substring(1);
      return intString + decString;
    }

    return intString;
  }

  /// Wraps generated HTML with all_stats CSS styling.
  ///
  /// Matches the styling used in static tables:
  /// - Plus Jakarta Sans font
  /// - BPS official blue (#0077EF) header
  /// - Proper borders and padding
  static String wrapWithStyling(String htmlTable) {
    return '''
<!DOCTYPE html>
<html lang="en">
<head>
  <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=5.0, user-scalable=yes">
  <style>
@import url('https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@400;700&display=swap');

body {
  width: fit-content;
  margin: 0;
  padding: 8px;
  font-size: 10px;
}

table {
  font-family: 'Plus Jakarta Sans', sans-serif;
  border-collapse: collapse;
}

thead {
  background-color: #0077EF;
  color: #FFFFFF;
}

tbody td {
  border: 1px solid gray;
}

thead tr th:not(:first-child) {
  border-left: 1px solid white;
}

td, th {
  padding: 8px;
}

tr > td:not(:first-child) {
  text-align: right;
}

.text-right {
  text-align: right;
}

.text-center {
  text-align: center;
}
  </style>
</head>
<body>
  <div class="htmlWrapper_container" id="_flutter_target_do_not_delete">$htmlTable</div>
  <script>
    function outputsize() {
      console.log(document.getElementById("_flutter_target_do_not_delete").offsetHeight);
      window.postMessage('flutterTargetHeight', document.getElementById("_flutter_target_do_not_delete").offsetHeight);
    }
    new ResizeObserver(outputsize).observe(_flutter_target_do_not_delete);
    outputsize();
  </script>
</body>
</html>
''';
  }
}
