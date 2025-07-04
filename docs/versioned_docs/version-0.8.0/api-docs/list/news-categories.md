# News Categories

The News Categories API provides access to the organizational structure used by BPS (Badan Pusat Statistik) Indonesia to classify and categorize news content. News categories serve as a systematic way to organize BPS communications, announcements, and publications into logical groupings that help users discover relevant content efficiently.

Understanding news categories is essential for effective news filtering, content discovery, and building comprehensive news monitoring systems. Each BPS office may have different category structures that reflect their specific focus areas and communication priorities.

## Understanding BPS News Categories

News categories provide organizational structure for BPS communications:

- **Thematic Organization**: Categories group news by subject matter and content type
- **Operational Classification**: Separate categories for different types of BPS activities
- **Audience Targeting**: Categories help users find content relevant to their interests
- **Content Management**: Systematic organization of news archives and content
- **Search Optimization**: Categories enable efficient filtering and discovery

## Category System Structure

BPS news categories are designed to reflect the diverse nature of statistical communications:

- **Statistical Releases**: Categories for data publications and survey results
- **Administrative Updates**: Categories for operational and organizational news
- **Public Information**: Categories for educational and outreach content
- **Regional Focus**: Categories that may be specific to geographic areas
- **Event-based Categories**: Categories for conferences, training, and special events

## Parameters

| Parameter | Type           | Description                                                         |
| --------- | -------------- | ------------------------------------------------------------------- |
| `domain`  | `String`       | Domain code (region) for retrieving news categories **(required)** |
| `lang`    | `DataLanguage` | Language for news categories data (default: `DataLanguage.id`)     |

## Examples

### 1. Get All News Categories for a Domain

```dart
// Fetch news categories from Central Java BPS
final newsCategoryResult = await StadataFlutter.instance.list.newsCategories(
  domain: '3300', // Central Java domain code
  lang: DataLanguage.id,
);

final newsCategoryList = newsCategoryResult.data;
final pagination = newsCategoryResult.pagination;

// Print pagination information
print('Current Page: ${pagination.page}');
print('Total Pages: ${pagination.pages}');
print('Data Count in This Page: ${pagination.count}');
print('Per Page: ${pagination.perPage}');
print('Total: ${pagination.total}');
print('------------------------');

// Print retrieved news category data
for (final newsCategory in newsCategoryList) {
  print('Category ID: ${newsCategory.id}');
  print('Category Name: ${newsCategory.name}');
  print('------------------------');
}
```

### 2. Compare Categories Across Domains

```dart
// Compare news categories between different regions
final domains = ['0000', '3100', '3200', '3300']; // National, Jakarta, West Java, Central Java
final categoryComparison = <String, List<NewsCategory>>{};

for (final domain in domains) {
  final categories = await StadataFlutter.instance.list.newsCategories(
    domain: domain,
    lang: DataLanguage.id,
  );
  categoryComparison[domain] = categories.data;
}

// Analyze category distribution
print('=== News Categories Comparison ===');
for (final entry in categoryComparison.entries) {
  print('Domain ${entry.key}: ${entry.value.length} categories');
  for (final category in entry.value) {
    print('  - ${category.name} (ID: ${category.id})');
  }
  print('------------------------');
}
```

### 3. Build Category-Based News Discovery

```dart
// Use categories to build a comprehensive news discovery system
class NewsCategoryExplorer {
  static Future<void> exploreNewsByCategories(String domain) async {
    try {
      // 1. Get all available categories
      final categoriesResult = await StadataFlutter.instance.list.newsCategories(
        domain: domain,
        lang: DataLanguage.id,
      );
      
      print('Available categories for domain $domain: ${categoriesResult.data.length}');
      
      // 2. For each category, get recent news
      for (final category in categoriesResult.data) {
        final categoryNews = await StadataFlutter.instance.list.news(
          domain: domain,
          lang: DataLanguage.id,
          newsCategoryId: category.id,
        );
        
        print('Category: ${category.name}');
        print('News count: ${categoryNews.data.length}');
        
        // Show most recent news in this category
        if (categoryNews.data.isNotEmpty) {
          final recentNews = categoryNews.data.first;
          print('Latest: ${recentNews.title}');
          print('Published: ${recentNews.releaseDate}');
        }
        
        print('------------------------');
        
        // Rate limiting to respect API
        await Future.delayed(Duration(milliseconds: 300));
      }
      
    } catch (e) {
      print('Error exploring categories: $e');
    }
  }
}
```

### 4. Category-Based Content Analysis

```dart
// Analyze news distribution across categories
class CategoryAnalyzer {
  static Future<void> analyzeCategoryUsage(String domain) async {
    try {
      // Get all categories
      final categories = await StadataFlutter.instance.list.newsCategories(
        domain: domain,
        lang: DataLanguage.id,
      );
      
      final categoryStats = <String, Map<String, dynamic>>{};
      
      // Analyze each category
      for (final category in categories.data) {
        final categoryNews = await StadataFlutter.instance.list.news(
          domain: domain,
          lang: DataLanguage.id,
          newsCategoryId: category.id,
        );
        
        // Calculate category statistics
        final newsCount = categoryNews.data.length;
        final hasRecentNews = categoryNews.data.any((news) {
          final daysSince = DateTime.now().difference(news.releaseDate).inDays;
          return daysSince <= 30; // News within last 30 days
        });
        
        final newsWithImages = categoryNews.data
            .where((news) => news.picture.isNotEmpty)
            .length;
        
        categoryStats[category.name] = {
          'id': category.id,
          'totalNews': newsCount,
          'hasRecentNews': hasRecentNews,
          'newsWithImages': newsWithImages,
          'activityScore': hasRecentNews ? newsCount : 0,
        };
        
        await Future.delayed(Duration(milliseconds: 200));
      }
      
      // Generate analysis report
      print('=== Category Usage Analysis ===');
      final sortedCategories = categoryStats.entries.toList()
        ..sort((a, b) => (b.value['totalNews'] as int).compareTo(a.value['totalNews'] as int));
      
      for (final entry in sortedCategories) {
        final stats = entry.value;
        print('${entry.key}:');
        print('  Total News: ${stats['totalNews']}');
        print('  Recent Activity: ${stats['hasRecentNews'] ? 'Yes' : 'No'}');
        print('  News with Images: ${stats['newsWithImages']}');
        print('  Activity Score: ${stats['activityScore']}');
        print('  Category ID: ${stats['id']}');
        print('---');
      }
      
    } catch (e) {
      print('Analysis error: $e');
    }
  }
}
```

### 5. Multi-Language Category Comparison

```dart
// Compare categories across different languages
Future<void> compareCategoriesAcrossLanguages(String domain) async {
  try {
    final languages = [DataLanguage.id, DataLanguage.en];
    final languageCategories = <DataLanguage, List<NewsCategory>>{};
    
    for (final language in languages) {
      final categories = await StadataFlutter.instance.list.newsCategories(
        domain: domain,
        lang: language,
      );
      languageCategories[language] = categories.data;
    }
    
    print('=== Category Language Comparison ===');
    print('Indonesian categories: ${languageCategories[DataLanguage.id]?.length ?? 0}');
    print('English categories: ${languageCategories[DataLanguage.en]?.length ?? 0}');
    
    // Find categories available in both languages
    final idCategories = languageCategories[DataLanguage.id] ?? [];
    final enCategories = languageCategories[DataLanguage.en] ?? [];
    
    final commonCategoryIds = idCategories
        .map((cat) => cat.id)
        .where((id) => enCategories.any((enCat) => enCat.id == id))
        .toSet();
    
    print('Categories available in both languages: ${commonCategoryIds.length}');
    
    // Show paired categories
    for (final categoryId in commonCategoryIds.take(5)) {
      final idCategory = idCategories.firstWhere((cat) => cat.id == categoryId);
      final enCategory = enCategories.firstWhere((cat) => cat.id == categoryId);
      
      print('ID $categoryId:');
      print('  Indonesian: ${idCategory.name}');
      print('  English: ${enCategory.name}');
      print('---');
    }
    
  } catch (e) {
    print('Language comparison error: $e');
  }
}
```

## Properties (NewsCategory)

| Property | Type     | Description                                  |
| -------- | -------- | -------------------------------------------- |
| `id`     | `String` | Unique identifier for the news category     |
| `name`   | `String` | Descriptive name of the news category       |

## Common News Category Types

### Statistical Content Categories
- **Survey Results**: Categories for data releases and statistical findings
- **Economic Indicators**: Categories for economic data and analysis
- **Demographic Data**: Categories for population and social statistics
- **Regional Statistics**: Categories for area-specific statistical releases

### Administrative Categories
- **Office Updates**: Categories for operational announcements
- **Policy Changes**: Categories for regulatory and procedural updates
- **Staff Announcements**: Categories for personnel and organizational news
- **System Updates**: Categories for technical and infrastructure news

### Public Engagement Categories
- **Educational Content**: Categories for statistical literacy and training
- **Community Programs**: Categories for outreach and engagement activities
- **Media Relations**: Categories for press releases and media communications
- **Event Announcements**: Categories for conferences, workshops, and seminars

### Special Purpose Categories
- **Emergency Communications**: Categories for urgent announcements
- **Seasonal Updates**: Categories for periodic or seasonal information
- **Research Publications**: Categories for academic and research content
- **International Cooperation**: Categories for global statistical initiatives

## Category Integration Workflow

The typical workflow for using news categories effectively:

1. **Category Discovery**: Retrieve all available categories for a domain
2. **Content Mapping**: Understand what types of content each category contains
3. **Filtering Strategy**: Use categories to filter news for specific interests
4. **Content Monitoring**: Set up category-based monitoring for relevant topics
5. **Cross-Reference Analysis**: Combine category data with actual news content

### Complete Category-Based News System

```dart
// Comprehensive news category management system
class NewsCategooryManager {
  static Future<void> buildCategoryBasedNewsFeed() async {
    try {
      // 1. Set up monitoring for multiple domains
      final monitoredDomains = ['0000', '3100', '3200']; // National, Jakarta, West Java
      final categoryMapping = <String, Map<String, dynamic>>{};
      
      // 2. Build category mapping for each domain
      for (final domain in monitoredDomains) {
        final categories = await StadataFlutter.instance.list.newsCategories(
          domain: domain,
          lang: DataLanguage.id,
        );
        
        categoryMapping[domain] = {
          'categories': categories.data,
          'totalCategories': categories.data.length,
        };
        
        print('Domain $domain: ${categories.data.length} categories');
      }
      
      // 3. Identify high-priority categories across domains
      final priorityKeywords = ['ekonomi', 'penduduk', 'survei', 'inflasi'];
      final priorityCategories = <String, List<NewsCategory>>{};
      
      for (final domain in monitoredDomains) {
        final domainCategories = categoryMapping[domain]!['categories'] as List<NewsCategory>;
        
        final matchingCategories = domainCategories.where((category) {
          return priorityKeywords.any((keyword) => 
              category.name.toLowerCase().contains(keyword));
        }).toList();
        
        if (matchingCategories.isNotEmpty) {
          priorityCategories[domain] = matchingCategories;
        }
      }
      
      // 4. Generate category-based news feed
      print('\\n=== Priority Category News Feed ===');
      for (final entry in priorityCategories.entries) {
        print('Domain ${entry.key}:');
        
        for (final category in entry.value) {
          // Get recent news for this priority category
          final categoryNews = await StadataFlutter.instance.list.news(
            domain: entry.key,
            lang: DataLanguage.id,
            newsCategoryId: category.id,
          );
          
          if (categoryNews.data.isNotEmpty) {
            final latestNews = categoryNews.data.first;
            print('  ${category.name}: ${latestNews.title}');
            print('    Published: ${latestNews.releaseDate}');
          }
          
          await Future.delayed(Duration(milliseconds: 200));
        }
        print('---');
      }
      
    } catch (e) {
      print('Category management error: $e');
    }
  }
}
```

## Integration with News API

### Building Category-Filtered News Applications

```dart
// Create a news application with category-based navigation
class CategoryBasedNewsApp {
  static Future<Map<String, List<News>>> buildCategorizedNewsFeed(String domain) async {
    final categorizedNews = <String, List<News>>{};
    
    try {
      // Get all categories
      final categories = await StadataFlutter.instance.list.newsCategories(
        domain: domain,
        lang: DataLanguage.id,
      );
      
      // For each category, get the latest news
      for (final category in categories.data) {
        final categoryNews = await StadataFlutter.instance.list.news(
          domain: domain,
          lang: DataLanguage.id,
          newsCategoryId: category.id,
        );
        
        categorizedNews[category.name] = categoryNews.data;
        
        // Rate limiting
        await Future.delayed(Duration(milliseconds: 300));
      }
      
      return categorizedNews;
      
    } catch (e) {
      print('Error building categorized news feed: $e');
      return {};
    }
  }
  
  static Widget buildCategoryTabs(Map<String, List<News>> categorizedNews) {
    return DefaultTabController(
      length: categorizedNews.keys.length,
      child: Scaffold(
        appBar: AppBar(
          title: Text('BPS News by Category'),
          bottom: TabBar(
            isScrollable: true,
            tabs: categorizedNews.keys.map((category) => 
              Tab(text: category)
            ).toList(),
          ),
        ),
        body: TabBarView(
          children: categorizedNews.entries.map((entry) {
            return ListView.builder(
              itemCount: entry.value.length,
              itemBuilder: (context, index) {
                final news = entry.value[index];
                return ListTile(
                  title: Text(news.title),
                  subtitle: Text(news.releaseDate.toString()),
                  leading: news.picture.isNotEmpty 
                      ? Image.network(news.picture, width: 50, height: 50, fit: BoxFit.cover)
                      : Icon(Icons.article),
                  onTap: () => openNewsDetail(news),
                );
              },
            );
          }).toList(),
        ),
      ),
    );
  }
  
  static void openNewsDetail(News news) {
    // Implementation for opening news detail
    print('Opening news: ${news.title}');
  }
}
```

## Error Handling

News Categories API methods return `Future<ListResult<NewsCategory>>` and may throw specific exceptions:

- `NewsCategoryException`: News category-related errors (invalid domain, category access errors)
- `ApiException`: Network or API-related errors
- `ApiKeyNotFoundException`: Invalid or missing API key

```dart
try {
  final result = await StadataFlutter.instance.list.newsCategories(
    domain: '3200',
    lang: DataLanguage.id,
  );
  
  // Process successful result
  print('Found ${result.data.length} news categories');
  
} on NewsCategoryException catch (e) {
  print('News category error: ${e.message}');
  // Handle domain validation errors or category access issues
  
} on ApiException catch (e) {
  print('API error: ${e.message}');
  // Handle network connectivity or API service errors
  
} catch (e) {
  print('Unexpected error: $e');
  // Handle any other unexpected errors
}
```

## Performance Considerations

- **Category Caching**: Cache category lists as they change infrequently
- **Efficient Filtering**: Use categories to reduce news query load
- **Batch Processing**: Process multiple categories efficiently with proper rate limiting
- **Memory Management**: Avoid loading excessive category-news combinations simultaneously
- **Update Frequency**: Monitor category changes and update cached data appropriately