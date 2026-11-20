# Period

The View Period API provides detailed information about a specific time period from BPS (Badan Pusat Statistik) Indonesia. Periods represent specific temporal points for which statistical data is available. They are fundamental building blocks for querying dynamic tables, enabling time-series analysis and temporal filtering.

## Parameters

| Parameter | Type           | Description                                                   |
| --------- | -------------- | ------------------------------------------------------------- |
| `id`      | `int`          | **Required**: The unique numerical identifier of the period   |
| `domain`  | `String`       | **Required**: The domain (region) code for the request        |
| `lang`    | `DataLanguage` | **Optional**: Language preference (default: `DataLanguage.id`)|

## Examples

### 1. Basic Period Retrieval

```dart
// Retrieve a specific period by ID
final period = await StadataFlutter.instance.view.period(
  id: 1,
  domain: '0000',
  lang: DataLanguage.id,
);

if (period != null) {
  print('Period ID: ${period.id}');
  print('Year: ${period.year}');
} else {
  print('Period not found');
}
```

### 2. Use Period to Query Dynamic Table Data

```dart
// Get period details then use it in a dynamic table query
final period = await StadataFlutter.instance.view.period(
  id: 1,
  domain: '0000',
);

if (period != null) {
  print('Year: ${period.year}');

  // Use this period to fetch dynamic table data
  final tableData = await StadataFlutter.instance.view.dynamicTable(
    variableID: 145,
    domain: '0000',
    period: '${period.id}',
  );

  if (tableData != null) {
    print('Table for ${period.year}: ${tableData.title}');
  }
}
```

### 3. List Available Periods for a Variable

```dart
// Get all available periods for a specific variable
final periods = await StadataFlutter.instance.list.periods(
  domain: '0000',
  variableID: 145,
);

print('Available periods for variable 145:');
for (final p in periods.data) {
  print('[ID: ${p.id}] Year: ${p.year}');
}

// Get details for the most recent period
if (periods.data.isNotEmpty) {
  final latestPeriod = periods.data.first;
  final detail = await StadataFlutter.instance.view.period(
    id: latestPeriod.id,
    domain: '0000',
  );

  if (detail != null) {
    print('Latest period: ${detail.year}');
  }
}
```

## Error Handling

```dart
try {
  final period = await StadataFlutter.instance.view.period(
    id: 1,
    domain: '0000',
    lang: DataLanguage.id,
  );

  if (period != null) {
    print('Period: ${period.year}');
  } else {
    print('Period not found');
  }

} on PeriodException catch (e) {
  print('Period error: ${e.message}');

} on ApiException catch (e) {
  print('API error: ${e.message}');

} on ApiKeyNotFoundException catch (e) {
  print('Authentication required: ${e.message}');

} catch (e) {
  print('Unexpected error: $e');
}
```

## Properties (Period)

| Property | Type  | Description                                                                |
| -------- | ----- | -------------------------------------------------------------------------- |
| `id`     | `int` | Unique identifier for the time period (`th_id` in API response)            |
| `year`   | `int` | The calendar year value for this period (e.g., `2023`, `2022`, `2021`)     |
