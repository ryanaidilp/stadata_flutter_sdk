# Statistical Classification (KBLI & KBKI)

The Statistical Classification API provides access to Indonesia's standardized classification systems from BPS (Badan Pusat Statistik): KBLI (Klasifikasi Baku Lapangan Usaha Indonesia / Indonesian Standard Industrial Classification) and KBKI (Klasifikasi Baku Komoditi Indonesia / Indonesian Standard Commodity Classification). These classification systems are fundamental frameworks for organizing and categorizing economic activities and commodities in Indonesian statistics.

KBLI and KBKI serve as the backbone for statistical data collection, economic analysis, and policy formulation across Indonesia. Understanding these classifications is essential for researchers, economists, business analysts, and policymakers who work with Indonesian economic and statistical data.

## Understanding Statistical Classifications

Statistical classifications provide standardized frameworks for data organization:

- **Economic Activity Classification (KBLI)**: Systematic categorization of economic activities and industries
- **Commodity Classification (KBKI)**: Structured classification of goods and commodities
- **Hierarchical Organization**: Multi-level classification from broad categories to specific activities
- **International Alignment**: Classifications aligned with international standards while reflecting Indonesian economic structure
- **Version Management**: Multiple versions reflecting economic evolution and methodological improvements

## Classification System Structure

### KBLI (Indonesian Standard Industrial Classification)

KBLI organizes economic activities into a hierarchical structure:

- **Category (1 letter)**: Broad economic sectors (A-U)
- **Primary Group (2 digits)**: Major economic divisions within categories
- **Group (3 digits)**: Specific economic activities within primary groups
- **Sub-group (4 digits)**: Detailed activities within groups
- **Cluster (5 digits)**: Most specific level of economic activity classification

### KBKI (Indonesian Standard Commodity Classification)

KBKI organizes commodities and goods into structured levels:

- **Section (1 digit)**: Broad commodity categories (0-4)
- **Division (2 digits)**: Major commodity groups within sections
- **Group (3 digits)**: Specific commodity types within divisions
- **Classes (4 digits)**: Detailed commodity categories
- **Sub-class (5 digits)**: Specific commodity sub-categories
- **Commodity Group (7 digits)**: Detailed commodity groupings
- **Commodity (10 digits)**: Individual commodity items

## Enums

### ClassificationType

`ClassificationType` is the base class for determining the type of classification. This class is then extended by `KBLIType` and `KBKIType`.

#### KBLIType

| Enum | Value | Description |
|------|-------|-------------|
|KBLI.y2009 | `kbli2009` | KBLI year 2009 |
|KBLI.y2015 | `kbli2015` | KBLI year 2015 |
|KBLI.y2017 | `kbli2017` | KBLI year 2017 |
|KBLI.y2020 | `kbli2020` | KBLI year 2020 |

To make a request to the `detail` endpoint, the KBLI code needs to be formatted in the `kbli_year_code` format. This class facilitates this formatting through the `urlParamGenerator` method.

Example:
```dart
final url = KBLIType.y2009.urlParamGenerator('24');
/// result: kbli_2009_24
final value = KBLIType.y2009.value;
/// result: kbli2009
final year = KBLIType.y2009.year;
/// result: 2009
```

#### KBKIType

| Enum | Value | Description |
|------|-------|-------------|
|KBKI.y2015 | `kbki2015` | KBKI year 2015 |

Example:
```dart
final url = KBKIType.y2015.urlParamGenerator('24');
/// result: kbki_2015_24
final value = KBKIType.y2015.value;
/// result: kbki2015
final year = KBKIType.y2015.year;
/// result: 2015
```

### ClassificationLevel

`ClassificationLevel` is the base class for determining the group/level of classification.

#### KBLILevel

| Enum | Value | Description |
|------|-------|-------------|
|KBLILevel.category | `category` | Represents the main classification. Marked with a single alphabet. |
|KBLILevel.primaryGroup | `primary group` | Detailed description from category, each coded with two digits. |
|KBLILevel.group | `group` | Further details from the primary group, each coded with three digits. |
|KBLILevel.subGroup | `subgroup` | Further detail from a group's economic activities, coded with four digits. |
|KBLILevel.cluster | `cluster` | Distinguishes activities within a subgroup, coded with five digits. |

Example:
```dart
final isValid = KBLILevel.category.validateCode('A');
/// result: true
final value = KBLILevel.category.value;
/// result: category
```

#### KBKILevel

| Enum | Value | Description |
|------|-------|-------------|
|KBKILevel.section | `section` | General classification outline, 1-digit code, 5 sections, 0-4. |
|KBKILevel.division | `division` | Detailed description from section, 2-digit code. |
|KBKILevel.group | `group` | Further details from division, 3-digit code. |
|KBKILevel.classes | `classes` | Further details from group, 4-digit code. |
|KBKILevel.subClass | `subclass` | Detailed from classes, 5-digit code. |
|KBKILevel.commodityGroup | `commodity group` | Detailed from sub-classes, 7-digit code. |
|KBKILevel.commodity | `commodity` | Detailed from commodity group, 10-digit code. |

## Parameters

| Parameter | Type                   | Description                                                                             |
| --------- | ---------------------- | --------------------------------------------------------------------------------------- |
| `type`    | `ClassificationType`   | Specifies the classification type from the `KBLIType` or `KBKIType` enum **(required)** |
| `level`   | `ClassificationLevel?` | Specifies the classification level from the `KBLILevel` or `KBKILevel` enum (optional) |
| `lang`    | `DataLanguage`         | Language used for KBLI/KBKI data (default: `DataLanguage.id`)                      |
| `page`    | `int`                  | Page number (default: `1`)                                                               |
| `perPage` | `int`                  | Number of data per page (default: `10`)                                                  |

## Examples

### 1. Get KBLI Categories (Top Level)

```dart
// Fetch all KBLI 2020 categories (broad economic sectors)
final result = await StadataFlutter.instance.list.statisticClassifications(
  type: KBLIType.y2020,
  level: KBLILevel.category,
  lang: DataLanguage.id,
);

final classificationsList = result.data;
final pagination = result.pagination;

// Display pagination information
print('Current Page: ${pagination.page}');
print('Total Pages: ${pagination.pages}');
print('Data Count in This Page: ${pagination.count}');
print('Per Page: ${pagination.perPage}');
print('Total: ${pagination.total}');
print('------------------------');

// Display KBLI categories
for (final classification in classificationsList) {
  print('Classification ID: ${classification.id}');
  print('Title: ${classification.title}');
  print('Description: ${classification.description}');
  print('Type: ${classification.type?.value}');
  print('Level: ${classification.level?.value}');
  print('Last Update: ${classification.lastUpdate}');
  print('Release Date: ${classification.releaseDate}');
  print('------------------------');
}
```

### 2. Explore KBLI Hierarchy (Manufacturing Sector)

```dart
// Explore the manufacturing sector hierarchy in KBLI 2020
class KBLIExplorer {
  static Future<void> exploreManufacturingHierarchy() async {
    try {
      // 1. Get Category C (Manufacturing)
      final categories = await StadataFlutter.instance.list.statisticClassifications(
        type: KBLIType.y2020,
        level: KBLILevel.category,
        lang: DataLanguage.id,
      );
      
      final manufacturing = categories.data
          .where((item) => item.id.startsWith('C') || 
                          item.title.toLowerCase().contains('manufaktur'))
          .firstOrNull;
      
      if (manufacturing != null) {
        print('=== Manufacturing Category ===');
        print('ID: ${manufacturing.id}');
        print('Title: ${manufacturing.title}');
        print('Description: ${manufacturing.description}');
      }
      
      // 2. Get Primary Groups within Manufacturing
      final primaryGroups = await StadataFlutter.instance.list.statisticClassifications(
        type: KBLIType.y2020,
        level: KBLILevel.primaryGroup,
        lang: DataLanguage.id,
      );
      
      final manufacturingGroups = primaryGroups.data
          .where((item) => item.id.startsWith('1') || item.id.startsWith('2') || item.id.startsWith('3'))
          .take(5)
          .toList();
      
      print('\\n=== Manufacturing Primary Groups (Sample) ===');
      for (final group in manufacturingGroups) {
        print('${group.id}: ${group.title}');
        print('  Description: ${group.description}');
      }
      
      // 3. Get detailed groups for food manufacturing (if available)
      final detailedGroups = await StadataFlutter.instance.list.statisticClassifications(
        type: KBLIType.y2020,
        level: KBLILevel.group,
        lang: DataLanguage.id,
      );
      
      final foodGroups = detailedGroups.data
          .where((item) => item.title.toLowerCase().contains('makanan') ||
                          item.title.toLowerCase().contains('food'))
          .take(3)
          .toList();
      
      print('\\n=== Food Manufacturing Groups ===');
      for (final group in foodGroups) {
        print('${group.id}: ${group.title}');
        print('  Description: ${group.description}');
      }
      
    } catch (e) {
      print('Error exploring KBLI hierarchy: $e');
    }
  }
}
```

### 3. Compare KBLI Versions

```dart
// Compare classification changes across KBLI versions
Future<void> compareKBLIVersions() async {
  try {
    final versions = [KBLIType.y2015, KBLIType.y2017, KBLIType.y2020];
    final versionData = <KBLIType, List<StatisticClassification>>{};
    
    // Get categories for each version
    for (final version in versions) {
      final result = await StadataFlutter.instance.list.statisticClassifications(
        type: version,
        level: KBLILevel.category,
        lang: DataLanguage.id,
      );
      versionData[version] = result.data;
      
      await Future.delayed(Duration(milliseconds: 300));
    }
    
    print('=== KBLI Version Comparison ===');
    for (final entry in versionData.entries) {
      print('${entry.key.value}: ${entry.value.length} categories');
      
      // Show sample categories
      for (final category in entry.value.take(3)) {
        print('  ${category.id}: ${category.title}');
      }
      print('---');
    }
    
    // Analyze classification evolution
    final kbli2015 = versionData[KBLIType.y2015] ?? [];
    final kbli2020 = versionData[KBLIType.y2020] ?? [];
    
    print('\\n=== Evolution Analysis ===');
    print('KBLI 2015 categories: ${kbli2015.length}');
    print('KBLI 2020 categories: ${kbli2020.length}');
    
    // Find common categories by ID
    final common2015Ids = kbli2015.map((c) => c.id).toSet();
    final common2020Ids = kbli2020.map((c) => c.id).toSet();
    final commonIds = common2015Ids.intersection(common2020Ids);
    
    print('Common categories: ${commonIds.length}');
    print('New in 2020: ${common2020Ids.difference(common2015Ids).length}');
    print('Removed since 2015: ${common2015Ids.difference(common2020Ids).length}');
    
  } catch (e) {
    print('Version comparison error: $e');
  }
}
```

### 4. Explore KBKI Commodity Classification

```dart
// Explore KBKI commodity classification structure
class KBKIExplorer {
  static Future<void> exploreKBKIStructure() async {
    try {
      // 1. Get all sections (top level)
      final sections = await StadataFlutter.instance.list.statisticClassifications(
        type: KBKIType.y2015,
        level: KBKILevel.section,
        lang: DataLanguage.id,
      );
      
      print('=== KBKI 2015 Sections ===');
      for (final section in sections.data) {
        print('Section ${section.id}: ${section.title}');
        print('  Description: ${section.description}');
      }
      
      // 2. Get divisions within a specific section
      final divisions = await StadataFlutter.instance.list.statisticClassifications(
        type: KBKIType.y2015,
        level: KBKILevel.division,
        lang: DataLanguage.id,
        perPage: 20,
      );
      
      print('\\n=== KBKI Divisions (Sample) ===');
      for (final division in divisions.data.take(10)) {
        print('Division ${division.id}: ${division.title}');
        
        // Check for derived classifications
        if (division.derived.isNotEmpty) {
          print('  Derived items: ${division.derived.length}');
          for (final derived in division.derived.take(2)) {
            print('    - ${derived.code}: ${derived.title}');
          }
        }
      }
      
      // 3. Get commodity groups for analysis
      final commodityGroups = await StadataFlutter.instance.list.statisticClassifications(
        type: KBKIType.y2015,
        level: KBKILevel.commodityGroup,
        lang: DataLanguage.id,
        perPage: 15,
      );
      
      print('\\n=== Commodity Groups (Sample) ===');
      for (final group in commodityGroups.data.take(5)) {
        print('Group ${group.id}: ${group.title}');
        print('  Description: ${group.description}');
        print('  Last Update: ${group.lastUpdate}');
        
        if (group.tags.isNotEmpty) {
          print('  Tags: ${group.tags.join(', ')}');
        }
      }
      
    } catch (e) {
      print('KBKI exploration error: $e');
    }
  }
}
```

### 5. Advanced Classification Analysis

```dart
// Comprehensive analysis of classification data
class ClassificationAnalyzer {
  static Future<void> analyzeClassificationData() async {
    try {
      // 1. Analyze KBLI data completeness across levels
      final kbliLevels = [
        KBLILevel.category,
        KBLILevel.primaryGroup,
        KBLILevel.group,
        KBLILevel.subGroup,
        KBLILevel.cluster,
      ];
      
      print('=== KBLI 2020 Level Analysis ===');
      for (final level in kbliLevels) {
        final result = await StadataFlutter.instance.list.statisticClassifications(
          type: KBLIType.y2020,
          level: level,
          lang: DataLanguage.id,
          perPage: 50,
        );
        
        print('${level.value}: ${result.pagination.total} items');
        
        // Analyze data quality
        final withDescription = result.data
            .where((item) => item.description.isNotEmpty)
            .length;
        
        final withTags = result.data
            .where((item) => item.tags.isNotEmpty)
            .length;
        
        print('  Items with description: $withDescription');
        print('  Items with tags: $withTags');
        
        await Future.delayed(Duration(milliseconds: 200));
      }
      
      // 2. Analyze classification relationships
      final groupsWithDerived = await StadataFlutter.instance.list.statisticClassifications(
        type: KBLIType.y2020,
        level: KBLILevel.group,
        lang: DataLanguage.id,
      );
      
      final itemsWithRelationships = groupsWithDerived.data
          .where((item) => item.derived.isNotEmpty || item.previous.isNotEmpty)
          .length;
      
      print('\\n=== Relationship Analysis ===');
      print('Groups with relationships: $itemsWithRelationships');
      
      // 3. Publication metadata analysis
      final classifications = await StadataFlutter.instance.list.statisticClassifications(
        type: KBLIType.y2020,
        level: KBLILevel.category,
        lang: DataLanguage.id,
      );
      
      final withISBN = classifications.data
          .where((item) => item.isbn != null && item.isbn!.isNotEmpty)
          .length;
      
      final withURL = classifications.data
          .where((item) => item.url != null && item.url!.isNotEmpty)
          .length;
      
      print('Classifications with ISBN: $withISBN');
      print('Classifications with URL: $withURL');
      
    } catch (e) {
      print('Analysis error: $e');
    }
  }
}
```

## Properties

### StatisticClassification

| Property            | Type                       | Description                            |
| ------------------- | -------------------------- | -------------------------------------- |
| `id`                | `String`                   | Unique identifier for KBLI/KBKI       |
| `type`              | `ClassificationType?`      | Classification type (KBLI/KBKI)        |
| `level`             | `ClassificationLevel?`     | Classification level within hierarchy  |
| `source`            | `String`                   | Data source information                |
| `title`             | `String`                   | Official title of the classification  |
| `description`       | `String`                   | Detailed description of the classification |
| `isbn`              | `String?`                  | ISBN number for publication reference |
| `issn`              | `String?`                  | ISSN number for serial publication    |
| `catalogueNumber`   | `String?`                  | Official catalogue number             |
| `publicationNumber` | `String?`                  | Publication reference number          |
| `lastUpdate`        | `DateTime`                 | Date of last update                    |
| `releaseDate`       | `DateTime`                 | Official release date                  |
| `location`          | `String?`                  | Publication or source location         |
| `url`               | `String?`                  | Official URL reference                 |
| `mfd`               | `String?`                  | Manufacturing date information         |
| `previous`          | `List<ClassificationItem>` | List of previous classification items  |
| `derived`           | `List<ClassificationItem>` | List of derived classification items   |
| `flag`              | `bool`                     | Classification status flag             |
| `tags`              | `List<String>`             | Associated tags for categorization     |

### ClassificationItem

| Property      | Type     | Description                           |
| ------------- | -------- | ------------------------------------- |
| `code`        | `String` | Classification code identifier        |
| `title`       | `String` | Title of the classification item      |
| `description` | `String` | Detailed description of the item      |

## Common Use Cases

### Economic Sector Analysis

```dart
// Analyze economic sectors using KBLI data
Future<void> analyzeEconomicSectors() async {
  try {
    final sectors = await StadataFlutter.instance.list.statisticClassifications(
      type: KBLIType.y2020,
      level: KBLILevel.category,
      lang: DataLanguage.id,
    );
    
    print('=== Indonesian Economic Sectors (KBLI 2020) ===');
    for (final sector in sectors.data) {
      print('${sector.id}: ${sector.title}');
      
      // Identify key sectors
      final isKeyEconomic = ['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J']
          .contains(sector.id);
      
      if (isKeyEconomic) {
        print('  ⭐ Key Economic Sector');
      }
      
      print('  Description: ${sector.description}');
      
      if (sector.derived.isNotEmpty) {
        print('  Sub-classifications: ${sector.derived.length}');
      }
      
      print('---');
    }
    
  } catch (e) {
    print('Economic sector analysis error: $e');
  }
}
```

### Business Classification Mapping

```dart
// Map business activities to KBLI codes
class BusinessClassificationMapper {
  static Future<Map<String, String>> mapBusinessActivities() async {
    final businessMapping = <String, String>{};
    
    try {
      // Get detailed business activities (sub-group level)
      final activities = await StadataFlutter.instance.list.statisticClassifications(
        type: KBLIType.y2020,
        level: KBLILevel.subGroup,
        lang: DataLanguage.id,
        perPage: 100,
      );
      
      for (final activity in activities.data) {
        // Create mapping for common business terms
        final keywords = activity.title.toLowerCase();
        
        if (keywords.contains('makanan') || keywords.contains('food')) {
          businessMapping['Food Production'] = activity.id;
        } else if (keywords.contains('teknologi') || keywords.contains('software')) {
          businessMapping['Technology'] = activity.id;
        } else if (keywords.contains('perdagangan') || keywords.contains('retail')) {
          businessMapping['Retail Trade'] = activity.id;
        } else if (keywords.contains('konstruksi') || keywords.contains('construction')) {
          businessMapping['Construction'] = activity.id;
        }
      }
      
      print('=== Business Activity Mapping ===');
      businessMapping.forEach((business, kbliCode) {
        print('$business → KBLI Code: $kbliCode');
      });
      
      return businessMapping;
      
    } catch (e) {
      print('Business mapping error: $e');
      return {};
    }
  }
}
```

## Integration with Other APIs

### Cross-Reference with Statistical Data

```dart
// Use classifications to understand statistical data context
Future<void> integrateWithStatisticalData() async {
  try {
    // Get manufacturing classifications
    final manufacturing = await StadataFlutter.instance.list.statisticClassifications(
      type: KBLIType.y2020,
      level: KBLILevel.primaryGroup,
      lang: DataLanguage.id,
    );
    
    final manufacturingGroups = manufacturing.data
        .where((item) => item.title.toLowerCase().contains('industri'))
        .toList();
    
    print('=== Manufacturing Classifications ===');
    for (final group in manufacturingGroups.take(5)) {
      print('${group.id}: ${group.title}');
      
      // This could be used to filter economic data
      print('  Use for filtering economic statistics by sector ${group.id}');
      print('  Related to industrial production data');
    }
    
    // Commodity classifications for trade data
    final commodities = await StadataFlutter.instance.list.statisticClassifications(
      type: KBKIType.y2015,
      level: KBKILevel.division,
      lang: DataLanguage.id,
    );
    
    print('\\n=== Commodity Classifications for Trade Analysis ===');
    for (final commodity in commodities.data.take(3)) {
      print('${commodity.id}: ${commodity.title}');
      print('  Use for: Import/Export data analysis');
      print('  Trade balance calculations by commodity group');
    }
    
  } catch (e) {
    print('Integration error: $e');
  }
}
```

## Error Handling

Statistical Classification API methods return `Future<ListResult<StatisticClassification>>` and may throw specific exceptions:

- `StatisticClassificationException`: Classification-related errors (invalid type, level errors)
- `ApiException`: Network or API-related errors
- `ApiKeyNotFoundException`: Invalid or missing API key

```dart
try {
  final result = await StadataFlutter.instance.list.statisticClassifications(
    type: KBLIType.y2020,
    level: KBLILevel.category,
    lang: DataLanguage.id,
  );
  
  // Process successful result
  print('Found ${result.data.length} classifications');
  
} on StatisticClassificationException catch (e) {
  print('Classification error: ${e.message}');
  // Handle classification type or level errors
  
} on ApiException catch (e) {
  print('API error: ${e.message}');
  // Handle network connectivity or API service errors
  
} catch (e) {
  print('Unexpected error: $e');
  // Handle any other unexpected errors
}
```

## Performance Considerations

- **Hierarchy Navigation**: Use appropriate levels to avoid retrieving excessive data
- **Version Selection**: Choose the most relevant KBLI/KBKI version for your use case
- **Pagination Management**: Implement efficient pagination for large classification datasets
- **Relationship Processing**: Handle derived and previous classifications efficiently
- **Caching Strategy**: Cache frequently accessed classifications as they change infrequently
- **Code Validation**: Use built-in validation methods for classification codes
- **Language Considerations**: Consider both Indonesian and English versions for international users