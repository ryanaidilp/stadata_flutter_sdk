# Subject

The View Subject API provides detailed information about a specific statistical subject from BPS (Badan Pusat Statistik) Indonesia. Statistical subjects represent specific domains or areas of statistical activity within broader subject categories, providing the primary organizational structure for BPS data collection, analysis, and dissemination.

Examples of statistical subjects include Kependudukan (Population and Demographics), Ketenagakerjaan (Employment and Labor Force), Kemiskinan (Poverty), Perdagangan (Trade), Industri Pengolahan (Manufacturing Industry), and Pertanian Tanaman Pangan (Food Crop Agriculture).

## Parameters

| Parameter | Type           | Description                                                      |
| --------- | -------------- | ---------------------------------------------------------------- |
| `id`      | `int`          | **Required**: The unique numerical identifier of the subject     |
| `domain`  | `String`       | **Required**: The domain (region) code for the request           |
| `lang`    | `DataLanguage` | **Optional**: Language preference (default: `DataLanguage.id`)   |

## Examples

### 1. Basic Subject Retrieval

```dart
// Retrieve detailed information for a specific statistical subject
final subject = await StadataFlutter.instance.view.subject(
  id: 1,
  domain: '0000', // National level
  lang: DataLanguage.id,
);

if (subject != null) {
  print('Subject ID: ${subject.id}');
  print('Name: ${subject.name}');
  print('Number of Tables: ${subject.nTable ?? 0}');

  if (subject.category != null) {
    print('Category ID: ${subject.category!.id}');
    print('Category Name: ${subject.category!.name}');
  }
} else {
  print('Subject not found');
}
```

### 2. Discover Available Tables for a Subject

```dart
// Use subject info to discover associated static tables
final subject = await StadataFlutter.instance.view.subject(
  id: 3,
  domain: '3200', // West Java
);

if (subject != null) {
  print('Subject: ${subject.name}');
  print('Available tables: ${subject.nTable ?? 0}');

  // Fetch the associated static tables
  final tables = await StadataFlutter.instance.list.staticTables(
    domain: '3200',
    subjectID: subject.id,
  );

  print('Tables in subject "${subject.name}":');
  for (final table in tables.data) {
    print('  - ${table.title}');
  }
}
```

### 3. Multi-language Subject Retrieval

```dart
// Compare subject names in Indonesian and English
final [indonesian, english] = await Future.wait([
  StadataFlutter.instance.view.subject(
    id: 5,
    domain: '0000',
    lang: DataLanguage.id,
  ),
  StadataFlutter.instance.view.subject(
    id: 5,
    domain: '0000',
    lang: DataLanguage.en,
  ),
]);

if (indonesian != null && english != null) {
  print('Indonesian: ${indonesian.name}');
  print('English: ${english.name}');
}
```

## Error Handling

```dart
try {
  final subject = await StadataFlutter.instance.view.subject(
    id: 1,
    domain: '0000',
    lang: DataLanguage.id,
  );

  if (subject != null) {
    print('Subject: ${subject.name}');
  } else {
    print('Subject not found');
  }

} on SubjectException catch (e) {
  print('Subject error: ${e.message}');

} on ApiException catch (e) {
  print('API communication error: ${e.message}');

} on ApiKeyNotFoundException catch (e) {
  print('Authentication required: ${e.message}');

} catch (e) {
  print('Unexpected error: $e');
}
```

## Properties (Subject)

| Property   | Type              | Description                                                          |
| ---------- | ----------------- | -------------------------------------------------------------------- |
| `id`       | `int`             | Unique identifier for the statistical subject within BPS system      |
| `name`     | `String`          | Descriptive name of the statistical subject in Indonesian            |
| `category` | `SubjectCategory?`| Parent subject category this subject belongs to (optional)           |
| `nTable`   | `int?`            | Total number of static tables available within this subject (optional)|
