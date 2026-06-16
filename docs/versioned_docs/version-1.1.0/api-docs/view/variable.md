# Variable

The View Variable API provides detailed information about a specific statistical variable from BPS (Badan Pusat Statistik) Indonesia. Statistical variables represent specific measurable phenomena, indicators, or characteristics that are systematically collected, analyzed, and reported by BPS. They form the fundamental building blocks of statistical datasets.

Examples include Jumlah Penduduk (Population Count), Tingkat Partisipasi Angkatan Kerja (Labor Force Participation Rate), Produk Domestik Regional Bruto (GRDP), Indeks Harga Konsumen (Consumer Price Index), and Tingkat Kemiskinan (Poverty Rate).

## Parameters

| Parameter | Type           | Description                                                      |
| --------- | -------------- | ---------------------------------------------------------------- |
| `id`      | `int`          | **Required**: The unique numerical identifier of the variable    |
| `domain`  | `String`       | **Required**: The domain (region) code for the request           |
| `lang`    | `DataLanguage` | **Optional**: Language preference (default: `DataLanguage.id`)   |

## Examples

### 1. Basic Variable Retrieval

```dart
// Retrieve detailed information for a specific variable
final variable = await StadataFlutter.instance.view.variable(
  id: 145,
  domain: '0000', // National level
  lang: DataLanguage.id,
);

if (variable != null) {
  print('Variable ID: ${variable.id}');
  print('Title: ${variable.title}');
  print('Graph Name: ${variable.graphName}');
  print('Unit: ${variable.unit}');
  print('Subject ID: ${variable.subjectID}');
  print('Subject Name: ${variable.subjectName}');
  print('Notes: ${variable.notes}');
} else {
  print('Variable not found');
}
```

### 2. Use Variable to Query Dynamic Table Data

```dart
// Get variable details then use it to query dynamic data
final variable = await StadataFlutter.instance.view.variable(
  id: 145,
  domain: '0000',
);

if (variable != null) {
  print('Variable: ${variable.title} (${variable.unit})');
  print('Vertical Variable ID: ${variable.verticalVariableID}');

  // Get available periods for this variable
  final periods = await StadataFlutter.instance.list.periods(
    domain: '0000',
    variableID: variable.id,
  );

  print('Available periods: ${periods.data.map((p) => p.year).join(', ')}');

  // Fetch dynamic table data for the most recent period
  if (periods.data.isNotEmpty) {
    final latestPeriod = periods.data.first;
    final tableData = await StadataFlutter.instance.view.dynamicTable(
      variableID: variable.id,
      domain: '0000',
      period: '${latestPeriod.id}',
    );

    print('Data for ${latestPeriod.year}: ${tableData?.title}');
  }
}
```

### 3. Inspect Variable Metadata

```dart
// Get full metadata for analysis
final variable = await StadataFlutter.instance.view.variable(
  id: 200,
  domain: '3200',
);

if (variable != null) {
  print('=== Variable Metadata ===');
  print('Title: ${variable.title}');
  print('Graph Display Name: ${variable.graphName}');
  print('Unit: ${variable.unit}');
  print('Subject: ${variable.subjectName} (ID: ${variable.subjectID})');
  print('Vertical Variable ID: ${variable.verticalVariableID}');

  if (variable.csaSubjectName != null) {
    print('CSA Subject: ${variable.csaSubjectName}');
  }
  if (variable.type != null) {
    print('Type: ${variable.type}');
  }
  if (variable.derivedPeriodID != null) {
    print('Derived Period ID: ${variable.derivedPeriodID}');
  }
  if (variable.derivedVariableID != null) {
    print('Derived Variable ID: ${variable.derivedVariableID}');
  }
  print('\nMethodological Notes:');
  print(variable.notes);
}
```

## Error Handling

```dart
try {
  final variable = await StadataFlutter.instance.view.variable(
    id: 145,
    domain: '0000',
    lang: DataLanguage.id,
  );

  if (variable != null) {
    print('Variable: ${variable.title}');
  } else {
    print('Variable not found');
  }

} on VariableException catch (e) {
  print('Variable error: ${e.message}');

} on ApiException catch (e) {
  print('API error: ${e.message}');

} on ApiKeyNotFoundException catch (e) {
  print('Authentication required: ${e.message}');

} catch (e) {
  print('Unexpected error: $e');
}
```

## Properties (Variable)

| Property           | Type      | Description                                                        |
| ------------------ | --------- | ------------------------------------------------------------------ |
| `id`               | `int`     | Unique identifier for the statistical variable                     |
| `title`            | `String`  | Official full name of the statistical variable                     |
| `graphName`        | `String`  | Shortened name optimized for display in charts and graphs          |
| `notes`            | `String`  | Comprehensive methodological notes and variable definitions        |
| `unit`             | `String`  | Unit of measurement for the variable values                        |
| `subjectID`        | `int`     | Identifier of the statistical subject area this variable belongs to|
| `subjectName`      | `String`  | Name of the statistical subject area containing this variable      |
| `verticalVariableID`| `int`    | Identifier linking to the associated vertical variable structure   |
| `csaSubjectName`   | `String?` | Optional name of the cross-sectional subject classification        |
| `csaSubjectID`     | `int?`    | Optional identifier for the cross-sectional subject classification |
| `type`             | `int?`    | Optional variable type classification code                         |
| `derivedPeriodID`  | `int?`    | Optional identifier for derived time period calculations           |
| `derivedVariableID`| `int?`    | Optional identifier for source variables in derived calculations   |
