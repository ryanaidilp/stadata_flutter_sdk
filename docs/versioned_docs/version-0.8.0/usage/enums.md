# Enums

The STADATA Flutter SDK provides a comprehensive set of enums designed to simplify API interactions, enhance type safety, and improve code readability. These enums serve as standardized constants for various parameters and response values throughout the SDK, ensuring consistent and predictable behavior across all statistical data operations.

These enums eliminate the need for magic strings, reduce potential errors, and provide IntelliSense support in your IDE, making development more efficient and less error-prone when working with Indonesian statistical data from BPS.

## Core Language and Localization

### `DataLanguage` Enum

The `DataLanguage` enum controls the language of data returned from BPS APIs, supporting both Indonesian and English responses where available.

| Enum | Parameter Value | Description | Status | Usage Context |
|------|----------------|-------------|---------|---------------|
| `DataLanguage.id` | `ind` | Indonesian language responses | **Default** | All API calls, recommended for Indonesian users |
| `DataLanguage.en` | `eng` | English language responses | Available | International users, English documentation |

#### Usage Examples

```dart
// Using default Indonesian language
final domains = await StadataFlutter.instance.list.domains();

// Explicitly requesting Indonesian data
final domainsIndonesian = await StadataFlutter.instance.list.domains(
  lang: DataLanguage.id,
);

// Requesting English data where available
final domainsEnglish = await StadataFlutter.instance.list.domains(
  lang: DataLanguage.en,
);

// Language-specific content retrieval
final publication = await StadataFlutter.instance.view.publication(
  id: '03220.2301',
  domain: '0000',
  lang: DataLanguage.id, // Indonesian content
);
```

#### Best Practices

- **Default Behavior**: When no language is specified, `DataLanguage.id` is used automatically
- **Consistency**: Use the same language throughout your application for consistent user experience
- **Fallback Strategy**: Some content may only be available in Indonesian; implement fallback logic when needed
- **User Preference**: Allow users to choose their preferred language and persist this setting

```dart
// Implementing language preference with fallback
Future<Publication?> getPublicationWithFallback(
  String id, 
  String domain, 
  DataLanguage preferredLang,
) async {
  try {
    // Try preferred language first
    final publication = await StadataFlutter.instance.view.publication(
      id: id,
      domain: domain,
      lang: preferredLang,
    );
    
    if (publication != null) return publication;
    
    // Fallback to Indonesian if preferred language fails
    if (preferredLang != DataLanguage.id) {
      return await StadataFlutter.instance.view.publication(
        id: id,
        domain: domain,
        lang: DataLanguage.id,
      );
    }
    
    return null;
  } catch (e) {
    // Handle errors appropriately
    return null;
  }
}
```

## Administrative and Geographic Classification

### `DomainType` Enum

The `DomainType` enum simplifies the specification of administrative domain types for geographic and administrative data filtering across Indonesia's governmental structure.

| Enum | Parameter Value | Description | Status | Administrative Level |
|------|----------------|-------------|---------|---------------------|
| `DomainType.all` | `all` | All administrative domains including national, provincial, and regency levels | **Default** | National, Provincial, Regency |
| `DomainType.province` | `prov` | Provincial-level administrative domains only | Available | Provincial |
| `DomainType.regency` | `kab` | Regency and city-level administrative domains only | Available | Regency/City |
| `DomainType.regencyByProvince` | `kabbyprov` | Regency domains filtered by specific province | Available | Regency (Province-filtered) |

#### Usage Examples

```dart
// Get all administrative domains (national, provincial, regency)
final allDomains = await StadataFlutter.instance.list.domains(
  type: DomainType.all,
);

// Get only provincial domains
final provinces = await StadataFlutter.instance.list.domains(
  type: DomainType.province,
);

// Get only regency/city domains
final regencies = await StadataFlutter.instance.list.domains(
  type: DomainType.regency,
);

// Get regencies within a specific province
final westJavaRegencies = await StadataFlutter.instance.list.domains(
  type: DomainType.regencyByProvince,
  provinceId: '32', // West Java province code
);
```

#### Administrative Hierarchy Integration

```dart
// Building a hierarchical administrative selector
class AdministrativeSelector {
  static Future<Map<String, List<Domain>>> buildHierarchy() async {
    final hierarchy = <String, List<Domain>>{};
    
    // Load all administrative levels
    final [allDomains, provinces, regencies] = await Future.wait([
      StadataFlutter.instance.list.domains(type: DomainType.all),
      StadataFlutter.instance.list.domains(type: DomainType.province),
      StadataFlutter.instance.list.domains(type: DomainType.regency),
    ]);
    
    hierarchy['all'] = allDomains.data;
    hierarchy['provinces'] = provinces.data;
    hierarchy['regencies'] = regencies.data;
    
    return hierarchy;
  }
  
  static Future<List<Domain>> getRegenciesByProvince(String provinceId) async {
    final regencies = await StadataFlutter.instance.list.domains(
      type: DomainType.regencyByProvince,
      provinceId: provinceId,
    );
    
    return regencies.data;
  }
}
```

## Data Availability and Status

### `DataAvailability` Enum

The `DataAvailability` enum provides standardized status indicators for data availability across all BPS statistical resources, enabling robust error handling and user feedback mechanisms.

| Enum | Parameter Value | Description | Usage Context |
|------|----------------|-------------|---------------|
| `DataAvailability.available` | `available` | Data is available and accessible | Successful data retrieval |
| `DataAvailability.listNotAvailable` | `list-not-available` | Collection or list data is not available | Empty collections, filtered results |
| `DataAvailability.notAvailable` | `not-available` | Specific data resource is not available | Missing resources, restricted access |

#### Usage Examples

```dart
// Checking data availability in API responses
final publicationsResult = await StadataFlutter.instance.list.publications(
  domain: '7200',
  keyword: 'rare-keyword',
);

// Handle different availability statuses
switch (publicationsResult.dataAvailability) {
  case DataAvailability.available:
    print('Found ${publicationsResult.data.length} publications');
    break;
  case DataAvailability.listNotAvailable:
    print('No publications found for the specified criteria');
    break;
  case DataAvailability.notAvailable:
    print('Publication data is not available for this domain');
    break;
}
```

#### Robust Data Availability Handling

```dart
// Comprehensive data availability handler
class DataAvailabilityHandler {
  static Future<T?> handleDataRetrieval<T>(
    Future<ApiResponse<List<T>>> apiCall,
    String dataType,
  ) async {
    try {
      final result = await apiCall;
      
      switch (result.dataAvailability) {
        case DataAvailability.available:
          if (result.data.isNotEmpty) {
            print('✅ $dataType data loaded: ${result.data.length} items');
            return result.data.first;
          } else {
            print('⚠️ $dataType data available but empty');
            return null;
          }
          
        case DataAvailability.listNotAvailable:
          print('📭 $dataType list not available for current criteria');
          return null;
          
        case DataAvailability.notAvailable:
          print('🚫 $dataType data not available');
          return null;
      }
    } catch (e) {
      print('❌ Error retrieving $dataType: $e');
      return null;
    }
  }
  
  static String getAvailabilityMessage(DataAvailability availability, String dataType) {
    switch (availability) {
      case DataAvailability.available:
        return '$dataType is available';
      case DataAvailability.listNotAvailable:
        return '$dataType list is currently not available';
      case DataAvailability.notAvailable:
        return '$dataType is not available';
    }
  }
}
```

## Statistical Classification Enums

### `ClassificationType` Enum Hierarchy

The SDK provides specialized enums for Indonesian Standard Industrial Classification (KBLI) and Indonesian Standard Commodity Classification (KBKI) systems.

#### `KBLIType` Enum (Industrial Classification)

Industrial classification types with version management for economic activity categorization.

| Enum | Parameter Value | Year | Description |
|------|----------------|------|-------------|
| `KBLIType.y2009` | `kbli2009` | 2009 | Original KBLI version based on ISIC Rev. 4 |
| `KBLIType.y2015` | `kbli2015` | 2015 | Updated version with refined economic categories |
| `KBLIType.y2017` | `kbli2017` | 2017 | Enhanced version with additional economic activities |
| `KBLIType.y2020` | `kbli2020` | 2020 | Latest version incorporating new economic activities |

#### `KBKIType` Enum (Commodity Classification)

Commodity classification types for product and trade categorization.

| Enum | Parameter Value | Year | Description |
|------|----------------|------|-------------|
| `KBKIType.y2015` | `kbki2015` | 2015 | Current commodity classification standard |

#### Usage Examples

```dart
// Working with KBLI classifications
const kbliType = KBLIType.y2020;

// Generate proper classification ID
final classificationId = kbliType.urlParamGenerator('A'); // Results in: kbli_2020_A

// Retrieve classification data
final classifications = await StadataFlutter.instance.view.statisticClassifications(
  id: classificationId,
  type: kbliType,
);

// Version comparison workflow
final comparisonResults = await Future.wait([
  StadataFlutter.instance.view.statisticClassifications(
    id: KBLIType.y2015.urlParamGenerator('C'),
    type: KBLIType.y2015,
  ),
  StadataFlutter.instance.view.statisticClassifications(
    id: KBLIType.y2020.urlParamGenerator('C'),
    type: KBLIType.y2020,
  ),
]);
```

### `ClassificationLevel` Enums

Hierarchical level specifications for classification systems.

#### `KBLILevel` Enum (Industrial Levels)

| Enum | Parameter Value | Description | Code Format |
|------|----------------|-------------|-------------|
| `KBLILevel.category` | `category` | Main economic sectors (A-U) | Single letter |
| `KBLILevel.primaryGroup` | `primary group` | Detailed economic divisions | Two digits |
| `KBLILevel.group` | `group` | Specific industry classifications | Three digits |
| `KBLILevel.subGroup` | `subgroup` | Detailed business activities | Four digits |
| `KBLILevel.cluster` | `cluster` | Most specific economic activities | Five digits |

#### `KBKILevel` Enum (Commodity Levels)

| Enum | Parameter Value | Description | Code Format |
|------|----------------|-------------|-------------|
| `KBKILevel.section` | `section` | Major product categories (0-4) | Single digit |
| `KBKILevel.division` | `division` | Product category divisions | Two digits |
| `KBKILevel.group` | `group` | Product group classifications | Three digits |
| `KBKILevel.classes` | `classes` | Specific product classes | Four digits |
| `KBKILevel.subClass` | `subclass` | Detailed product specifications | Five digits |
| `KBKILevel.commodityGroup` | `commodity group` | Commodity group classifications | Seven digits |
| `KBKILevel.commodity` | `commodity` | Individual commodity identification | Ten digits |

#### Code Validation Examples

```dart
// KBLI code validation
final categoryValid = KBLILevel.category.validateCode('A'); // true
final groupValid = KBLILevel.group.validateCode('123'); // true
final invalidCode = KBLILevel.category.validateCode('123'); // false

// KBKI code validation  
final sectionValid = KBKILevel.section.validateCode('0'); // true
final commodityValid = KBKILevel.commodity.validateCode('1234567890'); // true
```

## Practical Integration Patterns

### Enum-Driven Configuration

```dart
// Configuration class using enums for type safety
class StatisticalDataConfig {
  final DataLanguage language;
  final DomainType domainType;
  final ClassificationType classificationType;
  
  const StatisticalDataConfig({
    this.language = DataLanguage.id,
    this.domainType = DomainType.all,
    required this.classificationType,
  });
  
  // Factory constructors for common configurations
  factory StatisticalDataConfig.indonesian() => const StatisticalDataConfig(
    language: DataLanguage.id,
    domainType: DomainType.all,
    classificationType: KBLIType.y2020,
  );
  
  factory StatisticalDataConfig.english() => const StatisticalDataConfig(
    language: DataLanguage.en,
    domainType: DomainType.all,
    classificationType: KBLIType.y2020,
  );
}
```

### Error Handling with Enums

```dart
// Enum-based error categorization
enum DataRetrievalError {
  networkError,
  authenticationError,
  dataNotAvailable,
  invalidParameters,
  serviceUnavailable,
}

class EnumBasedErrorHandler {
  static DataRetrievalError categorizeError(dynamic error) {
    if (error is ApiKeyNotFoundException) {
      return DataRetrievalError.authenticationError;
    } else if (error is ApiException) {
      return DataRetrievalError.serviceUnavailable;
    } else if (error is ValidationException) {
      return DataRetrievalError.invalidParameters;
    } else {
      return DataRetrievalError.networkError;
    }
  }
  
  static String getErrorMessage(DataRetrievalError error) {
    switch (error) {
      case DataRetrievalError.networkError:
        return 'Network connection issue. Please check your internet connection.';
      case DataRetrievalError.authenticationError:
        return 'Invalid API key. Please check your credentials.';
      case DataRetrievalError.dataNotAvailable:
        return 'Requested data is not available.';
      case DataRetrievalError.invalidParameters:
        return 'Invalid request parameters.';
      case DataRetrievalError.serviceUnavailable:
        return 'Service is temporarily unavailable.';
    }
  }
}
```

## Enum Utility Extensions

### Custom Extension Methods

```dart
// Useful extensions for enum functionality
extension DataLanguageExtension on DataLanguage {
  String get displayName {
    switch (this) {
      case DataLanguage.id:
        return 'Bahasa Indonesia';
      case DataLanguage.en:
        return 'English';
    }
  }
  
  String get flagEmoji {
    switch (this) {
      case DataLanguage.id:
        return '🇮🇩';
      case DataLanguage.en:
        return '🇺🇸';
    }
  }
}

extension DomainTypeExtension on DomainType {
  String get description {
    switch (this) {
      case DomainType.all:
        return 'All administrative levels';
      case DomainType.province:
        return 'Provincial level only';
      case DomainType.regency:
        return 'Regency/City level only';
      case DomainType.regencyByProvince:
        return 'Regencies within province';
    }
  }
  
  IconData get icon {
    switch (this) {
      case DomainType.all:
        return Icons.public;
      case DomainType.province:
        return Icons.location_on;
      case DomainType.regency:
        return Icons.location_city;
      case DomainType.regencyByProvince:
        return Icons.filter_list;
    }
  }
}
```

## Performance and Best Practices

### Enum Usage Guidelines

1. **Type Safety**: Always use enums instead of string literals for parameters
2. **Default Values**: Leverage default enum values to simplify API calls
3. **Validation**: Use enum validation methods before making API calls
4. **Consistency**: Maintain consistent enum usage throughout your application
5. **Documentation**: Document your enum choices for team understanding

### Performance Optimization

```dart
// Enum-based caching strategy
class EnumBasedCache {
  static final Map<String, dynamic> _cache = {};
  
  static String _generateCacheKey(
    String endpoint,
    DataLanguage language,
    DomainType domainType,
    Map<String, dynamic> params,
  ) {
    return '$endpoint_${language.name}_${domainType.name}_${params.hashCode}';
  }
  
  static Future<T?> getCachedOrFetch<T>(
    String endpoint,
    DataLanguage language,
    DomainType domainType,
    Map<String, dynamic> params,
    Future<T> Function() fetcher,
  ) async {
    final cacheKey = _generateCacheKey(endpoint, language, domainType, params);
    
    if (_cache.containsKey(cacheKey)) {
      return _cache[cacheKey] as T;
    }
    
    final result = await fetcher();
    _cache[cacheKey] = result;
    return result;
  }
}
```

The comprehensive enum system in STADATA Flutter SDK provides type-safe, efficient, and maintainable ways to interact with Indonesian statistical data. By leveraging these enums effectively, you can build robust applications that handle the complexity of statistical data classification and administrative hierarchies with ease.

## Summary

These enums serve as the foundation for type-safe interactions with the STADATA Flutter SDK:

- **`DataLanguage`**: Controls response language (Indonesian/English)
- **`DomainType`**: Manages administrative domain filtering
- **`DataAvailability`**: Handles data availability status
- **Classification Enums**: Provide structured access to KBLI/KBKI systems
- **Level Enums**: Enable hierarchical navigation of classifications

By using these enums consistently, you ensure reliable, maintainable, and error-free integration with Indonesia's official statistical data through the BPS API system.