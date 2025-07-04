# Subject Categories

The Subject Categories API provides access to the high-level organizational framework used by BPS (Badan Pusat Statistik) Indonesia to group related statistical subjects into coherent thematic areas. Subject categories represent the broadest level of thematic classification in Indonesia's statistical system, serving as umbrella groupings that contain multiple related subjects.

Understanding subject categories is fundamental for navigating Indonesia's statistical landscape efficiently. These categories provide the organizational backbone that helps users discover related statistical content, understand thematic relationships, and build comprehensive analytical frameworks across different areas of statistical inquiry.

## Understanding BPS Subject Categories

Subject categories provide the highest level of thematic organization:

- **Thematic Umbrella**: Broad groupings that encompass related statistical domains
- **Navigation Structure**: Primary organizational framework for content discovery
- **Analytical Framework**: Foundation for cross-subject statistical analysis
- **Content Organization**: Systematic grouping of subjects by thematic similarity
- **Research Guidance**: Framework for understanding statistical domain relationships

## Category System Structure

BPS subject categories are designed to reflect major areas of statistical inquiry:

- **Economic Categories**: Groupings related to economic activities, indicators, and analysis
- **Social Categories**: Categories covering demographic, education, health, and welfare subjects
- **Environmental Categories**: Groupings for environmental, natural resources, and sustainability subjects
- **Administrative Categories**: Categories for governance, public administration, and institutional subjects
- **Cross-cutting Categories**: Interdisciplinary categories that span multiple domains

## Parameters

| Parameter | Type           | Description                                                         |
| --------- | -------------- | ------------------------------------------------------------------- |
| `domain`  | `String`       | Domain code (region) for retrieving subject categories **(required)** |
| `lang`    | `DataLanguage` | Language for subject categories data (default: `DataLanguage.id`) |

## Examples

### 1. Get All Subject Categories for a Domain

```dart
// Fetch subject categories from Central Java BPS
final subjectCategoryResult = await StadataFlutter.instance.list.subjectCategories(
  domain: '3300', // Central Java domain code
  lang: DataLanguage.id,
);

final subjectCategoryList = subjectCategoryResult.data;
final pagination = subjectCategoryResult.pagination;

// Print pagination information
print('Current Page: ${pagination.page}');
print('Total Pages: ${pagination.pages}');
print('Data Count in This Page: ${pagination.count}');
print('Per Page: ${pagination.perPage}');
print('Total: ${pagination.total}');
print('------------------------');

// Print retrieved subject category data
for (final subjectCategory in subjectCategoryList) {
  print('Subject Category ID: ${subjectCategory.id}');
  print('Subject Category Name: ${subjectCategory.name}');
  print('------------------------');
}
```

### 2. Compare Categories Across Domains

```dart
// Compare subject categories between different regions
class CategoryComparator {
  static Future<void> compareSubjectCategories() async {
    final domains = ['0000', '3100', '3200', '3300']; // National, Jakarta, West Java, Central Java
    final domainCategories = <String, List<SubjectCategory>>{};
    
    for (final domain in domains) {
      final categories = await StadataFlutter.instance.list.subjectCategories(
        domain: domain,
        lang: DataLanguage.id,
      );
      domainCategories[domain] = categories.data;
      
      await Future.delayed(Duration(milliseconds: 300));
    }
    
    print('=== Subject Category Distribution ===');
    for (final entry in domainCategories.entries) {
      print('Domain ${entry.key}: ${entry.value.length} categories');
      for (final category in entry.value) {
        print('  - ${category.name} (ID: ${category.id})');
      }
      print('------------------------');
    }
    
    // Find common categories across domains
    final nationalCategories = domainCategories['0000'] ?? [];
    print('\\n=== Category Availability Analysis ===');
    
    for (final nationalCategory in nationalCategories) {
      print('Category: ${nationalCategory.name}');
      for (final entry in domainCategories.entries) {
        if (entry.key != '0000') {
          final hasCategory = entry.value.any((cat) => cat.id == nationalCategory.id);
          print('  ${entry.key}: ${hasCategory ? 'Available' : 'Not Available'}');
        }
      }
      print('---');
    }
  }
}
```

### 3. Build Category-Based Subject Discovery

```dart
// Use categories to discover and organize subjects
class CategoryBasedSubjectExplorer {
  static Future<void> exploreSubjectsByCategory(String domain) async {
    try {
      // 1. Get all subject categories
      final categories = await StadataFlutter.instance.list.subjectCategories(
        domain: domain,
        lang: DataLanguage.id,
      );
      
      print('=== Category-Based Subject Discovery ===');
      print('Available Categories: ${categories.data.length}');
      
      // 2. For each category, get its subjects
      for (final category in categories.data) {
        print('\\n=== Category: ${category.name} (ID: ${category.id}) ===');
        
        // Get subjects in this category
        final subjects = await StadataFlutter.instance.list.subjects(
          domain: domain,
          lang: DataLanguage.id,
          subjectCategoryId: category.id,
        );
        
        print('Subjects in category: ${subjects.data.length}');
        
        // Calculate category statistics
        final totalTables = subjects.data
            .map((s) => s.nTable ?? 0)
            .fold(0, (a, b) => a + b);
        
        print('Total tables in category: $totalTables');
        
        // Show top subjects by table count
        final topSubjects = subjects.data
            .where((s) => s.nTable != null && s.nTable! > 0)
            .toList()
          ..sort((a, b) => (b.nTable ?? 0).compareTo(a.nTable ?? 0));
        
        print('Top subjects:');
        for (final subject in topSubjects.take(3)) {
          print('  • ${subject.name}: ${subject.nTable} tables');
        }
        
        if (topSubjects.isEmpty) {
          print('  No subjects with data tables available');
        }
        
        await Future.delayed(Duration(milliseconds: 200));
      }
      
    } catch (e) {
      print('Category exploration error: $e');
    }
  }
}
```

### 4. Category-Based Content Analysis

```dart
// Analyze content distribution across categories
class CategoryContentAnalyzer {
  static Future<void> analyzeCategoryContent(String domain) async {
    try {
      // Get categories and their associated content
      final categories = await StadataFlutter.instance.list.subjectCategories(
        domain: domain,
        lang: DataLanguage.id,
      );
      
      final categoryAnalysis = <String, Map<String, dynamic>>{};
      
      for (final category in categories.data) {
        // Get subjects for this category
        final subjects = await StadataFlutter.instance.list.subjects(
          domain: domain,
          lang: DataLanguage.id,
          subjectCategoryId: category.id,
        );
        
        // Calculate category metrics
        final subjectCount = subjects.data.length;
        final totalTables = subjects.data
            .map((s) => s.nTable ?? 0)
            .fold(0, (a, b) => a + b);
        
        final subjectsWithData = subjects.data
            .where((s) => s.nTable != null && s.nTable! > 0)
            .length;
        
        final avgTablesPerSubject = subjectCount > 0 ? totalTables / subjectCount : 0.0;
        
        categoryAnalysis[category.name] = {
          'id': category.id,
          'subjectCount': subjectCount,
          'totalTables': totalTables,
          'subjectsWithData': subjectsWithData,
          'avgTablesPerSubject': avgTablesPerSubject,
          'dataRichness': subjectCount > 0 ? (subjectsWithData / subjectCount) : 0.0,
        };
        
        await Future.delayed(Duration(milliseconds: 200));
      }
      
      // Generate analysis report
      print('=== Category Content Analysis ===');
      final sortedCategories = categoryAnalysis.entries.toList()
        ..sort((a, b) => (b.value['totalTables'] as int).compareTo(a.value['totalTables'] as int));
      
      for (final entry in sortedCategories) {
        final categoryName = entry.key;
        final stats = entry.value;
        
        print('📁 $categoryName');
        print('   Subjects: ${stats['subjectCount']}');
        print('   Total Tables: ${stats['totalTables']}');
        print('   Subjects with Data: ${stats['subjectsWithData']}');
        print('   Avg Tables/Subject: ${(stats['avgTablesPerSubject'] as double).toStringAsFixed(1)}');
        print('   Data Richness: ${((stats['dataRichness'] as double) * 100).toStringAsFixed(1)}%');
        
        // Category quality indicators
        if (stats['totalTables'] as int > 50) {
          print('   🌟 High-content category');
        }
        if ((stats['dataRichness'] as double) > 0.8) {
          print('   💎 High data coverage');
        }
        
        print('');
      }
      
    } catch (e) {
      print('Category analysis error: $e');
    }
  }
}
```

### 5. Build Hierarchical Navigation System

```dart
// Create a complete hierarchical navigation based on categories and subjects
class HierarchicalNavigationBuilder {
  static Future<Map<String, dynamic>> buildCompleteNavigation(String domain) async {
    final navigationTree = <String, dynamic>{};
    
    try {
      // Get all categories
      final categories = await StadataFlutter.instance.list.subjectCategories(
        domain: domain,
        lang: DataLanguage.id,
      );
      
      navigationTree['domain'] = domain;
      navigationTree['totalCategories'] = categories.data.length;
      navigationTree['categories'] = <Map<String, dynamic>>[];
      
      for (final category in categories.data) {
        // Get subjects for this category
        final subjects = await StadataFlutter.instance.list.subjects(
          domain: domain,
          lang: DataLanguage.id,
          subjectCategoryId: category.id,
        );
        
        // Build category node
        final categoryNode = <String, dynamic>{
          'id': category.id,
          'name': category.name,
          'subjectCount': subjects.data.length,
          'subjects': <Map<String, dynamic>>[],
        };
        
        // Add subjects to category
        for (final subject in subjects.data) {
          categoryNode['subjects'].add({
            'id': subject.id,
            'name': subject.name,
            'tableCount': subject.nTable ?? 0,
            'hasData': (subject.nTable ?? 0) > 0,
          });
        }
        
        // Calculate category totals
        final totalTables = subjects.data
            .map((s) => s.nTable ?? 0)
            .fold(0, (a, b) => a + b);
        
        categoryNode['totalTables'] = totalTables;
        
        (navigationTree['categories'] as List<Map<String, dynamic>>).add(categoryNode);
        
        await Future.delayed(Duration(milliseconds: 150));
      }
      
      // Calculate navigation statistics
      final allCategories = navigationTree['categories'] as List<Map<String, dynamic>>;
      final totalSubjects = allCategories
          .map((cat) => cat['subjectCount'] as int)
          .fold(0, (a, b) => a + b);
      
      final totalTables = allCategories
          .map((cat) => cat['totalTables'] as int)
          .fold(0, (a, b) => a + b);
      
      navigationTree['totalSubjects'] = totalSubjects;
      navigationTree['totalTables'] = totalTables;
      
      // Print navigation summary
      print('=== Hierarchical Navigation Summary ===');
      print('Domain: $domain');
      print('Categories: ${navigationTree['totalCategories']}');
      print('Total Subjects: $totalSubjects');
      print('Total Tables: $totalTables');
      print('');
      
      // Print category breakdown
      for (final category in allCategories) {
        print('📁 ${category['name']}');
        print('   Subjects: ${category['subjectCount']}');
        print('   Tables: ${category['totalTables']}');
        
        final subjects = category['subjects'] as List<Map<String, dynamic>>;
        final subjectsWithData = subjects.where((s) => s['hasData'] as bool).length;
        print('   Data Coverage: $subjectsWithData/${subjects.length} subjects');
        print('');
      }
      
      return navigationTree;
      
    } catch (e) {
      print('Navigation building error: $e');
      return {};
    }
  }
}
```

## Properties (SubjectCategory)

| Property | Type     | Description                                     |
| -------- | -------- | ----------------------------------------------- |
| `id`     | `int`    | Unique identifier for the subject category     |
| `name`   | `String` | Descriptive name of the subject category       |

## Common Subject Category Types

### Economic Categories
- **Macroeconomic Indicators**: National and regional economic performance metrics
- **Sectoral Economics**: Industry-specific economic data and analysis
- **Trade and Commerce**: Commercial activities, trade balances, market statistics
- **Financial Statistics**: Banking, monetary policy, capital market indicators
- **Labor and Employment**: Workforce statistics, employment trends, wage data

### Social and Demographic Categories
- **Population and Demographics**: Population statistics, demographic trends, migration
- **Education and Human Development**: Educational statistics, literacy, skills development
- **Health and Welfare**: Healthcare indicators, public health statistics, social welfare
- **Housing and Urban Development**: Housing conditions, urban planning, infrastructure
- **Social Services**: Public services, community programs, social assistance

### Environmental and Resource Categories
- **Natural Resources**: Environmental statistics, resource utilization, conservation
- **Agriculture and Food**: Agricultural production, food security, rural development
- **Energy and Utilities**: Energy production, consumption, utility services
- **Transportation**: Transportation infrastructure, mobility, logistics
- **Technology and Innovation**: ICT statistics, digital transformation, innovation metrics

### Governance and Administrative Categories
- **Public Administration**: Government operations, administrative efficiency
- **Regional Development**: Local government statistics, regional planning
- **Justice and Security**: Legal system indicators, public safety, security statistics
- **International Relations**: International cooperation, diplomatic statistics

## Category Discovery Workflow

The typical workflow for using subject categories effectively:

1. **Category Overview**: Get all available categories for a domain
2. **Content Analysis**: Analyze subjects and data availability within each category
3. **Thematic Focus**: Select relevant categories for specific research needs
4. **Subject Exploration**: Use categories to discover related subjects
5. **Data Integration**: Combine data from multiple categories for comprehensive analysis

### Complete Category Management Example

```dart
// Comprehensive category management and utilization system
class SubjectCategoryManager {
  static Future<void> manageCompleteWorkflow() async {
    try {
      // 1. Multi-domain category analysis
      final domains = ['0000', '3100', '3200']; // National, Jakarta, West Java
      final domainAnalysis = <String, Map<String, dynamic>>{};
      
      for (final domain in domains) {
        final categories = await StadataFlutter.instance.list.subjectCategories(
          domain: domain,
          lang: DataLanguage.id,
        );
        
        // Build domain-specific category analysis
        final categoryData = <String, dynamic>{
          'totalCategories': categories.data.length,
          'categories': <Map<String, dynamic>>[],
        };
        
        for (final category in categories.data) {
          final subjects = await StadataFlutter.instance.list.subjects(
            domain: domain,
            lang: DataLanguage.id,
            subjectCategoryId: category.id,
          );
          
          final totalTables = subjects.data
              .map((s) => s.nTable ?? 0)
              .fold(0, (a, b) => a + b);
          
          categoryData['categories'].add({
            'id': category.id,
            'name': category.name,
            'subjectCount': subjects.data.length,
            'totalTables': totalTables,
          });
          
          await Future.delayed(Duration(milliseconds: 100));
        }
        
        domainAnalysis[domain] = categoryData;
      }
      
      // 2. Cross-domain comparison
      print('=== Cross-Domain Category Comparison ===');
      for (final entry in domainAnalysis.entries) {
        final domain = entry.key;
        final data = entry.value;
        
        print('Domain $domain:');
        print('  Categories: ${data['totalCategories']}');
        
        final categories = data['categories'] as List<Map<String, dynamic>>;
        final totalTables = categories
            .map((cat) => cat['totalTables'] as int)
            .fold(0, (a, b) => a + b);
        
        print('  Total Tables: $totalTables');
        
        // Find top category by content
        final topCategory = categories.isNotEmpty
            ? categories.reduce((a, b) => 
                (a['totalTables'] as int) > (b['totalTables'] as int) ? a : b)
            : null;
        
        if (topCategory != null) {
          print('  Top Category: ${topCategory['name']} (${topCategory['totalTables']} tables)');
        }
        
        print('');
      }
      
      // 3. Category utilization recommendations
      print('=== Category Utilization Recommendations ===');
      final nationalData = domainAnalysis['0000'];
      if (nationalData != null) {
        final nationalCategories = nationalData['categories'] as List<Map<String, dynamic>>;
        
        // Recommend high-content categories
        final highContentCategories = nationalCategories
            .where((cat) => (cat['totalTables'] as int) > 20)
            .toList()
          ..sort((a, b) => (b['totalTables'] as int).compareTo(a['totalTables'] as int));
        
        print('High-Content Categories (>20 tables):');
        for (final category in highContentCategories.take(5)) {
          print('  🌟 ${category['name']}: ${category['totalTables']} tables');
          print('     Subjects: ${category['subjectCount']}');
          print('     Recommended for: Comprehensive statistical analysis');
        }
        
        // Recommend emerging categories
        final emergingCategories = nationalCategories
            .where((cat) => (cat['subjectCount'] as int) > 3 && (cat['totalTables'] as int) < 20)
            .toList();
        
        if (emergingCategories.isNotEmpty) {
          print('\\nEmerging Categories (good subject coverage, developing data):');
          for (final category in emergingCategories.take(3)) {
            print('  🚀 ${category['name']}: ${category['subjectCount']} subjects');
            print('     Recommended for: Exploratory research and monitoring');
          }
        }
      }
      
    } catch (e) {
      print('Category management error: $e');
    }
  }
}
```

## Integration with Other APIs

### Building Category-Based Data Applications

```dart
// Create comprehensive data applications using category structure
Future<void> buildCategoryBasedDataApp(String domain) async {
  try {
    // Get categories as navigation structure
    final categories = await StadataFlutter.instance.list.subjectCategories(
      domain: domain,
      lang: DataLanguage.id,
    );
    
    print('=== Category-Based Data Application ===');
    
    for (final category in categories.data) {
      print('\\nProcessing Category: ${category.name}');
      
      // Get subjects in this category
      final subjects = await StadataFlutter.instance.list.subjects(
        domain: domain,
        lang: DataLanguage.id,
        subjectCategoryId: category.id,
      );
      
      // For each subject, gather related resources
      for (final subject in subjects.data.take(2)) { // Limit for demo
        print('  Subject: ${subject.name}');
        
        // Get variables for this subject
        final variables = await StadataFlutter.instance.list.variables(
          domain: domain,
          subjectID: subject.id,
          lang: DataLanguage.id,
        );
        
        // Get static tables for this subject
        final staticTables = await StadataFlutter.instance.list.staticTable(
          domain: domain,
          lang: DataLanguage.id,
        );
        
        final subjectTables = staticTables.data
            .where((table) => table.subjectId == subject.id)
            .length;
        
        print('    Variables: ${variables.data.length}');
        print('    Static Tables: $subjectTables');
        print('    Tables Available: ${subject.nTable ?? 0}');
        
        // This creates a complete data context for the category-subject hierarchy
        print('    → Ready for data analysis and visualization');
      }
      
      await Future.delayed(Duration(milliseconds: 300));
    }
    
  } catch (e) {
    print('Data application building error: $e');
  }
}
```

## Error Handling

Subject Categories API methods return `Future<ListResult<SubjectCategory>>` and may throw specific exceptions:

- `SubjectCategoryException`: Subject category-related errors (invalid domain, access errors)
- `ApiException`: Network or API-related errors
- `ApiKeyNotFoundException`: Invalid or missing API key

```dart
try {
  final result = await StadataFlutter.instance.list.subjectCategories(
    domain: '3200',
    lang: DataLanguage.id,
  );
  
  // Process successful result
  print('Found ${result.data.length} subject categories');
  
} on SubjectCategoryException catch (e) {
  print('Subject category error: ${e.message}');
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

- **Category Caching**: Cache category lists as they change very infrequently
- **Hierarchical Loading**: Load categories first, then subjects on demand
- **Efficient Navigation**: Use categories to reduce the scope of subject queries
- **Content Prioritization**: Focus on categories with higher subject and table counts
- **Cross-Domain Optimization**: Use category structure to optimize multi-domain queries
- **Memory Management**: Avoid loading complete hierarchies for all categories simultaneously