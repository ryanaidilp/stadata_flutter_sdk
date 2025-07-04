# Publications

The Publications API provides access to official publications from BPS (Badan Pusat Statistik) Indonesia. These publications include statistical reports, research findings, data compilations, and analytical documents produced by BPS offices across Indonesia. Publications are essential resources for researchers, policymakers, students, and anyone seeking authoritative statistical information about Indonesia.

BPS publications cover various topics including demography, economics, social statistics, agriculture, industry, and regional development. Each publication is professionally produced with standardized metadata including ISSN numbers, catalogue numbers, and abstracts to ensure easy identification and citation.

## Publication Types and Coverage

BPS publishes several categories of documents:

- **Statistical Reports**: Regular data compilations and trend analyses
- **Research Publications**: In-depth studies and analytical reports  
- **Methodological Publications**: Technical documentation and standards
- **Regional Publications**: Area-specific statistical compilations
- **Thematic Publications**: Subject-focused statistical analysis

## Parameters

| Parameter | Type           | Description                                                     |
| --------- | -------------- | --------------------------------------------------------------- |
| `domain`  | `String`       | The domain (region) code for retrieving publications **(required)** |
| `lang`    | `DataLanguage` | The language for publication data (default: `DataLanguage.id`) |
| `page`    | `int`          | The page number (default: `1`)                                 |
| `keyword` | `String?`      | A keyword for searching publications (optional)                |
| `month`   | `int?`         | The month for filtering publications (optional - `1..12`)      |
| `year`    | `int?`         | The year for filtering publications (optional)                 |

## Examples

### 1. Get All Publications from a Domain

```dart
// Fetch all publications from West Java BPS
final publicationResult = await StadataFlutter.instance.list.publications(
  domain: '3200', // West Java domain code
  lang: DataLanguage.id,
);

final publicationList = publicationResult.data;
final pagination = publicationResult.pagination;

// Print pagination info
print('Current Page: ${pagination.page}');
print('Total Pages: ${pagination.pages}');
print('Data Count in This Page: ${pagination.count}');
print('Per Page: ${pagination.perPage}');
print('Total: ${pagination.total}');
print('------------------------');

// Print the retrieved publication data
for (final publication in publicationList) {
  print('Publication ID: ${publication.id}');
  print('Title: ${publication.title}');
  print('ISSN: ${publication.issn}');
  print('Release Date: ${publication.releaseDate}');
  print('PDF File URL: ${publication.pdf}');
  print('Size: ${publication.size}');
  print('------------------------');
}
```

### 2. Search Publications by Keyword

```dart
// Search for publications containing "penduduk" in West Java
final searchResult = await StadataFlutter.instance.list.publications(
  domain: '3200',
  lang: DataLanguage.id,
  keyword: 'penduduk', // Search for population-related publications
);

// Display search results
for (final publication in searchResult.data) {
  print('Found: ${publication.title}');
  print('Abstract: ${publication.abstract ?? 'No abstract available'}');
  print('PDF: ${publication.pdf}');
  print('------------------------');
}
```

### 3. Filter Publications by Date

```dart
// Get publications from December 2023 in Central Java
final dateFilteredResult = await StadataFlutter.instance.list.publications(
  domain: '3300', // Central Java domain code
  lang: DataLanguage.id,
  month: 12, // December
  year: 2023,
);

// Display publications from specific month/year
for (final publication in dateFilteredResult.data) {
  print('Publication: ${publication.title}');
  print('Scheduled: ${publication.scheduledDate}');
  print('Released: ${publication.releaseDate}');
  print('Updated: ${publication.updateDate}');
  print('------------------------');
}
```

### 4. Paginated Publication Browsing

```dart
// Browse publications page by page
int currentPage = 1;
bool hasMorePages = true;

while (hasMorePages && currentPage <= 3) { // Limit to first 3 pages
  final pageResult = await StadataFlutter.instance.list.publications(
    domain: '0000', // National level publications
    lang: DataLanguage.id,
    page: currentPage,
  );
  
  print('=== Page $currentPage ===');
  for (final publication in pageResult.data) {
    print('${publication.title} (${publication.size})');
  }
  
  hasMorePages = currentPage < pageResult.pagination.pages;
  currentPage++;
}
```

## Properties (Publication)

| Property            | Type        | Description                                                                   |
| ------------------- | ----------- | ----------------------------------------------------------------------------- |
| `id`                | `String`    | Unique identifier for the publication                                         |
| `title`             | `String`    | The title of the publication                                                  |
| `issn`              | `String`    | The International Standard Serial Number (ISSN)                              |
| `scheduledDate`     | `DateTime?` | The scheduled date for the publication (optional)                            |
| `releaseDate`       | `DateTime?` | The release date of the publication (optional)                               |
| `updateDate`        | `DateTime?` | The date when the publication was last updated (optional)                    |
| `cover`             | `String`    | The cover image URL of the publication                                        |
| `pdf`               | `String`    | The PDF file URL of the publication                                           |
| `size`              | `String`    | The size of the publication file (e.g., "2.5 MB")                           |
| `abstract`          | `String?`   | An optional abstract or summary of the publication in HTML format (optional) |
| `catalogueNumber`   | `String?`   | An optional catalogue number associated with the publication (optional)      |
| `publicationNumber` | `String?`   | An optional publication number or code (optional)                            |

## Common Usage Patterns

### Publication Discovery Workflow

The typical workflow for finding and accessing BPS publications:

1. **Browse by Domain**: Start with a specific geographic area of interest
2. **Filter by Topic**: Use keywords to narrow down to relevant subjects
3. **Filter by Date**: Focus on recent publications or specific time periods
4. **Access Full Content**: Download PDFs and review abstracts for detailed information

### Complete Example

```dart
// Complete publication discovery workflow
class PublicationExplorer {
  static Future<void> explorePublications() async {
    try {
      // 1. Get recent publications from East Java
      final recentPubs = await StadataFlutter.instance.list.publications(
        domain: '3500', // East Java
        lang: DataLanguage.id,
        year: 2023,
      );
      
      print('Recent East Java Publications (2023): ${recentPubs.data.length}');
      
      // 2. Search for economic publications
      final economicPubs = await StadataFlutter.instance.list.publications(
        domain: '3500',
        lang: DataLanguage.id,
        keyword: 'ekonomi',
      );
      
      print('Economic Publications: ${economicPubs.data.length}');
      
      // 3. Get publication details
      if (economicPubs.data.isNotEmpty) {
        final firstPub = economicPubs.data.first;
        print('Featured Publication:');
        print('Title: ${firstPub.title}');
        print('ISSN: ${firstPub.issn}');
        print('Size: ${firstPub.size}');
        print('PDF: ${firstPub.pdf}');
        
        // Process abstract if available
        if (firstPub.abstract != null) {
          print('Abstract available: ${firstPub.abstract!.length} characters');
        }
      }
      
    } catch (e) {
      print('Error exploring publications: $e');
    }
  }
}
```

## Working with Publication Content

### Processing PDF URLs

```dart
// Download and process publication PDFs
Future<void> downloadPublication(String pdfUrl, String fileName) async {
  try {
    // Example using http package (add to dependencies)
    final response = await http.get(Uri.parse(pdfUrl));
    if (response.statusCode == 200) {
      final file = File(fileName);
      await file.writeAsBytes(response.bodyBytes);
      print('Downloaded: $fileName');
    }
  } catch (e) {
    print('Download failed: $e');
  }
}
```

### Processing HTML Abstracts

```dart
// Process HTML content in abstracts
String cleanAbstract(String? htmlAbstract) {
  if (htmlAbstract == null) return 'No abstract available';
  
  // Remove HTML tags for plain text display
  return htmlAbstract
      .replaceAll(RegExp(r'<[^>]*>'), '')
      .replaceAll('&nbsp;', ' ')
      .replaceAll('&amp;', '&')
      .trim();
}
```

## Domain-Specific Publication Examples

### National Publications (Domain: 0000)
- National statistical yearbooks
- Indonesia's key economic indicators  
- National census reports
- Cross-provincial comparative studies

### Provincial Publications (Domain: XX00)
- Provincial statistical yearbooks
- Regional economic analysis
- Provincial demographic reports
- Local development indicators

### Regency/City Publications (Domain: XXXX)
- Local area statistical profiles
- Municipal development reports
- District-level demographic data
- Local economic surveys

## Error Handling

Publication API methods return `Future<ListResult<Publication>>` and may throw specific exceptions:

- `PublicationException`: Publication-related errors (invalid domain, search errors)
- `ApiException`: Network or API-related errors
- `ApiKeyNotFoundException`: Invalid or missing API key

```dart
try {
  final result = await StadataFlutter.instance.list.publications(
    domain: '3200',
    keyword: 'statistik',
  );
  
  // Process successful result
  print('Found ${result.data.length} publications');
  
} on PublicationException catch (e) {
  print('Publication error: ${e.message}');
  // Handle domain validation errors or search issues
  
} on ApiException catch (e) {
  print('API error: ${e.message}');
  // Handle network connectivity or API service errors
  
} catch (e) {
  print('Unexpected error: $e');
  // Handle any other unexpected errors
}
```

## Performance Considerations

- **Pagination**: Use pagination for large result sets to improve performance
- **Keyword Filtering**: Use specific keywords to reduce data transfer
- **Date Filtering**: Filter by year/month to get targeted results
- **Domain Selection**: Choose specific domains rather than national level when possible
