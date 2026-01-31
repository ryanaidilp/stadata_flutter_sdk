# Domains

The Domains API provides access to the administrative regions (domains) available in the BPS (Badan Pusat Statistik) Indonesia data system. These domains represent the geographic organizational structure of Indonesia's statistical data collection, ranging from national level to provincial and regency levels.

Understanding domains is crucial for accessing BPS data, as most other API endpoints require a domain code to specify which geographic region's data you want to retrieve. Each domain corresponds to a BPS regional office that collects and manages statistical data for their respective areas.

## Available Domain Types

The domains functionality provides several filtering options to retrieve specific types of administrative regions:

### Domain Type Options

| Type | Description | Use Case |
|------|-------------|----------|
| `DomainType.all` | All available domains | Get complete list of all BPS offices |
| `DomainType.province` | Provincial level domains only | Access provincial statistical data |
| `DomainType.regency` | All regency/city level domains | Access local government statistical data |
| `DomainType.regencyByProvince` | Regencies within a specific province | Filter local domains by province |

## Parameters

| Parameter      | Type         | Description                                                                                    |
| -------------- | ------------ | ---------------------------------------------------------------------------------------------- |
| `type`         | `DomainType` | The type of domain to retrieve (default: `DomainType.all`) |
| `provinceCode` | `String?`    | The province code for filtering domains **(required if type = `DomainType.regencyByProvince`)** |

## Examples

### 1. Get All Available Domains

```dart
// Fetch all domains from BPS
final domainResult = await StadataFlutter.instance.list.domains(
  type: DomainType.all,
);

final domainList = domainResult.data;
final pagination = domainResult.pagination;

// Print pagination info
print('Current Page: ${pagination.page}');
print('Total Pages: ${pagination.pages}');
print('Data Count in This Page: ${pagination.count}');
print('Per Page: ${pagination.perPage}');
print('Total: ${pagination.total}');
print('------------------------');

// Print the retrieved domain data
for (final domain in domainList) {
  print('Domain ID: ${domain.id}'); // Ex. 0000 (National), 3200 (West Java)
  print('Name: ${domain.name}'); // Ex. Indonesia, Jawa Barat
  print('URL: ${domain.url}'); // Ex. https://www.bps.go.id, https://jabar.bps.go.id
  print('------------------------');
}
```

### 2. Get Provincial Domains Only

```dart
// Fetch only provincial level domains
final provincialResult = await StadataFlutter.instance.list.domains(
  type: DomainType.province,
);

// Access provincial BPS offices
for (final province in provincialResult.data) {
  print('Province Code: ${province.id}'); // Ex. 3200, 3300, 7300
  print('Province Name: ${province.name}'); // Ex. Jawa Barat, Jawa Tengah, Sulawesi Selatan
  print('BPS Office URL: ${province.url}');
  print('------------------------');
}
```

### 3. Get Regencies in a Specific Province

```dart
// Fetch regencies/cities in West Java (code: 3200)
final regencyResult = await StadataFlutter.instance.list.domains(
  type: DomainType.regencyByProvince,
  provinceCode: '3200', // West Java province code
);

// Access regency/city BPS offices
for (final regency in regencyResult.data) {
  print('Regency Code: ${regency.id}'); // Ex. 3201, 3202, 3271
  print('Regency Name: ${regency.name}'); // Ex. Kab. Bogor, Kab. Sukabumi, Kota Bogor
  print('BPS Office URL: ${regency.url}');
  print('------------------------');
}
```

## Properties (DomainEntity)

| Property | Type     | Description                                    |
| -------- | -------- | ---------------------------------------------- |
| `id`     | `String` | Unique identifier for the domain (BPS code)   |
| `name`   | `String` | The name of the domain (region)               |
| `url`    | `String` | URL of the BPS office website for this domain |

## Common Domain Codes

Here are some frequently used domain codes for reference:

### National and Special Regions
| Domain Code | Name | Level |
|-------------|------|-------|
| `0000` | Indonesia | National |

### Major Provinces
| Domain Code | Name | Capital |
|-------------|------|---------|
| `1100` | Aceh | Banda Aceh |
| `1200` | Sumatera Utara | Medan |
| `3100` | DKI Jakarta | Jakarta |
| `3200` | Jawa Barat | Bandung |
| `3300` | Jawa Tengah | Semarang |
| `3400` | DI Yogyakarta | Yogyakarta |
| `3500` | Jawa Timur | Surabaya |
| `5100` | Bali | Denpasar |
| `7300` | Sulawesi Selatan | Makassar |

### Major Cities (Regency Level)
| Domain Code | Name | Province |
|-------------|------|----------|
| `3171` | Kota Jakarta Selatan | DKI Jakarta |
| `3271` | Kota Bogor | Jawa Barat |
| `3372` | Kota Surakarta | Jawa Tengah |
| `3471` | Kota Yogyakarta | DI Yogyakarta |
| `3578` | Kota Surabaya | Jawa Timur |

## Usage Workflow

The typical workflow for using domains with other BPS API endpoints:

1. **Discover Available Domains**: Use `domains()` to see what geographic regions are available
2. **Select Target Region**: Choose the appropriate domain code based on your data needs
3. **Use Domain Code**: Pass the domain code to other API endpoints (publications, news, static tables, etc.)

### Complete Example

```dart
// 1. Get all available domains
final allDomains = await StadataFlutter.instance.list.domains();
print('Total Available Domains: ${allDomains.data.length}');

// 2. Filter for a specific province (West Java)
final westJavaRegencies = await StadataFlutter.instance.list.domains(
  type: DomainType.regencyByProvince,
  provinceCode: '3200',
);
print('Regencies in West Java: ${westJavaRegencies.data.length}');

// 3. Use domain code with other APIs
final publications = await StadataFlutter.instance.list.publications(
  domain: '3200', // Use West Java domain code
  lang: DataLanguage.id,
);
print('Publications from West Java BPS: ${publications.data.length}');
```

## Administrative Structure Context

Indonesia's administrative structure consists of:

1. **National Level** (`0000`): Central BPS Indonesia
2. **Provincial Level** (`XX00`): 34 provinces, each with a BPS provincial office
3. **Regency/City Level** (`XXXX`): 514+ regencies and cities, each with a local BPS office

Each level collects and manages statistical data relevant to their administrative scope. Understanding this hierarchy helps in selecting the appropriate domain for your data needs.

## Error Handling

All domain methods return a `Future<ListResult<Domain>>` and may throw specific exceptions:

- `DomainException`: Domain-related errors (invalid province code, etc.)
- `ApiException`: Network or API-related errors
- `ApiKeyNotFoundException`: Invalid or missing API key

```dart
try {
  final result = await StadataFlutter.instance.list.domains(
    type: DomainType.regencyByProvince,
    provinceCode: '3200',
  );
  // Handle success
  print('Found ${result.data.length} regencies in the province');
} on DomainException catch (e) {
  print('Domain error: ${e.message}');
  // Handle invalid province codes or domain-specific errors
} on ApiException catch (e) {
  print('API error: ${e.message}');
  // Handle network or API-related errors
} catch (e) {
  print('Unexpected error: $e');
}
```
