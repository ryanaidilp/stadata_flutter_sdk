# Subjects

The Subjects API provides access to the thematic organization system used by BPS (Badan Pusat Statistik) Indonesia to categorize statistical data and content. Subjects represent the fundamental thematic areas that organize Indonesia's statistical information, covering diverse domains such as demographics, economics, social indicators, environment, and governance.

Understanding BPS subjects is essential for navigating Indonesia's statistical landscape, as they serve as the primary organizational framework for data discovery, content classification, and analytical research. Each subject represents a coherent area of statistical inquiry with associated data tables, publications, and analytical resources.

## Understanding BPS Subjects

Subjects provide thematic organization for Indonesia's statistical ecosystem:

- **Thematic Classification**: Systematic grouping of statistical content by subject matter
- **Data Organization**: Framework for organizing tables, publications, and indicators
- **Research Navigation**: Guide for discovering related statistical resources
- **Content Categorization**: Structure for classifying BPS outputs and data products
- **Analytical Framework**: Foundation for subject-specific statistical analysis

## Subject System Structure

BPS subjects are organized hierarchically within the statistical system:

- **Subject Categories**: Broad thematic groupings that contain related subjects
- **Individual Subjects**: Specific thematic areas within categories
- **Associated Tables**: Data tables organized under each subject
- **Cross-References**: Relationships between subjects and other statistical elements
- **Content Mapping**: Links between subjects and publications, indicators, variables

## Parameters

| Parameter           | Type           | Description                                                  |
| ------------------- | -------------- | ------------------------------------------------------------ |
| `domain`            | `String`       | Domain code (region) for retrieving subjects **(required)** |
| `lang`              | `DataLanguage` | Language for subject data (default: `DataLanguage.id`)      |
| `page`              | `int`          | Page number (default: `1`)                                  |
| `subjectCategoryId` | `int?`         | ID of the subject category for filtering subjects (optional) |

## Examples

### 1. Get All Subjects for a Domain

```dart
// Fetch subjects from Central Java BPS
final subjectResult = await StadataFlutter.instance.list.subjects(
  domain: '3300', // Central Java domain code
  lang: DataLanguage.id,
);

final subjectList = subjectResult.data;
final pagination = subjectResult.pagination;

// Print pagination information
print('Current Page: ${pagination.page}');
print('Total Pages: ${pagination.pages}');
print('Data Count in This Page: ${pagination.count}');
print('Per Page: ${pagination.perPage}');
print('Total: ${pagination.total}');
print('------------------------');

// Print retrieved subject data
for (final subject in subjectList) {
  print('Subject ID: ${subject.id}');
  print('Subject Name: ${subject.name}');
  print('Category ID: ${subject.category?.id ?? 'No category'}');
  print('Category Name: ${subject.category?.name ?? 'Uncategorized'}');
  print('Number of Tables: ${subject.nTable ?? 0}');
  print('------------------------');
}
```

### 2. Filter Subjects by Category

```dart
// Get subjects within a specific category (e.g., economic subjects)
final economicSubjects = await StadataFlutter.instance.list.subjects(
  domain: '0000', // National level
  lang: DataLanguage.id,
  subjectCategoryId: 2, // Assuming '2' is economic category
);

// Analyze economic subjects
print('=== Economic Subjects ===');
for (final subject in economicSubjects.data) {
  print('Economic Subject: ${subject.name}');
  print('Subject ID: ${subject.id}');
  print('Available Tables: ${subject.nTable ?? 0}');
  print('Category: ${subject.category?.name ?? 'Unknown'}');
  
  // Identify high-value subjects (those with many tables)
  if (subject.nTable != null && subject.nTable! > 10) {
    print('  ⭐ High-value subject (${subject.nTable} tables)');
  }
  
  print('------------------------');
}
```

### 3. Explore Subject Distribution Across Domains

```dart
// Compare subject availability across different regions
class SubjectExplorer {
  static Future<void> compareSubjectsAcrossDomains() async {
    final domains = ['0000', '3100', '3200', '3300']; // National, Jakarta, West Java, Central Java
    final domainSubjects = <String, List<Subject>>{};
    
    for (final domain in domains) {
      final subjects = await StadataFlutter.instance.list.subjects(
        domain: domain,
        lang: DataLanguage.id,
      );
      domainSubjects[domain] = subjects.data;
      
      await Future.delayed(Duration(milliseconds: 300));
    }
    
    print('=== Subject Distribution Analysis ===');
    for (final entry in domainSubjects.entries) {
      print('Domain ${entry.key}: ${entry.value.length} subjects');
      
      // Calculate total tables available
      final totalTables = entry.value
          .map((s) => s.nTable ?? 0)
          .reduce((a, b) => a + b);
      
      print('  Total Tables: $totalTables');
      
      // Find subjects with most tables
      final topSubjects = entry.value
          .where((s) => s.nTable != null && s.nTable! > 0)
          .toList()
        ..sort((a, b) => (b.nTable ?? 0).compareTo(a.nTable ?? 0));
      
      if (topSubjects.isNotEmpty) {
        print('  Top Subject: ${topSubjects.first.name} (${topSubjects.first.nTable} tables)');
      }
      
      print('---');
    }
  }
}
```

### 4. Analyze Subject Categories and Content

```dart
// Comprehensive analysis of subjects and their categorization
class SubjectAnalyzer {
  static Future<void> analyzeSubjectStructure(String domain) async {
    try {
      // 1. Get all subjects for the domain
      final allSubjects = await StadataFlutter.instance.list.subjects(
        domain: domain,
        lang: DataLanguage.id,
      );
      
      print('=== Subject Analysis for Domain $domain ===');
      print('Total Subjects: ${allSubjects.data.length}');
      
      // 2. Group subjects by category
      final categoryGroups = <String, List<Subject>>{};
      for (final subject in allSubjects.data) {
        final categoryName = subject.category?.name ?? 'Uncategorized';
        categoryGroups[categoryName] = (categoryGroups[categoryName] ?? [])..add(subject);
      }
      
      print('Subject Categories: ${categoryGroups.keys.length}');
      
      // 3. Analyze each category
      for (final entry in categoryGroups.entries) {
        print('\\n=== Category: ${entry.key} ===');
        print('Subjects in category: ${entry.value.length}');
        
        // Calculate category statistics
        final totalTables = entry.value
            .map((s) => s.nTable ?? 0)
            .reduce((a, b) => a + b);
        
        final avgTables = totalTables / entry.value.length;
        
        print('Total tables in category: $totalTables');
        print('Average tables per subject: ${avgTables.toStringAsFixed(1)}');
        
        // Show top subjects in category
        final sortedSubjects = entry.value
            .where((s) => s.nTable != null && s.nTable! > 0)
            .toList()
          ..sort((a, b) => (b.nTable ?? 0).compareTo(a.nTable ?? 0));
        
        print('Top subjects:');
        for (final subject in sortedSubjects.take(3)) {
          print('  - ${subject.name}: ${subject.nTable} tables');
        }
      }
      
      // 4. Identify subjects with no tables
      final subjectsWithoutTables = allSubjects.data
          .where((s) => s.nTable == null || s.nTable == 0)
          .length;
      
      print('\\n=== Data Availability ===');
      print('Subjects without tables: $subjectsWithoutTables');
      print('Subjects with data: ${allSubjects.data.length - subjectsWithoutTables}');
      
    } catch (e) {
      print('Subject analysis error: $e');
    }
  }
}
```

### 5. Build Subject-Based Navigation System

```dart
// Create a navigation system based on subjects and categories
class SubjectNavigationBuilder {
  static Future<Map<String, Map<String, dynamic>>> buildNavigationStructure(String domain) async {
    final navigationStructure = <String, Map<String, dynamic>>{};
    
    try {
      // Get all subjects
      final subjects = await StadataFlutter.instance.list.subjects(
        domain: domain,
        lang: DataLanguage.id,
      );
      
      // Get unique categories from subject list
      final categories = <int, String>{};
      for (final subject in subjects.data) {
        if (subject.category != null) {
          categories[subject.category!.id] = subject.category!.name;
        }
      }
      
      // Build navigation for each category
      for (final categoryEntry in categories.entries) {
        final categoryId = categoryEntry.key;
        final categoryName = categoryEntry.value;
        
        // Get subjects for this category
        final categorySubjects = await StadataFlutter.instance.list.subjects(
          domain: domain,
          lang: DataLanguage.id,
          subjectCategoryId: categoryId,
        );
        
        // Build category navigation structure
        final subjectItems = <Map<String, dynamic>>[];
        for (final subject in categorySubjects.data) {
          subjectItems.add({
            'id': subject.id,
            'name': subject.name,
            'tableCount': subject.nTable ?? 0,
            'hasData': (subject.nTable ?? 0) > 0,
          });
        }
        
        navigationStructure[categoryName] = {
          'categoryId': categoryId,
          'subjectCount': subjectItems.length,
          'totalTables': subjectItems.map((s) => s['tableCount'] as int).reduce((a, b) => a + b),
          'subjects': subjectItems,
        };
        
        await Future.delayed(Duration(milliseconds: 200));
      }
      
      // Print navigation structure
      print('=== Subject Navigation Structure ===');
      for (final entry in navigationStructure.entries) {
        final categoryName = entry.key;
        final categoryData = entry.value;
        
        print('📁 $categoryName');
        print('   Subjects: ${categoryData['subjectCount']}');
        print('   Total Tables: ${categoryData['totalTables']}');
        
        final subjects = categoryData['subjects'] as List<Map<String, dynamic>>;
        for (final subject in subjects.take(3)) {
          print('   📊 ${subject['name']} (${subject['tableCount']} tables)');
        }
        
        if (subjects.length > 3) {
          print('   ... and ${subjects.length - 3} more subjects');
        }
        print('');
      }
      
      return navigationStructure;
      
    } catch (e) {
      print('Navigation building error: $e');
      return {};
    }
  }
}
```

## Properties (Subject)

| Property   | Type               | Description                                     |
| ---------- | ------------------ | ----------------------------------------------- |
| `id`       | `int`              | Unique identifier for the subject              |
| `name`     | `String`           | Descriptive name of the statistical subject    |
| `category` | `SubjectCategory?` | Subject category containing this subject (optional) |
| `nTable`   | `int?`             | Number of data tables associated with this subject (optional) |

## Common Subject Areas

### Economic Subjects
- **Macroeconomic Indicators**: GDP, inflation, economic growth metrics
- **Sectoral Economics**: Industry, agriculture, services sector analysis
- **Trade and Investment**: Import/export data, foreign investment statistics
- **Labor Economics**: Employment, wages, productivity indicators
- **Financial Statistics**: Banking, capital markets, monetary indicators

### Demographic and Social Subjects
- **Population Statistics**: Population counts, demographics, migration
- **Education**: School enrollment, literacy, educational outcomes
- **Health**: Healthcare access, mortality, morbidity statistics
- **Social Welfare**: Poverty, income distribution, social assistance
- **Housing and Living Conditions**: Housing quality, urban development

### Environmental and Infrastructure Subjects
- **Environmental Statistics**: Natural resources, environmental quality
- **Transportation**: Infrastructure, mobility, transportation usage
- **Energy**: Energy production, consumption, renewable energy
- **Information Technology**: Digital infrastructure, ICT usage
- **Agriculture**: Agricultural production, land use, rural development

### Governance and Administrative Subjects
- **Public Administration**: Government operations, public services
- **Regional Development**: Local government statistics, regional indicators
- **Justice and Security**: Crime statistics, legal system indicators
- **International Relations**: International cooperation, diplomatic statistics

## Subject Discovery Workflow

The typical workflow for discovering and using subjects:

1. **Domain Selection**: Choose the geographic area of interest
2. **Category Exploration**: Browse subjects by thematic categories
3. **Subject Analysis**: Examine individual subjects and their data availability
4. **Content Discovery**: Use subjects to find related tables and publications
5. **Data Integration**: Combine multiple subjects for comprehensive analysis

### Complete Subject Discovery Example

```dart
// Comprehensive subject discovery and utilization workflow
class SubjectDiscoverySystem {
  static Future<void> discoverAndAnalyzeSubjects() async {
    try {
      // 1. Discover subjects at national level
      final nationalSubjects = await StadataFlutter.instance.list.subjects(
        domain: '0000', // National
        lang: DataLanguage.id,
      );
      
      print('=== National Subject Discovery ===');
      print('Total National Subjects: ${nationalSubjects.data.length}');
      
      // 2. Identify key economic subjects
      final economicKeywords = ['ekonomi', 'perdagangan', 'industri', 'keuangan'];
      final economicSubjects = nationalSubjects.data.where((subject) {
        return economicKeywords.any((keyword) => 
            subject.name.toLowerCase().contains(keyword));
      }).toList();
      
      print('Economic Subjects Found: ${economicSubjects.length}');
      
      // 3. Analyze data richness of economic subjects
      final richEconomicSubjects = economicSubjects
          .where((s) => s.nTable != null && s.nTable! > 5)
          .toList()
        ..sort((a, b) => (b.nTable ?? 0).compareTo(a.nTable ?? 0));
      
      print('\\n=== Data-Rich Economic Subjects ===');
      for (final subject in richEconomicSubjects.take(5)) {
        print('${subject.name}: ${subject.nTable} tables');
        print('  Subject ID: ${subject.id}');
        print('  Category: ${subject.category?.name ?? 'Uncategorized'}');
        
        // This subject can be used for further data queries
        print('  → Use for querying economic data tables');
        print('  → Can be filtered in publications and variables');
      }
      
      // 4. Compare with provincial data
      final provincialComparison = await _compareProvincialSubjects(
        richEconomicSubjects.take(3).toList(),
      );
      
      print('\\n=== Provincial Comparison ===');
      provincialComparison.forEach((subjectName, provincialData) {
        print('$subjectName:');
        provincialData.forEach((province, tableCount) {
          print('  $province: $tableCount tables');
        });
      });
      
    } catch (e) {
      print('Subject discovery error: $e');
    }
  }
  
  static Future<Map<String, Map<String, int>>> _compareProvincialSubjects(
    List<Subject> nationalSubjects,
  ) async {
    final comparison = <String, Map<String, int>>{};
    final provinces = ['3100', '3200', '3300']; // Jakarta, West Java, Central Java
    
    for (final nationalSubject in nationalSubjects) {
      final provincialData = <String, int>{};
      
      for (final province in provinces) {
        try {
          final provinceSubjects = await StadataFlutter.instance.list.subjects(
            domain: province,
            lang: DataLanguage.id,
          );
          
          // Find matching subject by name
          final matchingSubject = provinceSubjects.data
              .where((s) => s.name.contains(nationalSubject.name.split(' ').first))
              .firstOrNull;
          
          provincialData[province] = matchingSubject?.nTable ?? 0;
          
        } catch (e) {
          provincialData[province] = 0;
        }
        
        await Future.delayed(Duration(milliseconds: 100));
      }
      
      comparison[nationalSubject.name] = provincialData;
    }
    
    return comparison;
  }
}
```

## Integration with Other APIs

### Building Subject-Based Data Queries

```dart
// Use subjects to build comprehensive data analysis
Future<void> buildSubjectBasedAnalysis(String domain) async {
  try {
    // 1. Get subjects for the domain
    final subjects = await StadataFlutter.instance.list.subjects(
      domain: domain,
      lang: DataLanguage.id,
    );
    
    // 2. Focus on subjects with substantial data
    final dataRichSubjects = subjects.data
        .where((s) => s.nTable != null && s.nTable! > 3)
        .take(3)
        .toList();
    
    print('=== Subject-Based Data Analysis ===');
    
    for (final subject in dataRichSubjects) {
      print('\\nAnalyzing Subject: ${subject.name}');
      print('Available Tables: ${subject.nTable}');
      
      // 3. Get related variables for this subject
      try {
        final variables = await StadataFlutter.instance.list.variables(
          domain: domain,
          subjectID: subject.id,
          lang: DataLanguage.id,
        );
        
        print('Related Variables: ${variables.data.length}');
        
        // 4. Get related publications
        final publications = await StadataFlutter.instance.list.publications(
          domain: domain,
          lang: DataLanguage.id,
        );
        
        // Filter publications that might be related to this subject
        final relatedPubs = publications.data
            .where((pub) => pub.title.toLowerCase()
                .contains(subject.name.toLowerCase().split(' ').first))
            .length;
        
        print('Potentially Related Publications: $relatedPubs');
        
        // 5. Get static tables for this subject
        final staticTables = await StadataFlutter.instance.list.staticTable(
          domain: domain,
          lang: DataLanguage.id,
        );
        
        final subjectTables = staticTables.data
            .where((table) => table.subjectId == subject.id)
            .length;
        
        print('Static Tables for Subject: $subjectTables');
        
        print('Subject Analysis Complete for ${subject.name}');
        
      } catch (e) {
        print('Error analyzing subject ${subject.name}: $e');
      }
      
      await Future.delayed(Duration(milliseconds: 500));
    }
    
  } catch (e) {
    print('Subject-based analysis error: $e');
  }
}
```

## Error Handling

Subjects API methods return `Future<ListResult<Subject>>` and may throw specific exceptions:

- `SubjectException`: Subject-related errors (invalid domain, category ID errors)
- `ApiException`: Network or API-related errors
- `ApiKeyNotFoundException`: Invalid or missing API key

```dart
try {
  final result = await StadataFlutter.instance.list.subjects(
    domain: '3200',
    subjectCategoryId: 2,
    lang: DataLanguage.id,
  );
  
  // Process successful result
  print('Found ${result.data.length} subjects');
  
} on SubjectException catch (e) {
  print('Subject error: ${e.message}');
  // Handle domain validation errors or category ID issues
  
} on ApiException catch (e) {
  print('API error: ${e.message}');
  // Handle network connectivity or API service errors
  
} catch (e) {
  print('Unexpected error: $e');
  // Handle any other unexpected errors
}
```

## Performance Considerations

- **Category Filtering**: Use subject category IDs to reduce query scope when focusing on specific themes
- **Table Count Awareness**: Consider subjects with higher table counts for data-rich analysis
- **Cross-Domain Analysis**: Be mindful of API rate limits when comparing subjects across multiple domains
- **Subject Caching**: Cache subject lists as they change infrequently compared to actual data
- **Relationship Mapping**: Build efficient mappings between subjects and related data elements
- **Pagination Handling**: Implement proper pagination for domains with many subjects