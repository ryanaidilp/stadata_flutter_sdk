# Static Tables

The Static Tables API provides access to structured statistical data tables from BPS (Badan Pusat Statistik) Indonesia. Static tables are pre-compiled data presentations that contain statistical information organized in tabular format, covering various statistical domains including demographics, economics, social indicators, and administrative data.

These tables represent finalized statistical outputs that are regularly published by BPS offices at national, provincial, and regency/city levels. Static tables are essential resources for researchers, analysts, policymakers, and data journalists who need access to official statistical data in structured, downloadable formats.

## Understanding Static Tables

Static tables serve as the primary data dissemination format for BPS statistics:

- **Official Data Publications**: Formally released statistical tables with verified data
- **Time Series Data**: Historical data spanning multiple periods for trend analysis
- **Cross-sectional Analysis**: Comparative data across regions, demographics, or categories
- **Thematic Coverage**: Tables organized by statistical subjects and domains
- **Multiple Formats**: Available in HTML display and Excel download formats

## Table Organization Structure

BPS static tables are systematically organized:

- **Domain Classification**: Tables grouped by geographic areas (national, provincial, local)
- **Subject Categories**: Organized by statistical themes and topics
- **Temporal Categorization**: Filtered by publication year and month
- **Content Indexing**: Searchable by keywords and table titles
- **Format Options**: HTML preview and Excel download capabilities

## Parameters

| Parameter | Type           | Description                                                      |
| --------- | -------------- | ---------------------------------------------------------------- |
| `domain`  | `String`       | Domain code (region) for retrieving static tables **(required)** |
| `lang`    | `DataLanguage` | Language for static table data (default: `DataLanguage.id`)     |
| `page`    | `int`          | Page number (default: `1`)                                      |
| `keyword` | `String?`      | Keyword for searching static tables (optional)                  |
| `month`   | `int?`         | Month for filtering static tables (optional - `1..12`)          |
| `year`    | `int?`         | Year for filtering static tables (optional)                     |

## Examples

### 1. Get All Static Tables for a Domain

```dart
// Fetch static tables from Central Java BPS
final staticTableResult = await StadataFlutter.instance.list.staticTable(
  domain: '3300', // Central Java domain code
  lang: DataLanguage.id,
);

final staticTableList = staticTableResult.data;
final pagination = staticTableResult.pagination;

// Print pagination information
print('Current Page: ${pagination.page}');
print('Total Pages: ${pagination.pages}');
print('Data Count in This Page: ${pagination.count}');
print('Per Page: ${pagination.perPage}');
print('Total: ${pagination.total}');
print('------------------------');

// Print retrieved static table data
for (final staticTable in staticTableList) {
  print('Table ID: ${staticTable.id}');
  print('Title: ${staticTable.title}');
  print('Subject: ${staticTable.subject ?? 'Not specified'}');
  print('Size: ${staticTable.size}');
  print('Updated: ${staticTable.updatedAt}');
  print('Excel Download: ${staticTable.excel}');
  print('------------------------');
}
```

### 2. Search Tables by Keyword

```dart
// Search for population-related static tables
final populationTables = await StadataFlutter.instance.list.staticTable(
  domain: '0000', // National level
  lang: DataLanguage.id,
  keyword: 'penduduk', // Search for population tables
);

// Process search results
for (final table in populationTables.data) {
  print('Population Table: ${table.title}');
  print('Subject: ${table.subject ?? 'General'}');
  print('File Size: ${table.size}');
  print('Last Updated: ${table.updatedAt}');
  
  // Check if Excel download is available
  if (table.excel.isNotEmpty) {
    print('Excel Download: ${table.excel}');
  }
  
  // Preview HTML table content if available
  if (table.table != null && table.table!.isNotEmpty) {
    print('Has HTML preview available');
  }
  
  print('------------------------');
}
```

### 3. Filter Tables by Year and Month

```dart
// Get static tables published in December 2023
final recentTables = await StadataFlutter.instance.list.staticTable(
  domain: '3200', // West Java
  lang: DataLanguage.id,
  year: 2023,
  month: 12, // December
);

// Analyze recent publications
print('=== December 2023 Publications ===');
for (final table in recentTables.data) {
  print('Recent Table: ${table.title}');
  print('Subject Area: ${table.subject ?? 'Unspecified'}');
  print('Created: ${table.createdAt ?? 'Unknown'}');
  print('File Size: ${table.size}');
  
  // Calculate days since publication
  if (table.createdAt != null) {
    final daysSince = DateTime.now().difference(table.createdAt!).inDays;
    print('Published $daysSince days ago');
  }
  
  print('------------------------');
}
```

### 4. Browse Tables with Pagination

```dart
// Systematically browse through all available tables
class StaticTableBrowser {
  static Future<void> browseAllTables(String domain) async {
    int currentPage = 1;
    bool hasMorePages = true;
    final allTables = <StaticTable>[];
    
    while (hasMorePages) {
      final pageResult = await StadataFlutter.instance.list.staticTable(
        domain: domain,
        lang: DataLanguage.id,
        page: currentPage,
      );
      
      allTables.addAll(pageResult.data);
      print('Page $currentPage: ${pageResult.data.length} tables');
      
      hasMorePages = currentPage < pageResult.pagination.pages;
      currentPage++;
      
      // Add delay to respect API rate limits
      await Future.delayed(Duration(milliseconds: 500));
    }
    
    print('Total tables collected: ${allTables.length}');
    
    // Analyze table distribution by subject
    final subjectGroups = <String, int>{};
    for (final table in allTables) {
      final subject = table.subject ?? 'Unspecified';
      subjectGroups[subject] = (subjectGroups[subject] ?? 0) + 1;
    }
    
    print('\\n=== Tables by Subject ===');
    subjectGroups.forEach((subject, count) {
      print('$subject: $count tables');
    });
  }
}
```

### 5. Advanced Table Discovery and Analysis

```dart
// Comprehensive table analysis with multiple filters
class TableAnalyzer {
  static Future<void> analyzeTableAvailability(String domain) async {
    try {
      // 1. Get overview of all tables
      final allTables = await StadataFlutter.instance.list.staticTable(
        domain: domain,
        lang: DataLanguage.id,
      );
      
      print('Total tables in domain $domain: ${allTables.pagination.total}');
      
      // 2. Analyze tables by year availability
      final currentYear = DateTime.now().year;
      final years = [currentYear - 2, currentYear - 1, currentYear];
      
      for (final year in years) {
        final yearlyTables = await StadataFlutter.instance.list.staticTable(
          domain: domain,
          lang: DataLanguage.id,
          year: year,
        );
        
        print('$year: ${yearlyTables.pagination.total} tables');
      }
      
      // 3. Search for economic data tables
      final economicTables = await StadataFlutter.instance.list.staticTable(
        domain: domain,
        lang: DataLanguage.id,
        keyword: 'ekonomi',
      );
      
      print('Economic tables: ${economicTables.data.length}');
      
      // 4. Find largest tables by file size
      final largeTables = allTables.data
          .where((table) => table.size.contains('MB'))
          .toList()
        ..sort((a, b) => b.size.compareTo(a.size));
      
      print('\\n=== Largest Tables ===');
      for (final table in largeTables.take(5)) {
        print('${table.title} - ${table.size}');
      }
      
    } catch (e) {
      print('Error analyzing tables: $e');
    }
  }
}
```

## Properties (StaticTable)

| Property    | Type        | Description                                                     |
| ----------- | ----------- | --------------------------------------------------------------- |
| `id`        | `int`       | Unique identifier of the static table                          |
| `title`     | `String`    | Official title or name of the table                            |
| `subjectId` | `int`       | Subject identifier associated with the table                   |
| `subject`   | `String?`   | Subject name or thematic category (optional)                   |
| `size`      | `String`    | File size of the table data                                     |
| `table`     | `String?`   | HTML representation of the table for preview (optional)        |
| `updatedAt` | `DateTime`  | Date and time when the table was last updated                  |
| `createdAt` | `DateTime?` | Date and time when the table was created (optional)            |
| `excel`     | `String`    | Direct download URL for the Excel version of the table         |

## Common Table Categories

### Demographic Tables
- **Population Statistics**: Population counts, density, growth rates
- **Migration Data**: Internal migration patterns, urbanization trends  
- **Household Demographics**: Family structure, household composition
- **Vital Statistics**: Birth rates, death rates, life expectancy

### Economic Tables
- **Regional GDP**: Gross regional domestic product by sector
- **Employment Statistics**: Labor force, unemployment, employment by sector
- **Investment Data**: Investment flows, capital formation
- **Trade Statistics**: Regional trade balances, import/export data

### Social Tables
- **Education Statistics**: School enrollment, literacy rates, educational attainment
- **Health Indicators**: Healthcare access, mortality rates, disease statistics
- **Poverty and Welfare**: Poverty rates, social assistance programs
- **Housing Data**: Housing conditions, access to utilities

### Infrastructure Tables
- **Transportation**: Road networks, public transport statistics
- **Utilities**: Electricity, water supply, telecommunications coverage
- **Technology Access**: Internet penetration, digital infrastructure

## Data Processing Workflow

### Complete Table Discovery and Processing

```dart
// Comprehensive workflow for table discovery and data extraction
class StaticTableProcessor {
  static Future<void> processTableData() async {
    try {
      // 1. Discover tables for Jakarta
      final jakartaTables = await StadataFlutter.instance.list.staticTable(
        domain: '3100', // DKI Jakarta
        lang: DataLanguage.id,
        keyword: 'ekonomi',
      );
      
      print('Found ${jakartaTables.data.length} economic tables for Jakarta');
      
      // 2. Select most recent table
      final recentTables = jakartaTables.data
        ..sort((a, b) => b.updatedAt.compareTo(a.updatedAt));
      
      if (recentTables.isNotEmpty) {
        final latestTable = recentTables.first;
        print('Latest economic table: ${latestTable.title}');
        print('Last updated: ${latestTable.updatedAt}');
        print('File size: ${latestTable.size}');
        
        // 3. Process table content
        if (latestTable.table != null) {
          print('HTML preview available');
          // Parse HTML content for data extraction
          await processHTMLTable(latestTable.table!);
        }
        
        // 4. Download Excel version
        if (latestTable.excel.isNotEmpty) {
          print('Excel download: ${latestTable.excel}');
          await downloadExcelFile(latestTable.excel, latestTable.title);
        }
      }
      
    } catch (e) {
      print('Error processing table data: $e');
    }
  }
  
  static Future<void> processHTMLTable(String htmlContent) async {
    // Process HTML table content
    print('Processing HTML table data...');
    // Implementation for HTML parsing would go here
  }
  
  static Future<void> downloadExcelFile(String url, String title) async {
    // Download Excel file implementation
    print('Downloading Excel file: $title');
    // Implementation for file download would go here
  }
}
```

## Integration with Other APIs

### Building Complete Data Reports

```dart
// Combine static tables with other BPS data sources
Future<void> buildComprehensiveReport(String domain) async {
  try {
    // Get domain information
    final domains = await StadataFlutter.instance.list.domains();
    final currentDomain = domains.data.firstWhere((d) => d.id == domain);
    
    // Get static tables
    final tables = await StadataFlutter.instance.list.staticTable(
      domain: domain,
      lang: DataLanguage.id,
    );
    
    // Get related publications
    final publications = await StadataFlutter.instance.list.publications(
      domain: domain,
      lang: DataLanguage.id,
    );
    
    // Get strategic indicators
    final indicators = await StadataFlutter.instance.list.strategicIndicators(
      domain: domain,
      lang: DataLanguage.id,
    );
    
    print('=== Comprehensive Report for ${currentDomain.name} ===');
    print('Static Tables: ${tables.data.length}');
    print('Publications: ${publications.data.length}');
    print('Strategic Indicators: ${indicators.data.length}');
    
    // Analyze data availability by subject
    final tableSubjects = <String, int>{};
    for (final table in tables.data) {
      final subject = table.subject ?? 'Unspecified';
      tableSubjects[subject] = (tableSubjects[subject] ?? 0) + 1;
    }
    
    print('\\n=== Data Coverage by Subject ===');
    tableSubjects.forEach((subject, count) {
      print('$subject: $count tables');
    });
    
  } catch (e) {
    print('Report generation error: $e');
  }
}
```

## Working with Table Files

### Excel File Processing

```dart
// Download and process Excel files from static tables
Future<void> processExcelData() async {
  try {
    final tables = await StadataFlutter.instance.list.staticTable(
      domain: '3200', // West Java
      lang: DataLanguage.id,
      keyword: 'penduduk',
    );
    
    for (final table in tables.data.take(3)) {
      print('Processing: ${table.title}');
      print('Excel URL: ${table.excel}');
      print('File Size: ${table.size}');
      
      // Validate Excel URL before download
      if (table.excel.isNotEmpty && table.excel.startsWith('http')) {
        print('Valid Excel download URL available');
        
        // Here you would implement actual file download
        // using packages like dio, http, or flutter_downloader
        
      } else {
        print('No valid Excel download available');
      }
      
      print('------------------------');
    }
    
  } catch (e) {
    print('Excel processing error: $e');
  }
}
```

### HTML Table Preview

```dart
// Display HTML table content in Flutter apps
Widget buildTablePreview(StaticTable table) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        table.title,
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
      SizedBox(height: 8),
      Text('Subject: ${table.subject ?? 'Not specified'}'),
      Text('Size: ${table.size}'),
      Text('Updated: ${table.updatedAt}'),
      SizedBox(height: 12),
      
      // Display HTML table if available
      if (table.table != null && table.table!.isNotEmpty)
        Container(
          height: 300,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(4),
          ),
          child: SingleChildScrollView(
            child: Html(
              data: table.table!,
              // Configure HTML display options
            ),
          ),
        ),
      
      SizedBox(height: 12),
      
      // Download button
      if (table.excel.isNotEmpty)
        ElevatedButton.icon(
          onPressed: () => downloadTable(table.excel),
          icon: Icon(Icons.download),
          label: Text('Download Excel'),
        ),
    ],
  );
}

Future<void> downloadTable(String url) async {
  // Implement table download functionality
  print('Downloading table from: $url');
}
```

## Error Handling

Static Table API methods return `Future<ListResult<StaticTable>>` and may throw specific exceptions:

- `StaticTableException`: Static table-related errors (invalid domain, search errors)
- `ApiException`: Network or API-related errors
- `ApiKeyNotFoundException`: Invalid or missing API key

```dart
try {
  final result = await StadataFlutter.instance.list.staticTable(
    domain: '3200',
    keyword: 'ekonomi',
    year: 2023,
  );
  
  // Process successful result
  print('Found ${result.data.length} static tables');
  
} on StaticTableException catch (e) {
  print('Static table error: ${e.message}');
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

- **File Size Awareness**: Check table sizes before downloading large Excel files
- **Pagination Strategy**: Use pagination for domains with many tables
- **Search Optimization**: Use specific keywords to reduce result sets
- **Caching**: Cache frequently accessed tables locally
- **Download Management**: Implement proper download queuing for multiple Excel files
- **HTML Processing**: Optimize HTML table rendering for large tables