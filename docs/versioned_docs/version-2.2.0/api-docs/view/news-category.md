# News Category

The View News Category API provides detailed information about a specific news category from BPS (Badan Pusat Statistik) Indonesia. News categories provide thematic organization for BPS news articles, enabling users to filter and discover statistical news by subject area.

Common categories include Ekonomi (Economy), Sosial (Social), Kependudukan (Population), Pertanian (Agriculture), Industri (Industry), Regional, and Metodologi (Methodology).

## Parameters

| Parameter | Type           | Description                                                          |
| --------- | -------------- | -------------------------------------------------------------------- |
| `id`      | `String`       | **Required**: The unique string identifier of the news category      |
| `domain`  | `String`       | **Required**: The domain (region) code for the request               |
| `lang`    | `DataLanguage` | **Optional**: Language preference (default: `DataLanguage.id`)       |

Note: The `id` parameter for news categories is a `String`, unlike most other view APIs which use `int`.

## Examples

### 1. Basic News Category Retrieval

```dart
// Retrieve a specific news category
final category = await StadataFlutter.instance.view.newsCategory(
  id: 'Statistik Lain',
  domain: '0000',
  lang: DataLanguage.id,
);

if (category != null) {
  print('Category ID: ${category.id}');
  print('Category Name: ${category.name}');
} else {
  print('News category not found');
}
```

### 2. List News for a Category

```dart
// Get category details then list its news articles
final category = await StadataFlutter.instance.view.newsCategory(
  id: 'Statistik Lain',
  domain: '7315', // Pinrang regency
);

if (category != null) {
  print('Category: ${category.name}');

  // Fetch news articles in this category
  final news = await StadataFlutter.instance.list.news(
    domain: '7315',
    newsCategoryID: category.id,
  );

  print('News in "${category.name}":');
  for (final article in news.data) {
    print('  [${article.id}] ${article.title}');
    print('      Published: ${article.releaseDate}');
  }
}
```

### 3. Browse All News Categories

```dart
// List all available news categories then get details for each
final categories = await StadataFlutter.instance.list.newsCategories(
  domain: '0000',
);

print('=== News Categories ===');
for (final cat in categories.data) {
  final detail = await StadataFlutter.instance.view.newsCategory(
    id: cat.id,
    domain: '0000',
  );

  if (detail != null) {
    print('${detail.id}: ${detail.name}');
  }
}
```

## Error Handling

```dart
try {
  final category = await StadataFlutter.instance.view.newsCategory(
    id: 'Statistik Lain',
    domain: '0000',
    lang: DataLanguage.id,
  );

  if (category != null) {
    print('Category: ${category.name}');
  } else {
    print('News category not found');
  }

} on NewsCategoryException catch (e) {
  print('News category error: ${e.message}');

} on ApiException catch (e) {
  print('API error: ${e.message}');

} on ApiKeyNotFoundException catch (e) {
  print('Authentication required: ${e.message}');

} catch (e) {
  print('Unexpected error: $e');
}
```

## Properties (NewsCategory)

| Property | Type     | Description                                                            |
| -------- | -------- | ---------------------------------------------------------------------- |
| `id`     | `String` | Unique string identifier for the news category                         |
| `name`   | `String` | Descriptive name of the news category in Indonesian                    |
