# Subject Category

The View Subject Category API provides detailed information about a specific subject category from BPS (Badan Pusat Statistik) Indonesia. Subject categories provide high-level thematic organization for statistical subjects, serving as the top-level classification system within the BPS data ecosystem.

Common subject categories include Sosial (Social), Ekonomi (Economic), Pertanian (Agriculture), Lingkungan (Environment), Infrastruktur (Infrastructure), and Pemerintahan (Governance).

## Parameters

| Parameter | Type           | Description                                                            |
| --------- | -------------- | ---------------------------------------------------------------------- |
| `id`      | `int`          | **Required**: The unique numerical identifier of the subject category  |
| `domain`  | `String`       | **Required**: The domain (region) code for the request                 |
| `lang`    | `DataLanguage` | **Optional**: Language preference (default: `DataLanguage.id`)         |

## Examples

### 1. Basic Subject Category Retrieval

```dart
// Retrieve a specific subject category
final category = await StadataFlutter.instance.view.subjectCategory(
  id: 1,
  domain: '0000', // National level
  lang: DataLanguage.id,
);

if (category != null) {
  print('Category ID: ${category.id}');
  print('Category Name: ${category.name}');
} else {
  print('Subject category not found');
}
```

### 2. Browse Subjects Within a Category

```dart
// Get a category then list its subjects
final category = await StadataFlutter.instance.view.subjectCategory(
  id: 2,
  domain: '3100', // Jakarta
);

if (category != null) {
  print('Category: ${category.name}');

  // Fetch subjects belonging to this category
  final subjects = await StadataFlutter.instance.list.subjects(
    domain: '3100',
    subjectCategoryID: category.id,
  );

  print('Subjects in "${category.name}":');
  for (final subject in subjects.data) {
    print('  [${subject.id}] ${subject.name} (${subject.nTable ?? 0} tables)');
  }
}
```

### 3. Multi-language Category Retrieval

```dart
// Get category name in both languages
final [indonesian, english] = await Future.wait([
  StadataFlutter.instance.view.subjectCategory(
    id: 1,
    domain: '0000',
    lang: DataLanguage.id,
  ),
  StadataFlutter.instance.view.subjectCategory(
    id: 1,
    domain: '0000',
    lang: DataLanguage.en,
  ),
]);

if (indonesian != null) print('ID: ${indonesian.name}');
if (english != null) print('EN: ${english.name}');
```

## Error Handling

```dart
try {
  final category = await StadataFlutter.instance.view.subjectCategory(
    id: 1,
    domain: '0000',
    lang: DataLanguage.id,
  );

  if (category != null) {
    print('Category: ${category.name}');
  } else {
    print('Subject category not found');
  }

} on SubjectCategoryException catch (e) {
  print('Subject category error: ${e.message}');

} on ApiException catch (e) {
  print('API error: ${e.message}');

} on ApiKeyNotFoundException catch (e) {
  print('Authentication required: ${e.message}');

} catch (e) {
  print('Unexpected error: $e');
}
```

## Properties (SubjectCategory)

| Property | Type     | Description                                                          |
| -------- | -------- | -------------------------------------------------------------------- |
| `id`     | `int`    | Unique identifier for the subject category within BPS classification |
| `name`   | `String` | Descriptive name of the subject category in Indonesian               |
