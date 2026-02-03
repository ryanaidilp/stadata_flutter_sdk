# View API Usage Guide

The View API in STADATA Flutter SDK provides detailed access to individual records and comprehensive information about specific statistical entities. Unlike the List API which returns collections of summary data, the View API delivers complete detail records with full metadata, content, and contextual information.

## Understanding the View API

The View API is designed for detailed data retrieval and in-depth analysis:

- **Detailed Records**: Complete information about specific entities including metadata, content, and relationships
- **Rich Content**: Full text content, media attachments, classification details, and contextual information
- **Relationship Data**: Information about related entities, hierarchical structures, and cross-references
- **Analytical Context**: Statistical context, methodological information, and data quality indicators
- **Complete Metadata**: Comprehensive descriptive information for proper data interpretation

## Available View APIs

The STADATA Flutter SDK provides view access to these key statistical entities:

### 1. Publication View
Access detailed publication information including content, methodology, and statistical context.

### 2. News View
Retrieve complete news articles with full content, publication details, and related information.

### 3. Press Release View
Get comprehensive press release data including full content, media attachments, and contextual information.

### 4. Static Table View
Access detailed static table information with metadata, structure details, and data context.

### 5. Statistical Classification View
Retrieve complete classification information including hierarchical structures and detailed definitions.

## Basic Usage Pattern

The standard pattern for using View APIs follows this structure:

```dart
// 1. Initialize the SDK
final stadata = StadataFlutter.instance;
await stadata.init(apiKey: 'your_api_key');

// 2. Access the view API
final result = await stadata.view.methodName(
  id: 'specific_entity_id',
  domain: 'domain_code',
  lang: DataLanguage.id,
);

// 3. Handle the result
if (result.isSuccess) {
  final entity = result.data;
  // Process the detailed entity data
} else {
  // Handle error cases
  print('Error: ${result.error}');
}
```

## Comprehensive Examples

### 1. Publication Detail Analysis

```dart
// Retrieve and analyze detailed publication information
class PublicationAnalyzer {
  static Future<void> analyzePublication(String publicationId, String domain) async {
    try {
      // Get detailed publication information
      final result = await StadataFlutter.instance.view.publication(
        id: publicationId,
        domain: domain,
        lang: DataLanguage.id,
      );
      
      final publication = result.data;
      
      print('=== Publication Analysis ===');
      print('Title: ${publication.title}');
      print('Abstract: ${publication.abstract}');
      print('Publication Number: ${publication.publicationNumber}');
      print('ISSN: ${publication.issn}');
      print('Publication Date: ${publication.releaseDate}');
      print('Pages: ${publication.pages}');
      print('Size: ${publication.size}');
      print('Language: ${publication.language}');
      
      // Analyze content structure
      if (publication.cover.isNotEmpty) {
        print('\\nCover Image Available: ${publication.cover}');
      }
      
      if (publication.pdf.isNotEmpty) {
        print('PDF Available: ${publication.pdf}');
      }
      
      // Publication classification
      print('\\nClassification:');
      print('Subject ID: ${publication.subjectId}');
      print('Category: Based on subject classification');
      
      // Content analysis
      print('\\nContent Overview:');
      final abstractWords = publication.abstract.split(' ').length;
      print('Abstract Length: $abstractWords words');
      
      // Determine publication type and significance
      if (publication.pages != null && publication.pages! > 100) {
        print('Publication Type: Comprehensive report');
      } else if (publication.pages != null && publication.pages! > 20) {
        print('Publication Type: Standard publication');
      } else {
        print('Publication Type: Brief or summary publication');
      }
      
    } catch (e) {
      print('Error analyzing publication: $e');
    }
  }
}
```

### 2. News Content Processing

```dart
// Process and analyze news content in detail
class NewsContentProcessor {
  static Future<void> processNewsContent(int newsId, String domain) async {
    try {
      // Retrieve detailed news information
      final result = await StadataFlutter.instance.view.news(
        id: newsId,
        domain: domain,
        lang: DataLanguage.id,
      );
      
      final news = result.data;
      
      print('=== News Content Analysis ===');
      print('Headline: ${news.title}');
      print('Publication Date: ${news.releaseDate}');
      print('News Category: ${news.categoryId}');
      
      // Content analysis
      print('\\nContent Analysis:');
      final contentLength = news.content.length;
      final wordCount = news.content.split(' ').length;
      final paragraphs = news.content.split('\\n').where((p) => p.trim().isNotEmpty).length;
      
      print('Content Length: $contentLength characters');
      print('Word Count: $wordCount words');
      print('Paragraphs: $paragraphs');
      
      // Reading time estimation (average 200 words per minute)
      final readingTimeMinutes = (wordCount / 200).ceil();
      print('Estimated Reading Time: $readingTimeMinutes minutes');
      
      // Content categorization
      print('\\nContent Categorization:');
      final contentLower = news.content.toLowerCase();
      if (contentLower.contains('ekonomi') || contentLower.contains('ekonomi')) {
        print('Category: Economic news');
      } else if (contentLower.contains('sosial') || contentLower.contains('penduduk')) {
        print('Category: Social/demographic news');
      } else if (contentLower.contains('statistik') || contentLower.contains('data')) {
        print('Category: Statistical methodology news');
      } else {
        print('Category: General statistical news');
      }
      
      // Media and attachments
      if (news.picture.isNotEmpty) {
        print('\\nMedia: Featured image available');
        print('Image URL: ${news.picture}');
      }
      
    } catch (e) {
      print('Error processing news content: $e');
    }
  }
}
```

### 3. Press Release Comprehensive Analysis

```dart
// Comprehensive press release analysis and processing
class PressReleaseAnalyzer {
  static Future<void> analyzePressRelease(int pressReleaseId, String domain) async {
    try {
      // Get detailed press release information
      final result = await StadataFlutter.instance.view.pressRelease(
        id: pressReleaseId,
        domain: domain,
        lang: DataLanguage.id,
      );
      
      final pressRelease = result.data;
      
      print('=== Press Release Comprehensive Analysis ===');
      print('Title: ${pressRelease.title}');
      print('Release Date: ${pressRelease.releaseDate}');
      print('Abstract: ${pressRelease.abstract}');
      
      // Content structure analysis
      print('\\nContent Structure:');
      final content = pressRelease.content;
      final sections = content.split('\\n\\n').where((s) => s.trim().isNotEmpty).length;
      print('Content Sections: $sections');
      
      // Statistical significance analysis
      print('\\nStatistical Content Analysis:');
      final hasNumbers = RegExp(r'\\d+[.,]?\\d*\\s*%|\\d+[.,]?\\d*\\s*(juta|ribu|miliar)').hasMatch(content);
      final hasPercentages = content.contains('%');
      final hasComparisons = content.contains('naik') || content.contains('turun') || content.contains('meningkat');
      
      print('Contains Statistical Data: $hasNumbers');
      print('Contains Percentages: $hasPercentages');
      print('Contains Trend Information: $hasComparisons');
      
      // Urgency and importance indicators
      print('\\nPress Release Classification:');
      final titleLower = pressRelease.title.toLowerCase();
      if (titleLower.contains('darurat') || titleLower.contains('mendesak')) {
        print('Priority: High urgency');
      } else if (titleLower.contains('penting') || titleLower.contains('khusus')) {
        print('Priority: Important announcement');
      } else {
        print('Priority: Regular statistical announcement');
      }
      
      // Media package assessment
      if (pressRelease.picture.isNotEmpty) {
        print('\\nMedia Package: Visual content available');
        print('Image: ${pressRelease.picture}');
      }
      
      // Related data assessment
      print('\\nData Context:');
      print('Subject ID: ${pressRelease.subjectId}');
      print('Related to statistical subject area');
      
    } catch (e) {
      print('Error analyzing press release: $e');
    }
  }
}
```

### 4. Static Table Deep Analysis

```dart
// Deep analysis of static table structure and content
class StaticTableAnalyzer {
  static Future<void> analyzeStaticTable(int tableId, String domain) async {
    try {
      // Retrieve detailed static table information
      final result = await StadataFlutter.instance.view.staticTable(
        id: tableId,
        domain: domain,
        lang: DataLanguage.id,
      );
      
      final table = result.data;
      
      print('=== Static Table Deep Analysis ===');
      print('Table Title: ${table.title}');
      print('Table ID: ${table.id}');
      print('Subject ID: ${table.subjectId}');
      print('Updated: ${table.updatedAt}');
      print('Created: ${table.createdAt}');
      
      // Table metadata analysis
      print('\\nTable Metadata:');
      print('Size: ${table.size}');
      print('Excel Available: ${table.excel.isNotEmpty ? "Yes" : "No"}');
      
      if (table.excel.isNotEmpty) {
        print('Excel Download: ${table.excel}');
      }
      
      // Content structure analysis
      print('\\nData Structure Analysis:');
      
      // Analyze table description for data insights
      final description = table.table;
      if (description.isNotEmpty) {
        print('Description Available: Yes');
        
        // Look for temporal indicators
        if (description.contains('tahun') || description.contains('bulan')) {
          print('Temporal Data: Time series data detected');
        }
        
        // Look for geographic indicators
        if (description.contains('provinsi') || description.contains('kabupaten') || description.contains('kota')) {
          print('Geographic Data: Regional breakdown detected');
        }
        
        // Look for demographic indicators
        if (description.contains('jenis kelamin') || description.contains('umur') || description.contains('pendidikan')) {
          print('Demographic Data: Population characteristics detected');
        }
      }
      
      // Data freshness assessment
      final now = DateTime.now();
      final updated = DateTime.parse(table.updatedAt);
      final daysSinceUpdate = now.difference(updated).inDays;
      
      print('\\nData Freshness:');
      if (daysSinceUpdate < 30) {
        print('Status: Very recent (updated $daysSinceUpdate days ago)');
      } else if (daysSinceUpdate < 90) {
        print('Status: Recent (updated $daysSinceUpdate days ago)');
      } else if (daysSinceUpdate < 365) {
        print('Status: Moderately recent (updated $daysSinceUpdate days ago)');
      } else {
        print('Status: Older data (updated $daysSinceUpdate days ago)');
      }
      
      // Usage recommendations
      print('\\nUsage Recommendations:');
      if (table.excel.isNotEmpty) {
        print('✓ Download Excel file for detailed analysis');
      }
      print('✓ Use table ID ${table.id} for data queries');
      print('✓ Reference subject ID ${table.subjectId} for related content');
      
    } catch (e) {
      print('Error analyzing static table: $e');
    }
  }
}
```

### 5. Statistical Classification Detail Analysis

```dart
// Comprehensive statistical classification analysis
class ClassificationAnalyzer {
  static Future<void> analyzeClassification(int classificationId, String domain) async {
    try {
      // Get detailed classification information
      final result = await StadataFlutter.instance.view.statisticClassification(
        id: classificationId,
        domain: domain,
        lang: DataLanguage.id,
      );
      
      final classification = result.data;
      
      print('=== Statistical Classification Analysis ===');
      print('Classification Title: ${classification.title}');
      print('Derivation Note: ${classification.derivationNote}');
      print('Status: ${classification.status}');
      print('Level: ${classification.level}');
      
      // Hierarchical structure analysis
      print('\\nHierarchical Structure:');
      print('Classification Level: ${classification.level}');
      
      if (classification.level > 1) {
        print('Hierarchical Position: Sub-classification (Level ${classification.level})');
        print('Part of larger classification system');
      } else {
        print('Hierarchical Position: Root level classification');
      }
      
      // Classification system analysis
      print('\\nClassification System:');
      final title = classification.title.toLowerCase();
      
      if (title.contains('kbli') || title.contains('klasifikasi baku lapangan usaha')) {
        print('System Type: KBLI (Standard Industrial Classification)');
        print('Purpose: Economic activity classification');
        print('Usage: Business registration, economic surveys, national accounts');
      } else if (title.contains('kbki') || title.contains('klasifikasi baku komoditi')) {
        print('System Type: KBKI (Standard Commodity Classification)');
        print('Purpose: Commodity and product classification');
        print('Usage: Trade statistics, price monitoring, production analysis');
      } else if (title.contains('isco') || title.contains('pekerjaan')) {
        print('System Type: Occupational Classification');
        print('Purpose: Job and occupation classification');
        print('Usage: Labor force surveys, employment statistics');
      } else {
        print('System Type: General statistical classification');
        print('Purpose: Statistical categorization and analysis');
      }
      
      // Derivation and methodology
      print('\\nMethodological Information:');
      if (classification.derivationNote.isNotEmpty) {
        print('Derivation Details Available: Yes');
        print('Derivation: ${classification.derivationNote}');
        
        // Analyze derivation for international standards
        final derivation = classification.derivationNote.toLowerCase();
        if (derivation.contains('isic') || derivation.contains('international')) {
          print('International Standard: Based on international classification');
        } else if (derivation.contains('nasional') || derivation.contains('indonesia')) {
          print('National Standard: Indonesia-specific classification');
        }
      } else {
        print('Derivation Details: Not specified');
      }
      
      // Status and validity
      print('\\nStatus Information:');
      print('Current Status: ${classification.status}');
      
      if (classification.status.toLowerCase().contains('aktif') || classification.status.toLowerCase().contains('active')) {
        print('Validity: Currently active and in use');
        print('Recommendation: Safe to use for current statistical work');
      } else if (classification.status.toLowerCase().contains('revisi') || classification.status.toLowerCase().contains('revision')) {
        print('Validity: Under revision or being updated');
        print('Recommendation: Check for updates before extensive use');
      } else {
        print('Validity: Status unclear - verify current applicability');
      }
      
      // Usage recommendations
      print('\\nUsage Recommendations:');
      print('✓ Use for data categorization in subject area');
      print('✓ Reference in statistical surveys and analysis');
      print('✓ Apply in data collection and processing workflows');
      if (classification.level > 1) {
        print('✓ Consider parent classification for broader context');
      }
      
    } catch (e) {
      print('Error analyzing classification: $e');
    }
  }
}
```

## Integration Workflows

### Multi-Entity Analysis Workflow

```dart
// Comprehensive workflow combining multiple view APIs
class IntegratedAnalysisWorkflow {
  static Future<void> performComprehensiveAnalysis(String domain) async {
    try {
      print('=== Integrated Statistical Content Analysis ===');
      
      // 1. Start with a publication for context
      final publicationResult = await StadataFlutter.instance.view.publication(
        id: 'sample_publication_id',
        domain: domain,
        lang: DataLanguage.id,
      );
      
      if (publicationResult.isSuccess) {
        final publication = publicationResult.data;
        print('\\n1. Publication Context:');
        print('   Title: ${publication.title}');
        print('   Subject Area: ${publication.subjectId}');
        
        // 2. Find related news about the same subject
        // This would require getting news list first, then viewing specific items
        print('\\n2. Looking for related news content...');
        
        // 3. Check for press releases on the same topic
        print('\\n3. Checking for related press releases...');
        
        // 4. Find static tables related to the publication subject
        print('\\n4. Analyzing related data tables...');
        
        // 5. Examine classification systems used
        print('\\n5. Understanding classification frameworks...');
        
        print('\\nIntegrated analysis workflow demonstrates how view APIs');
        print('can be combined for comprehensive statistical research.');
      }
      
    } catch (e) {
      print('Error in integrated analysis: $e');
    }
  }
}
```

## Error Handling Best Practices

### Comprehensive Error Management

```dart
// Robust error handling for view API operations
class ViewAPIErrorHandler {
  static Future<void> handleViewOperationSafely<T>(
    Future<Result<T>> Function() viewOperation,
    String operationName,
  ) async {
    try {
      final result = await viewOperation();
      
      if (result.isSuccess) {
        print('$operationName completed successfully');
        // Process the successful result
        return result.data;
      } else {
        // Handle specific error types
        final error = result.error;
        
        if (error is ApiKeyNotFoundException) {
          print('$operationName failed: Invalid or missing API key');
          print('Solution: Check your API key configuration');
        } else if (error is ApiException) {
          print('$operationName failed: API error - ${error.message}');
          print('Solution: Check network connectivity and API status');
        } else if (error.toString().contains('not found')) {
          print('$operationName failed: Requested entity not found');
          print('Solution: Verify the ID and domain parameters');
        } else {
          print('$operationName failed: ${error.toString()}');
        }
      }
      
    } catch (e) {
      print('$operationName encountered unexpected error: $e');
      print('Solution: Check input parameters and network connectivity');
    }
  }
}

// Usage example
await ViewAPIErrorHandler.handleViewOperationSafely(
  () => StadataFlutter.instance.view.publication(
    id: 'publication_id',
    domain: '0000',
    lang: DataLanguage.id,
  ),
  'Publication retrieval',
);
```

## Performance Optimization

### Efficient View API Usage

```dart
// Optimized patterns for view API operations
class ViewAPIOptimizer {
  static final Map<String, dynamic> _cache = {};
  
  static Future<T?> getCachedOrFetch<T>(
    String cacheKey,
    Future<Result<T>> Function() fetchOperation,
    Duration cacheTimeout,
  ) async {
    // Check cache first
    if (_cache.containsKey(cacheKey)) {
      final cachedData = _cache[cacheKey];
      if (DateTime.now().difference(cachedData['timestamp']).compareTo(cacheTimeout) < 0) {
        print('Returning cached data for $cacheKey');
        return cachedData['data'] as T;
      }
    }
    
    // Fetch fresh data
    try {
      final result = await fetchOperation();
      if (result.isSuccess) {
        _cache[cacheKey] = {
          'data': result.data,
          'timestamp': DateTime.now(),
        };
        return result.data;
      }
    } catch (e) {
      print('Error fetching data for $cacheKey: $e');
    }
    
    return null;
  }
  
  // Batch processing for multiple view operations
  static Future<void> batchViewOperations(
    List<Future<void> Function()> operations,
    {int concurrentLimit = 3}
  ) async {
    // Process operations in batches to avoid overwhelming the API
    for (int i = 0; i < operations.length; i += concurrentLimit) {
      final batch = operations.skip(i).take(concurrentLimit);
      await Future.wait(batch.map((op) => op()));
      
      // Add delay between batches
      if (i + concurrentLimit < operations.length) {
        await Future.delayed(Duration(milliseconds: 500));
      }
    }
  }
}
```

## Best Practices Summary

### View API Usage Guidelines

1. **Entity Identification**: Always verify entity IDs and domain codes before making view API calls
2. **Error Handling**: Implement comprehensive error handling for network issues and invalid parameters
3. **Data Validation**: Validate retrieved data before processing to ensure completeness
4. **Caching Strategy**: Cache frequently accessed view data to improve performance
5. **Rate Limiting**: Respect API rate limits when making multiple view requests
6. **Content Processing**: Process large content (like publication PDFs) efficiently
7. **Relationship Mapping**: Use view data to understand relationships between different entities
8. **Metadata Utilization**: Leverage metadata for proper data interpretation and context

The View API provides powerful capabilities for detailed statistical content analysis and comprehensive data exploration within the Indonesian statistical system.