# Infographics

The Infographics API provides access to visual statistical content from BPS (Badan Pusat Statistik) Indonesia. Infographics are data visualizations that present statistical information in an accessible, visually appealing format designed to communicate insights quickly and effectively to diverse audiences.

BPS infographics cover a wide range of topics including demographics, economics, social statistics, regional development, and sector-specific data. These visual resources are essential for researchers, educators, journalists, policymakers, and the general public who need to understand and communicate statistical information clearly.

## Infographic Content Types

BPS provides various types of infographic content:

- **Statistical Summaries**: Key indicators and trends in visual format
- **Regional Profiles**: Geographic-specific data visualizations
- **Thematic Infographics**: Subject-focused statistical presentations
- **Comparative Analysis**: Visual comparisons across regions or time periods
- **Trend Visualizations**: Time-series data in graphical format

## Parameters

| Parameter | Type           | Description                                                     |
| --------- | -------------- | --------------------------------------------------------------- |
| `domain`  | `String`       | The domain (region) code for retrieving infographics **(required)** |
| `lang`    | `DataLanguage` | The language for infographic data (default: `DataLanguage.id`) |
| `page`    | `int`          | The page number (default: `1`)                                 |
| `keyword` | `String?`      | A keyword for searching infographics (optional)                |

## Examples

### 1. Get All Infographics from a Domain

```dart
// Fetch all infographics from Central Java BPS
final infographicResult = await StadataFlutter.instance.list.infographics(
  domain: '3300', // Central Java domain code
  lang: DataLanguage.id,
);

final infographicList = infographicResult.data;
final pagination = infographicResult.pagination;

// Print pagination info
print('Current Page: ${pagination.page}');
print('Total Pages: ${pagination.pages}');
print('Data Count in This Page: ${pagination.count}');
print('Per Page: ${pagination.perPage}');
print('Total: ${pagination.total}');
print('------------------------');

// Print the retrieved infographic data
for (final infographic in infographicList) {
  print('Infographic ID: ${infographic.id}');
  print('Title: ${infographic.title}');
  print('Category: ${infographic.category}');
  print('Image URL: ${infographic.image}');
  print('Download URL: ${infographic.downloadUrl}');
  print('------------------------');
}
```

### 2. Search Infographics by Keyword

```dart
// Search for infographics related to population
final searchResult = await StadataFlutter.instance.list.infographics(
  domain: '0000', // National level
  lang: DataLanguage.id,
  keyword: 'penduduk', // Search for population-related infographics
);

// Display search results
for (final infographic in searchResult.data) {
  print('Found: ${infographic.title}');
  print('Category: ${infographic.category}');
  if (infographic.description != null) {
    print('Description: ${infographic.description}');
  }
  print('View: ${infographic.image}');
  print('Download: ${infographic.downloadUrl}');
  print('------------------------');
}
```

### 3. Browse Infographics with Pagination

```dart
// Browse infographics page by page
int currentPage = 1;
bool hasMorePages = true;

while (hasMorePages && currentPage <= 3) { // Limit to first 3 pages
  final pageResult = await StadataFlutter.instance.list.infographics(
    domain: '3200', // West Java
    lang: DataLanguage.id,
    page: currentPage,
  );
  
  print('=== Page $currentPage ===');
  for (final infographic in pageResult.data) {
    print('${infographic.title} (${infographic.category})');
  }
  
  hasMorePages = currentPage < pageResult.pagination.pages;
  currentPage++;
}
```

### 4. Filter by Domain and Language

```dart
// Get infographics in English from Bali
final baliInfographics = await StadataFlutter.instance.list.infographics(
  domain: '5100', // Bali domain code
  lang: DataLanguage.en, // English language
);

// Process English content
for (final infographic in baliInfographics.data) {
  print('English Title: ${infographic.title}');
  print('Category: ${infographic.category}');
  
  // Download infographic for offline use
  print('Download from: ${infographic.downloadUrl}');
  print('Preview image: ${infographic.image}');
  print('------------------------');
}
```

## Properties (Infographic)

| Property      | Type      | Description                                                  |
| ------------- | --------- | ------------------------------------------------------------ |
| `id`          | `String`  | Unique identifier for the infographic                       |
| `title`       | `String`  | The title or name of the infographic                        |
| `image`       | `String`  | URL of the preview image for the infographic                |
| `description` | `String?` | Brief description of the infographic's content (optional)   |
| `category`    | `String`  | Category or topic classification of the infographic         |
| `downloadUrl` | `String`  | Direct download URL for the full-resolution infographic     |

## Common Usage Patterns

### Infographic Discovery Workflow

The typical workflow for finding and using BPS infographics:

1. **Browse by Domain**: Start with a specific geographic area of interest
2. **Filter by Topic**: Use keywords to find relevant subject matter
3. **Preview Content**: View image URLs to preview infographic content
4. **Download Resources**: Use download URLs to save high-resolution versions

### Complete Example

```dart
// Complete infographic discovery and download workflow
class InfographicExplorer {
  static Future<void> exploreInfographics() async {
    try {
      // 1. Get recent infographics from Jakarta
      final jakartaInfographics = await StadataFlutter.instance.list.infographics(
        domain: '3100', // DKI Jakarta
        lang: DataLanguage.id,
      );
      
      print('Jakarta Infographics: ${jakartaInfographics.data.length}');
      
      // 2. Search for economic infographics
      final economicInfographics = await StadataFlutter.instance.list.infographics(
        domain: '3100',
        lang: DataLanguage.id,
        keyword: 'ekonomi',
      );
      
      print('Economic Infographics: ${economicInfographics.data.length}');
      
      // 3. Process featured infographic
      if (economicInfographics.data.isNotEmpty) {
        final featured = economicInfographics.data.first;
        print('Featured Infographic:');
        print('Title: ${featured.title}');
        print('Category: ${featured.category}');
        print('Preview: ${featured.image}');
        print('Download: ${featured.downloadUrl}');
        
        // Description handling
        if (featured.description != null) {
          print('Description: ${featured.description!}');
        }
      }
      
    } catch (e) {
      print('Error exploring infographics: $e');
    }
  }
}
```

## Working with Infographic Resources

### Downloading Infographics

```dart
// Download infographic files for offline use
Future<void> downloadInfographic(String downloadUrl, String fileName) async {
  try {
    // Example using http package (add to dependencies)
    final response = await http.get(Uri.parse(downloadUrl));
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

### Displaying Preview Images

```dart
// Load and display infographic preview images
Widget buildInfographicPreview(Infographic infographic) {
  return Column(
    children: [
      Image.network(
        infographic.image,
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;
          return CircularProgressIndicator();
        },
        errorBuilder: (context, error, stackTrace) {
          return Icon(Icons.broken_image);
        },
      ),
      Text(infographic.title),
      Text(infographic.category),
      if (infographic.description != null)
        Text(infographic.description!),
    ],
  );
}
```

## Domain-Specific Infographic Examples

### National Infographics (Domain: 0000)
- Indonesia's key economic indicators
- National demographic overview
- Cross-provincial comparative analysis
- National development progress

### Provincial Infographics (Domain: XX00)
- Provincial economic performance
- Regional demographic profiles
- Provincial development indicators
- Local infrastructure statistics

### Regency/City Infographics (Domain: XXXX)
- Local area statistical summaries
- Municipal development progress
- District-level demographic data
- Local economic indicators

## Error Handling

Infographic API methods return `Future<ListResult<Infographic>>` and may throw specific exceptions:

- `InfographicException`: Infographic-related errors (invalid domain, search errors)
- `ApiException`: Network or API-related errors
- `ApiKeyNotFoundException`: Invalid or missing API key

```dart
try {
  final result = await StadataFlutter.instance.list.infographics(
    domain: '3200',
    keyword: 'statistik',
  );
  
  // Process successful result
  print('Found ${result.data.length} infographics');
  
} on InfographicException catch (e) {
  print('Infographic error: ${e.message}');
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

- **Image Loading**: Preview images should be loaded asynchronously with proper error handling
- **Download Management**: Implement proper download management for large infographic files
- **Caching**: Consider caching frequently accessed infographics locally
- **Pagination**: Use pagination for large result sets to improve performance
