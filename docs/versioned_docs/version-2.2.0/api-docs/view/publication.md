# Publication

The View Publication API provides comprehensive access to detailed information about specific statistical publications from BPS (Badan Pusat Statistik) Indonesia. This method enables applications to retrieve complete publication metadata, abstracts, PDF documents, cover images, and bibliographic information for in-depth analysis, research, and reference purposes.

Publications from BPS serve as authoritative sources of statistical information, providing detailed data analysis, methodological explanations, and comprehensive statistical findings across various domains of Indonesian statistics. The View Publication API ensures access to the complete publication ecosystem, enabling users to obtain full context and supporting materials for each statistical publication.

## Understanding the Publication System

BPS publications represent the cornerstone of Indonesian statistical documentation:

- **Authoritative Sources**: Official statistical reports and analysis from the national statistical office
- **Comprehensive Coverage**: Publications spanning economic, social, demographic, and regional statistics
- **Multi-format Access**: Complete access to PDF documents, abstracts, cover images, and metadata
- **Bibliographic Information**: Full citation details including ISSN, catalogue numbers, and publication schedules
- **Version Tracking**: Access to publication series and version history for longitudinal analysis

## Publication Categories

### Statistical Reports and Analysis
- **Economic Publications**: GDP reports, inflation analysis, trade statistics, and economic indicators
- **Social Publications**: Population analysis, education statistics, health indicators, and welfare reports
- **Demographic Publications**: Census results, population projections, and demographic trend analysis
- **Regional Publications**: Provincial and local statistics, regional development reports

### Methodological Publications
- **Survey Methodology**: Documentation of survey methods, sampling techniques, and data collection procedures
- **Standards and Classifications**: Statistical classification systems, coding schemes, and standardization guides
- **Quality Reports**: Data quality assessments, validation procedures, and reliability analysis

### Reference Publications
- **Statistical Yearbooks**: Annual compendiums of statistical information across various domains
- **Pocket Books**: Concise statistical summaries and key indicator collections
- **Catalogs and Directories**: Comprehensive listings of statistical products and services

## Parameters

| Parameter | Type           | Description                                                     |
| --------- | -------------- | --------------------------------------------------------------- |
| `id`      | `String`       | **Required**: The unique identifier of the specific publication |
| `domain`  | `String`       | **Required**: The domain (region) code specifying administrative context |
| `lang`    | `DataLanguage` | **Optional**: Language preference for localized content (default: `DataLanguage.id`) |

## Examples

### 1. Basic Publication Retrieval

![Preview](/gif/publications.gif)

```dart
// Retrieve detailed information for a specific publication
final publication = await StadataFlutter.instance.view.publication(
  id: '03220.2301', // Example: Economic Statistics publication ID
  domain: '0000', // National level
  lang: DataLanguage.id,
);

if (publication != null) {
  print('=== Publication Details ===');
  print('Title: ${publication.title}');
  print('ISSN: ${publication.issn}');
  print('Catalogue Number: ${publication.catalogueNumber ?? 'Not assigned'}');
  print('Publication Number: ${publication.publicationNumber ?? 'Not assigned'}');
  
  // Publication timeline
  print('\n=== Publication Timeline ===');
  print('Scheduled Date: ${publication.scheduledDate ?? 'Not scheduled'}');
  print('Release Date: ${publication.releaseDate ?? 'Not released'}');
  print('Last Update: ${publication.updateDate ?? 'No updates'}');
  
  // Content and resources
  print('\n=== Content and Resources ===');
  print('File Size: ${publication.size}');
  print('PDF Available: ${publication.pdf.isNotEmpty ? 'Yes' : 'No'}');
  print('Cover Image: ${publication.cover.isNotEmpty ? 'Yes' : 'No'}');
  
  if (publication.abstract != null && publication.abstract!.isNotEmpty) {
    // Display first 200 characters of abstract
    final abstractPreview = publication.abstract!.length > 200 
        ? '${publication.abstract!.substring(0, 200)}...'
        : publication.abstract!;
    print('Abstract: $abstractPreview');
  } else {
    print('Abstract: Not available');
  }
  
  // Direct access URLs
  print('\n=== Access URLs ===');
  if (publication.pdf.isNotEmpty) {
    print('PDF URL: ${publication.pdf}');
  }
  if (publication.cover.isNotEmpty) {
    print('Cover URL: ${publication.cover}');
  }
} else {
  print('Publication not found or not available');
}
```

### 2. Publication Research Workflow

```dart
// Comprehensive publication research workflow
class PublicationResearcher {
  static Future<void> researchPublicationTopic(
    String domain, 
    String searchKeyword,
  ) async {
    try {
      // 1. Discover publications using List API
      final publicationsList = await StadataFlutter.instance.list.publications(
        domain: domain,
        keyword: searchKeyword,
        lang: DataLanguage.id,
      );
      
      print('=== Publication Research: "$searchKeyword" ===');
      print('Found ${publicationsList.data.length} publications');
      
      if (publicationsList.data.isEmpty) {
        print('No publications found for keyword: $searchKeyword');
        return;
      }
      
      // 2. Analyze each publication in detail
      final detailedAnalysis = <Map<String, dynamic>>[];
      
      for (final pubSummary in publicationsList.data.take(5)) {
        print('\n--- Analyzing: ${pubSummary.title} ---');
        
        final detailedPub = await StadataFlutter.instance.view.publication(
          id: pubSummary.id,
          domain: domain,
          lang: DataLanguage.id,
        );
        
        if (detailedPub != null) {
          final analysis = {
            'id': detailedPub.id,
            'title': detailedPub.title,
            'hasAbstract': detailedPub.abstract != null && detailedPub.abstract!.isNotEmpty,
            'hasPdf': detailedPub.pdf.isNotEmpty,
            'hasCover': detailedPub.cover.isNotEmpty,
            'fileSize': detailedPub.size,
            'issn': detailedPub.issn,
            'releaseDate': detailedPub.releaseDate,
            'catalogueNumber': detailedPub.catalogueNumber,
          };
          
          detailedAnalysis.add(analysis);
          
          // Display key findings
          print('ISSN: ${detailedPub.issn}');
          print('Release Date: ${detailedPub.releaseDate ?? 'Not specified'}');
          print('File Size: ${detailedPub.size}');
          print('Abstract Available: ${analysis['hasAbstract'] ? 'Yes' : 'No'}');
          print('Resources: PDF(${analysis['hasPdf'] ? '✓' : '✗'}) Cover(${analysis['hasCover'] ? '✓' : '✗'})');
          
          if (detailedPub.abstract != null && detailedPub.abstract!.isNotEmpty) {
            // Analyze abstract for additional keywords
            final abstractLower = detailedPub.abstract!.toLowerCase();
            final relatedTopics = <String>[];
            
            // Check for related economic terms
            if (abstractLower.contains('ekonomi') || abstractLower.contains('gdp')) {
              relatedTopics.add('Economic Analysis');
            }
            if (abstractLower.contains('penduduk') || abstractLower.contains('demografi')) {
              relatedTopics.add('Demographics');
            }
            if (abstractLower.contains('inflasi') || abstractLower.contains('harga')) {
              relatedTopics.add('Price Analysis');
            }
            if (abstractLower.contains('perdagangan') || abstractLower.contains('ekspor')) {
              relatedTopics.add('Trade Statistics');
            }
            
            if (relatedTopics.isNotEmpty) {
              print('Related Topics: ${relatedTopics.join(', ')}');
            }
          }
        } else {
          print('Failed to retrieve detailed information');
        }
        
        // Rate limiting
        await Future.delayed(Duration(milliseconds: 300));
      }
      
      // 3. Research summary
      print('\n=== Research Summary ===');
      print('Total Publications Analyzed: ${detailedAnalysis.length}');
      print('With Abstracts: ${detailedAnalysis.where((p) => p['hasAbstract']).length}');
      print('With PDF Access: ${detailedAnalysis.where((p) => p['hasPdf']).length}');
      print('With Cover Images: ${detailedAnalysis.where((p) => p['hasCover']).length}');
      
      // Recent publications
      final recentPubs = detailedAnalysis.where((p) => 
          p['releaseDate'] != null && 
          (p['releaseDate'] as DateTime).isAfter(DateTime.now().subtract(Duration(days: 365)))
      ).length;
      
      print('Recent Publications (last year): $recentPubs');
      
      // Quality assessment
      final completenesScore = detailedAnalysis.isNotEmpty
          ? detailedAnalysis.map((p) => [
              p['hasAbstract'] ? 1 : 0,
              p['hasPdf'] ? 1 : 0,
              p['hasCover'] ? 1 : 0,
              p['catalogueNumber'] != null ? 1 : 0,
            ].reduce((a, b) => a + b)).reduce((a, b) => a + b) / (detailedAnalysis.length * 4)
          : 0.0;
      
      print('Average Completeness Score: ${(completenesScore * 100).toStringAsFixed(1)}%');
      
    } catch (e) {
      print('Research error: $e');
    }
  }
}
```

### 3. Publication Citation and Reference Management

```dart
// Publication citation and academic reference management
class PublicationCitationManager {
  static Future<void> generateCitationInformation(
    String publicationId, 
    String domain,
  ) async {
    try {
      final publication = await StadataFlutter.instance.view.publication(
        id: publicationId,
        domain: domain,
        lang: DataLanguage.id,
      );
      
      if (publication == null) {
        print('Publication not found for citation generation');
        return;
      }
      
      print('=== Publication Citation Information ===');
      print('Title: ${publication.title}');
      
      // Generate various citation formats
      print('\n=== Citation Formats ===');
      
      // APA Style
      final apaAuthor = 'Badan Pusat Statistik';
      final apaYear = publication.releaseDate?.year ?? DateTime.now().year;
      final apaTitle = publication.title;
      final apaPublisher = 'BPS-Statistics Indonesia';
      final apaLocation = 'Jakarta';
      
      print('APA Style:');
      print('$apaAuthor ($apaYear). $apaTitle. $apaPublisher: $apaLocation.');
      if (publication.pdf.isNotEmpty) {
        print('Retrieved from ${publication.pdf}');
      }
      
      // Chicago Style
      print('\nChicago Style:');
      print('Badan Pusat Statistik. "$apaTitle." BPS-Statistics Indonesia. $apaLocation: BPS, $apaYear.');
      
      // MLA Style
      print('\nMLA Style:');
      print('Badan Pusat Statistik. $apaTitle. BPS-Statistics Indonesia, $apaYear.');
      
      // Bibliographic Details
      print('\n=== Bibliographic Details ===');
      print('ISSN: ${publication.issn}');
      if (publication.catalogueNumber != null) {
        print('Catalogue Number: ${publication.catalogueNumber}');
      }
      if (publication.publicationNumber != null) {
        print('Publication Number: ${publication.publicationNumber}');
      }
      
      // Publication Dates
      print('\n=== Publication Timeline ===');
      if (publication.scheduledDate != null) {
        print('Scheduled Date: ${_formatDate(publication.scheduledDate!)}');
      }
      if (publication.releaseDate != null) {
        print('Release Date: ${_formatDate(publication.releaseDate!)}');
      }
      if (publication.updateDate != null) {
        print('Last Updated: ${_formatDate(publication.updateDate!)}');
      }
      
      // Access Information
      print('\n=== Access Information ===');
      print('File Size: ${publication.size}');
      if (publication.pdf.isNotEmpty) {
        print('PDF Access: Available');
        print('PDF URL: ${publication.pdf}');
      }
      if (publication.cover.isNotEmpty) {
        print('Cover Image: Available');
        print('Cover URL: ${publication.cover}');
      }
      
      // Abstract for research purposes
      if (publication.abstract != null && publication.abstract!.isNotEmpty) {
        print('\n=== Abstract ===');
        print(publication.abstract!);
      }
      
    } catch (e) {
      print('Citation generation error: $e');
    }
  }
  
  static String _formatDate(DateTime date) {
    return '${date.day}/${date.month}/${date.year}';
  }
}
```

## Publication Workflow Integration

Typical workflow for working with publications effectively:

1. **Discovery Phase**: Use List API to identify publications of interest
2. **Detailed Analysis**: Use View API to retrieve comprehensive publication information
3. **Content Assessment**: Evaluate abstracts, file sizes, and available resources
4. **Citation Generation**: Extract bibliographic information for academic reference
5. **Collection Management**: Organize and analyze publication metadata for research purposes

### Integration with Other APIs

```dart
// Building comprehensive statistical research workflow
Future<void> buildStatisticalResearchWorkflow(String domain, String topic) async {
  try {
    // 1. Find related publications
    final publications = await StadataFlutter.instance.list.publications(
      domain: domain,
      keyword: topic,
    );
    
    // 2. Find related news for context
    final news = await StadataFlutter.instance.list.news(
      domain: domain,
      keyword: topic,
    );
    
    // 3. Get detailed information for top publications
    final detailedPubs = <Publication>[];
    for (final pub in publications.data.take(3)) {
      final detailed = await StadataFlutter.instance.view.publication(
        id: pub.id,
        domain: domain,
      );
      if (detailed != null) detailedPubs.add(detailed);
    }
    
    print('=== Statistical Research: $topic ===');
    print('Publications found: ${publications.data.length}');
    print('Related news: ${news.data.length}');
    print('Detailed analysis: ${detailedPubs.length} publications');
    
    // Analysis combining both publication details and news context
    for (final pub in detailedPubs) {
      print('\nPublication: ${pub.title}');
      print('Release: ${pub.releaseDate ?? 'Date not specified'}');
      if (pub.abstract != null) {
        print('Abstract available: ${pub.abstract!.length} characters');
      }
      
      // Find related news coverage
      final relatedNews = news.data.where((n) => 
          n.title.toLowerCase().contains(topic.toLowerCase()) ||
          n.content.toLowerCase().contains(topic.toLowerCase())
      ).take(2);
      
      if (relatedNews.isNotEmpty) {
        print('Related news coverage:');
        for (final newsItem in relatedNews) {
          print('  • ${newsItem.title} (${newsItem.releaseDate})');
        }
      }
    }
    
  } catch (e) {
    print('Research workflow error: $e');
  }
}
```

## Error Handling

The View Publication API returns nullable `Publication` objects and may throw specific exceptions:

- **PublicationException**: Publication-specific errors (invalid ID, domain restrictions, access permissions)
- **ApiException**: General API communication errors (network issues, server errors, rate limiting)
- **ApiKeyNotFoundException**: Authentication errors (invalid or missing API key)
- **ValidationException**: Parameter validation errors (malformed IDs, invalid domain codes)

```dart
try {
  final publication = await StadataFlutter.instance.view.publication(
    id: '03220.2301',
    domain: '0000',
    lang: DataLanguage.id,
  );
  
  if (publication != null) {
    // Successfully retrieved publication
    print('Publication: ${publication.title}');
    print('ISSN: ${publication.issn}');
    print('PDF Available: ${publication.pdf.isNotEmpty}');
  } else {
    // Publication not found or not accessible
    print('Publication not found - may be unpublished or restricted');
  }
  
} on PublicationException catch (e) {
  print('Publication error: ${e.message}');
  // Handle publication-specific errors like invalid ID or access restrictions
  
} on ApiException catch (e) {
  print('API communication error: ${e.message}');
  // Handle network connectivity or server issues
  
} on ApiKeyNotFoundException catch (e) {
  print('Authentication required: ${e.message}');
  // Handle API key configuration issues
  
} catch (e) {
  print('Unexpected error: $e');
  // Handle any other unforeseen errors
}
```

## Performance Considerations

- **Rate Limiting**: Implement appropriate delays between requests to avoid overwhelming the API
- **Caching Strategy**: Cache publication metadata for frequently accessed publications
- **Batch Processing**: Process multiple publications in batches with rate limiting
- **Resource Management**: Consider PDF file sizes when implementing download functionality
- **Error Recovery**: Implement robust error handling for network issues and service unavailability
- **Memory Management**: Be mindful of memory usage when processing large publication collections

## Properties (Publication)

| Property            | Type        | Description                                                                   |
| ------------------- | ----------- | ----------------------------------------------------------------------------- |
| `id`                | `String`    | Unique identifier for the publication                                         |
| `title`             | `String`    | The complete title of the publication                                         |
| `issn`              | `String`    | International Standard Serial Number for publication series identification    |
| `scheduledDate`     | `DateTime?` | The originally scheduled publication date (optional)                          |
| `releaseDate`       | `DateTime?` | The actual release date when the publication became available (optional)      |
| `updateDate`        | `DateTime?` | The date when the publication was last updated or revised (optional)          |
| `cover`             | `String`    | URL to the cover image or thumbnail representation of the publication         |
| `pdf`               | `String`    | Direct URL to the PDF file for download and access                           |
| `size`              | `String`    | File size information in human-readable format (e.g., "2.5 MB", "1.2 GB")    |
| `abstract`          | `String?`   | Comprehensive summary or abstract of the publication content in HTML format (optional) |
| `catalogueNumber`   | `String?`   | BPS internal catalogue number for library and archival purposes (optional)    |
| `publicationNumber` | `String?`   | Official publication number or series identifier (optional)                   |