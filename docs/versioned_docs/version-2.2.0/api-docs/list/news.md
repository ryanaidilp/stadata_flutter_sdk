# News

The News API provides access to current news and announcements from BPS (Badan Pusat Statistik) Indonesia offices across all regions. This API serves as the primary source for official BPS news releases, statistical announcements, policy updates, survey results, and other important communications from Indonesia's national statistical agency.

BPS news content covers a wide range of topics including new statistical releases, policy changes, survey announcements, regional developments, and public information campaigns. This news system enables users to stay informed about the latest statistical developments and BPS activities at national, provincial, and local levels.

## Understanding BPS News Content

BPS news serves multiple purposes within Indonesia's statistical ecosystem:

- **Statistical Releases**: Announcements of new data publications and survey results
- **Policy Updates**: Information about methodological changes and new statistical initiatives
- **Regional News**: Local statistical office announcements and regional developments
- **Public Information**: Educational content and statistical literacy initiatives
- **Event Announcements**: Information about statistical conferences, training, and workshops

## News Organization Structure

BPS news content is systematically organized:

- **Geographic Coverage**: News from national, provincial, and regency/city BPS offices
- **Category Classification**: Organized by news types and thematic areas
- **Temporal Organization**: Filterable by publication year and month
- **Content Indexing**: Searchable by keywords and topics
- **Multimedia Integration**: Support for images and visual content

## Parameters

| Parameter        | Type           | Description                                              |
| ---------------- | -------------- | -------------------------------------------------------- |
| `domain`         | `String`       | Domain code (region) for retrieving news **(required)** |
| `lang`           | `DataLanguage` | Language for news data (default: `DataLanguage.id`)     |
| `page`           | `int`          | Page number (default: `1`)                              |
| `keyword`        | `String?`      | Keyword for searching news (optional)                   |
| `newsCategoryId` | `String?`      | Category ID for filtering news (optional)               |
| `month`          | `int?`         | Month for filtering news (optional - `1..12`)           |
| `year`           | `int?`         | Year for filtering news (optional)                      |

## Examples

### 1. Get All News from a Domain

```dart
// Fetch recent news from Central Java BPS
final newsResult = await StadataFlutter.instance.list.news(
  domain: '3300', // Central Java domain code
  lang: DataLanguage.id,
);

final newsList = newsResult.data;
final pagination = newsResult.pagination;

// Print pagination information
print('Current Page: ${pagination.page}');
print('Total Pages: ${pagination.pages}');
print('Data Count in This Page: ${pagination.count}');
print('Per Page: ${pagination.perPage}');
print('Total: ${pagination.total}');
print('------------------------');

// Print retrieved news data
for (final news in newsList) {
  print('News ID: ${news.id}');
  print('Title: ${news.title}');
  print('Category: ${news.category ?? 'General'}');
  print('Release Date: ${news.releaseDate}');
  print('Picture: ${news.picture}');
  print('Content Preview: ${news.content.substring(0, 100)}...');
  print('------------------------');
}
```

### 2. Search News by Keyword

```dart
// Search for statistics-related news
final statisticsNews = await StadataFlutter.instance.list.news(
  domain: '0000', // National level
  lang: DataLanguage.id,
  keyword: 'inflasi', // Search for inflation-related news
);

// Process search results
for (final news in statisticsNews.data) {
  print('Inflation News: ${news.title}');
  print('Category: ${news.category ?? 'Uncategorized'}');
  print('Published: ${news.releaseDate}');
  print('Category ID: ${news.categoryId}');
  
  // Check for image content
  if (news.picture.isNotEmpty) {
    print('Featured Image: ${news.picture}');
  }
  
  // Extract key information from content
  final contentWords = news.content.split(' ').take(20).join(' ');
  print('Summary: $contentWords...');
  print('------------------------');
}
```

### 3. Filter News by Category and Time

```dart
// Get economic news from Jakarta in 2023
final economicNews = await StadataFlutter.instance.list.news(
  domain: '3100', // DKI Jakarta
  lang: DataLanguage.id,
  newsCategoryId: '1', // Assuming '1' is economic category
  year: 2023,
  month: 12, // December
);

// Analyze economic news
print('=== Economic News - December 2023 ===');
for (final news in economicNews.data) {
  print('Economic Update: ${news.title}');
  print('Publication Date: ${news.releaseDate}');
  print('Category: ${news.category}');
  
  // Calculate days since publication
  final daysSince = DateTime.now().difference(news.releaseDate).inDays;
  print('Published $daysSince days ago');
  
  // Check content length for detailed articles
  if (news.content.length > 500) {
    print('Detailed article (${news.content.length} characters)');
  } else {
    print('Brief announcement');
  }
  
  print('------------------------');
}
```

### 4. Browse News with Pagination

```dart
// Systematically browse through all available news
class NewsBrowser {
  static Future<void> browseAllNews(String domain) async {
    int currentPage = 1;
    bool hasMorePages = true;
    final allNews = <News>[];
    
    while (hasMorePages && currentPage <= 5) { // Limit to first 5 pages
      final pageResult = await StadataFlutter.instance.list.news(
        domain: domain,
        lang: DataLanguage.id,
        page: currentPage,
      );
      
      allNews.addAll(pageResult.data);
      print('Page $currentPage: ${pageResult.data.length} news items');
      
      hasMorePages = currentPage < pageResult.pagination.pages;
      currentPage++;
      
      // Rate limiting
      await Future.delayed(Duration(milliseconds: 500));
    }
    
    print('Total news collected: ${allNews.length}');
    
    // Analyze news distribution by category
    final categoryGroups = <String, int>{};
    for (final news in allNews) {
      final category = news.category ?? 'Uncategorized';
      categoryGroups[category] = (categoryGroups[category] ?? 0) + 1;
    }
    
    print('\\n=== News by Category ===');
    categoryGroups.forEach((category, count) {
      print('$category: $count articles');
    });
  }
}
```

### 5. Advanced News Analysis

```dart
// Comprehensive news analysis with multiple filters
class NewsAnalyzer {
  static Future<void> analyzeNewsContent(String domain) async {
    try {
      // 1. Get overview of all recent news
      final allNews = await StadataFlutter.instance.list.news(
        domain: domain,
        lang: DataLanguage.id,
      );
      
      print('Total news in domain $domain: ${allNews.pagination.total}');
      
      // 2. Analyze news by recent months
      final currentYear = DateTime.now().year;
      final recentMonths = [
        DateTime.now().month - 2,
        DateTime.now().month - 1,
        DateTime.now().month,
      ].where((month) => month > 0).toList();
      
      for (final month in recentMonths) {
        final monthlyNews = await StadataFlutter.instance.list.news(
          domain: domain,
          lang: DataLanguage.id,
          year: currentYear,
          month: month,
        );
        
        print('Month $month/$currentYear: ${monthlyNews.data.length} articles');
      }
      
      // 3. Find news with images
      final newsWithImages = allNews.data
          .where((news) => news.picture.isNotEmpty)
          .toList();
      
      print('News with images: ${newsWithImages.length}');
      
      // 4. Analyze content length distribution
      final shortNews = allNews.data.where((n) => n.content.length < 300).length;
      final mediumNews = allNews.data.where((n) => n.content.length >= 300 && n.content.length < 1000).length;
      final longNews = allNews.data.where((n) => n.content.length >= 1000).length;
      
      print('\\n=== Content Length Analysis ===');
      print('Short articles: $shortNews');
      print('Medium articles: $mediumNews');
      print('Long articles: $longNews');
      
    } catch (e) {
      print('Error analyzing news: $e');
    }
  }
}
```

## Properties (News)

| Property      | Type       | Description                                              |
| ------------- | ---------- | -------------------------------------------------------- |
| `id`          | `int`      | Unique identifier for the news article                  |
| `categoryId`  | `String`   | Category identifier for the news (for filtering)        |
| `category`    | `String?`  | Name of the news category (optional)                    |
| `title`       | `String`   | Official title of the news article                      |
| `content`     | `String`   | Full content text of the news article                   |
| `releaseDate` | `DateTime` | Date and time when the news was published               |
| `picture`     | `String`   | URL of the featured image or picture for the news       |

## Common News Categories

### Statistical Release News
- **Survey Results**: New data releases from national surveys
- **Economic Indicators**: Inflation, GDP, employment statistics announcements
- **Demographic Updates**: Population census results, demographic analysis
- **Regional Statistics**: Provincial and local statistical releases

### Policy and Methodological News
- **Survey Methodology**: Updates to statistical collection methods
- **Classification Changes**: Updates to statistical classifications
- **Data Quality**: Information about data revisions and improvements
- **International Standards**: Adoption of new international statistical standards

### Educational and Outreach News
- **Statistical Literacy**: Public education about statistics
- **Training Programs**: Statistical capacity building initiatives
- **Community Engagement**: Public consultation and feedback programs
- **Media Relations**: Press conferences and media briefings

### Administrative News
- **Office Updates**: BPS office operational announcements
- **Staff Changes**: Leadership appointments and organizational updates
- **Infrastructure**: Technology upgrades and facility improvements
- **Partnerships**: Collaboration announcements with other agencies

## News Discovery Workflow

The typical workflow for discovering and consuming BPS news:

1. **Domain Selection**: Choose the geographic area of interest
2. **Category Filtering**: Focus on specific news categories
3. **Temporal Filtering**: Filter by publication timeframe
4. **Keyword Search**: Use search terms to find relevant content
5. **Content Analysis**: Review full articles and multimedia content

### Complete News Monitoring Example

```dart
// Comprehensive news monitoring and alert system
class NewsMonitor {
  static Future<void> monitorBPSNews() async {
    try {
      // Monitor national news for important announcements
      final nationalNews = await StadataFlutter.instance.list.news(
        domain: '0000', // National
        lang: DataLanguage.id,
        keyword: 'survei',
      );
      
      print('National Survey News: ${nationalNews.data.length}');
      
      // Check for recent provincial news
      final provinces = ['3100', '3200', '3300']; // Jakarta, West Java, Central Java
      
      for (final province in provinces) {
        final provinceNews = await StadataFlutter.instance.list.news(
          domain: province,
          lang: DataLanguage.id,
          year: DateTime.now().year,
          month: DateTime.now().month,
        );
        
        print('Province $province current month: ${provinceNews.data.length} articles');
        
        // Identify urgent news (published within last 7 days)
        final recentNews = provinceNews.data.where((news) {
          final daysSince = DateTime.now().difference(news.releaseDate).inDays;
          return daysSince <= 7;
        }).toList();
        
        if (recentNews.isNotEmpty) {
          print('Recent news from province $province:');
          for (final news in recentNews.take(3)) {
            print('- ${news.title}');
            print('  Published: ${news.releaseDate}');
            if (news.picture.isNotEmpty) {
              print('  Has image: Yes');
            }
          }
        }
      }
      
    } catch (e) {
      print('News monitoring error: $e');
    }
  }
}
```

## Integration with Other APIs

### Building News-Based Reports

```dart
// Integrate news with other BPS data for comprehensive reporting
Future<void> buildNewsReport(String domain) async {
  try {
    // Get domain information
    final domains = await StadataFlutter.instance.list.domains();
    final currentDomain = domains.data.firstWhere((d) => d.id == domain);
    
    // Get recent news
    final news = await StadataFlutter.instance.list.news(
      domain: domain,
      lang: DataLanguage.id,
      year: DateTime.now().year,
    );
    
    // Get news categories for context
    final newsCategories = await StadataFlutter.instance.list.newsCategories(
      domain: domain,
      lang: DataLanguage.id,
    );
    
    // Get related publications
    final publications = await StadataFlutter.instance.list.publications(
      domain: domain,
      lang: DataLanguage.id,
    );
    
    print('=== News Report for ${currentDomain.name} ===');
    print('News Articles: ${news.data.length}');
    print('News Categories: ${newsCategories.data.length}');
    print('Related Publications: ${publications.data.length}');
    
    // Cross-reference analysis
    print('\\n=== Recent News Highlights ===');
    final recentNews = news.data.take(5).toList();
    for (final article in recentNews) {
      print('${article.title} (${article.releaseDate})');
      
      // Find related category information
      final relatedCategory = newsCategories.data
          .where((cat) => cat.id == article.categoryId)
          .firstOrNull;
      
      if (relatedCategory != null) {
        print('  Category: ${relatedCategory.name}');
      }
    }
    
  } catch (e) {
    print('Report generation error: $e');
  }
}
```

## Working with News Content

### Content Processing and Display

```dart
// Process and format news content for display
class NewsFormatter {
  static String formatNewsContent(News news) {
    // Format title
    final formattedTitle = news.title.toUpperCase();
    
    // Format date
    final dateFormatter = DateFormat('dd MMMM yyyy');
    final formattedDate = dateFormatter.format(news.releaseDate);
    
    // Process content
    String processedContent = news.content
        .replaceAll(RegExp(r'\s+'), ' ') // Normalize whitespace
        .trim();
    
    // Truncate if too long
    if (processedContent.length > 500) {
      processedContent = '${processedContent.substring(0, 500)}...';
    }
    
    return '''
$formattedTitle

Published: $formattedDate
Category: ${news.category ?? 'General'}

$processedContent
    ''';
  }
  
  static Widget buildNewsCard(News news) {
    return Card(
      margin: EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Featured image
          if (news.picture.isNotEmpty)
            Image.network(
              news.picture,
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  height: 200,
                  color: Colors.grey[300],
                  child: Icon(Icons.image_not_supported),
                );
              },
            ),
          
          Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  news.title,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Category: ${news.category ?? 'General'}',
                  style: TextStyle(color: Colors.blue),
                ),
                Text(
                  DateFormat('dd MMM yyyy').format(news.releaseDate),
                  style: TextStyle(color: Colors.grey),
                ),
                SizedBox(height: 12),
                Text(
                  news.content.length > 150 
                      ? '${news.content.substring(0, 150)}...'
                      : news.content,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
```

## Error Handling

News API methods return `Future<ListResult<News>>` and may throw specific exceptions:

- `NewsException`: News-related errors (invalid domain, category errors)
- `ApiException`: Network or API-related errors
- `ApiKeyNotFoundException`: Invalid or missing API key

```dart
try {
  final result = await StadataFlutter.instance.list.news(
    domain: '3200',
    keyword: 'ekonomi',
    newsCategoryId: '1',
  );
  
  // Process successful result
  print('Found ${result.data.length} news articles');
  
} on NewsException catch (e) {
  print('News error: ${e.message}');
  // Handle domain validation errors or category issues
  
} on ApiException catch (e) {
  print('API error: ${e.message}');
  // Handle network connectivity or API service errors
  
} catch (e) {
  print('Unexpected error: $e');
  // Handle any other unexpected errors
}
```

## Performance Considerations

- **Content Loading**: Large news content may require progressive loading
- **Image Optimization**: Implement proper image caching and lazy loading
- **Search Efficiency**: Use specific keywords to reduce result sets
- **Pagination**: Implement efficient pagination for large news archives
- **Content Caching**: Cache frequently accessed news content locally
- **Date Filtering**: Use date filters to improve query performance