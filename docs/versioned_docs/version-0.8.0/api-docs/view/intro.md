---
sidebar_position: 1
---

# Intro

The View API provides comprehensive methods for retrieving detailed, in-depth information about specific items from the BPS (Badan Pusat Statistik) Indonesia statistical ecosystem. Unlike the List API which returns collections and summaries of data, the View API is specifically designed to deliver rich, complete details about individual statistical resources, enabling deep analysis, comprehensive understanding, and detailed examination of BPS content.

The View API serves as the detailed content access layer of the STADATA Flutter SDK, providing applications with the capability to present users with complete, contextualized information about statistical publications, data tables, news articles, press releases, and classification systems.

## Understanding the View API Architecture

The View API is built around the concept of detailed resource retrieval:

- **Individual Focus**: Each API call targets a specific, identified resource for comprehensive detail retrieval
- **Rich Content**: Returns complete metadata, content, and contextual information for items
- **Domain Contextualization**: Provides domain-specific details and relationships for each resource
- **Multimedia Support**: Access to associated files, images, and supplementary materials
- **Hierarchical Data**: For complex items like classifications, provides complete structural information

## Usage

To access the View API functionality:

```dart
final view = StadataFlutter.instance.view;
```

## Available View Methods

The View API provides detailed access to key BPS content types:

### Publication Resources

- **[Publications](./publication)**: Comprehensive publication details including metadata, abstracts, PDF access, and bibliographic information
  - Complete publication metadata with ISSN, catalogue numbers, and publication schedules
  - Full abstract content and document structure information
  - Direct access to PDF files and cover images
  - Publication series and version tracking

### Data Table Resources

- **[Static Tables](./static-table)**: Detailed static table information with complete content access
  - Full table metadata including data sources and methodology
  - Access to both HTML preview and Excel download formats
  - Subject classification and temporal coverage information
  - Data lineage and update history

### Communication Resources

- **[News](./news)**: Complete news article content with full text and multimedia

  - Full article content with rich text formatting
  - Category classification and topical organization
  - Associated images and multimedia content
  - Publication timeline and update tracking

- **[Press Releases](./press-release)**: Comprehensive press release details with all materials
  - Complete press release content and abstracts
  - Access to PDF documents and presentation slides
  - Cover images and visual materials
  - Subject classification and thematic organization

### Classification Resources

- **[Statistical Classifications](./statistic-classification)**: Detailed KBLI/KBKI classification with hierarchical structure
  - Complete classification hierarchy and relationships
  - Industry codes and economic activity descriptions
  - Version history and classification updates
  - Cross-references and alternative coding systems

## Universal Usage Pattern

All View API methods follow a consistent and predictable pattern:

```dart
// Standard View API call pattern
final result = await StadataFlutter.instance.view.methodName(
  id: itemId,             // Required: Unique identifier of the specific item
  domain: domainCode,     // Required: Domain code for geographic/administrative context
  lang: DataLanguage.id,  // Optional: Language preference (default: Indonesian)
);
```

### Parameter Specifications

#### Required Parameters

- **`id`**: The unique identifier for the specific resource being requested
- **`domain`**: The domain code specifying the administrative context and scope

#### Optional Parameters

- **`lang`**: Language preference for localized content (defaults to Indonesian)

## Error Handling

View API methods return nullable objects and may throw specific exceptions based on the resource type:

### Common Error Types

- **Resource-specific exceptions**: Each View method throws specific exceptions (e.g., `PublicationException`, `NewsException`)
- **ApiException**: General API connectivity and service errors
- **ApiKeyNotFoundException**: Invalid or missing API key
- **ValidationException**: Invalid parameters or request format

### Error Handling Pattern

```dart
try {
  final publication = await StadataFlutter.instance.view.publication(
    id: '123',
    domain: '7200',
    lang: DataLanguage.id,
  );

  if (publication != null) {
    // Handle successful data retrieval
    print('Publication: ${publication.title}');
    print('Abstract: ${publication.abstract ?? 'No abstract available'}');
    print('PDF URL: ${publication.pdf}');
  } else {
    // Handle case where item not found
    print('Publication not found - may be unavailable or invalid ID');
  }
} on PublicationException catch (e) {
  print('Publication-specific error: ${e.message}');
  // Handle errors like invalid publication ID, domain restrictions
} on ApiException catch (e) {
  print('API communication error: ${e.message}');
  // Handle network issues, server errors, rate limiting
} on ApiKeyNotFoundException catch (e) {
  print('Authentication error: ${e.message}');
  // Handle API key issues
} catch (e) {
  print('Unexpected error: $e');
  // Handle any other unforeseen errors
}
```

### Robust Error Handling for Production

```dart
Future<T?> safeViewCall<T>(
  Future<T?> Function() viewCall,
  String resourceType,
) async {
  try {
    final result = await viewCall();
    if (result == null) {
      print('$resourceType not found or not available');
    }
    return result;
  } on ApiKeyNotFoundException {
    print('API key required for $resourceType access');
    // Prompt user for API key configuration
    return null;
  } on ApiException catch (e) {
    print('Service unavailable for $resourceType: ${e.message}');
    // Implement retry logic or fallback
    return null;
  } catch (e) {
    print('Failed to retrieve $resourceType: $e');
    // Log error for debugging
    return null;
  }
}

// Usage example
final publication = await safeViewCall(
  () => StadataFlutter.instance.view.publication(
    id: '123',
    domain: '7200',
  ),
  'Publication',
);
```

## Integration Patterns

### Relationship with List API

The View API works best in combination with the List API for comprehensive data workflows:

1. **Discovery**: Use List API to find items of interest
2. **Details**: Use View API to get comprehensive information about specific items
3. **Analysis**: Combine both for detailed analysis and reporting

```dart
// Complete workflow example
// 1. Find publications using List API
final publicationsList = await StadataFlutter.instance.list.publications(
  domain: '7200',
  keyword: 'ekonomi',
);

print('Found ${publicationsList.data.length} economic publications');

// 2. Get detailed information for each publication
final detailedPublications = <Publication>[];

for (final pubSummary in publicationsList.data.take(5)) {
  final detailedPub = await StadataFlutter.instance.view.publication(
    id: pubSummary.id,
    domain: '7200',
  );

  if (detailedPub != null) {
    detailedPublications.add(detailedPub);
    print('Loaded: ${detailedPub.title}');
    print('Abstract available: ${detailedPub.abstract != null}');
    print('PDF size: ${detailedPub.size}');
  }

  // Rate limiting
  await Future.delayed(Duration(milliseconds: 200));
}

print('Successfully loaded ${detailedPublications.length} detailed publications');
```

### Cross-Resource Integration

```dart
// Building comprehensive domain overview
Future<void> buildDomainContentOverview(String domain) async {
  // Get overview using List APIs
  final [publications, news, pressReleases] = await Future.wait([
    StadataFlutter.instance.list.publications(domain: domain),
    StadataFlutter.instance.list.news(domain: domain),
    StadataFlutter.instance.list.pressReleases(domain: domain),
  ]);

  print('=== Domain $domain Content Overview ===');
  print('Publications: ${publications.data.length}');
  print('News Articles: ${news.data.length}');
  print('Press Releases: ${pressReleases.data.length}');

  // Get detailed examples from each category
  if (publications.data.isNotEmpty) {
    final detailedPub = await StadataFlutter.instance.view.publication(
      id: publications.data.first.id,
      domain: domain,
    );
    if (detailedPub != null) {
      print('Latest Publication: ${detailedPub.title}');
      print('Publication Date: ${detailedPub.releaseDate}');
    }
  }

  if (news.data.isNotEmpty) {
    final detailedNews = await StadataFlutter.instance.view.news(
      id: news.data.first.id,
      domain: domain,
    );
    if (detailedNews != null) {
      print('Latest News: ${detailedNews.title}');
      print('News Category: ${detailedNews.category ?? 'General'}');
    }
  }
}
```

## Advanced Usage Patterns

### Batch Processing with Error Resilience

```dart
Future<List<T>> batchViewRequests<T>(
  List<String> ids,
  String domain,
  Future<T?> Function(String id, String domain) viewFunction,
  {int batchSize = 5, Duration delay = const Duration(milliseconds: 300)}
) async {
  final results = <T>[];

  for (int i = 0; i < ids.length; i += batchSize) {
    final batch = ids.skip(i).take(batchSize);
    final batchResults = await Future.wait(
      batch.map((id) => viewFunction(id, domain)),
    );

    // Filter out null results
    results.addAll(batchResults.whereType<T>());

    // Rate limiting between batches
    if (i + batchSize < ids.length) {
      await Future.delayed(delay);
    }
  }

  return results;
}

// Usage example
final publicationIds = ['1', '2', '3', '4', '5'];
final detailedPublications = await batchViewRequests(
  publicationIds,
  '7200',
  (id, domain) => StadataFlutter.instance.view.publication(
    id: id,
    domain: domain,
  ),
);
```

### Resource-Specific Workflows

```dart
// Content analysis workflow combining List and View APIs
class ContentAnalysisWorkflow {
  static Future<Map<String, dynamic>> analyzePublications(
    String domain, {
    String? keyword,
    int maxAnalyze = 10,
  }) async {
    // 1. Discover publications
    final publicationsList = await StadataFlutter.instance.list.publications(
      domain: domain,
      keyword: keyword,
    );

    // 2. Get detailed information for analysis
    final detailedPubs = <Publication>[];
    for (final pub in publicationsList.data.take(maxAnalyze)) {
      final detailed = await StadataFlutter.instance.view.publication(
        id: pub.id,
        domain: domain,
      );
      if (detailed != null) detailedPubs.add(detailed);
      await Future.delayed(Duration(milliseconds: 200));
    }

    // 3. Perform analysis
    final analysis = {
      'totalFound': publicationsList.data.length,
      'analyzed': detailedPubs.length,
      'withAbstracts': detailedPubs.where((p) => p.abstract != null).length,
      'averageSize': detailedPubs.isNotEmpty
          ? detailedPubs.map((p) => _parseSize(p.size)).where((s) => s > 0).fold(0.0, (a, b) => a + b) / detailedPubs.length
          : 0.0,
      'recentPublications': detailedPubs.where((p) =>
          p.releaseDate != null &&
          p.releaseDate!.isAfter(DateTime.now().subtract(Duration(days: 90)))
      ).length,
    };

    return analysis;
  }

  static double _parseSize(String sizeStr) {
    // Simple size parsing logic
    final match = RegExp(r'([\d.]+)\s*(kb|mb)', caseSensitive: false).firstMatch(sizeStr.toLowerCase());
    if (match != null) {
      final value = double.tryParse(match.group(1) ?? '0') ?? 0;
      final unit = match.group(2)?.toLowerCase();
      return unit == 'mb' ? value * 1024 : value;
    }
    return 0.0;
  }
}
```
