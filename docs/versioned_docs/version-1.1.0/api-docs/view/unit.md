# Unit

The View Unit API provides detailed information about a specific unit of measurement from BPS (Badan Pusat Statistik) Indonesia. Units of measurement provide standardized quantitative scales and metrics used across BPS statistical data collection, analysis, and reporting. They ensure consistency, comparability, and proper interpretation of numerical data.

Common units include Rupiah (currency), Orang (persons), Ton (metric tons), Persen (percent), Hektar (hectares), and Kilogram (kilograms).

## Parameters

| Parameter | Type           | Description                                                   |
| --------- | -------------- | ------------------------------------------------------------- |
| `id`      | `int`          | **Required**: The unique numerical identifier of the unit     |
| `domain`  | `String`       | **Required**: The domain (region) code for the request        |
| `lang`    | `DataLanguage` | **Optional**: Language preference (default: `DataLanguage.id`)|

## Examples

### 1. Basic Unit Retrieval

```dart
// Retrieve a specific unit of measurement
final unit = await StadataFlutter.instance.view.unit(
  id: 1,
  domain: '0000',
  lang: DataLanguage.id,
);

if (unit != null) {
  print('Unit ID: ${unit.id}');
  print('Unit Name: ${unit.title}');
} else {
  print('Unit not found');
}
```

### 2. Display Variable with Its Unit

```dart
// Get a variable and look up its unit details
final variable = await StadataFlutter.instance.view.variable(
  id: 145,
  domain: '0000',
);

if (variable != null) {
  print('Variable: ${variable.title}');
  print('Unit (from variable): ${variable.unit}');
}

// Alternatively, browse available units
final units = await StadataFlutter.instance.list.units(
  domain: '0000',
  variableID: 145,
);

print('Units for variable 145:');
for (final u in units.data) {
  print('[${u.id}] ${u.title}');
}
```

### 3. Build a Unit Reference Dictionary

```dart
// Build a lookup dictionary of all available units
final units = await StadataFlutter.instance.list.units(
  domain: '0000',
);

final unitLookup = <int, String>{};
for (final u in units.data) {
  unitLookup[u.id] = u.title;
}

// Use the lookup to annotate variable values
print('Unit Reference:');
unitLookup.forEach((id, title) {
  print('  [$id] $title');
});
```

## Error Handling

```dart
try {
  final unit = await StadataFlutter.instance.view.unit(
    id: 1,
    domain: '0000',
    lang: DataLanguage.id,
  );

  if (unit != null) {
    print('Unit: ${unit.title}');
  } else {
    print('Unit not found');
  }

} on UnitException catch (e) {
  print('Unit error: ${e.message}');

} on ApiException catch (e) {
  print('API error: ${e.message}');

} on ApiKeyNotFoundException catch (e) {
  print('Authentication required: ${e.message}');

} catch (e) {
  print('Unexpected error: $e');
}
```

## Properties (UnitData)

| Property | Type     | Description                                                           |
| -------- | -------- | --------------------------------------------------------------------- |
| `id`     | `int`    | Unique identifier for the unit of measurement (`unit_id` in API)      |
| `title`  | `String` | Descriptive name of the unit in Indonesian (`unit` in API response)   |
