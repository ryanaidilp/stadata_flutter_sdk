# Derived Period

The View Derived Period API provides detailed information about a specific derived period from BPS (Badan Pusat Statistik) Indonesia. Derived periods (turth) represent calculated or transformed time periods—aggregations or groupings across base periods. Unlike standard periods which represent individual years, derived periods offer grouped temporal categories for more complex time-based analysis.

Examples include "Tahunan" (annual aggregations) and "Triwulanan" (quarterly groupings).

## Parameters

| Parameter | Type           | Description                                                          |
| --------- | -------------- | -------------------------------------------------------------------- |
| `id`      | `int`          | **Required**: The unique numerical identifier of the derived period  |
| `domain`  | `String`       | **Required**: The domain (region) code for the request               |
| `lang`    | `DataLanguage` | **Optional**: Language preference (default: `DataLanguage.id`)       |

## Examples

### 1. Basic Derived Period Retrieval

```dart
// Retrieve a specific derived period by ID
final derivedPeriod = await StadataFlutter.instance.view.derivedPeriod(
  id: 1,
  domain: '0000',
  lang: DataLanguage.id,
);

if (derivedPeriod != null) {
  print('Derived Period ID: ${derivedPeriod.id}');
  print('Name: ${derivedPeriod.name}');
  print('Group ID: ${derivedPeriod.groupID}');
  print('Group Name: ${derivedPeriod.groupName}');
} else {
  print('Derived period not found');
}
```

### 2. Use Derived Period in a Dynamic Table Query

```dart
// Get derived period details then use it for aggregated data
final derivedPeriod = await StadataFlutter.instance.view.derivedPeriod(
  id: 1,
  domain: '0000',
);

if (derivedPeriod != null) {
  print('Derived Period: ${derivedPeriod.name} (${derivedPeriod.groupName})');

  // Use derived period to get aggregated dynamic table data
  final tableData = await StadataFlutter.instance.view.dynamicTable(
    variableID: 145,
    domain: '0000',
    derivedPeriodID: derivedPeriod.id,
  );

  if (tableData != null) {
    print('Aggregated table: ${tableData.title}');
  }
}
```

### 3. Browse Derived Periods for a Variable

```dart
// List all derived periods for a specific variable
final derivedPeriods = await StadataFlutter.instance.list.derivedPeriods(
  domain: '0000',
  variableID: 145,
);

print('Available derived periods:');
for (final dp in derivedPeriods.data) {
  print('[${dp.id}] ${dp.name} — Group: ${dp.groupName}');
}
```

## Error Handling

```dart
try {
  final derivedPeriod = await StadataFlutter.instance.view.derivedPeriod(
    id: 1,
    domain: '0000',
    lang: DataLanguage.id,
  );

  if (derivedPeriod != null) {
    print('Derived Period: ${derivedPeriod.name}');
  } else {
    print('Derived period not found');
  }

} on DerivedPeriodException catch (e) {
  print('Derived period error: ${e.message}');

} on ApiException catch (e) {
  print('API error: ${e.message}');

} on ApiKeyNotFoundException catch (e) {
  print('Authentication required: ${e.message}');

} catch (e) {
  print('Unexpected error: $e');
}
```

## Properties (DerivedPeriod)

| Property    | Type     | Description                                                              |
| ----------- | -------- | ------------------------------------------------------------------------ |
| `id`        | `int`    | Unique identifier for the derived period (`turth_id` in API response)    |
| `name`      | `String` | Display label describing the temporal grouping (e.g., `'Tahunan'`)       |
| `groupID`   | `int`    | Numeric code linking this derived period to its classification group     |
| `groupName` | `String` | Human-readable label for the group category (e.g., `'Tahunan'`)          |
