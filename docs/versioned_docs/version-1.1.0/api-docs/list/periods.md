---
sidebar_position: 18
---

# Periods

The Periods API provides access to time period data from BPS (Badan Pusat Statistik) Indonesia. Periods represent temporal points for which statistical data is available and are essential for querying dynamic tables. Each period typically corresponds to a specific year or time frame in the BPS data collection system.

## Understanding Periods

Periods are fundamental components in the dynamic data architecture:

- **Temporal Reference**: Each period represents a specific time point for data collection
- **Variable Association**: Periods are linked to specific variables, indicating when data was collected
- **Dynamic Table Filtering**: Used as filter parameters when retrieving dynamic table data
- **Multi-year Analysis**: Enable time-series analysis by querying data across multiple periods

## Parameters

| Parameter    | Type           | Description                                                   |
| ------------ | -------------- | ------------------------------------------------------------- |
| `domain`     | `String`       | Domain code (region) for retrieving periods **(required)**    |
| `lang`       | `DataLanguage` | Language for period data (default: `DataLanguage.id`)         |
| `page`       | `int`          | Page number for pagination (default: `1`)                     |
| `variableID` | `int?`         | Filter periods for a specific variable (optional)             |

## Examples

### 1. Get All Periods for a Domain

```dart
// Fetch all available time periods for Central Java
final periodsResult = await StadataFlutter.instance.list.periods(
  domain: '3300', // Central Java domain code
  lang: DataLanguage.id,
);

final periodsList = periodsResult.data;
final pagination = periodsResult.pagination;

// Print pagination information
print('Current Page: ${pagination.page}');
print('Total Pages: ${pagination.pages}');
print('Data Count in This Page: ${pagination.count}');
print('Per Page: ${pagination.perPage}');
print('Total: ${pagination.total}');
print('------------------------');

// Print retrieved period data
for (final period in periodsList) {
  print('Period ID: ${period.id}');
  print('Year: ${period.year}');
  print('------------------------');
}
```

### 2. Get Periods for a Specific Variable

```dart
// Fetch periods available for a specific variable
final periodsResult = await StadataFlutter.instance.list.periods(
  domain: '0000', // National level
  lang: DataLanguage.id,
  variableID: 145, // Specific variable ID
);

// Process periods
for (final period in periodsResult.data) {
  print('Period ${period.id}: Year ${period.year}');
}
```

### 3. Paginated Period Retrieval

```dart
// Browse through periods with pagination
class PeriodBrowser {
  static Future<List<Period>> getAllPeriods(
    String domain,
    int variableID,
  ) async {
    final allPeriods = <Period>[];
    int currentPage = 1;
    bool hasMorePages = true;

    while (hasMorePages) {
      final result = await StadataFlutter.instance.list.periods(
        domain: domain,
        variableID: variableID,
        page: currentPage,
      );

      allPeriods.addAll(result.data);
      hasMorePages = currentPage < result.pagination.pages;
      currentPage++;

      // Respect API rate limits
      await Future.delayed(Duration(milliseconds: 300));
    }

    return allPeriods;
  }
}

// Usage
final allPeriods = await PeriodBrowser.getAllPeriods('0000', 145);
print('Total periods available: ${allPeriods.length}');
```

### 4. Integration with Dynamic Tables

```dart
// Complete workflow: Load periods for dynamic table filtering
Future<void> loadDynamicTableWithPeriods(
  String domain,
  int variableID,
) async {
  // 1. Load available periods for the variable
  final periodsResult = await StadataFlutter.instance.list.periods(
    domain: domain,
    variableID: variableID,
  );

  print('Available periods: ${periodsResult.data.length}');
  for (final period in periodsResult.data) {
    print('  - ${period.year} (ID: ${period.id})');
  }

  // 2. Select periods for filtering (e.g., last 2 periods)
  final sortedPeriods = List<Period>.from(periodsResult.data)
    ..sort((a, b) => b.year.compareTo(a.year));

  final selectedPeriods = sortedPeriods.take(2).toList();
  final periodFilter = selectedPeriods.map((p) => p.id).join(',');

  // 3. Fetch dynamic table data with period filter
  final tableResult = await StadataFlutter.instance.list.dynamicTableDetail(
    variableID: variableID,
    domain: domain,
    period: periodFilter,
  );

  tableResult.fold(
    (failure) => print('Error: $failure'),
    (table) {
      print('Table: ${table.title}');
      print('Data rows: ${table.dataContent.length}');
    },
  );
}
```

### 5. Time Series Analysis Pattern

```dart
// Build time series data using periods
class TimeSeriesBuilder {
  static Future<Map<int, List<dynamic>>> buildTimeSeries({
    required String domain,
    required int variableID,
  }) async {
    // 1. Get all available periods
    final periodsResult = await StadataFlutter.instance.list.periods(
      domain: domain,
      variableID: variableID,
    );

    final timeSeriesData = <int, List<dynamic>>{};

    // 2. Group periods by year
    for (final period in periodsResult.data) {
      timeSeriesData[period.year] = [];
    }

    // 3. Fetch data for each period (or batch for efficiency)
    final sortedYears = timeSeriesData.keys.toList()..sort();
    print('Time series spans: ${sortedYears.first} - ${sortedYears.last}');

    return timeSeriesData;
  }
}
```

## Properties (Period)

| Property | Type  | Description                              |
| -------- | ----- | ---------------------------------------- |
| `id`     | `int` | Unique identifier for the period         |
| `year`   | `int` | The year represented by this period      |

## Relationship with Dynamic Tables

Periods are crucial for dynamic table queries:

```dart
// Period selection workflow for dynamic tables
class DynamicTablePeriodSelector {
  final StadataFlutter _sdk;
  final String domain;
  final int variableID;

  List<Period> _availablePeriods = [];
  List<int> _selectedPeriodIDs = [];

  DynamicTablePeriodSelector({
    required StadataFlutter sdk,
    required this.domain,
    required this.variableID,
  }) : _sdk = sdk;

  Future<void> loadPeriods() async {
    final result = await _sdk.list.periods(
      domain: domain,
      variableID: variableID,
    );
    _availablePeriods = result.data;
  }

  void selectPeriod(int periodID) {
    if (!_selectedPeriodIDs.contains(periodID)) {
      _selectedPeriodIDs.add(periodID);
    }
  }

  void deselectPeriod(int periodID) {
    _selectedPeriodIDs.remove(periodID);
  }

  /// Get formatted period string for API call
  /// Note: BPS API typically requires 2 periods for dynamic table queries
  String? getFormattedPeriodString() {
    if (_selectedPeriodIDs.length < 2) {
      return null; // Need at least 2 periods
    }
    final sorted = List<int>.from(_selectedPeriodIDs)..sort();
    return sorted.join(',');
  }

  List<Period> get availablePeriods => _availablePeriods;
  List<int> get selectedPeriodIDs => _selectedPeriodIDs;
}
```

## Error Handling

```dart
try {
  final result = await StadataFlutter.instance.list.periods(
    domain: '3300',
    variableID: 145,
  );

  // Process successful result
  print('Found ${result.data.length} periods');

} on PeriodException catch (e) {
  print('Period-specific error: ${e.message}');
  // Handle period-related errors

} on ApiException catch (e) {
  print('API error: ${e.message}');
  // Handle network connectivity or API service errors

} on ApiKeyNotFoundException catch (e) {
  print('API key error: ${e.message}');
  // Handle API key issues

} catch (e) {
  print('Unexpected error: $e');
  // Handle any other unforeseen errors
}
```

## Best Practices

1. **Cache Period Data**: Period lists rarely change; cache them for better performance
2. **Sort Before Display**: Sort periods by year for chronological presentation
3. **Validate Selection**: Ensure at least 2 periods are selected for dynamic table queries
4. **Use with Variables**: Always specify `variableID` when loading periods for dynamic tables
5. **Handle Empty Results**: Some variables may have limited period availability

## Related APIs

- **[Variables](./variables)**: Get variables that have period data
- **[Dynamic Tables](./dynamic-tables)**: Use periods for filtering table data
- **[Derived Periods](./derived-periods)**: Get aggregated/grouped time periods
