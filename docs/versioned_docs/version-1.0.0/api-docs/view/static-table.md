# Static Table

The View Static Table API provides comprehensive access to detailed statistical tables from BPS (Badan Pusat Statistik) Indonesia. This method enables applications to retrieve complete table data, including HTML previews, Excel downloads, metadata, and subject classifications for statistical analysis, data integration, and research purposes.

Static tables from BPS represent structured statistical datasets that provide organized, tabular presentations of statistical information across various domains. These tables serve as fundamental data sources for analysis, offering both human-readable HTML formats and machine-processable Excel files for comprehensive data utilization.

## Understanding the Static Table System

BPS static tables provide structured statistical data across multiple dimensions:

- **Structured Data Access**: Organized tabular data with clear rows, columns, and statistical relationships
- **Multi-format Availability**: Access to both HTML preview and Excel downloadable formats
- **Subject Classification**: Tables organized by statistical subjects and thematic areas
- **Temporal Coverage**: Data spanning different time periods and statistical cycles
- **Geographic Scope**: Tables available at national, provincial, and local administrative levels

## Static Table Categories

### Economic Statistics Tables
- **Macroeconomic Indicators**: GDP, inflation, economic growth, and financial statistics
- **Trade Statistics**: Export-import data, trade balances, and commercial activity
- **Industry Statistics**: Manufacturing, services, and sectoral economic performance
- **Price Statistics**: Consumer price indices, producer prices, and cost of living data

### Social and Demographic Tables
- **Population Statistics**: Census data, population projections, and demographic indicators
- **Education Statistics**: Enrollment rates, literacy levels, and educational attainment
- **Health Statistics**: Health indicators, mortality rates, and healthcare access
- **Labor Statistics**: Employment rates, unemployment data, and workforce characteristics

### Regional and Administrative Tables
- **Provincial Statistics**: Province-level data across various statistical domains
- **Municipal Statistics**: City and regency-level statistical information
- **Rural Statistics**: Village-level data and rural development indicators
- **Administrative Boundaries**: Geographic and administrative classification data

## Parameters

| Parameter | Type           | Description                                                      |
| --------- | -------------- | ---------------------------------------------------------------- |
| `id`      | `int`          | **Required**: The unique numerical identifier of the specific static table |
| `domain`  | `String`       | **Required**: The domain (region) code specifying administrative context |
| `lang`    | `DataLanguage` | **Optional**: Language preference for localized content (default: `DataLanguage.id`) |

## Examples

### 1. Basic Static Table Retrieval

![Preview](/gif/static_tables.gif)

```dart
// Retrieve detailed information for a specific static table
final staticTable = await StadataFlutter.instance.view.staticTable(
  id: 1234, // Example: Economic indicators table ID
  domain: '0000', // National level
  lang: DataLanguage.id,
);

if (staticTable != null) {
  print('=== Static Table Details ===');
  print('Table ID: ${staticTable.id}');
  print('Title: ${staticTable.title}');
  print('Subject: ${staticTable.subject ?? 'General'}');
  print('Subject ID: ${staticTable.subjectId}');
  
  // Table metadata
  print('\n=== Table Metadata ===');
  print('File Size: ${staticTable.size}');
  print('Created: ${staticTable.createdAt ?? 'Date not available'}');
  print('Last Updated: ${staticTable.updatedAt}');
  
  // Data access information
  print('\n=== Data Access ===');
  print('HTML Preview Available: ${staticTable.table != null && staticTable.table!.isNotEmpty}');
  print('Excel Download Available: ${staticTable.excel.isNotEmpty}');
  
  if (staticTable.excel.isNotEmpty) {
    print('Excel URL: ${staticTable.excel}');
  }
  
  // Table content preview
  if (staticTable.table != null && staticTable.table!.isNotEmpty) {
    print('\n=== Table Preview ===');
    // Display first 200 characters of HTML table
    final tablePreview = staticTable.table!.length > 200 
        ? '${staticTable.table!.substring(0, 200)}...'
        : staticTable.table!;
    print('HTML Content: $tablePreview');
  }
} else {
  print('Static table not found or not accessible');
}
```

### 2. Data Analysis Workflow with Static Tables

```dart
// Comprehensive data analysis workflow using static tables
class StaticTableDataAnalyzer {
  static Future<void> analyzeTableData(
    String domain, 
    String analysisTheme,
  ) async {
    try {
      // 1. Discover static tables using List API
      final tablesList = await StadataFlutter.instance.list.staticTables(
        domain: domain,
        keyword: analysisTheme,
        lang: DataLanguage.id,
      );
      
      print('=== Static Table Data Analysis: "$analysisTheme" ===');
      print('Found ${tablesList.data.length} tables');
      
      if (tablesList.data.isEmpty) {
        print('No tables found for theme: $analysisTheme');
        return;
      }
      
      // 2. Analyze each table in detail
      final tableAnalysis = <Map<String, dynamic>>[];
      
      for (final tableSummary in tablesList.data.take(10)) {
        print('\n--- Analyzing: ${tableSummary.title} ---');
        
        final detailedTable = await StadataFlutter.instance.view.staticTable(
          id: tableSummary.id,
          domain: domain,
          lang: DataLanguage.id,
        );
        
        if (detailedTable != null) {
          final analysis = await _analyzeTableStructure(detailedTable);
          tableAnalysis.add({
            'id': detailedTable.id,
            'title': detailedTable.title,
            'subject': detailedTable.subject,
            'subjectId': detailedTable.subjectId,
            'hasHtmlContent': detailedTable.table != null && detailedTable.table!.isNotEmpty,
            'hasExcelAccess': detailedTable.excel.isNotEmpty,
            'fileSize': detailedTable.size,
            'lastUpdated': detailedTable.updatedAt,
            'structure': analysis,
          });
          
          // Display key findings
          print('Subject: ${detailedTable.subject ?? 'Unclassified'}');
          print('Size: ${detailedTable.size}');
          print('Last Updated: ${detailedTable.updatedAt}');
          print('Excel Available: ${detailedTable.excel.isNotEmpty ? 'Yes' : 'No'}');
          print('HTML Preview: ${detailedTable.table != null ? 'Available' : 'Not available'}');
          
          if (analysis['estimatedRows'] != null) {
            print('Estimated Rows: ${analysis['estimatedRows']}');
          }
          if (analysis['estimatedColumns'] != null) {
            print('Estimated Columns: ${analysis['estimatedColumns']}');
          }
          
        } else {
          print('Failed to retrieve detailed information');
        }
        
        // Rate limiting
        await Future.delayed(Duration(milliseconds: 400));
      }
      
      // 3. Analysis summary
      print('\n=== Analysis Summary ===');
      print('Total Tables Analyzed: ${tableAnalysis.length}');
      print('With HTML Content: ${tableAnalysis.where((t) => t['hasHtmlContent']).length}');
      print('With Excel Downloads: ${tableAnalysis.where((t) => t['hasExcelAccess']).length}');
      
      // Subject distribution
      final subjectDistribution = <String?, int>{};
      for (final table in tableAnalysis) {
        final subject = table['subject'] as String?;
        subjectDistribution[subject] = (subjectDistribution[subject] ?? 0) + 1;
      }
      
      print('\nSubject Distribution:');
      for (final entry in subjectDistribution.entries) {
        final subject = entry.key ?? 'Unclassified';
        print('  $subject: ${entry.value} tables');
      }
      
      // Recent updates analysis
      final currentDate = DateTime.now();
      final recentTables = tableAnalysis.where((t) => 
          t['lastUpdated'] != null && 
          (t['lastUpdated'] as DateTime).isAfter(currentDate.subtract(Duration(days: 365)))
      ).length;
      
      print('\nRecency Analysis:');
      print('Tables updated in last year: $recentTables');
      
      // Data completeness assessment
      final completenesScore = tableAnalysis.isNotEmpty
          ? tableAnalysis.map((t) => [
              t['hasHtmlContent'] ? 1 : 0,
              t['hasExcelAccess'] ? 1 : 0,
              t['subject'] != null ? 1 : 0,
            ].reduce((a, b) => a + b)).reduce((a, b) => a + b) / (tableAnalysis.length * 3)
          : 0.0;
      
      print('Average Completeness Score: ${(completenesScore * 100).toStringAsFixed(1)}%');
      
    } catch (e) {
      print('Data analysis error: $e');
    }
  }
  
  static Future<Map<String, dynamic>> _analyzeTableStructure(StaticTable table) async {
    final analysis = <String, dynamic>{};
    
    if (table.table != null && table.table!.isNotEmpty) {
      final htmlContent = table.table!;
      
      // Simple HTML table analysis
      final trMatches = RegExp(r'<tr[^>]*>').allMatches(htmlContent);
      final tdMatches = RegExp(r'<td[^>]*>').allMatches(htmlContent);
      final thMatches = RegExp(r'<th[^>]*>').allMatches(htmlContent);
      
      analysis['estimatedRows'] = trMatches.length;
      analysis['estimatedDataCells'] = tdMatches.length;
      analysis['estimatedHeaderCells'] = thMatches.length;
      
      if (trMatches.length > 0) {
        analysis['estimatedColumns'] = (tdMatches.length / trMatches.length).round();
      }
      
      // Check for common data patterns
      final hasNumbers = RegExp(r'\d{1,3}(?:,\d{3})*(?:\.\d+)?').hasMatch(htmlContent);
      final hasPercentages = htmlContent.contains('%');
      final hasYears = RegExp(r'20\d{2}').hasMatch(htmlContent);
      
      analysis['containsNumericalData'] = hasNumbers;
      analysis['containsPercentages'] = hasPercentages;
      analysis['containsYearData'] = hasYears;
    }
    
    return analysis;
  }
}
```

### 3. Data Integration and Export Workflow

```dart
// Comprehensive data integration workflow for static tables
class StaticTableDataIntegrator {
  static Future<void> integrateTableData(
    List<int> tableIds,
    String domain,
  ) async {
    try {
      print('=== Static Table Data Integration ===');
      print('Integrating ${tableIds.length} tables...');
      
      final integratedData = <Map<String, dynamic>>[];
      final downloadUrls = <String, String>{};
      
      // 1. Retrieve all table data
      for (final tableId in tableIds) {
        final table = await StadataFlutter.instance.view.staticTable(
          id: tableId,
          domain: domain,
          lang: DataLanguage.id,
        );
        
        if (table != null) {
          final tableData = {
            'id': table.id,
            'title': table.title,
            'subject': table.subject,
            'subjectId': table.subjectId,
            'size': table.size,
            'updatedAt': table.updatedAt.toIso8601String(),
            'createdAt': table.createdAt?.toIso8601String(),
            'hasHtmlData': table.table != null && table.table!.isNotEmpty,
            'excelUrl': table.excel.isNotEmpty ? table.excel : null,
          };
          
          integratedData.add(tableData);
          
          if (table.excel.isNotEmpty) {
            downloadUrls[table.title] = table.excel;
          }
          
          print('  ✓ Integrated: ${table.title}');
          
          // Extract structured data if HTML is available
          if (table.table != null && table.table!.isNotEmpty) {
            final extractedData = _extractTableData(table.table!);
            tableData['extractedRows'] = extractedData.length;
            
            if (extractedData.isNotEmpty) {
              tableData['firstRowSample'] = extractedData.first;
            }
          }
          
        } else {
          print('  ✗ Failed to load table: $tableId');
        }
        
        await Future.delayed(Duration(milliseconds: 300));
      }
      
      // 2. Generate integration report
      print('\n=== Integration Report ===');
      print('Successfully integrated: ${integratedData.length} tables');
      print('Excel downloads available: ${downloadUrls.length}');
      
      // Subject analysis
      final subjectGroups = <String?, List<Map<String, dynamic>>>{};
      for (final table in integratedData) {
        final subject = table['subject'] as String?;
        subjectGroups[subject] = (subjectGroups[subject] ?? [])..add(table);
      }
      
      print('\nData grouped by subject:');
      for (final entry in subjectGroups.entries) {
        final subject = entry.key ?? 'Unclassified';
        print('  $subject: ${entry.value.length} tables');
      }
      
      // 3. Export integration manifest
      print('\n=== Export Manifest ===');
      print('Integration completed at: ${DateTime.now().toIso8601String()}');
      print('Domain: $domain');
      print('Total data sources: ${integratedData.length}');
      
      if (downloadUrls.isNotEmpty) {
        print('\nExcel download URLs:');
        for (final entry in downloadUrls.entries) {
          print('  ${entry.key}: ${entry.value}');
        }
      }
      
      // 4. Data quality assessment
      final qualityMetrics = {
        'withExcelAccess': integratedData.where((t) => t['excelUrl'] != null).length,
        'withHtmlData': integratedData.where((t) => t['hasHtmlData']).length,
        'withSubjectClassification': integratedData.where((t) => t['subject'] != null).length,
        'recentlyUpdated': integratedData.where((t) => 
            DateTime.parse(t['updatedAt']).isAfter(DateTime.now().subtract(Duration(days: 365)))
        ).length,
      };
      
      print('\n=== Data Quality Metrics ===');
      for (final entry in qualityMetrics.entries) {
        final percentage = (entry.value / integratedData.length * 100).toStringAsFixed(1);
        print('${_formatMetricName(entry.key)}: ${entry.value} (${percentage}%)');
      }
      
    } catch (e) {
      print('Data integration error: $e');
    }
  }
  
  static List<Map<String, String>> _extractTableData(String htmlTable) {
    final rows = <Map<String, String>>[];
    
    // Simple HTML table parsing (basic implementation)
    final trPattern = RegExp(r'<tr[^>]*>(.*?)</tr>', dotAll: true);
    final tdPattern = RegExp(r'<td[^>]*>(.*?)</td>', dotAll: true);
    final thPattern = RegExp(r'<th[^>]*>(.*?)</th>', dotAll: true);
    
    final trMatches = trPattern.allMatches(htmlTable);
    List<String>? headers;
    
    for (final trMatch in trMatches.take(10)) { // Limit extraction for performance
      final rowHtml = trMatch.group(1) ?? '';
      
      // Check if this is a header row
      final thMatches = thPattern.allMatches(rowHtml);
      if (thMatches.isNotEmpty && headers == null) {
        headers = thMatches.map((m) => _cleanHtml(m.group(1) ?? '')).toList();
        continue;
      }
      
      // Extract data cells
      final tdMatches = tdPattern.allMatches(rowHtml);
      if (tdMatches.isNotEmpty) {
        final cellValues = tdMatches.map((m) => _cleanHtml(m.group(1) ?? '')).toList();
        
        if (headers != null && cellValues.length == headers.length) {
          final rowData = <String, String>{};
          for (int i = 0; i < headers.length; i++) {
            rowData[headers[i]] = cellValues[i];
          }
          rows.add(rowData);
        }
      }
    }
    
    return rows;
  }
  
  static String _cleanHtml(String html) {
    return html.replaceAll(RegExp(r'<[^>]*>'), '').trim();
  }
  
  static String _formatMetricName(String key) {
    switch (key) {
      case 'withExcelAccess':
        return 'Excel Access Available';
      case 'withHtmlData':
        return 'HTML Data Available';
      case 'withSubjectClassification':
        return 'Subject Classification';
      case 'recentlyUpdated':
        return 'Recently Updated';
      default:
        return key;
    }
  }
}
```

### 4. Statistical Table Comparison and Analysis

```dart
// Comparative analysis of multiple static tables
class StaticTableComparator {
  static Future<void> compareStaticTables(
    List<int> tableIds,
    String domain,
  ) async {
    try {
      print('=== Static Table Comparison Analysis ===');
      print('Comparing ${tableIds.length} tables...');
      
      final tables = <StaticTable>[];
      
      // 1. Load all tables
      for (final tableId in tableIds) {
        final table = await StadataFlutter.instance.view.staticTable(
          id: tableId,
          domain: domain,
          lang: DataLanguage.id,
        );
        
        if (table != null) {
          tables.add(table);
          print('  ✓ Loaded: ${table.title}');
        }
        
        await Future.delayed(Duration(milliseconds: 200));
      }
      
      if (tables.length < 2) {
        print('Need at least 2 tables for comparison');
        return;
      }
      
      // 2. Comparative analysis
      print('\n=== Comparison Results ===');
      
      // Size comparison
      print('File Size Comparison:');
      final sortedBySize = tables.toList()..sort((a, b) => 
          _parseSize(b.size).compareTo(_parseSize(a.size))
      );
      
      for (int i = 0; i < sortedBySize.length; i++) {
        final table = sortedBySize[i];
        print('  ${i + 1}. ${table.title}: ${table.size}');
      }
      
      // Update recency comparison
      print('\nUpdate Recency Comparison:');
      final sortedByUpdate = tables.toList()..sort((a, b) => 
          b.updatedAt.compareTo(a.updatedAt)
      );
      
      for (int i = 0; i < sortedByUpdate.length; i++) {
        final table = sortedByUpdate[i];
        final daysSinceUpdate = DateTime.now().difference(table.updatedAt).inDays;
        print('  ${i + 1}. ${table.title}: ${table.updatedAt} ($daysSinceUpdate days ago)');
      }
      
      // Subject classification comparison
      print('\nSubject Classification:');
      final subjectGroups = <String?, List<StaticTable>>{};
      for (final table in tables) {
        final subject = table.subject;
        subjectGroups[subject] = (subjectGroups[subject] ?? [])..add(table);
      }
      
      for (final entry in subjectGroups.entries) {
        final subject = entry.key ?? 'Unclassified';
        print('  $subject:');
        for (final table in entry.value) {
          print('    - ${table.title} (ID: ${table.id})');
        }
      }
      
      // Data availability comparison
      print('\nData Availability Comparison:');
      for (final table in tables) {
        final hasHtml = table.table != null && table.table!.isNotEmpty;
        final hasExcel = table.excel.isNotEmpty;
        
        print('${table.title}:');
        print('  HTML Preview: ${hasHtml ? '✓' : '✗'}');
        print('  Excel Download: ${hasExcel ? '✓' : '✗'}');
        
        if (hasHtml && table.table != null) {
          final structure = await StaticTableDataAnalyzer._analyzeTableStructure(table);
          if (structure['estimatedRows'] != null) {
            print('  Estimated Rows: ${structure['estimatedRows']}');
          }
          if (structure['estimatedColumns'] != null) {
            print('  Estimated Columns: ${structure['estimatedColumns']}');
          }
        }
        print('');
      }
      
      // 3. Comparison summary
      print('=== Comparison Summary ===');
      print('Tables compared: ${tables.length}');
      print('Largest table: ${sortedBySize.first.title} (${sortedBySize.first.size})');
      print('Most recently updated: ${sortedByUpdate.first.title}');
      print('Oldest update: ${sortedByUpdate.last.title}');
      
      final avgSize = tables.map((t) => _parseSize(t.size)).where((s) => s > 0).fold(0.0, (a, b) => a + b) / tables.length;
      print('Average file size: ${avgSize.toStringAsFixed(1)} KB');
      
      final withExcel = tables.where((t) => t.excel.isNotEmpty).length;
      final withHtml = tables.where((t) => t.table != null && t.table!.isNotEmpty).length;
      
      print('Tables with Excel: $withExcel/${tables.length}');
      print('Tables with HTML: $withHtml/${tables.length}');
      
    } catch (e) {
      print('Comparison error: $e');
    }
  }
  
  static double _parseSize(String sizeStr) {
    final match = RegExp(r'([\d.]+)\s*(kb|mb)', caseSensitive: false).firstMatch(sizeStr.toLowerCase());
    if (match != null) {
      final value = double.tryParse(match.group(1) ?? '0') ?? 0;
      final unit = match.group(2)?.toLowerCase();
      return unit == 'mb' ? value * 1024 : value;
    }
    return 0.0;
  }
}
```

## Static Table Workflow Integration

Typical workflow for working with static tables effectively:

1. **Discovery Phase**: Use List API to identify tables of interest based on keywords or subjects
2. **Detailed Retrieval**: Use View API to get comprehensive table information and access URLs
3. **Data Analysis**: Examine HTML content structure and extract meaningful data patterns
4. **Export Planning**: Utilize Excel download URLs for data integration and processing
5. **Quality Assessment**: Evaluate data completeness, recency, and accessibility

### Integration with Other APIs

```dart
// Building comprehensive statistical data workflow
Future<void> buildStatisticalDataWorkflow(String domain, String topic) async {
  try {
    // 1. Find related static tables
    final tables = await StadataFlutter.instance.list.staticTables(
      domain: domain,
      keyword: topic,
    );
    
    // 2. Find related publications for context
    final publications = await StadataFlutter.instance.list.publications(
      domain: domain,
      keyword: topic,
    );
    
    // 3. Get detailed information for top tables
    final detailedTables = <StaticTable>[];
    for (final table in tables.data.take(3)) {
      final detailed = await StadataFlutter.instance.view.staticTable(
        id: table.id,
        domain: domain,
      );
      if (detailed != null) detailedTables.add(detailed);
    }
    
    print('=== Statistical Data Analysis: $topic ===');
    print('Static Tables found: ${tables.data.length}');
    print('Related Publications: ${publications.data.length}');
    print('Detailed table analysis: ${detailedTables.length} tables');
    
    // Cross-reference analysis
    for (final table in detailedTables) {
      print('\nTable: ${table.title}');
      print('Subject: ${table.subject ?? 'General'}');
      print('Last Updated: ${table.updatedAt}');
      print('Excel Available: ${table.excel.isNotEmpty}');
      
      // Find related publications
      final relatedPubs = publications.data.where((p) => 
          p.title.toLowerCase().contains(topic.toLowerCase()) ||
          (table.subject != null && p.title.toLowerCase().contains(table.subject!.toLowerCase()))
      ).take(2);
      
      if (relatedPubs.isNotEmpty) {
        print('Related Publications:');
        for (final pub in relatedPubs) {
          print('  • ${pub.title}');
        }
      }
    }
    
  } catch (e) {
    print('Statistical data workflow error: $e');
  }
}
```

## Error Handling

The View Static Table API returns nullable `StaticTable` objects and may throw specific exceptions:

- **StaticTableException**: Table-specific errors (invalid ID, domain restrictions, access permissions)
- **ApiException**: General API communication errors (network issues, server errors, rate limiting)
- **ApiKeyNotFoundException**: Authentication errors (invalid or missing API key)
- **ValidationException**: Parameter validation errors (invalid table IDs, malformed domain codes)

```dart
try {
  final staticTable = await StadataFlutter.instance.view.staticTable(
    id: 1234,
    domain: '0000',
    lang: DataLanguage.id,
  );
  
  if (staticTable != null) {
    // Successfully retrieved static table
    print('Table: ${staticTable.title}');
    print('Subject: ${staticTable.subject ?? 'General'}');
    print('Excel Available: ${staticTable.excel.isNotEmpty}');
    print('HTML Preview: ${staticTable.table != null && staticTable.table!.isNotEmpty}');
  } else {
    // Table not found or not accessible
    print('Static table not found - may be unpublished or restricted');
  }
  
} on StaticTableException catch (e) {
  print('Static table error: ${e.message}');
  // Handle table-specific errors like invalid ID or access restrictions
  
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

- **Rate Limiting**: Implement appropriate delays between requests, especially for large-scale data extraction
- **Caching Strategy**: Cache table metadata and structure analysis for frequently accessed tables
- **HTML Parsing**: Consider using efficient HTML parsing libraries for large table content
- **Excel Downloads**: Implement progressive download strategies for large Excel files
- **Memory Management**: Be mindful of memory usage when processing multiple large tables simultaneously
- **Batch Processing**: Process tables in batches to avoid overwhelming the API and local resources

## Properties (StaticTable)

| Property    | Type        | Description                                                     |
| ----------- | ----------- | --------------------------------------------------------------- |
| `id`        | `int`       | Unique numerical identifier for the static table                |
| `title`     | `String`    | Complete title or name describing the table content             |
| `subjectId` | `int`       | Numerical identifier for the statistical subject classification  |
| `subject`   | `String?`   | Human-readable name of the subject category (optional)          |
| `size`      | `String`    | File size information in human-readable format                  |
| `table`     | `String?`   | HTML representation of the table content for preview (optional) |
| `updatedAt` | `DateTime`  | Timestamp when the table data was last updated                  |
| `createdAt` | `DateTime?` | Original creation timestamp of the table (optional)             |
| `excel`     | `String`    | Direct URL to download the table data in Excel format           |