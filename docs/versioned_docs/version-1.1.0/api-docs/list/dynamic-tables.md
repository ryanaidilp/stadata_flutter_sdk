# Dynamic Tables

The Dynamic Tables API provides access to interactive statistical data tables from BPS (Badan Pusat Statistik) Indonesia. Dynamic tables offer more flexible data access compared to static tables, allowing users to filter data by variables, periods, and other dimensions. These tables contain raw statistical data that can be dynamically queried and filtered based on specific parameters.

Dynamic tables are essential for researchers, data scientists, and analysts who need granular access to statistical datasets with customizable views and filtering capabilities.

## Understanding Dynamic Tables

Dynamic tables differ from static tables in several key ways:

- **Flexible Filtering**: Filter data by vertical variables, derived variables, and time periods
- **Structured Data Access**: Access raw data organized by statistical variables and dimensions
- **Multi-dimensional Analysis**: Query data across multiple dimensions including geographic, temporal, and categorical
- **Subject-based Organization**: Tables organized by subject categories and subjects
- **Real-time Query**: Data filtered at request time based on provided parameters

## Table Organization Structure

BPS dynamic tables follow a hierarchical organization:

- **Domain Classification**: Tables grouped by geographic areas (national, provincial, local)
- **Subject Categories**: High-level statistical theme groupings
- **Subjects**: Specific statistical topics within categories
- **Variables**: Individual statistical measures with associated data
- **Dimensions**: Vertical variables, derived variables, periods, and derived periods

## Parameters

| Parameter | Type           | Description                                                      |
| --------- | -------------- | ---------------------------------------------------------------- |
| `domain`  | `String`       | Domain code (region) for retrieving dynamic tables **(required)** |
| `lang`    | `DataLanguage` | Language for dynamic table data (default: `DataLanguage.id`)     |
| `page`    | `int`          | Page number (default: `1`)                                       |
| `keyword` | `String?`      | Keyword for searching dynamic tables (optional)                  |

## Examples

### 1. Get All Dynamic Tables for a Domain

```dart
// Fetch dynamic tables from Central Java BPS
final dynamicTableResult = await StadataFlutter.instance.list.dynamicTables(
  domain: '3300', // Central Java domain code
  lang: DataLanguage.id,
);

final dynamicTableList = dynamicTableResult.data;
final pagination = dynamicTableResult.pagination;

// Print pagination information
print('Current Page: ${pagination.page}');
print('Total Pages: ${pagination.pages}');
print('Data Count in This Page: ${pagination.count}');
print('Per Page: ${pagination.perPage}');
print('Total: ${pagination.total}');
print('------------------------');

// Print retrieved dynamic table data
for (final table in dynamicTableList) {
  print('Variable ID: ${table.id}');
  print('Title: ${table.title}');
  print('Subject ID: ${table.subjectId}');
  print('Subject: ${table.subject}');
  print('Vertical Variable: ${table.vertical}');
  print('Unit: ${table.unit}');
  print('Graph Name: ${table.graphName}');
  print('------------------------');
}
```

### 2. Search Dynamic Tables by Keyword

```dart
// Search for population-related dynamic tables
final populationTables = await StadataFlutter.instance.list.dynamicTables(
  domain: '0000', // National level
  lang: DataLanguage.id,
  keyword: 'penduduk', // Search for population tables
);

// Process search results
for (final table in populationTables.data) {
  print('Population Table: ${table.title}');
  print('Subject: ${table.subject}');
  print('Unit: ${table.unit}');
  print('Graph: ${table.graphName}');

  // Check vertical variable availability
  if (table.vertical != null) {
    print('Vertical Variable: ${table.vertical}');
  }

  print('------------------------');
}
```

### 3. Browse Dynamic Tables with Pagination

```dart
// Systematically browse through all available dynamic tables
class DynamicTableBrowser {
  static Future<void> browseAllTables(String domain) async {
    int currentPage = 1;
    bool hasMorePages = true;
    final allTables = <DynamicTable>[];

    while (hasMorePages) {
      final pageResult = await StadataFlutter.instance.list.dynamicTables(
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

    print('Total dynamic tables collected: ${allTables.length}');

    // Analyze table distribution by subject
    final subjectGroups = <String, int>{};
    for (final table in allTables) {
      final subject = table.subject;
      subjectGroups[subject] = (subjectGroups[subject] ?? 0) + 1;
    }

    print('\n=== Tables by Subject ===');
    subjectGroups.forEach((subject, count) {
      print('$subject: $count tables');
    });
  }
}
```

### 4. Advanced Dynamic Table Discovery

```dart
// Comprehensive dynamic table analysis
class DynamicTableAnalyzer {
  static Future<void> analyzeTableAvailability(String domain) async {
    try {
      // 1. Get overview of all dynamic tables
      final allTables = await StadataFlutter.instance.list.dynamicTables(
        domain: domain,
        lang: DataLanguage.id,
      );

      print('Total dynamic tables in domain $domain: ${allTables.pagination.total}');

      // 2. Search for economic data tables
      final economicTables = await StadataFlutter.instance.list.dynamicTables(
        domain: domain,
        lang: DataLanguage.id,
        keyword: 'ekonomi',
      );

      print('Economic tables: ${economicTables.data.length}');

      // 3. Analyze tables by unit type
      final unitGroups = <String, int>{};
      for (final table in allTables.data) {
        final unit = table.unit;
        unitGroups[unit] = (unitGroups[unit] ?? 0) + 1;
      }

      print('\n=== Tables by Unit ===');
      unitGroups.forEach((unit, count) {
        print('$unit: $count tables');
      });

    } catch (e) {
      print('Error analyzing tables: $e');
    }
  }
}
```

### 5. Working with Dynamic Table Dimensions

```dart
// Load and analyze dimensions for a dynamic table variable
class DynamicTableDimensionLoader {
  static Future<void> loadTableDimensions(
    String domain,
    int variableId,
  ) async {
    try {
      // 1. Load vertical variables for this table
      final verticalVars = await StadataFlutter.instance.list.verticalVariables(
        domain: domain,
        variableID: variableId,
      );

      print('=== Vertical Variables ===');
      for (final v in verticalVars.data) {
        print('ID: ${v.id}, Title: ${v.title}');
      }

      // 2. Load periods available for this table
      final periods = await StadataFlutter.instance.list.periods(
        domain: domain,
        variableID: variableId,
      );

      print('\n=== Available Periods ===');
      for (final p in periods.data) {
        print('ID: ${p.id}, Year: ${p.year}');
      }

      // 3. Load derived variables
      final derivedVars = await StadataFlutter.instance.list.derivedVariables(
        domain: domain,
        variableID: variableId,
      );

      print('\n=== Derived Variables ===');
      for (final dv in derivedVars.data) {
        print('ID: ${dv.id}, Name: ${dv.name}');
      }

      // 4. Load derived periods
      final derivedPeriods = await StadataFlutter.instance.list.derivedPeriods(
        domain: domain,
        variableID: variableId,
      );

      print('\n=== Derived Periods ===');
      for (final dp in derivedPeriods.data) {
        print('ID: ${dp.id}, Name: ${dp.name}');
      }

    } catch (e) {
      print('Error loading dimensions: $e');
    }
  }
}
```

## Properties (DynamicTable)

| Property    | Type       | Description                                                     |
| ----------- | ---------- | --------------------------------------------------------------- |
| `id`        | `int`      | Unique identifier of the variable (variable ID)                 |
| `title`     | `String`   | Title or name of the dynamic table variable                     |
| `subjectId` | `int`      | Subject identifier associated with the table                    |
| `subject`   | `String`   | Subject name or thematic category                               |
| `vertical`  | `int`      | Vertical variable identifier                                    |
| `unit`      | `String`   | Measurement unit for the data values                            |
| `graphName` | `String`   | Display name for graph/chart representations                    |

## Related List APIs for Dynamic Tables

Dynamic tables work in conjunction with several related APIs to provide complete data access:

### Subject Categories

```dart
// Get subject categories for organizing dynamic tables
final categories = await StadataFlutter.instance.list.subjectCategories(
  domain: '3300',
);

for (final category in categories.data) {
  print('Category: ${category.name} (ID: ${category.id})');
}
```

### Subjects

```dart
// Get subjects within a category
final subjects = await StadataFlutter.instance.list.subjects(
  domain: '3300',
  subjectCategoryID: 1, // Filter by category
);

for (final subject in subjects.data) {
  print('Subject: ${subject.name} (ID: ${subject.id})');
}
```

### Variables

```dart
// Get variables (dynamic tables) for a subject
final variables = await StadataFlutter.instance.list.variables(
  domain: '3300',
  subjectID: 1, // Filter by subject
);

for (final variable in variables.data) {
  print('Variable: ${variable.title} (ID: ${variable.id})');
}
```

## Common Table Categories

### Demographic Tables
- **Population Statistics**: Population counts, density, growth rates by region
- **Age Distribution**: Population breakdown by age groups
- **Gender Statistics**: Male/female population ratios and distributions

### Economic Tables
- **Regional GDP**: Gross regional domestic product by sector
- **Employment Statistics**: Labor force, unemployment by industry
- **Price Indices**: Consumer price index, inflation data

### Social Tables
- **Education Statistics**: School enrollment, literacy rates
- **Health Indicators**: Healthcare access, disease statistics
- **Poverty Data**: Poverty rates and welfare indicators

### Agricultural Tables
- **Crop Production**: Agricultural output by commodity
- **Land Use**: Agricultural land area and utilization
- **Livestock Statistics**: Animal population and production

## Integration with View API

After discovering dynamic tables using the List API, use the View API to retrieve detailed data:

```dart
// Workflow: List -> View for dynamic tables
Future<void> dynamicTableWorkflow(String domain) async {
  // 1. Find tables of interest
  final tables = await StadataFlutter.instance.list.dynamicTables(
    domain: domain,
    keyword: 'penduduk',
  );

  if (tables.data.isNotEmpty) {
    final selectedTable = tables.data.first;

    // 2. Get detailed data with filtering
    final detailResult = await StadataFlutter.instance.list.dynamicTableDetail(
      variableID: selectedTable.id,
      domain: domain,
      period: '119,120', // Filter by specific periods
      lang: DataLanguage.id,
    );

    detailResult.fold(
      (failure) => print('Error: $failure'),
      (table) {
        print('Title: ${table.title}');
        print('Data rows: ${table.dataContent.length}');
      },
    );
  }
}
```

## Error Handling

Dynamic Table API methods return `Future<ListResult<DynamicTable>>` and may throw specific exceptions:

- `DynamicTableException`: Dynamic table-related errors (invalid domain, variable not found)
- `ApiException`: Network or API-related errors
- `ApiKeyNotFoundException`: Invalid or missing API key

```dart
try {
  final result = await StadataFlutter.instance.list.dynamicTables(
    domain: '3200',
    keyword: 'ekonomi',
  );

  // Process successful result
  print('Found ${result.data.length} dynamic tables');

} on DynamicTableException catch (e) {
  print('Dynamic table error: ${e.message}');
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

- **Pagination Strategy**: Use pagination for domains with many dynamic tables
- **Search Optimization**: Use specific keywords to reduce result sets
- **Caching**: Cache frequently accessed table metadata locally
- **Rate Limiting**: Implement delays between requests for large-scale data collection
- **Dimension Loading**: Load dimensions (variables, periods) only when needed
