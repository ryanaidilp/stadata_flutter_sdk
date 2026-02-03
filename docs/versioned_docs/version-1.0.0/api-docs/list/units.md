# Units

The Units API provides access to the standardized measurement units used throughout BPS (Badan Pusat Statistik) Indonesia's statistical system. Units represent the fundamental measurement standards that define how statistical data is quantified, enabling consistent interpretation and comparison of statistical values across different datasets, variables, and time periods.

Understanding units is crucial for proper data interpretation, as they provide the context necessary to understand what statistical values represent and how they can be meaningfully compared or aggregated. Units in the BPS system cover diverse measurement types from basic counts to complex economic indicators.

## Understanding BPS Units

Units provide essential measurement context for statistical data:

- **Measurement Standards**: Standardized definitions of how quantities are measured
- **Data Interpretation**: Context for understanding statistical values and their significance
- **Comparability**: Framework for comparing data across different datasets and time periods
- **Variable Context**: Essential metadata that defines how variables are quantified
- **Analysis Foundation**: Basis for proper statistical analysis and aggregation

## Unit System Structure

BPS units encompass diverse measurement categories:

- **Count Units**: People, households, establishments, events
- **Ratio Units**: Percentages, rates per population, density measures
- **Economic Units**: Currency values, price indices, economic ratios
- **Physical Units**: Area measurements, volume, weight, distance
- **Time Units**: Periods, frequencies, duration measures
- **Composite Units**: Complex indicators combining multiple measurement dimensions

## Parameters

| Parameter    | Type           | Description                                           |
| ------------ | -------------- | ----------------------------------------------------- |
| `domain`     | `String`       | Domain code (region) to retrieve units **(required)** |
| `lang`       | `DataLanguage` | Language for units data (default: `DataLanguage.id`) |
| `page`       | `int`          | Page number (default: `1`)                           |
| `variableID` | `int?`         | Variable ID to filter units (optional)               |

## Examples

### 1. Get All Units for a Domain

```dart
// Fetch units from Central Java BPS
final unitsResult = await StadataFlutter.instance.list.units(
  domain: '3300', // Central Java domain code
  lang: DataLanguage.id,
);

final units = unitsResult.data;
final pagination = unitsResult.pagination;

// Print pagination information
print('Current Page: ${pagination.page}');
print('Total Pages: ${pagination.pages}');
print('Data Count in This Page: ${pagination.count}');
print('Per Page: ${pagination.perPage}');
print('Total: ${pagination.total}');
print('------------------------');

// Print retrieved units data
for (final unit in units) {
  print('Unit ID: ${unit.id}');
  print('Title: ${unit.title}');
  print('------------------------');
}
```

### 2. Filter Units by Variable

```dart
// Get units associated with a specific variable
final variableUnits = await StadataFlutter.instance.list.units(
  domain: '0000', // National level
  lang: DataLanguage.id,
  variableID: 1001, // Example variable ID for population data
);

// Analyze variable-specific units
print('=== Units for Variable 1001 ===');
for (final unit in variableUnits.data) {
  print('Variable Unit: ${unit.title}');
  print('Unit ID: ${unit.id}');
  
  // Categorize unit types
  final unitTitle = unit.title.toLowerCase();
  if (unitTitle.contains('orang') || unitTitle.contains('jiwa')) {
    print('  Type: Population count unit');
  } else if (unitTitle.contains('persen') || unitTitle.contains('%')) {
    print('  Type: Percentage unit');
  } else if (unitTitle.contains('rupiah') || unitTitle.contains('rp')) {
    print('  Type: Currency unit');
  } else if (unitTitle.contains('per') || unitTitle.contains('rate')) {
    print('  Type: Rate/ratio unit');
  } else {
    print('  Type: General measurement unit');
  }
  
  print('------------------------');
}
```

### 3. Explore Unit Types Across Domains

```dart
// Compare unit usage across different regions
class UnitExplorer {
  static Future<void> exploreUnitsAcrossDomains() async {
    final domains = ['0000', '3100', '3200', '3300']; // National, Jakarta, West Java, Central Java
    final domainUnits = <String, List<UnitData>>{};
    
    for (final domain in domains) {
      final units = await StadataFlutter.instance.list.units(
        domain: domain,
        lang: DataLanguage.id,
      );
      domainUnits[domain] = units.data;
      
      await Future.delayed(Duration(milliseconds: 300));
    }
    
    print('=== Unit Distribution Analysis ===');
    for (final entry in domainUnits.entries) {
      print('Domain ${entry.key}: ${entry.value.length} units');
      
      // Categorize units by type
      final unitCategories = <String, int>{
        'Population': 0,
        'Economic': 0,
        'Percentage': 0,
        'Physical': 0,
        'Other': 0,
      };
      
      for (final unit in entry.value) {
        final title = unit.title.toLowerCase();
        if (title.contains('orang') || title.contains('jiwa') || title.contains('penduduk')) {
          unitCategories['Population'] = unitCategories['Population']! + 1;
        } else if (title.contains('rupiah') || title.contains('rp') || title.contains('ekonomi')) {
          unitCategories['Economic'] = unitCategories['Economic']! + 1;
        } else if (title.contains('persen') || title.contains('%') || title.contains('rate')) {
          unitCategories['Percentage'] = unitCategories['Percentage']! + 1;
        } else if (title.contains('meter') || title.contains('kg') || title.contains('liter')) {
          unitCategories['Physical'] = unitCategories['Physical']! + 1;
        } else {
          unitCategories['Other'] = unitCategories['Other']! + 1;
        }
      }
      
      print('  Unit Types:');
      unitCategories.forEach((type, count) {
        if (count > 0) {
          print('    $type: $count units');
        }
      });
      
      print('---');
    }
  }
}
```

### 4. Analyze Unit-Variable Relationships

```dart
// Explore relationships between units and variables
class UnitVariableAnalyzer {
  static Future<void> analyzeUnitVariableRelationships(String domain) async {
    try {
      // 1. Get all units for the domain
      final allUnits = await StadataFlutter.instance.list.units(
        domain: domain,
        lang: DataLanguage.id,
      );
      
      print('=== Unit-Variable Relationship Analysis ===');
      print('Total Units in Domain $domain: ${allUnits.data.length}');
      
      // 2. Get variables to understand unit context
      final variables = await StadataFlutter.instance.list.variables(
        domain: domain,
        lang: DataLanguage.id,
      );
      
      print('Total Variables: ${variables.data.length}');
      
      // 3. Analyze unit diversity in variables
      final variableUnits = <String, int>{};
      final unitUsage = <String, int>{};
      
      for (final variable in variables.data.take(20)) { // Sample for analysis
        final variableSpecificUnits = await StadataFlutter.instance.list.units(
          domain: domain,
          lang: DataLanguage.id,
          variableID: variable.id,
        );
        
        if (variableSpecificUnits.data.isNotEmpty) {
          final primaryUnit = variableSpecificUnits.data.first.title;
          variableUnits[variable.title] = variableSpecificUnits.data.length;
          unitUsage[primaryUnit] = (unitUsage[primaryUnit] ?? 0) + 1;
        }
        
        await Future.delayed(Duration(milliseconds: 100));
      }
      
      // 4. Generate analysis report
      print('\\n=== Variable Unit Analysis ===');
      final variablesWithMultipleUnits = variableUnits.entries
          .where((entry) => entry.value > 1)
          .length;
      
      print('Variables with multiple units: $variablesWithMultipleUnits');
      
      print('\\n=== Most Common Units ===');
      final sortedUnits = unitUsage.entries.toList()
        ..sort((a, b) => b.value.compareTo(a.value));
      
      for (final entry in sortedUnits.take(10)) {
        print('${entry.key}: Used in ${entry.value} variables');
      }
      
    } catch (e) {
      print('Unit-variable analysis error: $e');
    }
  }
}
```

### 5. Build Unit Classification System

```dart
// Create a comprehensive unit classification and recommendation system
class UnitClassificationSystem {
  static Future<Map<String, List<UnitData>>> classifyUnits(String domain) async {
    final unitClassification = <String, List<UnitData>>{
      'Population and Demographic': [],
      'Economic and Financial': [],
      'Percentage and Ratios': [],
      'Physical Measurements': [],
      'Time-based': [],
      'Geographic and Spatial': [],
      'Specialized Indicators': [],
    };
    
    try {
      // Get all units
      final units = await StadataFlutter.instance.list.units(
        domain: domain,
        lang: DataLanguage.id,
      );
      
      // Classify units based on their titles and context
      for (final unit in units.data) {
        final title = unit.title.toLowerCase();
        bool classified = false;
        
        // Population and Demographic
        if (title.contains('orang') || title.contains('jiwa') || 
            title.contains('penduduk') || title.contains('keluarga')) {
          unitClassification['Population and Demographic']!.add(unit);
          classified = true;
        }
        
        // Economic and Financial
        if (!classified && (title.contains('rupiah') || title.contains('rp') || 
            title.contains('dollar') || title.contains('ekonomi') || 
            title.contains('harga') || title.contains('nilai'))) {
          unitClassification['Economic and Financial']!.add(unit);
          classified = true;
        }
        
        // Percentage and Ratios
        if (!classified && (title.contains('persen') || title.contains('%') || 
            title.contains('per') || title.contains('rate') || 
            title.contains('rasio') || title.contains('indeks'))) {
          unitClassification['Percentage and Ratios']!.add(unit);
          classified = true;
        }
        
        // Physical Measurements
        if (!classified && (title.contains('meter') || title.contains('kg') || 
            title.contains('ton') || title.contains('liter') || 
            title.contains('hektar') || title.contains('km'))) {
          unitClassification['Physical Measurements']!.add(unit);
          classified = true;
        }
        
        // Time-based
        if (!classified && (title.contains('tahun') || title.contains('bulan') || 
            title.contains('hari') || title.contains('jam') || 
            title.contains('minggu'))) {
          unitClassification['Time-based']!.add(unit);
          classified = true;
        }
        
        // Geographic and Spatial
        if (!classified && (title.contains('wilayah') || title.contains('daerah') || 
            title.contains('provinsi') || title.contains('kabupaten') || 
            title.contains('kota'))) {
          unitClassification['Geographic and Spatial']!.add(unit);
          classified = true;
        }
        
        // Specialized Indicators (catch-all for complex units)
        if (!classified) {
          unitClassification['Specialized Indicators']!.add(unit);
        }
      }
      
      // Print classification results
      print('=== Unit Classification Results ===');
      for (final entry in unitClassification.entries) {
        final category = entry.key;
        final categoryUnits = entry.value;
        
        if (categoryUnits.isNotEmpty) {
          print('\\n📊 $category (${categoryUnits.length} units)');
          for (final unit in categoryUnits.take(5)) {
            print('  • ${unit.title} (ID: ${unit.id})');
          }
          if (categoryUnits.length > 5) {
            print('  ... and ${categoryUnits.length - 5} more units');
          }
        }
      }
      
      // Generate recommendations
      print('\\n=== Unit Usage Recommendations ===');
      final topCategories = unitClassification.entries
          .where((entry) => entry.value.isNotEmpty)
          .toList()
        ..sort((a, b) => b.value.length.compareTo(a.value.length));
      
      for (final entry in topCategories.take(3)) {
        print('${entry.key}:');
        print('  Available Units: ${entry.value.length}');
        print('  Recommended for: ${_getRecommendation(entry.key)}');
        print('');
      }
      
      return unitClassification;
      
    } catch (e) {
      print('Unit classification error: $e');
      return {};
    }
  }
  
  static String _getRecommendation(String category) {
    switch (category) {
      case 'Population and Demographic':
        return 'Population studies, demographic analysis, household surveys';
      case 'Economic and Financial':
        return 'Economic analysis, financial reporting, market studies';
      case 'Percentage and Ratios':
        return 'Comparative analysis, trend studies, performance indicators';
      case 'Physical Measurements':
        return 'Infrastructure analysis, resource management, physical planning';
      case 'Time-based':
        return 'Temporal analysis, duration studies, time series research';
      case 'Geographic and Spatial':
        return 'Regional analysis, spatial studies, administrative research';
      default:
        return 'Specialized research, advanced statistical analysis';
    }
  }
}
```

## Properties (UnitData)

| Property | Type     | Description                         |
| -------- | -------- | ----------------------------------- |
| `id`     | `int`    | Unique identifier for the unit      |
| `title`  | `String` | Descriptive name of the measurement unit |

## Common Unit Categories

### Population and Demographic Units
- **Person Counts**: `orang`, `jiwa` (people, individuals)
- **Household Units**: `keluarga`, `rumah tangga` (families, households)
- **Population Rates**: `per 1000 penduduk` (per 1000 population)
- **Demographic Ratios**: `rasio jenis kelamin` (sex ratios)

### Economic and Financial Units
- **Currency**: `rupiah`, `ribu rupiah`, `juta rupiah` (Indonesian currency)
- **Economic Indicators**: `indeks harga` (price indices)
- **Financial Ratios**: `rasio utang` (debt ratios)
- **Economic Rates**: `tingkat inflasi` (inflation rates)

### Percentage and Ratio Units
- **Percentages**: `persen`, `%` (percentages)
- **Rates**: `per 100 ribu`, `per 1000` (per specific population)
- **Growth Rates**: `persen pertumbuhan` (growth percentages)
- **Coverage Ratios**: `rasio cakupan` (coverage ratios)

### Physical Measurement Units
- **Area**: `hektar`, `km²`, `m²` (area measurements)
- **Weight**: `kg`, `ton`, `gram` (weight measurements)
- **Distance**: `km`, `meter` (distance measurements)
- **Volume**: `liter`, `m³` (volume measurements)

### Time-based Units
- **Periods**: `tahun`, `bulan`, `hari` (years, months, days)
- **Frequencies**: `per tahun`, `bulanan` (annual, monthly)
- **Duration**: `jam kerja`, `hari kerja` (working hours, working days)

## Unit Discovery Workflow

The typical workflow for working with units:

1. **Unit Exploration**: Discover available units for a domain
2. **Variable Association**: Understand which units are used with specific variables
3. **Unit Classification**: Categorize units by measurement type
4. **Context Analysis**: Understand the proper interpretation of unit-value combinations
5. **Data Integration**: Use unit information for proper data analysis and comparison

### Complete Unit Management Example

```dart
// Comprehensive unit management and analysis system
class UnitManagementSystem {
  static Future<void> manageCompleteUnitWorkflow() async {
    try {
      // 1. Multi-domain unit discovery
      final domains = ['0000', '3100', '3200']; // National, Jakarta, West Java
      final domainUnitAnalysis = <String, Map<String, dynamic>>{};
      
      for (final domain in domains) {
        final units = await StadataFlutter.instance.list.units(
          domain: domain,
          lang: DataLanguage.id,
        );
        
        // Analyze unit distribution
        final unitTypes = <String, int>{};
        for (final unit in units.data) {
          final category = _categorizeUnit(unit.title);
          unitTypes[category] = (unitTypes[category] ?? 0) + 1;
        }
        
        domainUnitAnalysis[domain] = {
          'totalUnits': units.data.length,
          'unitTypes': unitTypes,
          'sampleUnits': units.data.take(5).map((u) => u.title).toList(),
        };
        
        await Future.delayed(Duration(milliseconds: 200));
      }
      
      // 2. Cross-domain analysis
      print('=== Cross-Domain Unit Analysis ===');
      for (final entry in domainUnitAnalysis.entries) {
        final domain = entry.key;
        final analysis = entry.value;
        
        print('Domain $domain:');
        print('  Total Units: ${analysis['totalUnits']}');
        
        final unitTypes = analysis['unitTypes'] as Map<String, int>;
        print('  Unit Categories:');
        unitTypes.forEach((type, count) {
          print('    $type: $count units');
        });
        
        print('  Sample Units:');
        final sampleUnits = analysis['sampleUnits'] as List<String>;
        for (final unit in sampleUnits) {
          print('    • $unit');
        }
        print('');
      }
      
      // 3. Unit standardization recommendations
      print('=== Unit Standardization Recommendations ===');
      final nationalUnits = domainUnitAnalysis['0000'];
      if (nationalUnits != null) {
        final unitTypes = nationalUnits['unitTypes'] as Map<String, int>;
        final topCategories = unitTypes.entries.toList()
          ..sort((a, b) => b.value.compareTo(a.value));
        
        print('Priority unit categories for standardization:');
        for (final entry in topCategories.take(5)) {
          print('${entry.key}: ${entry.value} units');
          print('  Recommendation: ${_getStandardizationRecommendation(entry.key)}');
          print('');
        }
      }
      
    } catch (e) {
      print('Unit management error: $e');
    }
  }
  
  static String _categorizeUnit(String unitTitle) {
    final title = unitTitle.toLowerCase();
    
    if (title.contains('orang') || title.contains('jiwa')) {
      return 'Population';
    } else if (title.contains('rupiah') || title.contains('rp')) {
      return 'Economic';
    } else if (title.contains('persen') || title.contains('%')) {
      return 'Percentage';
    } else if (title.contains('meter') || title.contains('kg') || title.contains('liter')) {
      return 'Physical';
    } else if (title.contains('tahun') || title.contains('bulan')) {
      return 'Temporal';
    } else {
      return 'Other';
    }
  }
  
  static String _getStandardizationRecommendation(String category) {
    switch (category) {
      case 'Population':
        return 'Standardize person counting methods and demographic ratios';
      case 'Economic':
        return 'Align currency denominations and economic indicator calculations';
      case 'Percentage':
        return 'Standardize percentage calculations and ratio presentations';
      case 'Physical':
        return 'Use consistent physical measurement standards';
      case 'Temporal':
        return 'Standardize time period definitions and reporting frequencies';
      default:
        return 'Review for specialized standardization needs';
    }
  }
}
```

## Integration with Variables and Data

### Using Units for Data Interpretation

```dart
// Use unit information to properly interpret statistical data
Future<void> interpretDataWithUnits(String domain) async {
  try {
    // Get variables and their associated units
    final variables = await StadataFlutter.instance.list.variables(
      domain: domain,
      lang: DataLanguage.id,
    );
    
    print('=== Data Interpretation with Units ===');
    
    for (final variable in variables.data.take(5)) {
      print('\\nVariable: ${variable.title}');
      print('Unit: ${variable.unit}');
      
      // Get specific units for this variable
      final variableUnits = await StadataFlutter.instance.list.units(
        domain: domain,
        variableID: variable.id,
        lang: DataLanguage.id,
      );
      
      if (variableUnits.data.isNotEmpty) {
        print('Available measurement units:');
        for (final unit in variableUnits.data) {
          print('  • ${unit.title}');
        }
        
        // Provide interpretation guidance
        final primaryUnit = variableUnits.data.first.title.toLowerCase();
        if (primaryUnit.contains('orang')) {
          print('  → Interpretation: Count data - values represent number of people');
        } else if (primaryUnit.contains('persen')) {
          print('  → Interpretation: Ratio data - values are percentages (0-100%)');
        } else if (primaryUnit.contains('rupiah')) {
          print('  → Interpretation: Currency data - values in Indonesian Rupiah');
        } else if (primaryUnit.contains('per')) {
          print('  → Interpretation: Rate data - values per unit population');
        } else {
          print('  → Interpretation: Measurement data - check unit for proper scaling');
        }
      } else {
        print('  No specific units available - use variable unit: ${variable.unit}');
      }
      
      await Future.delayed(Duration(milliseconds: 100));
    }
    
  } catch (e) {
    print('Data interpretation error: $e');
  }
}
```

## Error Handling

Units API methods return `Future<ListResult<UnitData>>` and may throw specific exceptions:

- `UnitException`: Unit-related errors (invalid domain, variable ID errors)
- `ApiException`: Network or API-related errors
- `ApiKeyNotFoundException`: Invalid or missing API key

```dart
try {
  final result = await StadataFlutter.instance.list.units(
    domain: '3200',
    variableID: 1001,
    lang: DataLanguage.id,
  );
  
  // Process successful result
  print('Found ${result.data.length} units');
  
} on UnitException catch (e) {
  print('Unit error: ${e.message}');
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

- **Variable Filtering**: Use variable IDs to get relevant units for specific data contexts
- **Unit Caching**: Cache unit definitions as they change infrequently
- **Classification Efficiency**: Pre-classify units to avoid repeated pattern matching
- **Context Awareness**: Consider units alongside variables for proper data interpretation
- **Standardization**: Use consistent unit interpretations across analytical workflows
- **Documentation**: Maintain clear documentation of unit meanings and proper usage