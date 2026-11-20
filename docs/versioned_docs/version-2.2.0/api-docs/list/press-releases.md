# Press Releases

The Press Releases API provides access to official press releases from BPS (Badan Pusat Statistik) Indonesia offices across all regions. Press releases are formal communications that announce important statistical findings, economic indicators, survey results, policy updates, and other significant developments within Indonesia's statistical system.

BPS press releases serve as the primary channel for communicating statistical insights to media, researchers, policymakers, and the general public. These releases contain official statements, data interpretations, contextual analysis, and supporting documentation that help stakeholders understand the implications of statistical findings.

## Understanding BPS Press Releases

Press releases represent the authoritative voice of BPS on statistical matters:

- **Official Communications**: Formal announcements of statistical findings and interpretations
- **Data Context**: Professional analysis and contextualization of statistical results
- **Policy Implications**: Discussion of how statistical findings relate to policy and development
- **Media Resources**: Materials designed for media consumption and public communication
- **Supporting Documentation**: Comprehensive materials including PDFs, presentations, and supplementary data

## Press Release Organization

BPS press releases are systematically organized to ensure effective communication:

- **Subject Classification**: Organized by statistical domains and subject areas
- **Geographic Coverage**: Available from national, provincial, and local BPS offices
- **Temporal Organization**: Filterable by release year and month
- **Content Types**: Multiple formats including PDFs, presentation slides, and cover images
- **Search Capabilities**: Keyword-based discovery and subject-based filtering

## Parameters

| Parameter | Type           | Description                                                       |
| --------- | -------------- | ----------------------------------------------------------------- |
| `domain`  | `String`       | Domain code (region) for retrieving press releases **(required)** |
| `lang`    | `DataLanguage` | Language for press release data (default: `DataLanguage.id`)     |
| `page`    | `int`          | Page number (default: `1`)                                       |
| `subcat`  | `int`          | Subject category ID for filtering press releases (optional)      |
| `keyword` | `String?`      | Keyword for searching press releases (optional)                  |
| `month`   | `int?`         | Month for filtering press releases (optional - `1..12`)          |
| `year`    | `int?`         | Year for filtering press releases (optional)                     |

## Examples

### 1. Get All Press Releases for a Domain

```dart
// Fetch press releases from Central Java BPS
final pressReleaseResult = await StadataFlutter.instance.list.pressReleases(
  domain: '3300', // Central Java domain code
  lang: DataLanguage.id,
);

final pressReleaseList = pressReleaseResult.data;
final pagination = pressReleaseResult.pagination;

// Print pagination information
print('Current Page: ${pagination.page}');
print('Total Pages: ${pagination.pages}');
print('Data Count in This Page: ${pagination.count}');
print('Per Page: ${pagination.perPage}');
print('Total: ${pagination.total}');
print('------------------------');

// Print retrieved press release data
for (final pressRelease in pressReleaseList) {
  print('Press Release ID: ${pressRelease.id}');
  print('Title: ${pressRelease.title}');
  print('Subject: ${pressRelease.subject?.name ?? 'Not specified'}');
  print('Release Date: ${pressRelease.releaseDate ?? 'Unknown'}');
  print('File Size: ${pressRelease.size}');
  print('PDF URL: ${pressRelease.pdf}');
  print('Slide URL: ${pressRelease.slide}');
  print('Cover Image: ${pressRelease.cover}');
  print('------------------------');
}
```

### 2. Search Press Releases by Keyword

```dart
// Search for inflation-related press releases
final inflationReleases = await StadataFlutter.instance.list.pressReleases(
  domain: '0000', // National level
  lang: DataLanguage.id,
  keyword: 'inflasi', // Search for inflation-related releases
);

// Process search results
for (final release in inflationReleases.data) {
  print('Inflation Press Release: ${release.title}');
  print('Subject: ${release.subject?.name ?? 'General'}');
  print('Release Date: ${release.releaseDate ?? 'Unknown'}');
  
  // Check for abstract content
  if (release.abstract != null && release.abstract!.isNotEmpty) {
    print('Abstract: ${release.abstract!.substring(0, 150)}...');
  }
  
  // Check available resources
  if (release.pdf.isNotEmpty) {
    print('PDF Available: ${release.pdf}');
  }
  
  if (release.slide.isNotEmpty) {
    print('Presentation Available: ${release.slide}');
  }
  
  print('Updated: ${release.updatedAt}');
  print('------------------------');
}
```

### 3. Filter Press Releases by Subject and Time

```dart
// Get economic press releases from Jakarta in 2023
final economicReleases = await StadataFlutter.instance.list.pressReleases(
  domain: '3100', // DKI Jakarta
  lang: DataLanguage.id,
  subcat: 2, // Assuming '2' is economic subject category
  year: 2023,
  month: 12, // December
);

// Analyze economic press releases
print('=== Economic Press Releases - December 2023 ===');
for (final release in economicReleases.data) {
  print('Economic Release: ${release.title}');
  print('Subject: ${release.subject?.name ?? 'Economics'}');
  print('Release Date: ${release.releaseDate}');
  print('File Size: ${release.size}');
  
  // Calculate recency
  if (release.releaseDate != null) {
    final daysSince = DateTime.now().difference(release.releaseDate!).inDays;
    print('Released $daysSince days ago');
  }
  
  // Check for comprehensive documentation
  final hasCompleteDocs = release.pdf.isNotEmpty && 
                         release.slide.isNotEmpty && 
                         release.cover.isNotEmpty;
  
  print('Complete Documentation: ${hasCompleteDocs ? 'Yes' : 'No'}');
  print('------------------------');
}
```

### 4. Advanced Press Release Analysis

```dart
// Comprehensive press release analysis with multiple filters
class PressReleaseAnalyzer {
  static Future<void> analyzePressReleaseContent(String domain) async {
    try {
      // 1. Get overview of all recent press releases
      final allReleases = await StadataFlutter.instance.list.pressReleases(
        domain: domain,
        lang: DataLanguage.id,
      );
      
      print('Total press releases in domain $domain: ${allReleases.pagination.total}');
      
      // 2. Analyze releases by recent months
      final currentYear = DateTime.now().year;
      final recentMonths = [
        DateTime.now().month - 2,
        DateTime.now().month - 1,
        DateTime.now().month,
      ].where((month) => month > 0).toList();
      
      for (final month in recentMonths) {
        final monthlyReleases = await StadataFlutter.instance.list.pressReleases(
          domain: domain,
          lang: DataLanguage.id,
          year: currentYear,
          month: month,
        );
        
        print('Month $month/$currentYear: ${monthlyReleases.data.length} releases');
      }
      
      // 3. Analyze resource availability
      final releasesWithPDF = allReleases.data
          .where((release) => release.pdf.isNotEmpty)
          .length;
      
      final releasesWithSlides = allReleases.data
          .where((release) => release.slide.isNotEmpty)
          .length;
      
      final releasesWithCovers = allReleases.data
          .where((release) => release.cover.isNotEmpty)
          .length;
      
      print('\\n=== Resource Availability Analysis ===');
      print('Releases with PDF: $releasesWithPDF');
      print('Releases with Slides: $releasesWithSlides');
      print('Releases with Cover Images: $releasesWithCovers');
      
      // 4. Subject distribution analysis
      final subjectGroups = <String, int>{};
      for (final release in allReleases.data) {
        final subject = release.subject?.name ?? 'Unspecified';
        subjectGroups[subject] = (subjectGroups[subject] ?? 0) + 1;
      }
      
      print('\\n=== Subject Distribution ===');
      final sortedSubjects = subjectGroups.entries.toList()
        ..sort((a, b) => b.value.compareTo(a.value));
      
      for (final entry in sortedSubjects.take(5)) {
        print('${entry.key}: ${entry.value} releases');
      }
      
    } catch (e) {
      print('Error analyzing press releases: $e');
    }
  }
}
```

### 5. Press Release Monitoring System

```dart
// Build a comprehensive press release monitoring system
class PressReleaseMonitor {
  static Future<void> monitorBPSPressReleases() async {
    try {
      // Monitor multiple domains for important releases
      final monitoredDomains = ['0000', '3100', '3200', '3300']; // National + major provinces
      final recentReleases = <String, List<PressRelease>>{};
      
      for (final domain in monitoredDomains) {
        final releases = await StadataFlutter.instance.list.pressReleases(
          domain: domain,
          lang: DataLanguage.id,
          year: DateTime.now().year,
          month: DateTime.now().month,
        );
        
        // Filter for very recent releases (last 7 days)
        final veryRecentReleases = releases.data.where((release) {
          if (release.releaseDate != null) {
            final daysSince = DateTime.now().difference(release.releaseDate!).inDays;
            return daysSince <= 7;
          }
          return false;
        }).toList();
        
        if (veryRecentReleases.isNotEmpty) {
          recentReleases[domain] = veryRecentReleases;
        }
        
        await Future.delayed(Duration(milliseconds: 300));
      }
      
      // Generate monitoring report
      print('=== Press Release Monitoring Report ===');
      for (final entry in recentReleases.entries) {
        print('Domain ${entry.key} - Recent Releases: ${entry.value.length}');
        
        for (final release in entry.value.take(3)) {
          print('  • ${release.title}');
          print('    Subject: ${release.subject?.name ?? 'General'}');
          print('    Released: ${release.releaseDate}');
          
          // Priority indicators
          if (release.slide.isNotEmpty && release.pdf.isNotEmpty) {
            print('    Status: Complete documentation available');
          }
          
          // Check for economic indicators
          final isEconomic = release.title.toLowerCase().contains('ekonomi') ||
                           release.title.toLowerCase().contains('inflasi') ||
                           release.title.toLowerCase().contains('pdb');
          
          if (isEconomic) {
            print('    Priority: Economic indicator - HIGH');
          }
        }
        print('---');
      }
      
    } catch (e) {
      print('Monitoring error: $e');
    }
  }
}
```

## Properties (PressRelease)

| Property      | Type        | Description                                                             |
| ------------- | ----------- | ----------------------------------------------------------------------- |
| `id`          | `int`       | Unique identifier of the press release                                 |
| `title`       | `String`    | Official title of the press release                                    |
| `subject`     | `Subject?`  | Subject classification of the press release (optional)                 |
| `size`        | `String`    | File size of the press release document                                |
| `pdf`         | `String`    | Direct download URL for the PDF version of the press release           |
| `cover`       | `String`    | URL of the cover image or thumbnail for the press release              |
| `abstract`    | `String?`   | Abstract or summary of the press release content (optional)            |
| `updatedAt`   | `DateTime`  | Date and time when the press release was last updated                  |
| `releaseDate` | `DateTime?` | Date and time when the press release was officially published (optional) |
| `slide`       | `String`    | Direct download URL for presentation slides related to the press release |

## Common Press Release Categories

### Economic Data Releases
- **Inflation Reports**: Monthly and annual inflation rate announcements
- **GDP Statistics**: Quarterly and annual economic growth data
- **Employment Data**: Labor force and unemployment statistics
- **Trade Statistics**: Import/export data and trade balance reports

### Demographic Releases
- **Population Statistics**: Census results and population projections
- **Migration Data**: Internal and international migration patterns
- **Vital Statistics**: Birth, death, and marriage statistics
- **Household Surveys**: Living conditions and demographic analysis

### Social Indicator Releases
- **Education Statistics**: School enrollment, literacy, and educational outcomes
- **Health Indicators**: Healthcare access, mortality, and health statistics
- **Poverty Analysis**: Poverty rates, income distribution, and welfare indicators
- **Housing Data**: Housing conditions and urban development statistics

### Regional Development Releases
- **Provincial Statistics**: Regional economic and social indicators
- **Urban Development**: City-level statistics and development indicators
- **Infrastructure Data**: Transportation, utilities, and infrastructure development
- **Environmental Statistics**: Natural resource and environmental quality data

## Press Release Processing Workflow

### Complete Press Release Management System

```dart
// Comprehensive system for managing and processing press releases
class PressReleaseManager {
  static Future<void> processCompleteReleaseWorkflow() async {
    try {
      // 1. Discover recent releases across key domains
      final keyDomains = ['0000', '3100', '3200']; // National, Jakarta, West Java
      final releaseCollection = <String, List<PressRelease>>{};
      
      for (final domain in keyDomains) {
        final releases = await StadataFlutter.instance.list.pressReleases(
          domain: domain,
          lang: DataLanguage.id,
          year: DateTime.now().year,
        );
        
        releaseCollection[domain] = releases.data;
        print('Domain $domain: ${releases.data.length} releases this year');
      }
      
      // 2. Identify high-priority releases
      final priorityReleases = <PressRelease>[];
      final priorityKeywords = ['inflasi', 'pdb', 'ekonomi', 'penduduk'];
      
      for (final releases in releaseCollection.values) {
        final matching = releases.where((release) {
          return priorityKeywords.any((keyword) => 
              release.title.toLowerCase().contains(keyword));
        }).toList();
        
        priorityReleases.addAll(matching);
      }
      
      // 3. Process priority releases
      print('\\n=== Priority Release Processing ===');
      for (final release in priorityReleases.take(10)) {
        print('Processing: ${release.title}');
        print('Subject: ${release.subject?.name ?? 'General'}');
        print('Resources:');
        
        // Check available resources
        if (release.pdf.isNotEmpty) {
          print('  - PDF: Available (${release.size})');
          await processPDFDocument(release.pdf, release.title);
        }
        
        if (release.slide.isNotEmpty) {
          print('  - Slides: Available');
          await processSlidePresentation(release.slide, release.title);
        }
        
        if (release.cover.isNotEmpty) {
          print('  - Cover: Available');
          await processCoverImage(release.cover, release.title);
        }
        
        if (release.abstract != null && release.abstract!.isNotEmpty) {
          print('  - Abstract: ${release.abstract!.length} characters');
        }
        
        print('---');
      }
      
    } catch (e) {
      print('Release processing error: $e');
    }
  }
  
  static Future<void> processPDFDocument(String url, String title) async {
    print('    Processing PDF: $title');
    // Implementation for PDF processing would go here
  }
  
  static Future<void> processSlidePresentation(String url, String title) async {
    print('    Processing slides: $title');
    // Implementation for slide processing would go here
  }
  
  static Future<void> processCoverImage(String url, String title) async {
    print('    Processing cover image: $title');
    // Implementation for image processing would go here
  }
}
```

## Integration with Other APIs

### Building Comprehensive Statistical Reports

```dart
// Integrate press releases with other BPS data sources
Future<void> buildStatisticalReport(String domain) async {
  try {
    // Get domain information
    final domains = await StadataFlutter.instance.list.domains();
    final currentDomain = domains.data.firstWhere((d) => d.id == domain);
    
    // Get recent press releases
    final pressReleases = await StadataFlutter.instance.list.pressReleases(
      domain: domain,
      lang: DataLanguage.id,
      year: DateTime.now().year,
    );
    
    // Get related publications
    final publications = await StadataFlutter.instance.list.publications(
      domain: domain,
      lang: DataLanguage.id,
    );
    
    // Get static tables
    final staticTables = await StadataFlutter.instance.list.staticTable(
      domain: domain,
      lang: DataLanguage.id,
    );
    
    print('=== Statistical Report for ${currentDomain.name} ===');
    print('Press Releases: ${pressReleases.data.length}');
    print('Publications: ${publications.data.length}');
    print('Static Tables: ${staticTables.data.length}');
    
    // Cross-reference analysis
    print('\\n=== Recent Press Release Highlights ===');
    final recentReleases = pressReleases.data
        .where((release) => release.releaseDate != null)
        .toList()
      ..sort((a, b) => b.releaseDate!.compareTo(a.releaseDate!));
    
    for (final release in recentReleases.take(5)) {
      print('${release.title}');
      print('  Released: ${release.releaseDate}');
      print('  Subject: ${release.subject?.name ?? 'General'}');
      
      // Check for supporting documentation
      final hasCompleteDocs = release.pdf.isNotEmpty && 
                             release.slide.isNotEmpty;
      print('  Documentation: ${hasCompleteDocs ? 'Complete' : 'Partial'}');
    }
    
  } catch (e) {
    print('Report generation error: $e');
  }
}
```

## Working with Press Release Resources

### Download and Display Management

```dart
// Manage press release resources (PDFs, slides, images)
class PressReleaseResourceManager {
  static Future<void> downloadPressReleaseResources(PressRelease release) async {
    print('Downloading resources for: ${release.title}');
    
    try {
      // Download PDF if available
      if (release.pdf.isNotEmpty) {
        await downloadFile(release.pdf, 'press_release_${release.id}.pdf');
      }
      
      // Download presentation slides if available
      if (release.slide.isNotEmpty) {
        await downloadFile(release.slide, 'press_release_slides_${release.id}.pptx');
      }
      
      // Download cover image if available
      if (release.cover.isNotEmpty) {
        await downloadFile(release.cover, 'press_release_cover_${release.id}.jpg');
      }
      
      print('All available resources downloaded successfully');
      
    } catch (e) {
      print('Download error: $e');
    }
  }
  
  static Future<void> downloadFile(String url, String fileName) async {
    print('  Downloading: $fileName from $url');
    // Implementation for actual file download would go here
    // using packages like dio, http, or flutter_downloader
  }
  
  static Widget buildPressReleaseCard(PressRelease release) {
    return Card(
      margin: EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Cover image
          if (release.cover.isNotEmpty)
            Image.network(
              release.cover,
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  height: 200,
                  color: Colors.grey[300],
                  child: Icon(Icons.description, size: 50),
                );
              },
            ),
          
          Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  release.title,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                if (release.subject?.name != null)
                  Text(
                    'Subject: ${release.subject!.name}',
                    style: TextStyle(color: Colors.blue),
                  ),
                if (release.releaseDate != null)
                  Text(
                    'Released: ${DateFormat('dd MMM yyyy').format(release.releaseDate!)}',
                    style: TextStyle(color: Colors.grey),
                  ),
                Text('Size: ${release.size}'),
                SizedBox(height: 12),
                
                // Abstract
                if (release.abstract != null && release.abstract!.isNotEmpty)
                  Text(
                    release.abstract!.length > 150 
                        ? '${release.abstract!.substring(0, 150)}...'
                        : release.abstract!,
                  ),
                
                SizedBox(height: 12),
                
                // Action buttons
                Row(
                  children: [
                    if (release.pdf.isNotEmpty)
                      ElevatedButton.icon(
                        onPressed: () => openDocument(release.pdf),
                        icon: Icon(Icons.picture_as_pdf),
                        label: Text('PDF'),
                      ),
                    SizedBox(width: 8),
                    if (release.slide.isNotEmpty)
                      ElevatedButton.icon(
                        onPressed: () => openDocument(release.slide),
                        icon: Icon(Icons.slideshow),
                        label: Text('Slides'),
                      ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
  
  static Future<void> openDocument(String url) async {
    print('Opening document: $url');
    // Implementation for opening documents
  }
}
```

## Error Handling

Press Release API methods return `Future<ListResult<PressRelease>>` and may throw specific exceptions:

- `PressReleaseException`: Press release-related errors (invalid domain, subject category errors)
- `ApiException`: Network or API-related errors
- `ApiKeyNotFoundException`: Invalid or missing API key

```dart
try {
  final result = await StadataFlutter.instance.list.pressReleases(
    domain: '3200',
    keyword: 'ekonomi',
    subcat: 2,
    year: 2023,
  );
  
  // Process successful result
  print('Found ${result.data.length} press releases');
  
} on PressReleaseException catch (e) {
  print('Press release error: ${e.message}');
  // Handle domain validation errors or subject category issues
  
} on ApiException catch (e) {
  print('API error: ${e.message}');
  // Handle network connectivity or API service errors
  
} catch (e) {
  print('Unexpected error: $e');
  // Handle any other unexpected errors
}
```

## Performance Considerations

- **Resource Management**: Handle large PDF and presentation file downloads efficiently
- **Image Optimization**: Implement proper image caching and lazy loading for cover images
- **Search Efficiency**: Use specific keywords and subject categories to reduce result sets
- **Pagination**: Implement efficient pagination for large press release archives
- **Content Caching**: Cache frequently accessed press releases and their metadata
- **Download Queuing**: Implement proper download management for multiple resources
- **Memory Usage**: Monitor memory consumption when processing multiple press releases with large attachments