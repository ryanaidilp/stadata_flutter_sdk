# Strategic Indicators

The Strategic Indicators API provides access to key economic and development indicators from BPS (Badan Pusat Statistik) Indonesia. Strategic indicators are critical metrics that reflect the economic performance, social development, and overall progress of regions across Indonesia. These indicators are essential for policy makers, researchers, investors, and analysts who need to monitor and evaluate regional development trends.

Strategic indicators encompass a wide range of metrics including economic growth rates, inflation indicators, employment statistics, poverty levels, infrastructure development metrics, and other key performance indicators that guide strategic decision-making at national, provincial, and local levels.

## Indicator Categories

BPS strategic indicators cover multiple domains of development:

- **Economic Indicators**: GDP growth, inflation rates, trade balances, investment levels
- **Social Indicators**: Population growth, education levels, health metrics, poverty rates
- **Infrastructure Indicators**: Transportation, telecommunications, utilities coverage
- **Environmental Indicators**: Natural resource utilization, environmental quality metrics
- **Governance Indicators**: Public service quality, administrative efficiency measures

## Parameters

| Parameter    | Type           | Description                                                          |
| ------------ | -------------- | -------------------------------------------------------------------- |
| `domain`     | `String`       | Domain code (region) to retrieve strategic indicators **(required)** |
| `lang`       | `DataLanguage` | Language for strategic indicators data (default: `DataLanguage.id`) |
| `page`       | `int`          | Page number (default: `1`)                                          |
| `variableID` | `int?`         | Variable ID of the strategic indicator (optional)                   |

## Examples

### 1. Get All Strategic Indicators for a Domain

```dart
// Fetch strategic indicators for East Java
final result = await StadataFlutter.instance.list.strategicIndicators(
  domain: '3500', // East Java domain code
  lang: DataLanguage.id,
);

final strategicIndicators = result.data;
final pagination = result.pagination;

// Print pagination information
print('Current Page: ${pagination.page}');
print('Total Pages: ${pagination.pages}');
print('Data Count in This Page: ${pagination.count}');
print('Per Page: ${pagination.perPage}');
print('Total: ${pagination.total}');
print('------------------------');

// Print retrieved strategic indicator data
for (final indicator in strategicIndicators) {
  print('Indicator ID: ${indicator.id}');
  print('Title: ${indicator.title}');
  print('Name: ${indicator.name}');
  print('Value: ${indicator.value} ${indicator.unit}');
  print('Period: ${indicator.period}');
  print('Data Source: ${indicator.dataSource}');
  print('------------------------');
}
```

### 2. Filter by Specific Variable

```dart
// Get specific economic indicator (e.g., GDP growth rate)
final gdpIndicators = await StadataFlutter.instance.list.strategicIndicators(
  domain: '0000', // National level
  lang: DataLanguage.id,
  variableID: 1001, // Example: GDP-related variable ID
);

// Analyze economic indicators
for (final indicator in gdpIndicators.data) {
  print('Economic Indicator: ${indicator.title}');
  print('Current Value: ${indicator.value} ${indicator.unit}');
  print('Reporting Period: ${indicator.period}');
  print('Variable ID: ${indicator.variableID}');
  print('Category: ${indicator.categoryID}');
  print('------------------------');
}
```

### 3. Compare Indicators Across Regions

```dart
// Compare strategic indicators between provinces
final regions = ['3200', '3300', '3500']; // West Java, Central Java, East Java
final indicators = <String, List<StrategicIndicator>>{};

for (final region in regions) {
  final result = await StadataFlutter.instance.list.strategicIndicators(
    domain: region,
    lang: DataLanguage.id,
  );
  indicators[region] = result.data;
}

// Analyze regional comparisons
print('=== Regional Strategic Indicators Comparison ===');
for (final entry in indicators.entries) {
  print('Domain ${entry.key}: ${entry.value.length} indicators');
  if (entry.value.isNotEmpty) {
    final avgValue = entry.value
        .map((i) => i.value)
        .reduce((a, b) => a + b) / entry.value.length;
    print('Average indicator value: $avgValue');
  }
  print('------------------------');
}
```

### 4. Monitor Indicator Trends with Pagination

```dart
// Browse indicators systematically with pagination
class IndicatorMonitor {
  static Future<void> monitorIndicators(String domain) async {
    int currentPage = 1;
    bool hasMorePages = true;
    final allIndicators = <StrategicIndicator>[];

    while (hasMorePages) {
      final result = await StadataFlutter.instance.list.strategicIndicators(
        domain: domain,
        lang: DataLanguage.id,
        page: currentPage,
      );
      
      allIndicators.addAll(result.data);
      print('Page $currentPage: ${result.data.length} indicators');
      
      hasMorePages = currentPage < result.pagination.pages;
      currentPage++;
    }
    
    print('Total indicators collected: ${allIndicators.length}');
    
    // Analyze collected indicators
    final categories = <int, int>{};
    for (final indicator in allIndicators) {
      categories[indicator.categoryID] = 
          (categories[indicator.categoryID] ?? 0) + 1;
    }
    
    print('Indicators by category:');
    categories.forEach((categoryId, count) {
      print('Category $categoryId: $count indicators');
    });
  }
}
```

## Properties (StrategicIndicator)

| Property       | Type     | Description                                                    |
| -------------- | -------- | -------------------------------------------------------------- |
| `id`           | `int`    | Unique identifier for the strategic indicator                 |
| `title`        | `String` | Official title of the strategic indicator                     |
| `name`         | `String` | Descriptive name or description of the indicator              |
| `variableID`   | `int`    | Variable ID linking to the underlying statistical variable    |
| `csaSubjectID` | `int?`   | CSA (Classification of Statistical Activities) subject ID     |
| `categoryID`   | `int`    | Category ID for grouping related indicators                   |
| `hashID`       | `String` | Hash identifier for data integrity and versioning            |
| `value`        | `double` | Current numerical value of the strategic indicator           |
| `unit`         | `String` | Unit of measurement for the indicator value                   |
| `dataSource`   | `String` | Source of the data (survey, administrative records, etc.)    |
| `period`       | `String` | Time period to which the indicator value applies             |

## Common Strategic Indicator Categories

### Economic Performance Indicators
- **GDP Growth Rate**: Regional economic growth measurements
- **Inflation Rate**: Price level changes over time
- **Investment Levels**: Foreign and domestic investment flows
- **Trade Balance**: Import/export ratios and trends

### Social Development Indicators  
- **Poverty Rate**: Percentage of population below poverty line
- **Education Index**: Educational attainment and quality metrics
- **Health Index**: Healthcare access and outcome indicators
- **Employment Rate**: Labor force participation and unemployment

### Infrastructure Development Indicators
- **Road Density**: Transportation infrastructure coverage
- **Electrification Rate**: Power grid coverage and access
- **Internet Penetration**: Digital connectivity levels
- **Water Access**: Clean water availability metrics

## Usage Workflow

The typical workflow for strategic indicator analysis:

1. **Domain Selection**: Choose the geographic area of interest
2. **Indicator Discovery**: Browse available indicators for the domain
3. **Variable Filtering**: Focus on specific indicator types using variable IDs
4. **Trend Analysis**: Compare indicators across time periods
5. **Regional Comparison**: Analyze indicators across different domains

### Complete Example

```dart
// Comprehensive strategic indicator analysis
class StrategicIndicatorAnalyzer {
  static Future<void> analyzeRegionalPerformance() async {
    try {
      // 1. Get national-level indicators for context
      final nationalIndicators = await StadataFlutter.instance.list.strategicIndicators(
        domain: '0000', // National
        lang: DataLanguage.id,
      );
      
      print('National Strategic Indicators: ${nationalIndicators.data.length}');
      
      // 2. Analyze specific regional indicators
      final westJavaIndicators = await StadataFlutter.instance.list.strategicIndicators(
        domain: '3200', // West Java
        lang: DataLanguage.id,
      );
      
      print('West Java Indicators: ${westJavaIndicators.data.length}');
      
      // 3. Focus on economic indicators
      final economicIndicators = westJavaIndicators.data
          .where((indicator) => indicator.title.toLowerCase().contains('ekonomi'))
          .toList();
      
      print('Economic Indicators Found: ${economicIndicators.length}');
      
      // 4. Generate summary report
      if (economicIndicators.isNotEmpty) {
        print('\n=== Economic Performance Summary ===');
        for (final indicator in economicIndicators.take(5)) {
          print('${indicator.title}: ${indicator.value} ${indicator.unit}');
          print('Period: ${indicator.period}');
          print('Source: ${indicator.dataSource}');
          print('---');
        }
      }
      
    } catch (e) {
      print('Error analyzing strategic indicators: $e');
    }
  }
}
```

## Data Integration Patterns

### Combining with Other APIs

```dart
// Integrate strategic indicators with other BPS data
Future<void> comprehensiveRegionalAnalysis(String domain) async {
  try {
    // Get strategic indicators
    final indicators = await StadataFlutter.instance.list.strategicIndicators(
      domain: domain,
      lang: DataLanguage.id,
    );
    
    // Get related publications for context
    final publications = await StadataFlutter.instance.list.publications(
      domain: domain,
      lang: DataLanguage.id,
      keyword: 'indikator',
    );
    
    // Get domain information
    final domains = await StadataFlutter.instance.list.domains();
    final currentDomain = domains.data.firstWhere((d) => d.id == domain);
    
    print('=== Regional Analysis for ${currentDomain.name} ===');
    print('Strategic Indicators: ${indicators.data.length}');
    print('Related Publications: ${publications.data.length}');
    
    // Cross-reference analysis
    final economicIndicators = indicators.data
        .where((i) => i.categoryID == 1) // Assuming category 1 is economic
        .toList();
    
    print('Economic Indicators: ${economicIndicators.length}');
    
  } catch (e) {
    print('Analysis error: $e');
  }
}
```

## Error Handling

Strategic Indicator API methods return `Future<ListResult<StrategicIndicator>>` and may throw specific exceptions:

- `StrategicIndicatorException`: Strategic indicator-related errors (invalid domain, variable ID errors)
- `ApiException`: Network or API-related errors
- `ApiKeyNotFoundException`: Invalid or missing API key

```dart
try {
  final result = await StadataFlutter.instance.list.strategicIndicators(
    domain: '3200',
    variableID: 1001,
  );
  
  // Process successful result
  print('Found ${result.data.length} strategic indicators');
  
} on StrategicIndicatorException catch (e) {
  print('Strategic indicator error: ${e.message}');
  // Handle domain validation errors or variable ID issues
  
} on ApiException catch (e) {
  print('API error: ${e.message}');
  // Handle network connectivity or API service errors
  
} catch (e) {
  print('Unexpected error: $e');
  // Handle any other unexpected errors
}
```

## Performance Considerations

- **Variable Filtering**: Use variable IDs to reduce data transfer when focusing on specific indicators
- **Pagination Strategy**: Implement efficient pagination for large datasets
- **Caching**: Cache frequently accessed indicators to improve performance  
- **Batch Processing**: Consider batching requests when analyzing multiple domains
- **Data Freshness**: Strategic indicators are updated periodically; consider data refresh cycles in your application logic
