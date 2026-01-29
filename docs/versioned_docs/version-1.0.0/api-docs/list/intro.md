---
sidebar_position: 1
---

# Intro

The List API provides convenient methods for retrieving lists of data resources from the BPS API based on the type of data needed. To use the List API, you can access it using the following code:

```dart
final list = StadataFlutter.instance.list;
```

## Available Data Types

The List API supports the following data types:

### Geographic and Administrative Data
- **[Domains](./domains)**: Regional domains (provinces, regencies, etc.)

### Statistical Content
- **[Publications](./publications)**: Statistical publications and reports
- **[Static Tables](./static-tables)**: Pre-compiled statistical tables
- **[Dynamic Tables](./dynamic-tables)**: Interactive statistical tables with flexible filtering ⭐ **New**
- **[Infographics](./infographics)**: Visual statistical presentations
- **[Press Releases](./press-releases)**: Official statistical announcements
- **[News](./news)**: Statistical news and updates
- **[News Categories](./news-categories)**: Categories for news content

### Census Data ⭐ **New**
- **[Census](./census)**: Comprehensive census data including:
  - Population Census (Sensus Penduduk)
  - Agricultural Census (Sensus Pertanian) 
  - Economic Census (Sensus Ekonomi)

### Classification and Categorization
- **[Statistic Classifications](./statistic-classifications)**: KBLI and KBKI classifications
- **[Subject Categories](./subject-categories)**: Statistical subject categorizations
- **[Subjects](./subjects)**: Statistical subjects and topics
- **[Strategic Indicators](./strategic-indicators)**: Key performance indicators

### Data Structure and Metadata
- **[Units](./units)**: Data measurement units
- **[Variables](./variables)**: Statistical variables
- **[Vertical Variables](./vertical-variables)**: Hierarchical variable structures
- **[Derived Variables](./derived-variables)**: Calculated statistical variables ⭐ **New**

### Temporal Data
- **[Periods](./periods)**: Time periods for statistical data ⭐ **New**
- **[Derived Periods](./derived-periods)**: Aggregated/grouped time periods ⭐ **New**

Each data type provides methods to retrieve paginated lists with comprehensive filtering and search capabilities.

## Common Usage Patterns

### Basic List Retrieval

```dart
// Fetch publications from a specific domain
final publications = await StadataFlutter.instance.list.publications(
  domain: '0000', // National level
  lang: DataLanguage.id,
);

print('Total publications: ${publications.pagination.total}');
for (final pub in publications.data) {
  print('- ${pub.title}');
}
```

### Pagination

```dart
// Browse through paginated results
int currentPage = 1;
bool hasMorePages = true;

while (hasMorePages) {
  final result = await StadataFlutter.instance.list.news(
    domain: '0000',
    page: currentPage,
  );

  // Process current page
  for (final item in result.data) {
    print('News: ${item.title}');
  }

  hasMorePages = currentPage < result.pagination.pages;
  currentPage++;
}
```

### Search and Filtering

```dart
// Search with filters
final searchResults = await StadataFlutter.instance.list.publications(
  domain: '7200',
  keyword: 'ekonomi',
  year: 2024,
  lang: DataLanguage.id,
);
```

## Error Handling

All List API methods may throw these exceptions:

- `ApiException`: Network or API service errors
- `ApiKeyNotFoundException`: Invalid or missing API key
- Resource-specific exceptions (e.g., `PublicationException`, `NewsException`)

```dart
try {
  final result = await StadataFlutter.instance.list.publications(
    domain: '0000',
  );
  // Process result
} on ApiException catch (e) {
  print('API error: ${e.message}');
} catch (e) {
  print('Unexpected error: $e');
}
```
