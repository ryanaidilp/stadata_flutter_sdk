# Glossary

The Glossary API provides access to the BPS statistical glossary (`glosarium`), a reference index of terms, definitions, and concepts used in Indonesian official statistics. Each entry contains a term name, its definition, and an optional reference URL.

## Parameters

| Parameter | Type           | Default          | Description                                                     |
| --------- | -------------- | ---------------- | --------------------------------------------------------------- |
| `domain`  | `String`       | **Required**     | BPS domain code (e.g. `'0000'` for national)                    |
| `lang`    | `DataLanguage` | `DataLanguage.id` | Response language — `DataLanguage.id` or `DataLanguage.en`     |
| `page`    | `int`          | `1`              | Page number for pagination                                      |
| `keyword` | `String?`      | `null`           | Search keyword to filter terms by title or description          |
| `prefix`  | `String?`      | `null`           | Single letter prefix filter (e.g. `'A'`) to browse alphabetically |

## Examples

### 1. Get All Glossary Terms

```dart
final result = await StadataFlutter.instance.list.glossary(
  domain: '0000',
);

for (final term in result.data) {
  print('${term.title}: ${term.description}');
}
```

### 2. Search by Keyword

```dart
final result = await StadataFlutter.instance.list.glossary(
  domain: '0000',
  keyword: 'inflasi',
);
```

### 3. Browse by Letter

```dart
final result = await StadataFlutter.instance.list.glossary(
  domain: '0000',
  prefix: 'A',
);
```

### 4. Paginated Fetch in English

```dart
final result = await StadataFlutter.instance.list.glossary(
  domain: '0000',
  lang: DataLanguage.en,
  page: 2,
);
```

## Properties

| Property      | Type      | Description                                               |
| ------------- | --------- | --------------------------------------------------------- |
| `id`          | `int`     | Unique identifier of the glossary term (`glos_id`)        |
| `title`       | `String`  | The statistical term name                                 |
| `description` | `String`  | Full definition or explanation of the term                |
| `url`         | `String?` | Optional reference URL for further reading                |

## Error Handling

```dart
try {
  final result = await StadataFlutter.instance.list.glossary(
    domain: '0000',
    keyword: 'kemiskinan',
  );
  print('Found ${result.data.length} terms');
} on GlossaryException catch (e) {
  print('Glossary error: ${e.message}');
} catch (e) {
  print('Unexpected error: $e');
}
```

## See Also

- [BPS Web API Documentation](https://webapi.bps.go.id/documentation/)
