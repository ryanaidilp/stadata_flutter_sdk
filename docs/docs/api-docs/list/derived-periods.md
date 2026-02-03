---
sidebar_position: 19
---

# Derived Periods

The Derived Periods API provides access to aggregated or transformed time period data from BPS (Badan Pusat Statistik) Indonesia. Derived periods represent grouped temporal aggregations such as annual groupings, quarterly aggregations, or custom time range combinations that are derived from base period data.

## Understanding Derived Periods

Derived periods differ from regular periods in several important ways:

- **Aggregated Time Frames**: Represent grouped or combined time periods
- **Custom Groupings**: May include multi-year averages, quarterly aggregations, or custom ranges
- **Derived Calculations**: Often used for presenting smoothed or aggregated statistical trends
- **Complementary to Periods**: Work alongside regular periods for comprehensive temporal analysis

## Parameters

| Parameter    | Type           | Description                                                         |
| ------------ | -------------- | ------------------------------------------------------------------- |
| `domain`     | `String`       | Domain code (region) for retrieving derived periods **(required)**  |
| `lang`       | `DataLanguage` | Language for data representation (default: `DataLanguage.id`)       |
| `page`       | `int`          | Page number for pagination (default: `1`)                           |
| `variableID` | `int?`         | Filter derived periods for a specific variable (optional)           |

## Examples

### 1. Get Derived Periods for a Domain

```dart
// Fetch derived periods for Central Java
final derivedPeriodsResult = await StadataFlutter.instance.list.derivedPeriods(
  domain: '3300', // Central Java domain code
  lang: DataLanguage.id,
);

final derivedPeriodsList = derivedPeriodsResult.data;
final pagination = derivedPeriodsResult.pagination;

// Print pagination information
print('Current Page: ${pagination.page}');
print('Total Pages: ${pagination.pages}');
print('Data Count: ${pagination.count}');
print('Total: ${pagination.total}');
print('------------------------');

// Print derived period data
for (final derivedPeriod in derivedPeriodsList) {
  print('ID: ${derivedPeriod.id}');
  print('Name: ${derivedPeriod.name}');
  print('------------------------');
}
```

### 2. Get Derived Periods for a Specific Variable

```dart
// Fetch derived periods for a specific variable
final derivedPeriodsResult = await StadataFlutter.instance.list.derivedPeriods(
  domain: '0000', // National level
  lang: DataLanguage.id,
  variableID: 145, // Specific variable ID
);

// Check for meaningful derived periods
final meaningfulPeriods = derivedPeriodsResult.data
    .where((dp) => dp.id != 0 && dp.name.toLowerCase() != 'tidak ada')
    .toList();

if (meaningfulPeriods.isEmpty) {
  print('No derived periods available for this variable');
} else {
  print('Available derived periods: ${meaningfulPeriods.length}');
  for (final dp in meaningfulPeriods) {
    print('  - ${dp.name} (ID: ${dp.id})');
  }
}
```

### 3. Integration with Dynamic Table Filtering

```dart
// Use derived periods to filter dynamic table data
Future<void> loadTableWithDerivedPeriod({
  required String domain,
  required int variableID,
}) async {
  // 1. Load available derived periods
  final derivedPeriodsResult = await StadataFlutter.instance.list.derivedPeriods(
    domain: domain,
    variableID: variableID,
  );

  // 2. Filter out placeholder values
  final validDerivedPeriods = derivedPeriodsResult.data
      .where((dp) => dp.id != 0 && dp.name.toLowerCase() != 'tidak ada')
      .toList();

  if (validDerivedPeriods.isEmpty) {
    print('No derived period filtering available');
    return;
  }

  // 3. Select a derived period for filtering
  final selectedDerivedPeriod = validDerivedPeriods.first;
  print('Using derived period: ${selectedDerivedPeriod.name}');

  // 4. Fetch dynamic table with derived period filter
  final tableResult = await StadataFlutter.instance.list.dynamicTableDetail(
    variableID: variableID,
    domain: domain,
    derivedPeriodID: selectedDerivedPeriod.id,
  );

  tableResult.fold(
    (failure) => print('Error: $failure'),
    (table) {
      print('Table: ${table.title}');
      print('Data filtered by: ${selectedDerivedPeriod.name}');
      print('Data rows: ${table.dataContent.length}');
    },
  );
}
```

### 4. Comparing Regular vs Derived Periods

```dart
// Load both period types for comparison
Future<void> comparePeriodTypes({
  required String domain,
  required int variableID,
}) async {
  // Load regular periods
  final regularPeriods = await StadataFlutter.instance.list.periods(
    domain: domain,
    variableID: variableID,
  );

  // Load derived periods
  final derivedPeriods = await StadataFlutter.instance.list.derivedPeriods(
    domain: domain,
    variableID: variableID,
  );

  print('=== Period Comparison ===');
  print('Regular Periods: ${regularPeriods.data.length}');
  for (final p in regularPeriods.data.take(5)) {
    print('  - Year ${p.year} (ID: ${p.id})');
  }

  print('\nDerived Periods: ${derivedPeriods.data.length}');
  for (final dp in derivedPeriods.data) {
    print('  - ${dp.name} (ID: ${dp.id})');
  }
}
```

### 5. Dynamic Table Dimension Loader

```dart
// Complete dimension loading for dynamic tables
class DynamicTableDimensionLoader {
  static Future<Map<String, dynamic>> loadAllDimensions({
    required String domain,
    required int variableID,
  }) async {
    final dimensions = <String, dynamic>{};

    // Load periods
    try {
      final periodsResult = await StadataFlutter.instance.list.periods(
        domain: domain,
        variableID: variableID,
      );
      dimensions['periods'] = periodsResult.data;
    } catch (e) {
      dimensions['periods'] = <Period>[];
    }

    // Load derived periods
    try {
      final derivedPeriodsResult = await StadataFlutter.instance.list.derivedPeriods(
        domain: domain,
        variableID: variableID,
      );
      // Filter out placeholder values
      dimensions['derivedPeriods'] = derivedPeriodsResult.data
          .where((dp) => dp.id != 0 && dp.name.toLowerCase() != 'tidak ada')
          .toList();
    } catch (e) {
      dimensions['derivedPeriods'] = <DerivedPeriod>[];
    }

    // Summary
    print('=== Dimension Summary ===');
    print('Periods: ${(dimensions['periods'] as List).length}');
    print('Derived Periods: ${(dimensions['derivedPeriods'] as List).length}');

    return dimensions;
  }
}
```

## Properties (DerivedPeriod)

| Property | Type     | Description                                 |
| -------- | -------- | ------------------------------------------- |
| `id`     | `int`    | Unique identifier for the derived period    |
| `name`   | `String` | Display name of the derived period grouping |

## Common Derived Period Types

Derived periods typically represent:

| Type | Description | Example |
| ---- | ----------- | ------- |
| Annual Averages | Multi-year statistical averages | "Rata-rata 2015-2020" |
| Quarterly Groups | Quarter-based aggregations | "Kuartal I 2023" |
| Custom Ranges | Specific date range combinations | "Semester I" |
| Cumulative | Running totals across periods | "Kumulatif 2020-2023" |

## Handling Placeholder Values

The BPS API may return placeholder derived periods. Always filter these:

```dart
// Utility function to filter meaningful derived periods
List<DerivedPeriod> filterMeaningfulDerivedPeriods(List<DerivedPeriod> periods) {
  return periods.where((dp) {
    // Filter out ID 0 and "tidak ada" placeholders
    if (dp.id == 0) return false;
    if (dp.name.toLowerCase() == 'tidak ada') return false;
    return true;
  }).toList();
}

// Usage
final allDerivedPeriods = derivedPeriodsResult.data;
final meaningfulPeriods = filterMeaningfulDerivedPeriods(allDerivedPeriods);
print('Meaningful derived periods: ${meaningfulPeriods.length}');
```

## Error Handling

```dart
try {
  final result = await StadataFlutter.instance.list.derivedPeriods(
    domain: '3300',
    variableID: 145,
  );

  // Process successful result
  print('Found ${result.data.length} derived periods');

} on DerivedPeriodException catch (e) {
  print('Derived period error: ${e.message}');
  // Handle derived period-specific errors

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
2. **Graceful Handling**: Not all variables have derived periods; handle empty results
3. **Combine with Regular Periods**: Use both period types for comprehensive analysis
4. **Cache Results**: Derived period lists rarely change; consider caching
5. **Display Clearly**: Show derived period names to users for clarity

## Related APIs

- **[Periods](./periods)**: Get regular time periods
- **[Variables](./variables)**: Get variables with period data
- **[Derived Variables](./derived-variables)**: Get calculated statistical variables
- **[Dynamic Tables](./dynamic-tables)**: Use derived periods for filtering
