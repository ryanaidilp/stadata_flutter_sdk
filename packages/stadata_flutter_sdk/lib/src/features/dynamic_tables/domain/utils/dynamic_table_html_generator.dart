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

  /// Generates the table header with variable label at top level.
  ///
  /// Structure WITH derived variables:
  /// Row 1: Vertical Variable Label | Variable Label (colspan: turvar × years)
  /// Row 2: (empty) | Derived Var 1 (colspan: years) | Derived Var 2 (colspan: years) | ...
  /// Row 3: (empty) | Year 1 | Year 2 | ... | Year 1 | Year 2 | ...
  ///
  /// Structure WITHOUT derived variables:
  /// Row 1: Vertical Variable Label | Variable Label (colspan: years)
  /// Row 2: (empty) | Year 1 | Year 2 | Year 3 | ...
  static String _generateHeader(DynamicTable table) {
    final buffer = StringBuffer()..writeln('<thead>');

    final turvarList = table.derivedVariables;
    final tahunList = table.periods;
    final hasTurvar =
        turvarList.isNotEmpty &&
        (turvarList.length > 1 || turvarList.first.value != 0);

    // Get variable label
    final varLabel =
        table.variables.isNotEmpty ? table.variables.first.label : table.title;

    if (hasTurvar) {
      // 3-row header WITH derived variables
      final totalColspan = turvarList.length * tahunList.length;

      // Row 1: Vertical variable label + Variable label (top level)
      buffer
        ..writeln('<tr>')
        ..writeln(
          '<th rowspan="3" style="vertical-align: middle;">${table.verticalVariableLabel ?? 'Variable'}</th>',
        )
        ..writeln(
          '<th colspan="$totalColspan" class="text-center">$varLabel</th>',
        )
        ..writeln('</tr>')
        // Row 2: Derived variable labels (with colspan for years)
        ..writeln('<tr>');

      for (final turvar in turvarList) {
        final colspan = tahunList.length;
        buffer.writeln(
          '<th colspan="$colspan" class="text-center">${turvar.label}</th>',
        );
      }

      // Row 3: Year sub-headers repeated for each derived variable
      buffer
        ..writeln('</tr>')
        ..writeln('<tr>');
      for (var i = 0; i < turvarList.length; i++) {
        for (final tahun in tahunList) {
          buffer.writeln('<th class="text-center">${tahun.label}</th>');
        }
      }
    } else {
      // 2-row header WITHOUT derived variables
      final totalColspan = tahunList.length;

      // Row 1: Vertical variable label + Variable label (top level)
      buffer
        ..writeln('<tr>')
        ..writeln(
          '<th rowspan="2" style="vertical-align: middle;">${table.verticalVariableLabel ?? 'Variable'}</th>',
        )
        ..writeln(
          '<th colspan="$totalColspan" class="text-center">$varLabel</th>',
        )
        ..writeln('</tr>')
        // Row 2: Year labels directly (no derived variable row)
        ..writeln('<tr>');

      for (final tahun in tahunList) {
        buffer.writeln('<th class="text-center">${tahun.label}</th>');
      }
    }

    buffer
      ..writeln('</tr>')
      ..writeln('</thead>');

    return buffer.toString();
  }

  /// Generates the table body with vertical variables as rows.
  ///
  /// Structure WITH derived variables:
  /// Each row = one vertical variable (e.g., Kecamatan)
  /// Columns = derived variables × years (e.g., Laki-Laki 2014, Laki-Laki 2015, ..., Perempuan 2014, ...)
  ///
  /// Structure WITHOUT derived variables:
  /// Each row = one vertical variable
  /// Columns = years only (e.g., 2014, 2015, 2016, ...)
  static String _generateBody(DynamicTable table) {
    final buffer = StringBuffer()..writeln('<tbody>');

    // Get metadata
    final vervarList = table.verticalVariables;
    final turvarList = table.derivedVariables;
    final turtahunList = table.derivedPeriods;
    final tahunList = table.periods;
    final varValue =
        table.variables.isNotEmpty ? table.variables.first.value : 0;

    // Check if turvar is actually used (not just placeholder with value 0)
    final hasTurvar =
        turvarList.isNotEmpty &&
        (turvarList.length > 1 || turvarList.first.value != 0);

    // For simplicity, assume turtahun is always the first item
    final turtahunValue =
        turtahunList.isNotEmpty ? turtahunList.first.value : 0;

    // Generate one row per vertical variable
    for (final vervar in vervarList) {
      buffer
        ..writeln('<tr>')
        // First column: vertical variable label
        ..writeln('<td style="font-weight: bold;">${vervar.label}</td>');

      if (hasTurvar) {
        // WITH derived variables: loop through derived vars then years
        for (final turvar in turvarList) {
          for (final tahun in tahunList) {
            // Build composite key: vervar + var + turvar + tahun + turtahun
            final compositeKey =
                '${vervar.value}$varValue${turvar.value}${tahun.value}$turtahunValue';

            // Lookup value in datacontent
            final value = table.dataContent[compositeKey];
            final displayValue = value != null ? _formatNumber(value) : '-';

            buffer.writeln('<td class="text-right">$displayValue</td>');
          }
        }
      } else {
        // WITHOUT derived variables: just loop through years
        // Use turvar value 0 as default
        final turvarValue = turvarList.isNotEmpty ? turvarList.first.value : 0;

        for (final tahun in tahunList) {
          // Build composite key without derived variable
          final compositeKey =
              '${vervar.value}$varValue$turvarValue${tahun.value}$turtahunValue';

          // Lookup value in datacontent
          final value = table.dataContent[compositeKey];
          final displayValue = value != null ? _formatNumber(value) : '-';

          buffer.writeln('<td class="text-right">$displayValue</td>');
        }
      }

      buffer.writeln('</tr>');
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

thead th {
  border: 1px solid white;
}

tbody td {
  border: 1px solid gray;
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
