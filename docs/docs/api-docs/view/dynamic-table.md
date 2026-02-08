# Dynamic Table Detail

The Dynamic Table Detail API provides comprehensive access to detailed statistical data from BPS (Badan Pusat Statistik) Indonesia dynamic tables. This method enables applications to retrieve complete table data with flexible filtering options, including vertical variables, derived variables, periods, and derived periods.

Dynamic tables provide structured statistical datasets with multi-dimensional data that can be filtered and analyzed based on various parameters. This API is essential for researchers, analysts, and applications requiring granular access to BPS statistical data.

## Understanding the Dynamic Table System

BPS dynamic tables provide structured statistical data across multiple dimensions:

- **Variable-based Data**: Data organized by statistical variables with specific measurements
- **Multi-dimensional Filtering**: Filter by vertical variables, derived variables, and periods
- **Structured Data Content**: Data organized with composite keys linking variables, periods, and values
- **Geographic Scope**: Tables available at national, provincial, and local administrative levels
- **Temporal Coverage**: Data spanning different time periods with flexible period selection

## Dynamic Table Structure

### Data Organization

Dynamic tables contain:

- **Vertical Variables**: Breakdown dimensions for the main variable (e.g., age groups, regions)
- **Derived Variables**: Calculated or aggregated variable dimensions
- **Periods**: Time periods for which data is available
- **Derived Periods**: Aggregated time periods (e.g., yearly totals, averages)
- **Data Content**: Actual data values with composite keys linking all dimensions

### Composite Key System

Data content uses composite keys in the format: `{verticalVarId}{derivedVarId}{periodId}{derivedPeriodId}`

This allows precise identification of each data point across all dimensions.

## Parameters

| Parameter         | Type           | Description                                                      |
| ----------------- | -------------- | ---------------------------------------------------------------- |
| `variableID`      | `int`          | **Required**: The unique identifier of the statistical variable  |
| `domain`          | `String`       | **Required**: The domain (region) code specifying administrative context |
| `period`          | `String?`      | **Optional**: Period filter (comma-separated, e.g., "119,120")   |
| `verticalVarID`   | `int?`         | **Optional**: Filter by specific vertical variable ID            |
| `derivedVarID`    | `int?`         | **Optional**: Filter by specific derived variable ID             |
| `derivedPeriodID` | `int?`         | **Optional**: Filter by specific derived period ID               |
| `lang`            | `DataLanguage` | **Optional**: Language preference (default: `DataLanguage.id`)   |

### Period Format

The `period` parameter supports:
- **Comma-separated**: `"119,120"` - Select specific periods by ID

**Note**: The API allows a maximum of 2 periods per request.

## Examples

### 1. Basic Dynamic Table Retrieval

```dart
// Retrieve detailed data for a specific dynamic table variable
final result = await StadataFlutter.instance.list.dynamicTableDetail(
  variableID: 31, // Population statistics variable
  domain: '3300', // Central Java
  period: '119,120', // Select 2 periods
  lang: DataLanguage.id,
);

result.fold(
  (failure) => print('Error: $failure'),
  (table) {
    print('=== Dynamic Table Details ===');
    print('Variable ID: ${table.variableID}');
    print('Title: ${table.title}');
    print('Subject: ${table.subjectName}');
    print('Domain: ${table.domain}');
    print('Unit: ${table.unit}');

    // Table dimensions
    print('\n=== Dimensions ===');
    print('Vertical Variables: ${table.verticalVariables.length}');
    print('Derived Variables: ${table.derivedVariables.length}');
    print('Periods: ${table.periods.length}');
    print('Derived Periods: ${table.derivedPeriods.length}');

    // Data content
    print('\n=== Data Content ===');
    print('Total data points: ${table.dataContent.length}');

    // Sample data
    for (final entry in table.dataContent.entries.take(5)) {
      print('Key: ${entry.key}, Value: ${entry.value}');
    }
  },
);
```

### 2. Filtering by Vertical Variable

```dart
// Filter data by a specific vertical variable (e.g., age group)
final result = await StadataFlutter.instance.list.dynamicTableDetail(
  variableID: 31,
  domain: '3300',
  period: '119,120',
  verticalVarID: 5, // Specific age group
  lang: DataLanguage.id,
);

result.fold(
  (failure) => print('Error: $failure'),
  (table) {
    print('Filtered by Vertical Variable ID: 5');
    print('Title: ${table.title}');
    print('Data points: ${table.dataContent.length}');

    // Display vertical variable info
    for (final vv in table.verticalVariables) {
      print('Vertical Var: ${vv.title} (ID: ${vv.id})');
    }
  },
);
```

### 3. Filtering by Derived Variable

```dart
// Filter data by derived variable (e.g., calculated totals)
final result = await StadataFlutter.instance.list.dynamicTableDetail(
  variableID: 31,
  domain: '3300',
  period: '119,120',
  derivedVarID: 1, // Specific derived calculation
  lang: DataLanguage.id,
);

result.fold(
  (failure) => print('Error: $failure'),
  (table) {
    print('Filtered by Derived Variable ID: 1');

    // Display derived variable info
    for (final dv in table.derivedVariables) {
      print('Derived Var: ${dv.name} (ID: ${dv.id})');
    }
  },
);
```

### 4. Complete Data Analysis Workflow

```dart
// Comprehensive workflow for analyzing dynamic table data
class DynamicTableAnalyzer {
  static Future<void> analyzeTableData(
    String domain,
    int variableId,
  ) async {
    try {
      // 1. First, load available dimensions
      final verticalVars = await StadataFlutter.instance.list.verticalVariables(
        domain: domain,
        variableID: variableId,
      );

      final periods = await StadataFlutter.instance.list.periods(
        domain: domain,
        variableID: variableId,
      );

      print('=== Available Dimensions ===');
      print('Vertical Variables: ${verticalVars.data.length}');
      print('Periods: ${periods.data.length}');

      // 2. Select 2 periods for analysis (API limit)
      if (periods.data.length >= 2) {
        final selectedPeriods = periods.data.take(2).map((p) => p.id).join(',');

        // 3. Load detailed data
        final result = await StadataFlutter.instance.list.dynamicTableDetail(
          variableID: variableId,
          domain: domain,
          period: selectedPeriods,
          lang: DataLanguage.id,
        );

        result.fold(
          (failure) => print('Error: $failure'),
          (table) {
            print('\n=== Table Analysis ===');
            print('Title: ${table.title}');
            print('Unit: ${table.unit}');

            // Analyze data distribution
            final values = table.dataContent.values
                .map((v) => double.tryParse(v) ?? 0)
                .where((v) => v > 0)
                .toList();

            if (values.isNotEmpty) {
              final sum = values.reduce((a, b) => a + b);
              final avg = sum / values.length;
              final max = values.reduce((a, b) => a > b ? a : b);
              final min = values.reduce((a, b) => a < b ? a : b);

              print('\n=== Data Statistics ===');
              print('Count: ${values.length}');
              print('Sum: $sum');
              print('Average: ${avg.toStringAsFixed(2)}');
              print('Max: $max');
              print('Min: $min');
            }
          },
        );
      }

    } catch (e) {
      print('Analysis error: $e');
    }
  }
}
```

### 5. Building Data Tables for Display

```dart
// Convert dynamic table data to display format
class DynamicTableFormatter {
  static Map<String, List<Map<String, dynamic>>> formatForDisplay(
    DynamicTable table,
  ) {
    final formattedData = <String, List<Map<String, dynamic>>>{};

    // Group data by period
    for (final period in table.periods) {
      final periodData = <Map<String, dynamic>>[];

      for (final vv in table.verticalVariables) {
        // Build composite key pattern for this vertical var and period
        final keyPattern = '${vv.id}';

        // Find matching data entries
        for (final entry in table.dataContent.entries) {
          if (entry.key.startsWith(keyPattern)) {
            periodData.add({
              'verticalVar': vv.title,
              'verticalVarId': vv.id,
              'value': entry.value,
              'key': entry.key,
            });
          }
        }
      }

      formattedData['Period ${period.year}'] = periodData;
    }

    return formattedData;
  }
}

// Usage example
final result = await StadataFlutter.instance.list.dynamicTableDetail(
  variableID: 31,
  domain: '3300',
  period: '119,120',
);

result.fold(
  (failure) => print('Error: $failure'),
  (table) {
    final formatted = DynamicTableFormatter.formatForDisplay(table);

    for (final entry in formatted.entries) {
      print('\n=== ${entry.key} ===');
      for (final row in entry.value.take(5)) {
        print('${row['verticalVar']}: ${row['value']}');
      }
    }
  },
);
```

### 6. Generating HTML Tables

```dart
// The SDK includes a built-in HTML table generator
import 'package:stadata_flutter_sdk/stadata_flutter_sdk.dart';

final result = await StadataFlutter.instance.list.dynamicTableDetail(
  variableID: 31,
  domain: '3300',
  period: '119,120',
);

result.fold(
  (failure) => print('Error: $failure'),
  (table) {
    // Generate HTML table using built-in generator
    final htmlTable = DynamicTableHtmlGenerator.generate(table);

    // Wrap with styling for display
    final styledHtml = DynamicTableHtmlGenerator.wrapWithStyling(htmlTable);

    // Use in WebView or HTML renderer
    print('Generated HTML table with ${table.dataContent.length} data points');
  },
);
```

## Dynamic Table Workflow Integration

Typical workflow for working with dynamic tables effectively:

1. **Discovery Phase**: Use List API to find tables by subject or keyword
2. **Dimension Loading**: Load available vertical variables, periods, and derived dimensions
3. **Parameter Selection**: Choose specific filters based on analysis needs
4. **Data Retrieval**: Use dynamicTableDetail with selected parameters
5. **Data Processing**: Format and analyze the retrieved data
6. **Presentation**: Generate tables, charts, or export data

### Complete Workflow Example

```dart
// Full workflow from discovery to data retrieval
Future<void> dynamicTableWorkflow(String domain, String searchTerm) async {
  try {
    // 1. Discover dynamic tables
    final tables = await StadataFlutter.instance.list.dynamicTables(
      domain: domain,
      keyword: searchTerm,
    );

    print('Found ${tables.data.length} tables for "$searchTerm"');

    if (tables.data.isEmpty) return;

    final selectedTable = tables.data.first;
    print('Selected: ${selectedTable.title}');

    // 2. Load dimensions
    final periods = await StadataFlutter.instance.list.periods(
      domain: domain,
      variableID: selectedTable.id,
    );

    print('Available periods: ${periods.data.length}');

    if (periods.data.length < 2) {
      print('Need at least 2 periods');
      return;
    }

    // 3. Select periods and retrieve data
    final selectedPeriods = periods.data.take(2).map((p) => p.id).join(',');

    final result = await StadataFlutter.instance.list.dynamicTableDetail(
      variableID: selectedTable.id,
      domain: domain,
      period: selectedPeriods,
    );

    // 4. Process and display
    result.fold(
      (failure) => print('Error: $failure'),
      (table) {
        print('\n=== Retrieved Data ===');
        print('Title: ${table.title}');
        print('Unit: ${table.unit}');
        print('Data points: ${table.dataContent.length}');

        // Generate HTML for display
        final html = DynamicTableHtmlGenerator.generate(table);
        print('Generated HTML table');
      },
    );

  } catch (e) {
    print('Workflow error: $e');
  }
}
```

## Error Handling

The Dynamic Table Detail API returns `Future<Result<Failure, DynamicTable>>` and may throw specific exceptions:

- **DynamicTableNotAvailableException**: Table data not available for the specified parameters
- **DynamicTableFailure**: General dynamic table processing errors
- **ApiException**: General API communication errors (network issues, server errors)
- **ApiKeyNotFoundException**: Authentication errors (invalid or missing API key)

```dart
final result = await StadataFlutter.instance.list.dynamicTableDetail(
  variableID: 31,
  domain: '3300',
  period: '119,120',
);

result.fold(
  (failure) {
    // Handle failure
    if (failure is DynamicTableFailure) {
      print('Dynamic table error: ${failure.message}');
    } else {
      print('Error: $failure');
    }
  },
  (table) {
    // Process successful result
    print('Successfully retrieved: ${table.title}');
  },
);
```

## Performance Considerations

- **Period Limit**: The API allows a maximum of 2 periods per request
- **Filter Optimization**: Use dimension filters to reduce data volume
- **Caching Strategy**: Cache table metadata and dimension data locally
- **Rate Limiting**: Implement appropriate delays between requests
- **Memory Management**: Process large data sets incrementally
- **Batch Processing**: For multi-period analysis, make separate requests and combine results

## Properties (DynamicTable)

| Property            | Type                       | Description                                                     |
| ------------------- | -------------------------- | --------------------------------------------------------------- |
| `variableID`        | `int`                      | Unique identifier for the statistical variable                  |
| `title`             | `String`                   | Title of the dynamic table                                      |
| `subjectName`       | `String`                   | Name of the statistical subject                                 |
| `domain`            | `String`                   | Domain code for the table                                       |
| `unit`              | `String`                   | Measurement unit for data values                                |
| `verticalVariables` | `List<VerticalVariable>`   | Available vertical variable dimensions                          |
| `derivedVariables`  | `List<DerivedVariable>`    | Available derived variable dimensions                           |
| `periods`           | `List<Period>`             | Available time periods                                          |
| `derivedPeriods`    | `List<DerivedPeriod>`      | Available derived/aggregated periods                            |
| `dataContent`       | `Map<String, String>`      | Data values with composite keys                                 |

### VerticalVariable Properties

| Property | Type     | Description                        |
| -------- | -------- | ---------------------------------- |
| `id`     | `int`    | Unique identifier                  |
| `title`  | `String` | Display title for the variable     |

### DerivedVariable Properties

| Property | Type     | Description                        |
| -------- | -------- | ---------------------------------- |
| `id`     | `int`    | Unique identifier                  |
| `name`   | `String` | Name of the derived variable       |

### Period Properties

| Property | Type  | Description                        |
| -------- | ----- | ---------------------------------- |
| `id`     | `int` | Unique period identifier           |
| `year`   | `int` | Year value for the period          |

### DerivedPeriod Properties

| Property | Type     | Description                        |
| -------- | -------- | ---------------------------------- |
| `id`     | `int`    | Unique identifier                  |
| `name`   | `String` | Name of the derived period         |
