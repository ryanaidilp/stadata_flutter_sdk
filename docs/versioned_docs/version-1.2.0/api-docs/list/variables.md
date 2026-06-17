# Variables

The Variables API provides access to the fundamental building blocks of statistical data from BPS (Badan Pusat Statistik) Indonesia. Variables represent the core statistical concepts that are measured, collected, and analyzed across various surveys, censuses, and administrative data sources. Understanding variables is essential for accessing and interpreting BPS data effectively.

Variables in the BPS system define what is being measured (population, GDP, employment rate, etc.), how it's measured (units, methodology), and how it relates to other statistical concepts. Each variable has rich metadata including subject classifications, measurement units, time periods, and relationships to other variables.

## Understanding BPS Variables

Variables serve as the foundation for all statistical data in the BPS ecosystem:

- **Core Measurements**: Population counts, economic indicators, social metrics
- **Derived Indicators**: Calculated values based on multiple source variables
- **Time Series Data**: Variables tracked over multiple time periods
- **Cross-sectional Analysis**: Variables enabling comparison across regions
- **Hierarchical Relationships**: Variables organized by subject and category

## Variable Classification System

BPS variables are organized in a hierarchical structure:

- **Subjects**: Broad topic areas (demographics, economics, social, etc.)
- **Subject Categories**: Sub-classifications within subjects
- **Variable Types**: Different measurement approaches and methodologies
- **Vertical Variables**: Related measurements with different temporal or spatial dimensions

## Parameters

| Parameter              | Type           | Description                                                                                                                                                                                                                                                                                                      |
| ---------------------- | -------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `domain`               | `String`       | Domain code (region) to retrieve variables **(required)**                                                                                                                                                                                                                                                      |
| `lang`                 | `DataLanguage` | Language for variables data (default: `DataLanguage.id`)                                                                                                                                                                                                                                                        |
| `page`                 | `int`          | Page number (default: `1`)                                                                                                                                                                                                                                                                                      |
| `subjectID`            | `int?`         | Filter by specific subject ID (optional)                                                                                                                                                                                                                                                                         |
| `showExistingVariable` | `bool`         | Show only variables with data for the specified domain. When `true`, filters variables to include only those with existing values in the domain (default: `false`) |
| `year`                 | `int?`         | Filter by specific year for time-sensitive variables (optional)                                                                                                                                                                                                                                            |

## Examples

### 1. Get All Variables for a Domain

```dart
// Fetch all variables available for Central Java
final result = await StadataFlutter.instance.list.variables(
  domain: '3300', // Central Java domain code
  lang: DataLanguage.id,
);

final variables = result.data;
final pagination = result.pagination;

// Print pagination information
print('Current Page: ${pagination.page}');
print('Total Pages: ${pagination.pages}');
print('Data Count in This Page: ${pagination.count}');
print('Per Page: ${pagination.perPage}');
print('Total: ${pagination.total}');
print('------------------------');

// Print retrieved variables data
for (final variable in variables) {
  print('Variable ID: ${variable.id}');
  print('Title: ${variable.title}');
  print('Subject: ${variable.subjectName}');
  print('Unit: ${variable.unit}');
  print('Type: ${variable.type}');
  print('------------------------');
}
```

### 2. Filter Variables by Subject

```dart
// Get demographic variables for Jakarta
final demographicVariables = await StadataFlutter.instance.list.variables(
  domain: '3100', // DKI Jakarta
  lang: DataLanguage.id,
  subjectID: 1, // Assuming 1 is demographics subject ID
);

// Analyze demographic variables
for (final variable in demographicVariables.data) {
  print('Demographic Variable: ${variable.title}');
  print('Subject: ${variable.subjectName}');
  print('Graph Label: ${variable.graphName}');
  print('Unit: ${variable.unit}');
  print('Notes: ${variable.notes}');
  
  // Check for derived variables
  if (variable.derivedVariableID != null) {
    print('Derived from Variable ID: ${variable.derivedVariableID}');
  }
  
  print('------------------------');
}
```

### 3. Get Variables with Existing Data Only

```dart
// Get only variables that have actual data for West Java in 2023
final dataAvailableVariables = await StadataFlutter.instance.list.variables(
  domain: '3200', // West Java
  lang: DataLanguage.id,
  showExistingVariable: true, // Only show variables with data
  year: 2023,
);

// Process variables with guaranteed data availability
for (final variable in dataAvailableVariables.data) {
  print('Available Data Variable: ${variable.title}');
  print('Subject: ${variable.subjectName}');
  print('Measurement Unit: ${variable.unit}');
  
  // This variable has data for West Java in 2023
  print('Data confirmed available for domain 3200');
  print('------------------------');
}
```

### 4. Explore Variable Relationships

```dart
// Discover variable relationships and hierarchies
class VariableExplorer {
  static Future<void> exploreVariableStructure(String domain) async {
    final allVariables = await StadataFlutter.instance.list.variables(
      domain: domain,
      lang: DataLanguage.id,
    );
    
    // Group variables by subject
    final subjectGroups = <String, List<Variable>>{};
    for (final variable in allVariables.data) {
      final key = variable.subjectName;
      subjectGroups[key] = (subjectGroups[key] ?? [])..add(variable);
    }
    
    print('=== Variable Structure for Domain $domain ===');
    subjectGroups.forEach((subject, variables) {
      print('Subject: $subject (${variables.length} variables)');
      
      // Show derived variables
      final derivedVars = variables.where((v) => v.derivedVariableID != null);
      if (derivedVars.isNotEmpty) {
        print('  Derived Variables: ${derivedVars.length}');
      }
      
      // Show unique units
      final units = variables.map((v) => v.unit).toSet();
      print('  Measurement Units: ${units.join(", ")}');
      print('');
    });
  }
}
```

### 5. Variable Discovery by Year

```dart
// Compare variable availability across different years
Future<void> compareVariablesByYear(String domain) async {
  final years = [2020, 2021, 2022, 2023];
  final yearlyVariables = <int, int>{};
  
  for (final year in years) {
    final variables = await StadataFlutter.instance.list.variables(
      domain: domain,
      lang: DataLanguage.id,
      year: year,
      showExistingVariable: true,
    );
    
    yearlyVariables[year] = variables.data.length;
  }
  
  print('=== Variable Availability by Year ===');
  yearlyVariables.forEach((year, count) {
    print('$year: $count variables with data');
  });
  
  // Find the year with most variables
  final maxYear = yearlyVariables.entries
      .reduce((a, b) => a.value > b.value ? a : b)
      .key;
  print('Peak data year: $maxYear');
}
```

## Properties (Variable)

| Property             | Type      | Description                                                                     |
| -------------------- | --------- | ------------------------------------------------------------------------------- |
| `id`                 | `int`     | Unique identifier for the variable                                         |
| `title`              | `String`  | Official title or label of the variable                                     |
| `subjectID`          | `int`     | Identifier for the subject category of the variable                             |
| `subjectName`        | `String`  | Name of the subject to which the variable belongs                          |
| `verticalVariableID` | `int`     | Identifier for the vertical variable (related temporal/spatial dimension)                                        |
| `csaSubjectName`     | `String?` | CSA (Classification of Statistical Activities) subject name, if applicable |
| `graphName`          | `String`  | Descriptive name optimized for graphing and visualization purposes                                  |
| `notes`              | `String`  | Additional notes, methodology, or descriptions about the variable                            |
| `unit`               | `String`  | Measurement unit of the variable (persons, rupiah, percentage, etc.)                                           |
| `type`               | `int?`    | Variable type classification identifier, if applicable                                        |
| `derivedPeriodID`    | `int?`    | Identifier for the derived period, if this is a calculated variable                           |
| `derivedVariableID`  | `int?`    | Identifier for the source variable, if this is derived from another variable                         |

## Common Variable Subjects

### Demographic Variables
- **Population Count**: Total population by region and characteristics
- **Age Distribution**: Population by age groups and gender
- **Migration**: Internal and international migration patterns
- **Household Composition**: Family structure and household size

### Economic Variables
- **GDP Components**: Gross domestic product by sector and expenditure
- **Employment**: Labor force participation, unemployment rates
- **Income**: Household income, wage levels, poverty indicators
- **Investment**: Capital formation, foreign direct investment

### Social Variables
- **Education**: Literacy rates, school enrollment, educational attainment
- **Health**: Life expectancy, infant mortality, healthcare access
- **Housing**: Housing conditions, access to utilities
- **Crime**: Public safety indicators and crime statistics

### Infrastructure Variables
- **Transportation**: Road networks, public transport accessibility
- **Utilities**: Water, electricity, telecommunications coverage
- **Technology**: Internet penetration, digital literacy

## Variable Discovery Workflow

The typical workflow for discovering and using variables:

1. **Domain Selection**: Choose the geographic area of interest
2. **Subject Exploration**: Browse variables by subject area
3. **Data Availability Check**: Use `showExistingVariable` to find variables with data
4. **Temporal Filtering**: Filter by year for time-sensitive analysis
5. **Relationship Analysis**: Explore derived variables and hierarchies

### Complete Example

```dart
// Comprehensive variable analysis workflow
class VariableAnalyzer {
  static Future<void> analyzeVariableEcosystem() async {
    try {
      // 1. Discover all subjects available nationally
      final nationalVars = await StadataFlutter.instance.list.variables(
        domain: '0000', // National
        lang: DataLanguage.id,
      );
      
      print('National Variables: ${nationalVars.data.length}');
      
      // 2. Find economic variables with data for Bali
      final baliEconomicVars = await StadataFlutter.instance.list.variables(
        domain: '5100', // Bali
        lang: DataLanguage.id,
        subjectID: 2, // Assuming 2 is economics
        showExistingVariable: true,
      );
      
      print('Bali Economic Variables: ${baliEconomicVars.data.length}');
      
      // 3. Analyze variable types and units
      final units = <String, int>{};
      for (final variable in baliEconomicVars.data) {
        units[variable.unit] = (units[variable.unit] ?? 0) + 1;
      }
      
      print('=== Economic Variable Units ===');
      units.forEach((unit, count) {
        print('$unit: $count variables');
      });
      
      // 4. Find derived variables
      final derivedVars = baliEconomicVars.data
          .where((v) => v.derivedVariableID != null)
          .toList();
      
      print('Derived Variables: ${derivedVars.length}');
      
      // 5. Generate variable metadata report
      if (derivedVars.isNotEmpty) {
        print('\n=== Derived Variable Analysis ===');
        for (final variable in derivedVars.take(3)) {
          print('Variable: ${variable.title}');
          print('Derived from: ${variable.derivedVariableID}');
          print('Period: ${variable.derivedPeriodID}');
          print('Notes: ${variable.notes}');
          print('---');
        }
      }
      
    } catch (e) {
      print('Error analyzing variables: $e');
    }
  }
}
```

## Integration with Other APIs

### Building Data Queries

Variables provide the foundation for querying actual statistical data:

```dart
// Use variables to build static table queries
Future<void> buildDataQuery(String domain, int subjectID) async {
  // 1. First, discover available variables
  final variables = await StadataFlutter.instance.list.variables(
    domain: domain,
    subjectID: subjectID,
    showExistingVariable: true,
  );
  
  print('Found ${variables.data.length} variables with data');
  
  // 2. Select variables of interest
  final keyVariables = variables.data
      .where((v) => v.title.toLowerCase().contains('total'))
      .take(5)
      .toList();
  
  // 3. Use variable IDs for further data retrieval
  for (final variable in keyVariables) {
    print('Variable ${variable.id}: ${variable.title}');
    print('Ready for data query with Variable ID: ${variable.id}');
    
    // This variable ID can now be used with other APIs
    // such as static tables or strategic indicators
  }
}
```

## Error Handling

Variable API methods return `Future<ListResult<Variable>>` and may throw specific exceptions:

- `VariableException`: Variable-related errors (invalid domain, subject ID errors)
- `ApiException`: Network or API-related errors
- `ApiKeyNotFoundException`: Invalid or missing API key

```dart
try {
  final result = await StadataFlutter.instance.list.variables(
    domain: '3200',
    subjectID: 1,
    showExistingVariable: true,
  );
  
  // Process successful result
  print('Found ${result.data.length} variables');
  
} on VariableException catch (e) {
  print('Variable error: ${e.message}');
  // Handle domain validation errors or subject ID issues
  
} on ApiException catch (e) {
  print('API error: ${e.message}');
  // Handle network connectivity or API service errors
  
} catch (e) {
  print('Unexpected error: $e');
  // Handle any other unexpected errors
}
```

## Performance Considerations

- **Subject Filtering**: Use subject IDs to reduce data transfer when focusing on specific topics
- **Data Availability**: Use `showExistingVariable: true` to avoid processing variables without data
- **Pagination**: Implement proper pagination for large variable collections
- **Caching**: Cache variable metadata as it changes infrequently
- **Incremental Loading**: Load variables by subject to improve user experience
