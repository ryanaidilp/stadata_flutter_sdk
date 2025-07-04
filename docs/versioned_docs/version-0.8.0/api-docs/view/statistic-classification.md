# Statistical Classification (KBLI & KBKI)

The View Statistical Classification API provides comprehensive access to detailed information about Indonesian Standard Industrial Classification (KBLI) and Indonesian Standard Commodity Classification (KBKI) systems from BPS (Badan Pusat Statistik) Indonesia. This method enables applications to retrieve complete classification hierarchies, code structures, and detailed descriptions for economic activity classification and commodity categorization purposes.

Statistical classifications from BPS serve as fundamental frameworks for organizing and categorizing economic activities, industries, and commodities within Indonesia's statistical system. The View Statistical Classification API ensures access to complete classification metadata, hierarchical relationships, and comprehensive documentation for statistical standardization and data analysis purposes.

## Understanding the Statistical Classification System

BPS statistical classifications provide comprehensive frameworks for economic and commodity categorization:

- **Standardized Classification**: Official government standards for industry and commodity classification across statistical systems
- **Hierarchical Structure**: Multi-level classification systems with detailed breakdown from broad categories to specific items
- **Version Management**: Multiple classification versions with temporal validity and update tracking
- **Cross-Reference Systems**: Relationships between different classification versions and international standards
- **Economic Integration**: Integration with national economic accounting, survey systems, and statistical reporting

## Classification Systems Overview

### Indonesian Standard Industrial Classification (KBLI)

KBLI provides comprehensive classification of economic activities and industries:

- **Economic Activity Classification**: Systematic categorization of all economic activities within Indonesia
- **Industry Structure**: Hierarchical organization from broad economic sectors to specific business activities
- **Statistical Harmonization**: Alignment with international standards (ISIC) while maintaining national specificity
- **Survey Integration**: Foundation for economic surveys, census operations, and statistical data collection
- **Version Evolution**: Multiple versions reflecting changes in economic structure and international standards

### Indonesian Standard Commodity Classification (KBKI)

KBKI provides detailed classification of commodities and products:

- **Product Categorization**: Comprehensive classification of goods, commodities, and products
- **Trade Integration**: Support for trade statistics, import-export classification, and commercial analysis
- **Production Analysis**: Framework for production statistics and industrial output classification
- **Quality Standards**: Integration with product quality standards and specification systems
- **International Alignment**: Harmonization with international commodity classification systems

## Classification Hierarchy Levels

### KBLI (Industrial Classification) Levels

- **Category (Kategori)**: Highest level classification marked with single alphabetic codes (A-U)
  - Broad economic sectors like Agriculture, Manufacturing, Services
  - 21 main categories covering all economic activities
  
- **Primary Group (Golongan Pokok)**: Two-digit numeric codes (01-99)
  - Detailed breakdown of economic activities within each category
  - More specific industry groupings and economic divisions
  
- **Group (Golongan)**: Three-digit codes expanding primary groups
  - Specific industry classifications and business activity types
  - Detailed economic activity specifications
  
- **Sub-Group (Sub Golongan)**: Four-digit codes for detailed activities
  - Specific business activities and operational classifications
  - Precise economic activity identification
  
- **Cluster (Kelompok)**: Five-digit codes for finest classification level
  - Most detailed level of economic activity classification
  - Specific business operations and activity types

### KBKI (Commodity Classification) Levels

- **Section (Bagian)**: Single-digit codes (0-4) for broad commodity categories
  - Major product and commodity groupings
  - Fundamental classification of all goods and products
  
- **Division (Bab)**: Two-digit codes for detailed section breakdown
  - Specific product categories within major groupings
  - Industry-specific commodity classifications
  
- **Group (Golongan)**: Three-digit codes for product groups
  - Detailed product families and commodity types
  - Specific product categorizations
  
- **Classes (Kelas)**: Four-digit codes for product classes
  - Detailed product specifications and types
  - Precise commodity classifications
  
- **Sub-Class (Sub Kelas)**: Five-digit codes for detailed products
  - Specific product variants and detailed classifications
  - Product-specific categorizations
  
- **Commodity Group (Kelompok Komoditas)**: Seven-digit codes
  - Detailed commodity groupings and product families
  - Specific product line classifications
  
- **Commodity (Komoditas)**: Ten-digit codes for individual commodities
  - Individual product identification and specification
  - Most detailed level of commodity classification

## Classification Types and Versions

### KBLI Type Specifications

| Classification | Enum | Value | Year | Description |
|---|---|---|---|---|
| KBLI 2009 | `KBLIType.y2009` | `kbli2009` | 2009 | Original KBLI version based on ISIC Rev. 4 |
| KBLI 2015 | `KBLIType.y2015` | `kbli2015` | 2015 | Updated version with refined categories |
| KBLI 2017 | `KBLIType.y2017` | `kbli2017` | 2017 | Enhanced version with additional activities |
| KBLI 2020 | `KBLIType.y2020` | `kbli2020` | 2020 | Latest version incorporating new economic activities |

### KBKI Type Specifications

| Classification | Enum | Value | Year | Description |
|---|---|---|---|---|
| KBKI 2015 | `KBKIType.y2015` | `kbki2015` | 2015 | Current commodity classification standard |

## Parameters

| Parameter | Type | Description |
| --------- | ---- | ----------- |
| `id` | `String` | **Required**: Unique identifier in `type_year_code` format (use `urlParamGenerator` method) |
| `type` | `ClassificationType` | **Required**: Classification type from `KBLIType` or `KBKIType` enum |
| `lang` | `DataLanguage` | **Optional**: Language preference for localized content (default: `DataLanguage.id`) |
| `page` | `int` | **Optional**: Page number for pagination (default: 1) |
| `perPage` | `int` | **Optional**: Number of items per page (default: 10) |

## Examples

### 1. Basic Statistical Classification Retrieval

<!-- ![Preview](/gif/statistic_classifications.gif) -->

```dart
// Retrieve detailed information for a specific KBLI classification
const kbliType = KBLIType.y2020;
final classificationId = kbliType.urlParamGenerator('A'); // Agriculture sector

final result = await StadataFlutter.instance.view.statisticClassifications(
  id: classificationId, // kbli_2020_A
  type: kbliType,
  lang: DataLanguage.id,
);

if (result.data.isNotEmpty) {
  final classification = result.data.first;
  
  print('=== Statistical Classification Details ===');
  print('Classification ID: ${classification.id}');
  print('Title: ${classification.title}');
  print('Type: ${classification.type?.value ?? 'Not specified'}');
  print('Level: ${classification.level?.value ?? 'Not specified'}');
  
  // Classification metadata
  print('\n=== Classification Metadata ===');
  print('Source: ${classification.source}');
  print('Description: ${classification.description}');
  print('Last Update: ${classification.lastUpdate}');
  print('Release Date: ${classification.releaseDate}');
  
  // Publication information
  print('\n=== Publication Information ===');
  print('ISBN: ${classification.isbn ?? 'Not available'}');
  print('ISSN: ${classification.issn ?? 'Not available'}');
  print('Catalogue Number: ${classification.catalogueNumber ?? 'Not assigned'}');
  print('Publication Number: ${classification.publicationNumber ?? 'Not assigned'}');
  
  // Hierarchical relationships
  print('\n=== Hierarchical Relationships ===');
  print('Previous Classifications: ${classification.previous.length}');
  print('Derived Classifications: ${classification.derived.length}');
  
  if (classification.previous.isNotEmpty) {
    print('\nPrevious Classifications:');
    for (final prev in classification.previous.take(3)) {
      print('  • ${prev.code}: ${prev.title}');
    }
  }
  
  if (classification.derived.isNotEmpty) {
    print('\nDerived Classifications:');
    for (final derived in classification.derived.take(3)) {
      print('  • ${derived.code}: ${derived.title}');
    }
  }
  
  // Additional information
  print('\n=== Additional Information ===');
  print('Flag Status: ${classification.flag ? 'Active' : 'Inactive'}');
  print('Tags: ${classification.tags.join(', ')}');
  print('Location: ${classification.location ?? 'Not specified'}');
  print('URL: ${classification.url ?? 'Not available'}');
  print('MFD: ${classification.mfd ?? 'Not available'}');
  
} else {
  print('No classification data found');
}

// Display pagination information
print('\n=== Pagination Information ===');
print('Current Page: ${result.pagination.page}');
print('Total Pages: ${result.pagination.pages}');
print('Items per Page: ${result.pagination.perPage}');
print('Total Items: ${result.pagination.total}');
```

### 2. Classification Hierarchy Analysis Workflow

```dart
// Comprehensive classification hierarchy analysis and exploration
class ClassificationHierarchyAnalyzer {
  static Future<void> analyzeClassificationHierarchy(
    ClassificationType classificationType,
    String baseCode,
  ) async {
    try {
      print('=== Classification Hierarchy Analysis ===');
      print('Type: ${classificationType.value}');
      print('Base Code: $baseCode');
      
      // 1. Get base classification
      final baseId = classificationType.urlParamGenerator(baseCode);
      final baseResult = await StadataFlutter.instance.view.statisticClassifications(
        id: baseId,
        type: classificationType,
        lang: DataLanguage.id,
      );
      
      if (baseResult.data.isEmpty) {
        print('Base classification not found');
        return;
      }
      
      final baseClassification = baseResult.data.first;
      
      print('\n--- Base Classification ---');
      print('Title: ${baseClassification.title}');
      print('Level: ${baseClassification.level?.value ?? 'Unknown'}');
      print('Description: ${baseClassification.description}');
      
      // 2. Analyze hierarchical structure
      final hierarchyAnalysis = <String, dynamic>{
        'baseClassification': baseClassification,
        'previousCount': baseClassification.previous.length,
        'derivedCount': baseClassification.derived.length,
        'totalRelated': baseClassification.previous.length + baseClassification.derived.length,
      };
      
      // 3. Explore previous classifications (parent hierarchy)
      if (baseClassification.previous.isNotEmpty) {
        print('\n--- Parent Hierarchy Analysis ---');
        print('Previous classifications: ${baseClassification.previous.length}');
        
        for (final previous in baseClassification.previous.take(5)) {
          print('\nParent: ${previous.code}');
          print('  Title: ${previous.title}');
          print('  Description: ${previous.description}');
          
          // Get detailed information for parent
          final parentId = classificationType.urlParamGenerator(previous.code);
          final parentResult = await StadataFlutter.instance.view.statisticClassifications(
            id: parentId,
            type: classificationType,
            lang: DataLanguage.id,
          );
          
          if (parentResult.data.isNotEmpty) {
            final parentDetail = parentResult.data.first;
            print('  Level: ${parentDetail.level?.value ?? 'Unknown'}');
            print('  Last Updated: ${parentDetail.lastUpdate}');
            print('  Children Count: ${parentDetail.derived.length}');
          }
          
          await Future.delayed(Duration(milliseconds: 300));
        }
      }
      
      // 4. Explore derived classifications (child hierarchy)
      if (baseClassification.derived.isNotEmpty) {
        print('\n--- Child Hierarchy Analysis ---');
        print('Derived classifications: ${baseClassification.derived.length}');
        
        final childAnalysis = <Map<String, dynamic>>[];
        
        for (final derived in baseClassification.derived.take(5)) {
          print('\nChild: ${derived.code}');
          print('  Title: ${derived.title}');
          print('  Description: ${derived.description}');
          
          // Get detailed information for child
          final childId = classificationType.urlParamGenerator(derived.code);
          final childResult = await StadataFlutter.instance.view.statisticClassifications(
            id: childId,
            type: classificationType,
            lang: DataLanguage.id,
          );
          
          if (childResult.data.isNotEmpty) {
            final childDetail = childResult.data.first;
            print('  Level: ${childDetail.level?.value ?? 'Unknown'}');
            print('  Last Updated: ${childDetail.lastUpdate}');
            print('  Further Children: ${childDetail.derived.length}');
            
            childAnalysis.add({
              'code': derived.code,
              'title': derived.title,
              'level': childDetail.level?.value,
              'childCount': childDetail.derived.length,
              'lastUpdate': childDetail.lastUpdate,
            });
          }
          
          await Future.delayed(Duration(milliseconds: 300));
        }
        
        // 5. Child classification analysis
        print('\n--- Child Classification Summary ---');
        final avgChildCount = childAnalysis.isNotEmpty
            ? childAnalysis.map((c) => c['childCount'] as int).reduce((a, b) => a + b) / childAnalysis.length
            : 0.0;
        
        final recentlyUpdated = childAnalysis.where((c) => 
            (c['lastUpdate'] as DateTime).isAfter(DateTime.now().subtract(Duration(days: 365)))
        ).length;
        
        print('Average children per classification: ${avgChildCount.toStringAsFixed(1)}');
        print('Recently updated children: $recentlyUpdated/${childAnalysis.length}');
        
        // Level distribution
        final levelDistribution = <String?, int>{};
        for (final child in childAnalysis) {
          final level = child['level'] as String?;
          levelDistribution[level] = (levelDistribution[level] ?? 0) + 1;
        }
        
        print('\nLevel Distribution:');
        for (final entry in levelDistribution.entries) {
          final level = entry.key ?? 'Unknown';
          print('  $level: ${entry.value} classifications');
        }
      }
      
      // 6. Hierarchy summary
      print('\n=== Hierarchy Analysis Summary ===');
      print('Base: ${baseClassification.title} (${baseClassification.id})');
      print('Total previous: ${hierarchyAnalysis['previousCount']}');
      print('Total derived: ${hierarchyAnalysis['derivedCount']}');
      print('Total related: ${hierarchyAnalysis['totalRelated']}');
      print('Classification level: ${baseClassification.level?.value ?? 'Unknown'}');
      print('Last updated: ${baseClassification.lastUpdate}');
      print('Flag status: ${baseClassification.flag ? 'Active' : 'Inactive'}');
      
    } catch (e) {
      print('Hierarchy analysis error: $e');
    }
  }
}
```

### 3. Cross-Classification Comparison and Analysis

```dart
// Comprehensive comparison between different classification systems and versions
class ClassificationComparator {
  static Future<void> compareClassificationVersions(
    List<ClassificationType> types,
    String baseCode,
  ) async {
    try {
      print('=== Classification Version Comparison ===');
      print('Comparing ${types.length} classification versions for code: $baseCode');
      
      final versionAnalysis = <Map<String, dynamic>>[];
      
      // 1. Load all classification versions
      for (final type in types) {
        print('\n--- Loading ${type.value} ---');
        
        final classificationId = type.urlParamGenerator(baseCode);
        final result = await StadataFlutter.instance.view.statisticClassifications(
          id: classificationId,
          type: type,
          lang: DataLanguage.id,
        );
        
        if (result.data.isNotEmpty) {
          final classification = result.data.first;
          
          final analysis = {
            'type': type.value,
            'year': type is KBLIType ? type.year : (type as KBKIType).year,
            'classification': classification,
            'title': classification.title,
            'description': classification.description,
            'level': classification.level?.value,
            'previousCount': classification.previous.length,
            'derivedCount': classification.derived.length,
            'lastUpdate': classification.lastUpdate,
            'releaseDate': classification.releaseDate,
            'tags': classification.tags,
            'hasISBN': classification.isbn != null,
            'hasISSN': classification.issn != null,
          };
          
          versionAnalysis.add(analysis);
          
          print('Found: ${classification.title}');
          print('Level: ${classification.level?.value ?? 'Unknown'}');
          print('Previous: ${classification.previous.length}, Derived: ${classification.derived.length}');
          
        } else {
          print('No data found for ${type.value}');
        }
        
        await Future.delayed(Duration(milliseconds: 400));
      }
      
      if (versionAnalysis.isEmpty) {
        print('No classification data found for any version');
        return;
      }
      
      // 2. Comparative analysis
      print('\n=== Version Comparison Analysis ===');
      
      // Timeline analysis
      versionAnalysis.sort((a, b) => (a['year'] as int).compareTo(b['year'] as int));
      
      print('Chronological Evolution:');
      for (final analysis in versionAnalysis) {
        print('${analysis['year']}: ${analysis['title']}');
        print('  Release: ${analysis['releaseDate']}');
        print('  Last Update: ${analysis['lastUpdate']}');
        print('  Hierarchy: ${analysis['previousCount']} previous, ${analysis['derivedCount']} derived');
      }
      
      // 3. Content evolution analysis
      print('\n=== Content Evolution Analysis ===');
      
      // Title evolution
      final titles = versionAnalysis.map((a) => a['title'] as String).toSet();
      if (titles.length > 1) {
        print('Title Changes Detected:');
        for (int i = 0; i < versionAnalysis.length; i++) {
          print('  ${versionAnalysis[i]['year']}: ${versionAnalysis[i]['title']}');
        }
      } else {
        print('Title Consistency: Maintained across all versions');
      }
      
      // Description analysis
      final descriptions = versionAnalysis.map((a) => a['description'] as String).toSet();
      print('\nDescription Evolution:');
      if (descriptions.length > 1) {
        print('Descriptions have evolved across versions');
        for (int i = 0; i < versionAnalysis.length; i++) {
          final desc = versionAnalysis[i]['description'] as String;
          final preview = desc.length > 100 ? '${desc.substring(0, 100)}...' : desc;
          print('  ${versionAnalysis[i]['year']}: $preview');
        }
      } else {
        print('Description consistency maintained');
      }
      
      // 4. Hierarchy evolution
      print('\n=== Hierarchy Evolution ===');
      
      final hierarchyChanges = <String, List<int>>{
        'previous': versionAnalysis.map((a) => a['previousCount'] as int).toList(),
        'derived': versionAnalysis.map((a) => a['derivedCount'] as int).toList(),
      };
      
      for (final entry in hierarchyChanges.entries) {
        print('${entry.key.toUpperCase()} Classifications:');
        for (int i = 0; i < versionAnalysis.length; i++) {
          print('  ${versionAnalysis[i]['year']}: ${entry.value[i]}');
        }
        
        final trend = _calculateTrend(entry.value);
        print('  Trend: $trend');
      }
      
      // 5. Metadata completeness comparison
      print('\n=== Metadata Completeness ===');
      
      final completenessMetrics = {
        'ISBN Available': versionAnalysis.where((a) => a['hasISBN']).length,
        'ISSN Available': versionAnalysis.where((a) => a['hasISSN']).length,
        'Has Tags': versionAnalysis.where((a) => (a['tags'] as List<String>).isNotEmpty).length,
        'Has Level': versionAnalysis.where((a) => a['level'] != null).length,
      };
      
      for (final entry in completenessMetrics.entries) {
        final percentage = (entry.value / versionAnalysis.length * 100).toStringAsFixed(1);
        print('${entry.key}: ${entry.value}/${versionAnalysis.length} (${percentage}%)');
      }
      
      // 6. Recommendations
      print('\n=== Version Recommendations ===');
      
      final latestVersion = versionAnalysis.last;
      final oldestVersion = versionAnalysis.first;
      
      print('Latest Version: ${latestVersion['type']} (${latestVersion['year']})');
      print('Recommended for: Current statistical operations and new implementations');
      
      if (versionAnalysis.length > 1) {
        final hierarchyGrowth = (latestVersion['derivedCount'] as int) - (oldestVersion['derivedCount'] as int);
        if (hierarchyGrowth > 0) {
          print('Evolution: Classification has expanded by $hierarchyGrowth derived items');
        } else if (hierarchyGrowth < 0) {
          print('Evolution: Classification has been simplified by ${hierarchyGrowth.abs()} items');
        } else {
          print('Evolution: Classification structure remains stable');
        }
      }
      
    } catch (e) {
      print('Version comparison error: $e');
    }
  }
  
  static String _calculateTrend(List<int> values) {
    if (values.length < 2) return 'Insufficient data';
    
    final increases = <int>[];
    final decreases = <int>[];
    
    for (int i = 1; i < values.length; i++) {
      final change = values[i] - values[i - 1];
      if (change > 0) increases.add(change);
      if (change < 0) decreases.add(change.abs());
    }
    
    if (increases.length > decreases.length) {
      return 'Generally increasing';
    } else if (decreases.length > increases.length) {
      return 'Generally decreasing';
    } else {
      return 'Stable with variations';
    }
  }
}
```

### 4. Classification Validation and Code Analysis

```dart
// Comprehensive classification code validation and analysis system
class ClassificationValidator {
  static Future<void> validateAndAnalyzeClassificationCodes(
    ClassificationType type,
    List<String> codes,
  ) async {
    try {
      print('=== Classification Code Validation ===');
      print('Type: ${type.value}');
      print('Validating ${codes.length} codes...');
      
      final validationResults = <Map<String, dynamic>>[];
      
      // 1. Validate each code
      for (final code in codes) {
        print('\n--- Validating Code: $code ---');
        
        // Format validation
        final formatValid = _validateCodeFormat(type, code);
        print('Format Valid: ${formatValid ? '✓' : '✗'}');
        
        if (!formatValid) {
          validationResults.add({
            'code': code,
            'formatValid': false,
            'exists': false,
            'classification': null,
            'level': null,
          });
          continue;
        }
        
        // Existence validation
        final classificationId = type.urlParamGenerator(code);
        final result = await StadataFlutter.instance.view.statisticClassifications(
          id: classificationId,
          type: type,
          lang: DataLanguage.id,
        );
        
        final exists = result.data.isNotEmpty;
        print('Exists in System: ${exists ? '✓' : '✗'}');
        
        if (exists) {
          final classification = result.data.first;
          print('Title: ${classification.title}');
          print('Level: ${classification.level?.value ?? 'Unknown'}');
          print('Last Updated: ${classification.lastUpdate}');
          print('Active: ${classification.flag ? '✓' : '✗'}');
          
          validationResults.add({
            'code': code,
            'formatValid': true,
            'exists': true,
            'classification': classification,
            'level': classification.level?.value,
            'title': classification.title,
            'active': classification.flag,
            'lastUpdate': classification.lastUpdate,
            'hierarchySize': classification.previous.length + classification.derived.length,
          });
        } else {
          validationResults.add({
            'code': code,
            'formatValid': true,
            'exists': false,
            'classification': null,
            'level': null,
          });
        }
        
        await Future.delayed(Duration(milliseconds: 300));
      }
      
      // 2. Validation summary
      print('\n=== Validation Summary ===');
      
      final validFormat = validationResults.where((r) => r['formatValid']).length;
      final existsInSystem = validationResults.where((r) => r['exists']).length;
      final activeItems = validationResults.where((r) => r['active'] == true).length;
      
      print('Format Valid: $validFormat/${codes.length}');
      print('Exists in System: $existsInSystem/${codes.length}');
      print('Active Classifications: $activeItems/${codes.length}');
      
      // 3. Level distribution analysis
      final levelDistribution = <String?, int>{};
      for (final result in validationResults.where((r) => r['exists'])) {
        final level = result['level'] as String?;
        levelDistribution[level] = (levelDistribution[level] ?? 0) + 1;
      }
      
      if (levelDistribution.isNotEmpty) {
        print('\nLevel Distribution:');
        for (final entry in levelDistribution.entries) {
          final level = entry.key ?? 'Unknown';
          print('  $level: ${entry.value} codes');
        }
      }
      
      // 4. Hierarchy analysis
      final hierarchyAnalysis = validationResults
          .where((r) => r['exists'])
          .map((r) => r['hierarchySize'] as int)
          .toList();
      
      if (hierarchyAnalysis.isNotEmpty) {
        final avgHierarchy = hierarchyAnalysis.reduce((a, b) => a + b) / hierarchyAnalysis.length;
        final maxHierarchy = hierarchyAnalysis.reduce((a, b) => a > b ? a : b);
        final minHierarchy = hierarchyAnalysis.reduce((a, b) => a < b ? a : b);
        
        print('\nHierarchy Analysis:');
        print('Average hierarchy size: ${avgHierarchy.toStringAsFixed(1)}');
        print('Maximum hierarchy size: $maxHierarchy');
        print('Minimum hierarchy size: $minHierarchy');
      }
      
      // 5. Recency analysis
      final recentUpdates = validationResults
          .where((r) => r['exists'])
          .where((r) => (r['lastUpdate'] as DateTime).isAfter(DateTime.now().subtract(Duration(days: 365))))
          .length;
      
      print('\nRecency Analysis:');
      print('Updated in last year: $recentUpdates/$existsInSystem');
      
      // 6. Invalid codes report
      final invalidCodes = validationResults.where((r) => !r['exists'] || !r['formatValid']).toList();
      
      if (invalidCodes.isNotEmpty) {
        print('\n=== Invalid Codes Report ===');
        for (final invalid in invalidCodes) {
          print('Code: ${invalid['code']}');
          if (!invalid['formatValid']) {
            print('  Issue: Invalid format for ${type.value}');
          } else {
            print('  Issue: Not found in classification system');
          }
        }
      }
      
      // 7. Recommendations
      print('\n=== Validation Recommendations ===');
      
      if (existsInSystem == codes.length) {
        print('✅ All codes are valid and exist in the system');
      } else {
        print('⚠️  ${codes.length - existsInSystem} codes need attention');
      }
      
      if (activeItems < existsInSystem) {
        print('⚠️  ${existsInSystem - activeItems} codes are inactive');
      }
      
      if (recentUpdates < existsInSystem * 0.8) {
        print('📅 Consider checking for updated classification versions');
      }
      
    } catch (e) {
      print('Validation error: $e');
    }
  }
  
  static bool _validateCodeFormat(ClassificationType type, String code) {
    if (type is KBLIType) {
      // KBLI validation based on level
      if (code.length == 1 && RegExp(r'^[A-U]$').hasMatch(code)) {
        return true; // Category
      }
      if (code.length == 2 && RegExp(r'^\d{2}$').hasMatch(code)) {
        return true; // Primary Group
      }
      if (code.length == 3 && RegExp(r'^\d{3}$').hasMatch(code)) {
        return true; // Group
      }
      if (code.length == 4 && RegExp(r'^\d{4}$').hasMatch(code)) {
        return true; // Sub-Group
      }
      if (code.length == 5 && RegExp(r'^\d{5}$').hasMatch(code)) {
        return true; // Cluster
      }
    } else if (type is KBKIType) {
      // KBKI validation based on level
      if (code.length == 1 && RegExp(r'^[0-4]$').hasMatch(code)) {
        return true; // Section
      }
      if (code.length == 2 && RegExp(r'^\d{2}$').hasMatch(code)) {
        return true; // Division
      }
      if (code.length >= 3 && code.length <= 10 && RegExp(r'^\d+$').hasMatch(code)) {
        return true; // Group through Commodity
      }
    }
    
    return false;
  }
}
```

## Statistical Classification Workflow Integration

Typical workflow for working with statistical classifications effectively:

1. **Classification Discovery**: Identify appropriate classification type and version for your use case
2. **Hierarchy Exploration**: Navigate through classification levels to find specific codes
3. **Code Validation**: Verify code format and existence in the classification system
4. **Relationship Analysis**: Examine hierarchical relationships and cross-references
5. **Version Management**: Track classification updates and version changes

### Integration with Economic Analysis

```dart
// Building comprehensive economic analysis using statistical classifications
Future<void> buildEconomicAnalysisWorkflow(String economicSector) async {
  try {
    // 1. Find KBLI classifications for the economic sector
    const kbliType = KBLIType.y2020;
    
    // Start with category level
    final categoryResult = await StadataFlutter.instance.view.statisticClassifications(
      id: kbliType.urlParamGenerator(economicSector), // e.g., 'C' for Manufacturing
      type: kbliType,
    );
    
    if (categoryResult.data.isEmpty) {
      print('Economic sector not found: $economicSector');
      return;
    }
    
    final category = categoryResult.data.first;
    
    print('=== Economic Sector Analysis: ${category.title} ===');
    print('Category: ${category.id}');
    print('Description: ${category.description}');
    print('Sub-classifications: ${category.derived.length}');
    
    // 2. Analyze sub-categories
    final subCategoryAnalysis = <Map<String, dynamic>>[];
    
    for (final derived in category.derived.take(10)) {
      final subCatResult = await StadataFlutter.instance.view.statisticClassifications(
        id: kbliType.urlParamGenerator(derived.code),
        type: kbliType,
      );
      
      if (subCatResult.data.isNotEmpty) {
        final subCategory = subCatResult.data.first;
        subCategoryAnalysis.add({
          'code': derived.code,
          'title': derived.title,
          'description': derived.description,
          'furtherBreakdown': subCategory.derived.length,
          'lastUpdate': subCategory.lastUpdate,
        });
        
        print('\nSub-category: ${derived.code} - ${derived.title}');
        print('  Further breakdown: ${subCategory.derived.length} items');
        print('  Last updated: ${subCategory.lastUpdate}');
      }
      
      await Future.delayed(Duration(milliseconds: 200));
    }
    
    // 3. Economic sector summary
    print('\n=== Economic Sector Summary ===');
    print('Total analyzed sub-categories: ${subCategoryAnalysis.length}');
    
    final totalBreakdown = subCategoryAnalysis.fold(0, (sum, item) => sum + (item['furtherBreakdown'] as int));
    print('Total detailed classifications: $totalBreakdown');
    
    final avgBreakdown = subCategoryAnalysis.isNotEmpty 
        ? totalBreakdown / subCategoryAnalysis.length 
        : 0.0;
    print('Average classifications per sub-category: ${avgBreakdown.toStringAsFixed(1)}');
    
    // Recent updates
    final recentUpdates = subCategoryAnalysis.where((item) => 
        (item['lastUpdate'] as DateTime).isAfter(DateTime.now().subtract(Duration(days: 365)))
    ).length;
    
    print('Recently updated sub-categories: $recentUpdates/${subCategoryAnalysis.length}');
    
  } catch (e) {
    print('Economic analysis workflow error: $e');
  }
}
```

## Error Handling

The View Statistical Classification API returns paginated results with statistical classification data and may throw specific exceptions:

- **StatisticClassificationException**: Classification-specific errors (invalid ID, type mismatches, access restrictions)
- **ApiException**: General API communication errors (network issues, server errors, rate limiting)
- **ApiKeyNotFoundException**: Authentication errors (invalid or missing API key)
- **ValidationException**: Parameter validation errors (invalid classification codes, malformed parameters)

```dart
try {
  const kbliType = KBLIType.y2020;
  final result = await StadataFlutter.instance.view.statisticClassifications(
    id: kbliType.urlParamGenerator('A'),
    type: kbliType,
    lang: DataLanguage.id,
  );
  
  if (result.data.isNotEmpty) {
    // Successfully retrieved classification data
    final classification = result.data.first;
    print('Classification: ${classification.title}');
    print('Type: ${classification.type?.value ?? 'Unknown'}');
    print('Level: ${classification.level?.value ?? 'Unknown'}');
    print('Hierarchical relationships: ${classification.previous.length + classification.derived.length}');
  } else {
    // No classification data found
    print('Classification not found - may be invalid code or restricted access');
  }
  
} on StatisticClassificationException catch (e) {
  print('Classification error: ${e.message}');
  // Handle classification-specific errors like invalid codes or type mismatches
  
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

- **Rate Limiting**: Implement appropriate delays between requests, especially for hierarchy traversal
- **Caching Strategy**: Cache classification metadata and hierarchical relationships
- **Batch Processing**: Process multiple classifications efficiently with proper rate limiting
- **Memory Management**: Be mindful of memory usage when processing large classification hierarchies
- **Version Management**: Consider classification version compatibility for historical analysis
- **Code Validation**: Implement client-side code format validation before API calls

## Properties (StatisticClassification)

| Property | Type | Description |
| -------- | ---- | ----------- |
| `id` | `String` | Unique identifier for the statistical classification |
| `type` | `ClassificationType?` | Classification type (KBLI or KBKI) with version (optional) |
| `level` | `ClassificationLevel?` | Hierarchical level within the classification system (optional) |
| `source` | `String` | Data source and origin information |
| `title` | `String` | Complete title or name of the classification |
| `description` | `String` | Detailed description of the classification and its scope |
| `isbn` | `String?` | International Standard Book Number (optional) |
| `issn` | `String?` | International Standard Serial Number (optional) |
| `catalogueNumber` | `String?` | BPS internal catalogue reference number (optional) |
| `publicationNumber` | `String?` | Official publication series number (optional) |
| `lastUpdate` | `DateTime` | Timestamp of the most recent classification update |
| `releaseDate` | `DateTime` | Original release date of the classification |
| `location` | `String?` | Geographic or administrative location context (optional) |
| `url` | `String?` | Direct URL to classification documentation or resources (optional) |
| `mfd` | `String?` | Metadata or format description information (optional) |
| `previous` | `List<ClassificationItem>` | List of parent or previous level classifications in hierarchy |
| `derived` | `List<ClassificationItem>` | List of child or derived classifications in hierarchy |
| `flag` | `bool` | Active status flag indicating whether classification is currently valid |
| `tags` | `List<String>` | List of descriptive tags and keywords for classification |

## Properties (ClassificationItem)

| Property | Type | Description |
| -------- | ---- | ----------- |
| `code` | `String` | Unique classification code identifier |
| `title` | `String` | Complete title or name of the classification item |
| `description` | `String` | Detailed description of the classification item scope and meaning |