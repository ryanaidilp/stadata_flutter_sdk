---
sidebar_position: 20
---

# Derived Variables

The Derived Variables API provides access to calculated or transformed statistical variables from BPS (Badan Pusat Statistik) Indonesia. Derived variables represent computed metrics that are derived from base statistical variables, such as growth rates, percentage changes, indices, or other calculated measures.

## Understanding Derived Variables

Derived variables serve specific analytical purposes:

- **Calculated Metrics**: Represent computations based on raw statistical data
- **Transformation Types**: Include percentages, growth rates, indices, and ratios
- **Enhanced Analysis**: Enable deeper insights by providing pre-calculated analytical measures
- **Filter Dimension**: Used as filtering parameters in dynamic table queries

## Parameters

| Parameter       | Type           | Description                                                          |
| --------------- | -------------- | -------------------------------------------------------------------- |
| `domain`        | `String`       | Domain code (region) for retrieving derived variables **(required)** |
| `lang`          | `DataLanguage` | Language for data representation (default: `DataLanguage.id`)        |
| `page`          | `int`          | Page number for pagination (default: `1`)                            |
| `variableID`    | `int?`         | Filter by base variable ID (optional)                                |
| `verticalGroup` | `int?`         | Filter by vertical variable group (optional)                         |

## Examples

### 1. Get Derived Variables for a Domain

```dart
// Fetch derived variables for Central Java
final derivedVarsResult = await StadataFlutter.instance.list.derivedVariables(
  domain: '3300', // Central Java domain code
  lang: DataLanguage.id,
);

final derivedVarsList = derivedVarsResult.data;
final pagination = derivedVarsResult.pagination;

// Print pagination information
print('Current Page: ${pagination.page}');
print('Total Pages: ${pagination.pages}');
print('Data Count: ${pagination.count}');
print('Total: ${pagination.total}');
print('------------------------');

// Print derived variable data
for (final derivedVar in derivedVarsList) {
  print('ID: ${derivedVar.id}');
  print('Name: ${derivedVar.name}');
  print('------------------------');
}
```

### 2. Get Derived Variables for a Specific Base Variable

```dart
// Fetch derived variables associated with a specific variable
final derivedVarsResult = await StadataFlutter.instance.list.derivedVariables(
  domain: '0000', // National level
  lang: DataLanguage.id,
  variableID: 145, // Base variable ID
);

// Check for meaningful derived variables
final meaningfulVars = derivedVarsResult.data
    .where((dv) => dv.id != 0 && dv.name.toLowerCase() != 'tidak ada')
    .toList();

if (meaningfulVars.isEmpty) {
  print('No derived variables available for this variable');
} else {
  print('Available derived variables: ${meaningfulVars.length}');
  for (final dv in meaningfulVars) {
    print('  - ${dv.name} (ID: ${dv.id})');
  }
}
```

### 3. Integration with Dynamic Table Filtering

```dart
// Use derived variables to filter dynamic table data
Future<void> loadTableWithDerivedVariable({
  required String domain,
  required int variableID,
}) async {
  // 1. Load available derived variables
  final derivedVarsResult = await StadataFlutter.instance.list.derivedVariables(
    domain: domain,
    variableID: variableID,
  );

  // 2. Filter out placeholder values
  final validDerivedVars = derivedVarsResult.data
      .where((dv) => dv.id != 0 && dv.name.toLowerCase() != 'tidak ada')
      .toList();

  if (validDerivedVars.isEmpty) {
    print('No derived variable filtering available');
    return;
  }

  // 3. Select a derived variable for filtering
  final selectedDerivedVar = validDerivedVars.first;
  print('Using derived variable: ${selectedDerivedVar.name}');

  // 4. Fetch dynamic table with derived variable filter
  final tableResult = await StadataFlutter.instance.list.dynamicTableDetail(
    variableID: variableID,
    domain: domain,
    derivedVarID: selectedDerivedVar.id,
  );

  tableResult.fold(
    (failure) => print('Error: $failure'),
    (table) {
      print('Table: ${table.title}');
      print('Filtered by: ${selectedDerivedVar.name}');
      print('Data rows: ${table.dataContent.length}');
    },
  );
}
```

### 4. Complete Dimension Loading for Dynamic Tables

```dart
// Load all filtering dimensions for a dynamic table variable
class DynamicTableDimensionLoader {
  static Future<void> loadAllDimensions({
    required String domain,
    required int variableID,
  }) async {
    print('=== Loading Dimensions for Variable $variableID ===\n');

    // Load vertical variables
    try {
      final verticalVarsResult = await StadataFlutter.instance.list.verticalVariables(
        domain: domain,
        variableID: variableID,
      );
      print('Vertical Variables: ${verticalVarsResult.data.length}');
      for (final v in verticalVarsResult.data.take(3)) {
        print('  - ${v.title} (ID: ${v.id})');
      }
    } catch (e) {
      print('Vertical Variables: Not available');
    }

    // Load derived variables
    try {
      final derivedVarsResult = await StadataFlutter.instance.list.derivedVariables(
        domain: domain,
        variableID: variableID,
      );
      final validVars = derivedVarsResult.data
          .where((dv) => dv.id != 0 && dv.name.toLowerCase() != 'tidak ada')
          .toList();
      print('\nDerived Variables: ${validVars.length}');
      for (final dv in validVars.take(3)) {
        print('  - ${dv.name} (ID: ${dv.id})');
      }
    } catch (e) {
      print('\nDerived Variables: Not available');
    }

    // Load periods
    try {
      final periodsResult = await StadataFlutter.instance.list.periods(
        domain: domain,
        variableID: variableID,
      );
      print('\nPeriods: ${periodsResult.data.length}');
      for (final p in periodsResult.data.take(3)) {
        print('  - ${p.year} (ID: ${p.id})');
      }
    } catch (e) {
      print('\nPeriods: Not available');
    }

    // Load derived periods
    try {
      final derivedPeriodsResult = await StadataFlutter.instance.list.derivedPeriods(
        domain: domain,
        variableID: variableID,
      );
      final validPeriods = derivedPeriodsResult.data
          .where((dp) => dp.id != 0 && dp.name.toLowerCase() != 'tidak ada')
          .toList();
      print('\nDerived Periods: ${validPeriods.length}');
      for (final dp in validPeriods.take(3)) {
        print('  - ${dp.name} (ID: ${dp.id})');
      }
    } catch (e) {
      print('\nDerived Periods: Not available');
    }
  }
}

// Usage
await DynamicTableDimensionLoader.loadAllDimensions(
  domain: '0000',
  variableID: 145,
);
```

### 5. Building a Filter Selection UI

```dart
// State management for derived variable selection
class DerivedVariableSelector {
  final List<DerivedVariable> _availableVars = [];
  int? _selectedID;

  Future<void> loadDerivedVariables({
    required String domain,
    required int variableID,
  }) async {
    final result = await StadataFlutter.instance.list.derivedVariables(
      domain: domain,
      variableID: variableID,
    );

    // Filter and store meaningful variables
    _availableVars.clear();
    _availableVars.addAll(
      result.data.where((dv) =>
        dv.id != 0 && dv.name.toLowerCase() != 'tidak ada'
      ),
    );
  }

  void selectVariable(int? id) {
    _selectedID = id;
  }

  void clearSelection() {
    _selectedID = null;
  }

  List<DerivedVariable> get availableVariables => List.unmodifiable(_availableVars);
  int? get selectedID => _selectedID;
  bool get hasSelection => _selectedID != null;
  bool get hasOptions => _availableVars.isNotEmpty;
}
```

## Properties (DerivedVariable)

| Property | Type     | Description                                 |
| -------- | -------- | ------------------------------------------- |
| `id`     | `int`    | Unique identifier for the derived variable  |
| `name`   | `String` | Display name of the derived variable        |

## Common Derived Variable Types

Derived variables typically represent:

| Type | Description | Example |
| ---- | ----------- | ------- |
| Growth Rates | Year-over-year changes | "Pertumbuhan (%)" |
| Percentages | Proportional values | "Persentase" |
| Index Values | Normalized measures | "Indeks" |
| Per Capita | Population-adjusted values | "Per Kapita" |
| Cumulative | Running totals | "Kumulatif" |

## Handling Placeholder Values

The BPS API may return placeholder derived variables. Always filter these:

```dart
// Utility function to filter meaningful derived variables
List<DerivedVariable> filterMeaningfulDerivedVariables(
  List<DerivedVariable> variables,
) {
  return variables.where((dv) {
    // Filter out ID 0 and "tidak ada" placeholders
    if (dv.id == 0) return false;
    if (dv.name.toLowerCase() == 'tidak ada') return false;
    return true;
  }).toList();
}

// Usage
final allDerivedVars = derivedVarsResult.data;
final meaningfulVars = filterMeaningfulDerivedVariables(allDerivedVars);
print('Meaningful derived variables: ${meaningfulVars.length}');
```

## Error Handling

```dart
try {
  final result = await StadataFlutter.instance.list.derivedVariables(
    domain: '3300',
    variableID: 145,
  );

  // Process successful result
  print('Found ${result.data.length} derived variables');

} on DerivedVariableException catch (e) {
  print('Derived variable error: ${e.message}');
  // Handle derived variable-specific errors

} on ApiException catch (e) {
  print('API error: ${e.message}');
  // Handle network or API service errors

} on ApiKeyNotFoundException catch (e) {
  print('API key error: ${e.message}');
  // Handle API key issues

} catch (e) {
  print('Unexpected error: $e');
}
```

## Best Practices

1. **Filter Placeholders**: Always filter out `id == 0` and "tidak ada" values
2. **Graceful Handling**: Not all variables have derived variants; handle empty results
3. **Show "All" Option**: Allow users to view unfiltered data alongside filtered views
4. **Combine Filters**: Derived variables can be combined with other dimensions
5. **Cache Results**: Derived variable lists rarely change; consider caching

## Related APIs

- **[Variables](./variables)**: Get base statistical variables
- **[Vertical Variables](./vertical-variables)**: Get hierarchical variable structures
- **[Periods](./periods)**: Get time periods
- **[Derived Periods](./derived-periods)**: Get aggregated time periods
- **[Dynamic Tables](./dynamic-tables)**: Use derived variables for filtering
