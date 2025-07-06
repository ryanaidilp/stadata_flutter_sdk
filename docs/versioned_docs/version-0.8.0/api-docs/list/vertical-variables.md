# Vertical Variables

The Vertical Variables API provides access to specialized variable structures used by BPS (Badan Pusat Statistik) Indonesia for organizing complex hierarchical data relationships. Vertical variables represent a sophisticated classification system that enables multi-dimensional data analysis by organizing variables in vertical relationship structures that reflect real-world hierarchical connections.

Vertical variables are essential for understanding layered data relationships in Indonesian statistics, particularly in complex domains such as economic indicators, administrative hierarchies, and demographic classifications. These variables enable researchers and analysts to explore data across multiple organizational levels simultaneously.

## Understanding BPS Vertical Variables

Vertical variables provide structured access to hierarchical data relationships:

- **Hierarchical Organization**: Variables organized in parent-child and group relationships
- **Multi-Level Analysis**: Support for analysis across different organizational levels
- **Group Classification**: Systematic grouping of related variables for comprehensive analysis
- **Dimensional Mapping**: Framework for understanding complex data dimensions and relationships
- **Analytical Flexibility**: Support for both drill-down and roll-up analytical operations

## Vertical Variable System Structure

BPS vertical variables are designed to handle complex data relationships:

- **Variable Hierarchy**: Multi-level variable organization with clear parent-child relationships
- **Group Classifications**: Systematic grouping of variables by thematic and functional criteria
- **Item Specifications**: Detailed item-level organization within variable groups
- **Cross-Dimensional Links**: Relationships that span across different data dimensions
- **Analytical Contexts**: Support for different analytical perspectives and use cases

## Parameters

| Parameter    | Type           | Description                                                        |
| ------------ | -------------- | ------------------------------------------------------------------ |
| `domain`     | `String`       | Domain code (region) to retrieve vertical variables **(required)** |
| `lang`       | `DataLanguage` | Language for vertical variables data (default: `DataLanguage.id`) |
| `page`       | `int`          | Page number (default: `1`)                                        |
| `variableID` | `int?`         | Variable ID to filter vertical variables (optional)               |

## Examples

### 1. Get All Vertical Variables for a Domain

```dart
// Fetch vertical variables from Central Java BPS
final verticalVariablesResult = await StadataFlutter.instance.list.verticalVariables(
  domain: '3300', // Central Java domain code
  lang: DataLanguage.id,
);

final variables = verticalVariablesResult.data;
final pagination = verticalVariablesResult.pagination;

// Print pagination information
print('Current Page: ${pagination.page}');
print('Total Pages: ${pagination.pages}');
print('Data Count in This Page: ${pagination.count}');
print('Per Page: ${pagination.perPage}');
print('Total: ${pagination.total}');
print('------------------------');

// Print retrieved vertical variables data
for (final variable in variables) {
  print('Vertical Variable ID: ${variable.id}');
  print('Title: ${variable.title}');
  print('Item ID: ${variable.itemID}');
  print('Group ID: ${variable.groupID ?? 'No group'}');
  print('Group Name: ${variable.groupName ?? 'Ungrouped'}');
  print('------------------------');
}
```

### 2. Filter Vertical Variables by Variable ID

```dart
// Get vertical variables associated with a specific variable
final specificVerticalVars = await StadataFlutter.instance.list.verticalVariables(
  domain: '0000', // National level
  lang: DataLanguage.id,
  variableID: 2501, // Example variable ID for economic indicators
);

// Analyze variable-specific vertical structures
print('=== Vertical Variables for Variable 2501 ===');
for (final verticalVar in specificVerticalVars.data) {
  print('Vertical Variable: ${verticalVar.title}');
  print('Variable ID: ${verticalVar.id}');
  print('Item ID: ${verticalVar.itemID}');
  
  // Analyze group relationships
  if (verticalVar.groupID != null && verticalVar.groupName != null) {
    print('Group: ${verticalVar.groupName} (ID: ${verticalVar.groupID})');
    print('  Type: Grouped vertical variable');
  } else {
    print('  Type: Independent vertical variable');
  }
  
  print('------------------------');
}
```

### 3. Explore Vertical Variable Groups

```dart
// Analyze vertical variable grouping patterns across domains
class VerticalVariableGroupExplorer {
  static Future<void> exploreGroupStructures() async {
    final domains = ['0000', '3100', '3200', '3300']; // National, Jakarta, West Java, Central Java
    final domainGroups = <String, Map<String, List<VerticalVariable>>>{};
    
    for (final domain in domains) {
      final variables = await StadataFlutter.instance.list.verticalVariables(
        domain: domain,
        lang: DataLanguage.id,
      );
      
      // Group variables by their group names
      final groupedVars = <String, List<VerticalVariable>>{};
      for (final variable in variables.data) {
        final groupName = variable.groupName ?? 'Ungrouped';
        groupedVars[groupName] = (groupedVars[groupName] ?? [])..add(variable);
      }
      
      domainGroups[domain] = groupedVars;
      
      await Future.delayed(Duration(milliseconds: 300));
    }
    
    print('=== Vertical Variable Group Analysis ===');
    for (final entry in domainGroups.entries) {
      print('Domain ${entry.key}:');
      print('  Total Groups: ${entry.value.keys.length}');
      
      final sortedGroups = entry.value.entries.toList()
        ..sort((a, b) => b.value.length.compareTo(a.value.length));
      
      print('  Top Groups by Variable Count:');
      for (final groupEntry in sortedGroups.take(5)) {
        print('    ${groupEntry.key}: ${groupEntry.value.length} variables');
        
        // Show sample variable titles
        final sampleTitles = groupEntry.value.take(2).map((v) => v.title).join(', ');
        print('      Sample: $sampleTitles');
      }
      
      print('---');
    }
  }
}
```

### 4. Analyze Vertical Variable Hierarchies

```dart
// Comprehensive analysis of vertical variable hierarchical structures
class VerticalVariableHierarchyAnalyzer {
  static Future<void> analyzeHierarchicalStructures(String domain) async {
    try {
      // 1. Get all vertical variables for the domain
      final allVerticalVars = await StadataFlutter.instance.list.verticalVariables(
        domain: domain,
        lang: DataLanguage.id,
      );
      
      print('=== Vertical Variable Hierarchy Analysis ===');
      print('Total Vertical Variables: ${allVerticalVars.data.length}');
      
      // 2. Analyze group distribution
      final groupDistribution = <String, List<VerticalVariable>>{};
      final ungroupedVariables = <VerticalVariable>[];
      
      for (final variable in allVerticalVars.data) {
        if (variable.groupName != null && variable.groupName!.isNotEmpty) {
          final groupName = variable.groupName!;
          groupDistribution[groupName] = (groupDistribution[groupName] ?? [])..add(variable);
        } else {
          ungroupedVariables.add(variable);
        }
      }
      
      print('Grouped Variables: ${groupDistribution.length} groups');
      print('Ungrouped Variables: ${ungroupedVariables.length}');
      
      // 3. Analyze group hierarchies
      for (final entry in groupDistribution.entries) {
        final groupName = entry.key;
        final variables = entry.value;
        
        print('\\n=== Group: $groupName ===');
        print('Variables in group: ${variables.length}');
        
        // Analyze item ID patterns
        final itemIds = variables.map((v) => v.itemID).toSet();
        print('Unique item IDs: ${itemIds.length}');
        
        // Check for hierarchical patterns
        final groupIds = variables
            .where((v) => v.groupID != null)
            .map((v) => v.groupID!)
            .toSet();
        
        if (groupIds.length > 1) {
          print('Multiple group IDs detected: $groupIds');
          print('  → Complex hierarchical structure');
        } else if (groupIds.length == 1) {
          print('Single group ID: ${groupIds.first}');
          print('  → Simple group structure');
        }
        
        // Show sample variables
        print('Sample variables:');
        for (final variable in variables.take(3)) {
          print('  • ${variable.title} (Item: ${variable.itemID})');
        }
      }
      
      // 4. Cross-group relationship analysis
      print('\\n=== Cross-Group Analysis ===');
      final allGroupIds = groupDistribution.values
          .expand((vars) => vars)
          .where((v) => v.groupID != null)
          .map((v) => v.groupID!)
          .toSet();
      
      print('Unique group IDs across all groups: ${allGroupIds.length}');
      
      // Find groups that share item IDs
      final itemIdGroups = <int, List<String>>{};
      for (final entry in groupDistribution.entries) {
        for (final variable in entry.value) {
          itemIdGroups[variable.itemID] = (itemIdGroups[variable.itemID] ?? [])..add(entry.key);
        }
      }
      
      final sharedItemIds = itemIdGroups.entries
          .where((entry) => entry.value.length > 1)
          .length;
      
      print('Item IDs shared across groups: $sharedItemIds');
      if (sharedItemIds > 0) {
        print('  → Cross-group relationships detected');
      }
      
    } catch (e) {
      print('Hierarchy analysis error: $e');
    }
  }
}
```

### 5. Build Vertical Variable Navigation System

```dart
// Create a comprehensive navigation system for vertical variables
class VerticalVariableNavigationBuilder {
  static Future<Map<String, dynamic>> buildNavigationStructure(String domain) async {
    final navigationStructure = <String, dynamic>{};
    
    try {
      // Get all vertical variables
      final variables = await StadataFlutter.instance.list.verticalVariables(
        domain: domain,
        lang: DataLanguage.id,
      );
      
      navigationStructure['domain'] = domain;
      navigationStructure['totalVariables'] = variables.data.length;
      navigationStructure['groups'] = <Map<String, dynamic>>[];
      
      // Group variables by group name
      final groupedVars = <String, List<VerticalVariable>>{};
      for (final variable in variables.data) {
        final groupName = variable.groupName ?? 'Ungrouped';
        groupedVars[groupName] = (groupedVars[groupName] ?? [])..add(variable);
      }
      
      // Build navigation for each group
      for (final entry in groupedVars.entries) {
        final groupName = entry.key;
        final groupVariables = entry.value;
        
        // Build group node
        final groupNode = <String, dynamic>{
          'groupName': groupName,
          'variableCount': groupVariables.length,
          'variables': <Map<String, dynamic>>[],
        };
        
        // Get unique group IDs for this group
        final groupIds = groupVariables
            .where((v) => v.groupID != null)
            .map((v) => v.groupID!)
            .toSet();
        
        groupNode['groupIds'] = groupIds.toList();
        
        // Add variables to group
        for (final variable in groupVariables) {
          groupNode['variables'].add({
            'id': variable.id,
            'title': variable.title,
            'itemID': variable.itemID,
            'groupID': variable.groupID,
          });
        }
        
        // Calculate group statistics
        final uniqueItemIds = groupVariables.map((v) => v.itemID).toSet();
        groupNode['uniqueItemIds'] = uniqueItemIds.length;
        
        (navigationStructure['groups'] as List<Map<String, dynamic>>).add(groupNode);
      }
      
      // Calculate navigation statistics
      final allGroups = navigationStructure['groups'] as List<Map<String, dynamic>>;
      final groupsWithMultipleIds = allGroups
          .where((group) => (group['groupIds'] as List).length > 1)
          .length;
      
      navigationStructure['groupsWithMultipleIds'] = groupsWithMultipleIds;
      navigationStructure['totalGroups'] = allGroups.length;
      
      // Print navigation summary
      print('=== Vertical Variable Navigation Summary ===');
      print('Domain: $domain');
      print('Total Variables: ${navigationStructure['totalVariables']}');
      print('Total Groups: ${navigationStructure['totalGroups']}');
      print('Groups with Multiple IDs: $groupsWithMultipleIds');
      print('');
      
      // Print group breakdown
      for (final group in allGroups) {
        print('📁 ${group['groupName']}');
        print('   Variables: ${group['variableCount']}');
        print('   Unique Item IDs: ${group['uniqueItemIds']}');
        print('   Group IDs: ${(group['groupIds'] as List).join(', ')}');
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

## Properties (VerticalVariable)

| Property    | Type      | Description                                                             |
| ----------- | --------- | ----------------------------------------------------------------------- |
| `id`        | `int`     | Unique identifier for the vertical variable                             |
| `title`     | `String`  | Descriptive title or label of the vertical variable                     |
| `itemID`    | `int`     | Specific item identifier within the vertical variable structure         |
| `groupID`   | `int?`    | Group identifier for hierarchical organization (optional)               |
| `groupName` | `String?` | Name of the group containing this vertical variable (optional)          |

## Common Vertical Variable Patterns

### Hierarchical Economic Indicators
- **Sector Classifications**: Variables organized by economic sectors and sub-sectors
- **Regional Hierarchies**: Variables structured by administrative levels (national, provincial, regency)
- **Temporal Classifications**: Variables organized by time periods and frequencies
- **Industry Groupings**: Variables categorized by industrial classifications

### Administrative Structure Variables
- **Government Levels**: Variables organized by administrative hierarchy
- **Department Classifications**: Variables grouped by government departments and agencies
- **Service Categories**: Variables structured by public service types
- **Policy Domains**: Variables organized by policy areas and implementation levels

### Demographic Classification Variables
- **Population Segments**: Variables organized by demographic characteristics
- **Geographic Classifications**: Variables structured by geographic and administrative boundaries
- **Social Categories**: Variables grouped by social and economic classifications
- **Household Types**: Variables organized by household and family structures

## Vertical Variable Discovery Workflow

The typical workflow for working with vertical variables:

1. **Domain Exploration**: Discover available vertical variables for a domain
2. **Group Analysis**: Understand variable groupings and hierarchical structures
3. **Relationship Mapping**: Identify relationships between variables and groups
4. **Hierarchical Navigation**: Use group structures for efficient data exploration
5. **Multi-Dimensional Analysis**: Leverage vertical structures for comprehensive analysis

### Complete Vertical Variable Analysis Example

```dart
// Comprehensive vertical variable analysis and utilization system
class VerticalVariableAnalysisSystem {
  static Future<void> performCompleteAnalysis() async {
    try {
      // 1. Multi-domain vertical variable discovery
      final domains = ['0000', '3100', '3200']; // National, Jakarta, West Java
      final domainAnalysis = <String, Map<String, dynamic>>{};
      
      for (final domain in domains) {
        final variables = await StadataFlutter.instance.list.verticalVariables(
          domain: domain,
          lang: DataLanguage.id,
        );
        
        // Analyze variable distribution
        final groupDistribution = <String, int>{};
        final itemIdRange = <int>[];
        
        for (final variable in variables.data) {
          final groupName = variable.groupName ?? 'Ungrouped';
          groupDistribution[groupName] = (groupDistribution[groupName] ?? 0) + 1;
          itemIdRange.add(variable.itemID);
        }
        
        itemIdRange.sort();
        
        domainAnalysis[domain] = {
          'totalVariables': variables.data.length,
          'groupCount': groupDistribution.keys.length,
          'groupDistribution': groupDistribution,
          'itemIdRange': {
            'min': itemIdRange.isNotEmpty ? itemIdRange.first : 0,
            'max': itemIdRange.isNotEmpty ? itemIdRange.last : 0,
          },
        };
        
        await Future.delayed(Duration(milliseconds: 200));
      }
      
      // 2. Cross-domain comparison
      print('=== Cross-Domain Vertical Variable Analysis ===');
      for (final entry in domainAnalysis.entries) {
        final domain = entry.key;
        final analysis = entry.value;
        
        print('Domain $domain:');
        print('  Total Variables: ${analysis['totalVariables']}');
        print('  Groups: ${analysis['groupCount']}');
        
        final itemRange = analysis['itemIdRange'] as Map<String, int>;
        print('  Item ID Range: ${itemRange['min']} - ${itemRange['max']}');
        
        final groupDist = analysis['groupDistribution'] as Map<String, int>;
        final topGroups = groupDist.entries.toList()
          ..sort((a, b) => b.value.compareTo(a.value));
        
        if (topGroups.isNotEmpty) {
          print('  Top Group: ${topGroups.first.key} (${topGroups.first.value} variables)');
        }
        
        print('');
      }
      
      // 3. Variable relationship analysis
      print('=== Variable Relationship Recommendations ===');
      final nationalData = domainAnalysis['0000'];
      if (nationalData != null) {
        final groupCount = nationalData['groupCount'] as int;
        final totalVars = nationalData['totalVariables'] as int;
        
        if (groupCount > 0) {
          final avgVarsPerGroup = totalVars / groupCount;
          print('National level analysis:');
          print('  Average variables per group: ${avgVarsPerGroup.toStringAsFixed(1)}');
          
          if (avgVarsPerGroup > 10) {
            print('  Recommendation: High variable density - suitable for detailed analysis');
          } else if (avgVarsPerGroup > 5) {
            print('  Recommendation: Moderate density - good for comparative analysis');
          } else {
            print('  Recommendation: Low density - suitable for overview analysis');
          }
        }
        
        final itemRange = nationalData['itemIdRange'] as Map<String, int>;
        final rangeSize = itemRange['max']! - itemRange['min']!;
        print('  Item ID span: $rangeSize');
        
        if (rangeSize > 1000) {
          print('  Recommendation: Wide range - implement efficient pagination');
        }
      }
      
    } catch (e) {
      print('Complete analysis error: $e');
    }
  }
}
```

## Integration with Other APIs

### Using Vertical Variables for Enhanced Data Analysis

```dart
// Integrate vertical variables with other BPS data sources for comprehensive analysis
Future<void> integrateVerticalVariablesWithData(String domain) async {
  try {
    // Get vertical variables for context
    final verticalVars = await StadataFlutter.instance.list.verticalVariables(
      domain: domain,
      lang: DataLanguage.id,
    );
    
    // Get regular variables for comparison
    final regularVars = await StadataFlutter.instance.list.variables(
      domain: domain,
      lang: DataLanguage.id,
    );
    
    print('=== Variable Integration Analysis ===');
    print('Vertical Variables: ${verticalVars.data.length}');
    print('Regular Variables: ${regularVars.data.length}');
    
    // Analyze relationships between vertical and regular variables
    final verticalVarIds = verticalVars.data.map((v) => v.id).toSet();
    final regularVarIds = regularVars.data.map((v) => v.id).toSet();
    
    final commonIds = verticalVarIds.intersection(regularVarIds);
    print('Common Variable IDs: ${commonIds.length}');
    
    if (commonIds.isNotEmpty) {
      print('Integration opportunities detected:');
      for (final id in commonIds.take(5)) {
        final verticalVar = verticalVars.data.firstWhere((v) => v.id == id);
        final regularVar = regularVars.data.firstWhere((v) => v.id == id);
        
        print('  Variable ID $id:');
        print('    Vertical: ${verticalVar.title}');
        print('    Regular: ${regularVar.title}');
        print('    Group: ${verticalVar.groupName ?? 'None'}');
      }
    }
    
    // Get static tables for data context
    final staticTables = await StadataFlutter.instance.list.staticTable(
      domain: domain,
      lang: DataLanguage.id,
    );
    
    print('\\nStatic Tables Available: ${staticTables.data.length}');
    print('→ Use vertical variable groups to organize table analysis');
    print('→ Apply hierarchical variable structures to table data interpretation');
    
  } catch (e) {
    print('Integration analysis error: $e');
  }
}
```

## Error Handling

Vertical Variables API methods return `Future<ListResult<VerticalVariable>>` and may throw specific exceptions:

- `VerticalVariableException`: Vertical variable-related errors (invalid domain, variable ID errors)
- `ApiException`: Network or API-related errors
- `ApiKeyNotFoundException`: Invalid or missing API key

```dart
try {
  final result = await StadataFlutter.instance.list.verticalVariables(
    domain: '3200',
    variableID: 2501,
    lang: DataLanguage.id,
  );
  
  // Process successful result
  print('Found ${result.data.length} vertical variables');
  
} on VerticalVariableException catch (e) {
  print('Vertical variable error: ${e.message}');
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

- **Group-Based Filtering**: Use variable IDs to focus on specific hierarchical branches
- **Hierarchical Caching**: Cache group structures as they provide analytical context
- **Relationship Mapping**: Build efficient mappings between vertical variables and data tables
- **Navigation Optimization**: Use group structures to optimize multi-level data exploration
- **Memory Management**: Handle large variable hierarchies efficiently in memory-constrained environments
- **Cross-Domain Analysis**: Consider API rate limits when analyzing vertical variables across multiple domains