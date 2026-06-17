# Trade (Foreign Trade Data)

The Trade API provides access to foreign trade statistics from BPS (Badan Pusat Statistik) Indonesia via the `dataexim` endpoint. This API delivers export and import trade data aggregated by HS (Harmonized System) commodity code, port of origin or destination, and trading partner country.

BPS foreign trade data is used by economists, policymakers, researchers, and businesses to understand Indonesia's international trade patterns, monitor commodity flows, and analyze bilateral trade relationships.

## Understanding the BPS Trade System

Foreign trade data from BPS is structured around three key dimensions:

- **Trade Direction**: Export (`sumber=1`) or Import (`sumber=2`)
- **Reporting Period**: Monthly (`periode=1`) or Annual (`periode=2`) aggregation
- **HS Code Level**: Two-digit (`jenishs=1`) or full HS code (`jenishs=2`) classification

Data is filtered by a specific HS commodity code and year, returning records broken down by port and trading partner country.

## Parameters

| Parameter | Type          | Description                                                                   |
| --------- | ------------- | ----------------------------------------------------------------------------- |
| `source`  | `TradeSource` | **Required**: Trade direction — `TradeSource.export` or `TradeSource.import_` |
| `period`  | `TradePeriod` | **Required**: Reporting period type — `TradePeriod.monthly` or `TradePeriod.annually` |
| `hsCode`  | `String`      | **Required**: HS commodity code to filter by (e.g. `'01'` for live animals)   |
| `hsType`  | `HSCodeType`  | **Required**: HS code digit level — `HSCodeType.twoDigit` or `HSCodeType.full` |
| `year`    | `String`      | **Required**: Year to filter by (e.g. `'2023'`)                               |

## Examples

### 1. Get Annual Export Data

```dart
// Fetch annual export data for HS code '01' (live animals) in 2023
final tradeResult = await StadataFlutter.instance.list.trade(
  source: TradeSource.export,
  period: TradePeriod.annually,
  hsCode: '01',
  hsType: HSCodeType.twoDigit,
  year: '2023',
);

final tradeList = tradeResult.data;
final pagination = tradeResult.pagination;

// Print pagination info
print('Current Page: ${pagination.page}');
print('Total Pages: ${pagination.pages}');
print('Data Count in This Page: ${pagination.count}');
print('Per Page: ${pagination.perPage}');
print('Total: ${pagination.total}');
print('------------------------');

// Print the retrieved trade data
for (final trade in tradeList) {
  print('HS Code: ${trade.hsCode}');
  print('Port: ${trade.port}');
  print('Country: ${trade.country}');
  print('Year: ${trade.year}');
  print('Value (USD): ${trade.value}');
  print('Net Weight (kg): ${trade.netWeight}');
  print('------------------------');
}
```

### 2. Get Monthly Import Data

```dart
// Fetch monthly import data for a specific full HS code
final importResult = await StadataFlutter.instance.list.trade(
  source: TradeSource.import_,
  period: TradePeriod.monthly,
  hsCode: '0101',
  hsType: HSCodeType.full,
  year: '2023',
);

// Display import records
for (final record in importResult.data) {
  print('Country: ${record.country}');
  print('Port: ${record.port}');
  print('Value: USD ${record.value.toStringAsFixed(2)}');
  print('Net Weight: ${record.netWeight} kg');
  print('------------------------');
}
```

### 3. Compare Export vs Import

```dart
// Compare export and import for the same HS code and year
final [exportResult, importResult] = await Future.wait([
  StadataFlutter.instance.list.trade(
    source: TradeSource.export,
    period: TradePeriod.annually,
    hsCode: '27',
    hsType: HSCodeType.twoDigit,
    year: '2023',
  ),
  StadataFlutter.instance.list.trade(
    source: TradeSource.import_,
    period: TradePeriod.annually,
    hsCode: '27',
    hsType: HSCodeType.twoDigit,
    year: '2023',
  ),
]);

final totalExportValue = exportResult.data
    .fold(0.0, (sum, record) => sum + record.value);
final totalImportValue = importResult.data
    .fold(0.0, (sum, record) => sum + record.value);

print('HS Code 27 (Mineral Fuels) Trade Balance - 2023');
print('Total Export Value: USD ${totalExportValue.toStringAsFixed(2)}');
print('Total Import Value: USD ${totalImportValue.toStringAsFixed(2)}');
print('Trade Balance: USD ${(totalExportValue - totalImportValue).toStringAsFixed(2)}');
```

### 4. Analyze Top Trading Partners

```dart
// Analyze top export destinations for a commodity
final exportData = await StadataFlutter.instance.list.trade(
  source: TradeSource.export,
  period: TradePeriod.annually,
  hsCode: '15',
  hsType: HSCodeType.twoDigit,
  year: '2023',
);

// Aggregate by country
final countryTotals = <String, double>{};
for (final record in exportData.data) {
  countryTotals[record.country] =
      (countryTotals[record.country] ?? 0) + record.value;
}

// Sort by total value descending
final sortedCountries = countryTotals.entries.toList()
  ..sort((a, b) => b.value.compareTo(a.value));

print('Top Export Destinations for HS 15 (Animal/Vegetable Fats) - 2023');
for (final entry in sortedCountries.take(10)) {
  print('${entry.key}: USD ${entry.value.toStringAsFixed(2)}');
}
```

## Error Handling

```dart
try {
  final result = await StadataFlutter.instance.list.trade(
    source: TradeSource.export,
    period: TradePeriod.annually,
    hsCode: '01',
    hsType: HSCodeType.twoDigit,
    year: '2023',
  );

  if (result.data.isEmpty) {
    print('No trade data found for the specified parameters');
  } else {
    print('Found ${result.data.length} records');
  }

} on TradeException catch (e) {
  print('Trade data error: ${e.message}');
  // Handle trade-specific errors (data not available for given params)

} on ApiException catch (e) {
  print('API communication error: ${e.message}');
  // Handle network or server errors

} on ApiKeyNotFoundException catch (e) {
  print('Authentication required: ${e.message}');
  // Handle missing or invalid API key

} catch (e) {
  print('Unexpected error: $e');
}
```

## Properties (TradeData)

| Property    | Type     | Description                                                    |
| ----------- | -------- | -------------------------------------------------------------- |
| `value`     | `double` | Trade value in USD                                             |
| `netWeight` | `double` | Net weight of the traded commodity in kilograms                |
| `hsCode`    | `String` | HS (Harmonized System) commodity code (`kodehs` in API)        |
| `port`      | `String` | Port of origin or destination (`pod` in API)                   |
| `country`   | `String` | Trading partner country (`ctr` in API)                         |
| `year`      | `String` | Year of the trade record (`tahun` in API)                      |
