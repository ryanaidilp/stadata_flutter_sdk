# Strategic Indicator

The View Strategic Indicator API provides detailed information about a specific strategic indicator from BPS (Badan Pusat Statistik) Indonesia. Strategic indicators are key statistical measures that track progress toward national development goals and policy objectives, providing high-level insights into economic performance, social welfare, and development outcomes across Indonesia.

Examples include Produk Domestik Bruto (GDP), Tingkat Pengangguran Terbuka (Open Unemployment Rate), and Indeks Pembangunan Manusia (Human Development Index).

## Parameters

| Parameter | Type           | Description                                                           |
| --------- | -------------- | --------------------------------------------------------------------- |
| `id`      | `int`          | **Required**: The unique numerical identifier of the strategic indicator |
| `domain`  | `String`       | **Required**: The domain (region) code for the request                |
| `lang`    | `DataLanguage` | **Optional**: Language preference (default: `DataLanguage.id`)        |

## Examples

### 1. Basic Strategic Indicator Retrieval

```dart
// Retrieve a specific strategic indicator
final indicator = await StadataFlutter.instance.view.strategicIndicator(
  id: 1,
  domain: '0000', // National level
  lang: DataLanguage.id,
);

if (indicator != null) {
  print('Indicator ID: ${indicator.id}');
  print('Title: ${indicator.title}');
  print('Name: ${indicator.name}');
  print('Value: ${indicator.value} ${indicator.unit}');
  print('Period: ${indicator.period}');
  print('Data Source: ${indicator.dataSource}');
  print('Category ID: ${indicator.categoryID}');
  print('Variable ID: ${indicator.variableID}');
} else {
  print('Strategic indicator not found');
}
```

### 2. Build a Strategic Indicators Dashboard

```dart
// Fetch multiple strategic indicators and display as a dashboard
final indicatorIDs = [1, 2, 3, 4, 5];
final domain = '0000';

print('=== National Strategic Indicators Dashboard ===');

for (final id in indicatorIDs) {
  final indicator = await StadataFlutter.instance.view.strategicIndicator(
    id: id,
    domain: domain,
    lang: DataLanguage.id,
  );

  if (indicator != null) {
    print('');
    print('${indicator.title}');
    print('Value: ${indicator.value} ${indicator.unit}');
    print('Period: ${indicator.period}');
    print('Source: ${indicator.dataSource}');
  }
}
```

### 3. Regional Indicator Comparison

```dart
// Compare the same indicator across different domains
final domains = ['3100', '3200', '3300', '3400']; // Jakarta, West Java, Central Java, Yogyakarta
const indicatorID = 10;

print('=== Regional Comparison: Indicator $indicatorID ===');

for (final domain in domains) {
  final indicator = await StadataFlutter.instance.view.strategicIndicator(
    id: indicatorID,
    domain: domain,
  );

  if (indicator != null) {
    print('Domain $domain: ${indicator.value} ${indicator.unit} (${indicator.period})');
  }
}
```

## Error Handling

```dart
try {
  final indicator = await StadataFlutter.instance.view.strategicIndicator(
    id: 1,
    domain: '0000',
    lang: DataLanguage.id,
  );

  if (indicator != null) {
    print('Indicator: ${indicator.title}');
    print('Value: ${indicator.value} ${indicator.unit}');
  } else {
    print('Strategic indicator not found');
  }

} on StrategicIndicatorException catch (e) {
  print('Strategic indicator error: ${e.message}');

} on ApiException catch (e) {
  print('API error: ${e.message}');

} on ApiKeyNotFoundException catch (e) {
  print('Authentication required: ${e.message}');

} catch (e) {
  print('Unexpected error: $e');
}
```

## Properties (StrategicIndicator)

| Property       | Type      | Description                                                          |
| -------------- | --------- | -------------------------------------------------------------------- |
| `id`           | `int`     | Unique identifier for the strategic indicator                        |
| `title`        | `String`  | Formal title of the strategic indicator                              |
| `name`         | `String`  | Descriptive name providing additional context                        |
| `dataSource`   | `String`  | Source of the underlying data (e.g., `'Sakernas'`, `'Susenas'`)      |
| `value`        | `double`  | Current numerical value of the indicator                             |
| `unit`         | `String`  | Unit of measurement (e.g., `'Persen'`, `'Triliun Rupiah'`)           |
| `period`       | `String`  | Time period when this value was measured (e.g., `'2024'`)            |
| `hashID`       | `String`  | Unique hash identifier for data integrity and version control        |
| `categoryID`   | `int`     | Identifier for the thematic category this indicator belongs to       |
| `variableID`   | `int`     | Identifier for the underlying statistical variable                   |
| `csaSubjectID` | `int?`    | Optional CSA subject classification identifier                       |
