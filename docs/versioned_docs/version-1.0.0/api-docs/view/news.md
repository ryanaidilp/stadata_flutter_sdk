# News

The View News API provides comprehensive access to detailed news articles from BPS (Badan Pusat Statistik) Indonesia. This method enables applications to retrieve complete news content, including full text, multimedia content, category classifications, and publication metadata for news analysis, content management, and information dissemination purposes.

News articles from BPS serve as primary communication channels for statistical insights, data releases, policy announcements, and analytical commentary. The View News API ensures access to complete news content with rich formatting, enabling applications to provide users with comprehensive statistical communication and timely information updates.

## Understanding the BPS News System

BPS news articles provide strategic communication and information dissemination:

- **Official Communication**: Primary channel for statistical announcements, data releases, and policy communications
- **Contextual Analysis**: Expert interpretation and analysis of statistical data and trends
- **Multi-format Content**: Rich text content with images, charts, and multimedia elements
- **Category Organization**: Structured classification system for efficient content discovery and navigation
- **Temporal Relevance**: Timely publication aligned with statistical release cycles and important events

## News Content Categories

### Statistical Data Releases
- **Economic Releases**: GDP announcements, inflation reports, trade statistics, and economic indicators
- **Social Statistics**: Population updates, education statistics, health indicators, and welfare reports
- **Demographic News**: Census results, population projections, and demographic trend analysis
- **Regional Statistics**: Province and local-level statistical releases and comparative analysis

### Analytical Commentary
- **Trend Analysis**: Expert interpretation of statistical patterns and developments
- **Policy Impact**: Analysis of policy effects on statistical indicators and societal outcomes
- **Comparative Studies**: Inter-regional and temporal comparisons of statistical data
- **Methodological Updates**: Explanations of new statistical methods and data collection techniques

### Institutional News
- **BPS Activities**: Agency updates, conferences, training programs, and institutional developments
- **International Cooperation**: Collaboration announcements, technical assistance, and global initiatives
- **Technology Updates**: Digital transformation, system upgrades, and innovation announcements
- **Public Engagement**: Community outreach, educational programs, and stakeholder communications

## Parameters

| Parameter | Type           | Description                                              |
| --------- | -------------- | -------------------------------------------------------- |
| `id`      | `int`          | **Required**: The unique numerical identifier of the specific news article |
| `domain`  | `String`       | **Required**: The domain (region) code specifying administrative context |
| `lang`    | `DataLanguage` | **Optional**: Language preference for localized content (default: `DataLanguage.id`) |

## Examples

### 1. Basic News Retrieval

![Preview](/gif/news.gif)

```dart
// Retrieve detailed information for a specific news article
final news = await StadataFlutter.instance.view.news(
  id: 12345, // Example: Economic news article ID
  domain: '0000', // National level
  lang: DataLanguage.id,
);

if (news != null) {
  print('=== News Article Details ===');
  print('Article ID: ${news.id}');
  print('Title: ${news.title}');
  print('Category: ${news.category ?? 'General'}');
  print('Category ID: ${news.categoryId}');
  
  // Publication information
  print('\n=== Publication Information ===');
  print('Release Date: ${news.releaseDate}');
  print('Has Image: ${news.picture.isNotEmpty ? 'Yes' : 'No'}');
  
  if (news.picture.isNotEmpty) {
    print('Image URL: ${news.picture}');
  }
  
  // Content preview
  print('\n=== Content Preview ===');
  final contentPreview = news.content.length > 300 
      ? '${news.content.substring(0, 300)}...'
      : news.content;
  print('Content: $contentPreview');
  
  // Content analysis
  print('\n=== Content Analysis ===');
  print('Content Length: ${news.content.length} characters');
  print('Word Count: ${news.content.split(' ').length} words');
  
  // Check for statistical keywords
  final contentLower = news.content.toLowerCase();
  final statisticalKeywords = <String>[];
  
  if (contentLower.contains('inflasi') || contentLower.contains('inflation')) {
    statisticalKeywords.add('Inflation');
  }
  if (contentLower.contains('pdb') || contentLower.contains('gdp')) {
    statisticalKeywords.add('GDP');
  }
  if (contentLower.contains('penduduk') || contentLower.contains('population')) {
    statisticalKeywords.add('Population');
  }
  if (contentLower.contains('ekonomi') || contentLower.contains('economic')) {
    statisticalKeywords.add('Economic');
  }
  
  if (statisticalKeywords.isNotEmpty) {
    print('Statistical Topics: ${statisticalKeywords.join(', ')}');
  }
  
} else {
  print('News article not found or not accessible');
}
```

### 2. News Content Analysis Workflow

```dart
// Comprehensive news content analysis and categorization
class NewsContentAnalyzer {
  static Future<void> analyzeNewsContent(
    String domain,
    String analysisTheme,
  ) async {
    try {
      // 1. Discover news articles using List API
      final newsList = await StadataFlutter.instance.list.news(
        domain: domain,
        keyword: analysisTheme,
        lang: DataLanguage.id,
      );
      
      print('=== News Content Analysis: "$analysisTheme" ===');
      print('Found ${newsList.data.length} news articles');
      
      if (newsList.data.isEmpty) {
        print('No news articles found for theme: $analysisTheme');
        return;
      }
      
      // 2. Analyze each article in detail
      final contentAnalysis = <Map<String, dynamic>>[];
      
      for (final newsSummary in newsList.data.take(10)) {
        print('\n--- Analyzing: ${newsSummary.title} ---');
        
        final detailedNews = await StadataFlutter.instance.view.news(
          id: newsSummary.id,
          domain: domain,
          lang: DataLanguage.id,
        );
        
        if (detailedNews != null) {
          final analysis = _analyzeNewsContent(detailedNews);
          contentAnalysis.add({
            'id': detailedNews.id,
            'title': detailedNews.title,
            'category': detailedNews.category,
            'categoryId': detailedNews.categoryId,
            'releaseDate': detailedNews.releaseDate,
            'hasImage': detailedNews.picture.isNotEmpty,
            'contentLength': detailedNews.content.length,
            'wordCount': detailedNews.content.split(' ').length,
            'analysis': analysis,
          });
          
          // Display key findings
          print('Category: ${detailedNews.category ?? 'Uncategorized'}');
          print('Release Date: ${detailedNews.releaseDate}');
          print('Content Length: ${detailedNews.content.length} characters');
          print('Has Image: ${detailedNews.picture.isNotEmpty ? 'Yes' : 'No'}');
          print('Statistical Topics: ${analysis['topics'].join(', ')}');
          print('Sentiment: ${analysis['sentiment']}');
          print('Reading Level: ${analysis['readingLevel']}');
          
        } else {
          print('Failed to retrieve detailed information');
        }
        
        // Rate limiting
        await Future.delayed(Duration(milliseconds: 500));
      }
      
      // 3. Analysis summary
      print('\n=== Content Analysis Summary ===');
      print('Total Articles Analyzed: ${contentAnalysis.length}');
      
      // Category distribution
      final categoryDistribution = <String?, int>{};
      for (final article in contentAnalysis) {
        final category = article['category'] as String?;
        categoryDistribution[category] = (categoryDistribution[category] ?? 0) + 1;
      }
      
      print('\nCategory Distribution:');
      for (final entry in categoryDistribution.entries) {
        final category = entry.key ?? 'Uncategorized';
        print('  $category: ${entry.value} articles');
      }
      
      // Content metrics
      final avgContentLength = contentAnalysis.isNotEmpty
          ? contentAnalysis.map((a) => a['contentLength'] as int).reduce((a, b) => a + b) / contentAnalysis.length
          : 0.0;
      
      final avgWordCount = contentAnalysis.isNotEmpty
          ? contentAnalysis.map((a) => a['wordCount'] as int).reduce((a, b) => a + b) / contentAnalysis.length
          : 0.0;
      
      final withImages = contentAnalysis.where((a) => a['hasImage'] as bool).length;
      
      print('\nContent Metrics:');
      print('Average Content Length: ${avgContentLength.round()} characters');
      print('Average Word Count: ${avgWordCount.round()} words');
      print('Articles with Images: $withImages/${contentAnalysis.length}');
      
      // Topic analysis
      final allTopics = <String, int>{};
      for (final article in contentAnalysis) {
        final topics = article['analysis']['topics'] as List<String>;
        for (final topic in topics) {
          allTopics[topic] = (allTopics[topic] ?? 0) + 1;
        }
      }
      
      final sortedTopics = allTopics.entries.toList()
        ..sort((a, b) => b.value.compareTo(a.value));
      
      print('\nMost Common Topics:');
      for (final entry in sortedTopics.take(5)) {
        print('  ${entry.key}: ${entry.value} articles');
      }
      
      // Temporal analysis
      final currentDate = DateTime.now();
      final recentArticles = contentAnalysis.where((a) => 
          (a['releaseDate'] as DateTime).isAfter(currentDate.subtract(Duration(days: 30)))
      ).length;
      
      print('\nTemporal Analysis:');
      print('Recent Articles (last 30 days): $recentArticles');
      
    } catch (e) {
      print('Content analysis error: $e');
    }
  }
  
  static Map<String, dynamic> _analyzeNewsContent(News news) {
    final content = news.content.toLowerCase();
    final analysis = <String, dynamic>{};
    
    // Topic detection
    final topics = <String>[];
    if (content.contains('inflasi') || content.contains('harga')) topics.add('Inflation');
    if (content.contains('pdb') || content.contains('ekonomi')) topics.add('Economy');
    if (content.contains('penduduk') || content.contains('demografi')) topics.add('Demographics');
    if (content.contains('perdagangan') || content.contains('ekspor')) topics.add('Trade');
    if (content.contains('kemiskinan') || content.contains('kesejahteraan')) topics.add('Welfare');
    if (content.contains('pendidikan') || content.contains('sekolah')) topics.add('Education');
    if (content.contains('kesehatan') || content.contains('medis')) topics.add('Health');
    if (content.contains('teknologi') || content.contains('digital')) topics.add('Technology');
    
    analysis['topics'] = topics.isNotEmpty ? topics : ['General'];
    
    // Simple sentiment analysis
    final positiveWords = ['meningkat', 'tumbuh', 'positif', 'baik', 'sukses', 'berhasil'];
    final negativeWords = ['menurun', 'turun', 'negatif', 'buruk', 'gagal', 'masalah'];
    
    final positiveCount = positiveWords.where((word) => content.contains(word)).length;
    final negativeCount = negativeWords.where((word) => content.contains(word)).length;
    
    if (positiveCount > negativeCount) {
      analysis['sentiment'] = 'Positive';
    } else if (negativeCount > positiveCount) {
      analysis['sentiment'] = 'Negative';
    } else {
      analysis['sentiment'] = 'Neutral';
    }
    
    // Reading level assessment
    final sentences = news.content.split(RegExp(r'[.!?]')).length;
    final words = news.content.split(' ').length;
    final avgWordsPerSentence = sentences > 0 ? words / sentences : 0;
    
    if (avgWordsPerSentence < 15) {
      analysis['readingLevel'] = 'Simple';
    } else if (avgWordsPerSentence < 25) {
      analysis['readingLevel'] = 'Moderate';
    } else {
      analysis['readingLevel'] = 'Complex';
    }
    
    return analysis;
  }
}
```

### 3. News Monitoring and Alert System

```dart
// Comprehensive news monitoring system for tracking statistical updates
class NewsMonitoringSystem {
  static Future<void> setupNewsMonitoring(
    List<String> domains,
    List<String> keywords,
  ) async {
    try {
      print('=== News Monitoring System ===');
      print('Monitoring ${domains.length} domains for ${keywords.length} keywords');
      
      final monitoringResults = <String, Map<String, dynamic>>{};
      
      for (final domain in domains) {
        print('\n--- Monitoring Domain: $domain ---');
        
        final domainResults = <String, List<News>>{};
        
        for (final keyword in keywords) {
          // Get news for each keyword
          final keywordNews = await StadataFlutter.instance.list.news(
            domain: domain,
            keyword: keyword,
            lang: DataLanguage.id,
          );
          
          if (keywordNews.data.isNotEmpty) {
            domainResults[keyword] = [];
            
            // Get detailed content for recent news
            for (final newsSummary in keywordNews.data.take(5)) {
              final detailedNews = await StadataFlutter.instance.view.news(
                id: newsSummary.id,
                domain: domain,
                lang: DataLanguage.id,
              );
              
              if (detailedNews != null) {
                domainResults[keyword]!.add(detailedNews);
              }
              
              await Future.delayed(Duration(milliseconds: 200));
            }
          }
          
          await Future.delayed(Duration(milliseconds: 300));
        }
        
        // Analyze monitoring results for this domain
        final domainAnalysis = _analyzeDomainNews(domainResults);
        monitoringResults[domain] = domainAnalysis;
        
        print('Found news for ${domainResults.keys.length} keywords');
        print('Total articles: ${domainAnalysis['totalArticles']}');
        print('Recent articles: ${domainAnalysis['recentArticles']}');
        
        // Alert for high-priority news
        final alerts = domainAnalysis['alerts'] as List<String>;
        if (alerts.isNotEmpty) {
          print('🚨 ALERTS:');
          for (final alert in alerts) {
            print('  $alert');
          }
        }
      }
      
      // Generate monitoring summary
      print('\n=== Monitoring Summary ===');
      
      final totalArticles = monitoringResults.values
          .map((analysis) => analysis['totalArticles'] as int)
          .reduce((a, b) => a + b);
      
      final totalAlerts = monitoringResults.values
          .map((analysis) => (analysis['alerts'] as List<String>).length)
          .reduce((a, b) => a + b);
      
      print('Total articles monitored: $totalArticles');
      print('Total alerts generated: $totalAlerts');
      
      // Keyword effectiveness
      final keywordEffectiveness = <String, int>{};
      for (final domainAnalysis in monitoringResults.values) {
        final keywordResults = domainAnalysis['keywordResults'] as Map<String, int>;
        for (final entry in keywordResults.entries) {
          keywordEffectiveness[entry.key] = (keywordEffectiveness[entry.key] ?? 0) + entry.value;
        }
      }
      
      final sortedKeywords = keywordEffectiveness.entries.toList()
        ..sort((a, b) => b.value.compareTo(a.value));
      
      print('\nKeyword Effectiveness:');
      for (final entry in sortedKeywords) {
        print('  ${entry.key}: ${entry.value} articles');
      }
      
      // Recommendations
      print('\n=== Monitoring Recommendations ===');
      
      if (totalAlerts > totalArticles * 0.3) {
        print('📈 High alert rate - consider refining alert criteria');
      }
      
      final effectiveKeywords = sortedKeywords.where((e) => e.value > 0).length;
      if (effectiveKeywords < keywords.length * 0.7) {
        print('🔍 Low keyword effectiveness - consider updating keyword list');
      }
      
      if (totalArticles < domains.length * 10) {
        print('📰 Low article volume - consider expanding monitoring scope');
      } else {
        print('✅ Good monitoring coverage across domains');
      }
      
    } catch (e) {
      print('Monitoring system error: $e');
    }
  }
  
  static Map<String, dynamic> _analyzeDomainNews(Map<String, List<News>> domainResults) {
    final analysis = <String, dynamic>{};
    
    final allArticles = <News>[];
    final keywordResults = <String, int>{};
    
    for (final entry in domainResults.entries) {
      keywordResults[entry.key] = entry.value.length;
      allArticles.addAll(entry.value);
    }
    
    analysis['totalArticles'] = allArticles.length;
    analysis['keywordResults'] = keywordResults;
    
    // Check for recent articles
    final currentDate = DateTime.now();
    final recentArticles = allArticles.where((article) => 
        article.releaseDate.isAfter(currentDate.subtract(Duration(days: 7)))
    ).toList();
    
    analysis['recentArticles'] = recentArticles.length;
    
    // Generate alerts
    final alerts = <String>[];
    
    // Alert for high-frequency keywords
    for (final entry in keywordResults.entries) {
      if (entry.value > 10) {
        alerts.add('High activity for "${entry.key}": ${entry.value} articles');
      }
    }
    
    // Alert for recent spikes
    if (recentArticles.length > allArticles.length * 0.5) {
      alerts.add('High recent activity: ${recentArticles.length} articles in last 7 days');
    }
    
    // Alert for specific topics
    for (final article in recentArticles) {
      final content = article.content.toLowerCase();
      if (content.contains('krisis') || content.contains('darurat')) {
        alerts.add('Crisis-related news: "${article.title}"');
      }
      if (content.contains('rekor') || content.contains('tertinggi')) {
        alerts.add('Record-breaking news: "${article.title}"');
      }
    }
    
    analysis['alerts'] = alerts;
    
    return analysis;
  }
}
```

### 4. News Content Integration and Export

```dart
// News content integration for research and analysis purposes
class NewsContentIntegrator {
  static Future<void> integrateNewsContent(
    List<int> newsIds,
    String domain,
  ) async {
    try {
      print('=== News Content Integration ===');
      print('Integrating ${newsIds.length} news articles...');
      
      final integratedContent = <Map<String, dynamic>>[];
      
      // 1. Retrieve all news articles
      for (final newsId in newsIds) {
        final news = await StadataFlutter.instance.view.news(
          id: newsId,
          domain: domain,
          lang: DataLanguage.id,
        );
        
        if (news != null) {
          final newsData = {
            'id': news.id,
            'title': news.title,
            'category': news.category,
            'categoryId': news.categoryId,
            'content': news.content,
            'releaseDate': news.releaseDate.toIso8601String(),
            'picture': news.picture,
            'wordCount': news.content.split(' ').length,
            'contentLength': news.content.length,
            'hasImage': news.picture.isNotEmpty,
          };
          
          // Content analysis
          final analysis = NewsContentAnalyzer._analyzeNewsContent(news);
          newsData['topics'] = analysis['topics'];
          newsData['sentiment'] = analysis['sentiment'];
          newsData['readingLevel'] = analysis['readingLevel'];
          
          integratedContent.add(newsData);
          print('  ✓ Integrated: ${news.title}');
          
        } else {
          print('  ✗ Failed to load news: $newsId');
        }
        
        await Future.delayed(Duration(milliseconds: 300));
      }
      
      // 2. Generate integration report
      print('\n=== Integration Report ===');
      print('Successfully integrated: ${integratedContent.length} articles');
      
      // Content statistics
      final totalWords = integratedContent.fold(0, (sum, article) => sum + (article['wordCount'] as int));
      final avgWords = integratedContent.isNotEmpty ? totalWords / integratedContent.length : 0;
      
      final withImages = integratedContent.where((article) => article['hasImage'] as bool).length;
      
      print('Total word count: $totalWords');
      print('Average words per article: ${avgWords.round()}');
      print('Articles with images: $withImages/${integratedContent.length}');
      
      // Topic distribution
      final topicFrequency = <String, int>{};
      for (final article in integratedContent) {
        final topics = article['topics'] as List<String>;
        for (final topic in topics) {
          topicFrequency[topic] = (topicFrequency[topic] ?? 0) + 1;
        }
      }
      
      print('\nTopic Distribution:');
      final sortedTopics = topicFrequency.entries.toList()
        ..sort((a, b) => b.value.compareTo(a.value));
      
      for (final entry in sortedTopics) {
        final percentage = (entry.value / integratedContent.length * 100).toStringAsFixed(1);
        print('  ${entry.key}: ${entry.value} articles (${percentage}%)');
      }
      
      // Sentiment analysis
      final sentimentDistribution = <String, int>{};
      for (final article in integratedContent) {
        final sentiment = article['sentiment'] as String;
        sentimentDistribution[sentiment] = (sentimentDistribution[sentiment] ?? 0) + 1;
      }
      
      print('\nSentiment Distribution:');
      for (final entry in sentimentDistribution.entries) {
        final percentage = (entry.value / integratedContent.length * 100).toStringAsFixed(1);
        print('  ${entry.key}: ${entry.value} articles (${percentage}%)');
      }
      
      // 3. Export structured data
      print('\n=== Export Summary ===');
      print('Integration completed at: ${DateTime.now().toIso8601String()}');
      print('Domain: $domain');
      print('Total articles: ${integratedContent.length}');
      print('Data ready for export to analysis tools or databases');
      
      // Quality assessment
      final qualityMetrics = {
        'averageContentLength': integratedContent.fold(0, (sum, a) => sum + (a['contentLength'] as int)) / integratedContent.length,
        'imageRatio': withImages / integratedContent.length,
        'topicDiversity': topicFrequency.keys.length.toDouble(),
        'sentimentBalance': _calculateSentimentBalance(sentimentDistribution),
      };
      
      print('\n=== Quality Metrics ===');
      print('Average Content Length: ${qualityMetrics['averageContentLength']!.round()} characters');
      print('Image Ratio: ${(qualityMetrics['imageRatio']! * 100).toStringAsFixed(1)}%');
      print('Topic Diversity: ${qualityMetrics['topicDiversity']!.round()} topics');
      print('Sentiment Balance: ${(qualityMetrics['sentimentBalance']! * 100).toStringAsFixed(1)}%');
      
    } catch (e) {
      print('Content integration error: $e');
    }
  }
  
  static double _calculateSentimentBalance(Map<String, int> sentimentDistribution) {
    final total = sentimentDistribution.values.fold(0, (a, b) => a + b);
    if (total == 0) return 0.0;
    
    final positive = sentimentDistribution['Positive'] ?? 0;
    final negative = sentimentDistribution['Negative'] ?? 0;
    final neutral = sentimentDistribution['Neutral'] ?? 0;
    
    // Balance score: higher when distribution is more even
    final expectedEach = total / 3;
    final variance = ((positive - expectedEach).abs() + 
                     (negative - expectedEach).abs() + 
                     (neutral - expectedEach).abs()) / 3;
    
    return 1.0 - (variance / expectedEach);
  }
}
```

## News Workflow Integration

Typical workflow for working with news content effectively:

1. **Discovery Phase**: Use List API to identify news articles of interest based on keywords, categories, or time periods
2. **Detailed Retrieval**: Use View API to get complete news content and metadata
3. **Content Analysis**: Analyze news content for topics, sentiment, and relevance
4. **Integration Planning**: Organize news content for research, monitoring, or publication purposes
5. **Quality Assessment**: Evaluate content completeness, relevance, and engagement potential

### Integration with Other APIs

```dart
// Building comprehensive news and statistical data workflow
Future<void> buildNewsDataWorkflow(String domain, String topic) async {
  try {
    // 1. Find related news articles
    final news = await StadataFlutter.instance.list.news(
      domain: domain,
      keyword: topic,
    );
    
    // 2. Find related publications for context
    final publications = await StadataFlutter.instance.list.publications(
      domain: domain,
      keyword: topic,
    );
    
    // 3. Find related press releases
    final pressReleases = await StadataFlutter.instance.list.pressReleases(
      domain: domain,
      keyword: topic,
    );
    
    // 4. Get detailed information for top news articles
    final detailedNews = <News>[];
    for (final newsItem in news.data.take(3)) {
      final detailed = await StadataFlutter.instance.view.news(
        id: newsItem.id,
        domain: domain,
      );
      if (detailed != null) detailedNews.add(detailed);
    }
    
    print('=== News and Statistical Data Analysis: $topic ===');
    print('News Articles: ${news.data.length}');
    print('Related Publications: ${publications.data.length}');
    print('Related Press Releases: ${pressReleases.data.length}');
    print('Detailed news analysis: ${detailedNews.length} articles');
    
    // Cross-reference analysis
    for (final newsItem in detailedNews) {
      print('\nNews: ${newsItem.title}');
      print('Category: ${newsItem.category ?? 'General'}');
      print('Release Date: ${newsItem.releaseDate}');
      print('Content Length: ${newsItem.content.length} characters');
      
      // Find related publications and press releases
      final relatedPubs = publications.data.where((p) => 
          p.title.toLowerCase().contains(topic.toLowerCase())
      ).take(2);
      
      final relatedPR = pressReleases.data.where((pr) => 
          pr.title.toLowerCase().contains(topic.toLowerCase())
      ).take(2);
      
      if (relatedPubs.isNotEmpty) {
        print('Related Publications:');
        for (final pub in relatedPubs) {
          print('  • ${pub.title}');
        }
      }
      
      if (relatedPR.isNotEmpty) {
        print('Related Press Releases:');
        for (final pr in relatedPR) {
          print('  • ${pr.title}');
        }
      }
    }
    
  } catch (e) {
    print('News data workflow error: $e');
  }
}
```

## Error Handling

The View News API returns nullable `News` objects and may throw specific exceptions:

- **NewsException**: News-specific errors (invalid ID, domain restrictions, access permissions)
- **ApiException**: General API communication errors (network issues, server errors, rate limiting)
- **ApiKeyNotFoundException**: Authentication errors (invalid or missing API key)
- **ValidationException**: Parameter validation errors (invalid news IDs, malformed domain codes)

```dart
try {
  final news = await StadataFlutter.instance.view.news(
    id: 12345,
    domain: '0000',
    lang: DataLanguage.id,
  );
  
  if (news != null) {
    // Successfully retrieved news article
    print('News: ${news.title}');
    print('Category: ${news.category ?? 'General'}');
    print('Content: ${news.content.length} characters');
    print('Has Image: ${news.picture.isNotEmpty}');
  } else {
    // News article not found or not accessible
    print('News article not found - may be unpublished or restricted');
  }
  
} on NewsException catch (e) {
  print('News error: ${e.message}');
  // Handle news-specific errors like invalid ID or access restrictions
  
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

- **Rate Limiting**: Implement appropriate delays between requests, especially for content analysis workflows
- **Caching Strategy**: Cache news content and analysis results for frequently accessed articles
- **Content Processing**: Be mindful of memory usage when processing large news content collections
- **Image Loading**: Implement progressive loading for news images and multimedia content
- **Batch Processing**: Process news articles in batches for analysis and monitoring systems
- **Text Analysis**: Consider using efficient text processing libraries for advanced content analysis

## Properties (News)

| Property      | Type       | Description                                      |
| ------------- | ---------- | ------------------------------------------------ |
| `id`          | `int`      | Unique numerical identifier for the news article |
| `categoryId`  | `String`   | Identifier for the news category classification  |
| `category`    | `String?`  | Human-readable name of the news category (optional) |
| `title`       | `String`   | Complete title of the news article               |
| `content`     | `String`   | Full content of the news article with rich text formatting |
| `releaseDate` | `DateTime` | Timestamp when the news article was published    |
| `picture`     | `String`   | URL to the associated image or multimedia content |