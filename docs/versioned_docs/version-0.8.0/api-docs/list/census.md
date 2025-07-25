# Census

The Census API provides access to census data from BPS (Badan Pusat Statistik) Indonesia. Census data includes comprehensive demographic, housing, agricultural, and economic surveys conducted periodically by BPS.

## Available Methods

The census functionality provides four methods for accessing different levels of census data:

### 1. `census()` - Get All Census Types

Retrieves a list of all available census types from BPS.

#### Parameters

This method takes no parameters.

#### Example

```dart
// Fetch all available census types
final censusResult = await StadataFlutter.instance.list.census();

final censusList = censusResult.data;
final pagination = censusResult.pagination;

// Print pagination info
print('Current Page: ${pagination.page}');
print('Total Pages: ${pagination.pages}');
print('Data Count in This Page: ${pagination.count}');
print('Per Page: ${pagination.perPage}');
print('Total: ${pagination.total}');
print('------------------------');

// Print the retrieved census data
for (final census in censusList) {
  print('Census ID: ${census.id}'); // Ex. sp2020
  print('Name: ${census.name}'); // Ex. Sensus Penduduk 2020
  print('------------------------');
}
```

#### Properties (Census)

| Property | Type     | Description                      |
| -------- | -------- | -------------------------------- |
| `id`     | `String` | Unique identifier for the census |
| `name`   | `String` | The name of the census           |

### 2. `censusTopics()` - Get Topics for a Census

Retrieves available topics for a specific census event.

#### Parameters

| Parameter  | Type     | Description                                    |
| ---------- | -------- | ---------------------------------------------- |
| `censusID` | `String` | The ID of the census (e.g., 'sp2020') **(required)** |

#### Example

```dart
// Fetch topics for Population Census 2020
final topicsResult = await StadataFlutter.instance.list.censusTopics(
  censusID: 'sp2020',
);

final topicsList = topicsResult.data;
final pagination = topicsResult.pagination;

// Print pagination info
print('Current Page: ${pagination.page}');
print('Total Pages: ${pagination.pages}');
print('Data Count in This Page: ${pagination.count}');
print('Per Page: ${pagination.perPage}');
print('Total: ${pagination.total}');
print('------------------------');

// Print the retrieved census topics
for (final topic in topicsList) {
  print('Topic ID: ${topic.id}'); // Ex. 20
  print('Name: ${topic.name}'); // Ex. Demografi
  print('------------------------');
}
```

#### Properties (CensusTopic)

| Property | Type  | Description                         |
| -------- | ----- | ----------------------------------- |
| `id`     | `int` | Unique identifier for the topic     |
| `name`   | `String` | The name of the census topic     |

### 3. `censusEventAreas()` - Get Areas for a Census

Retrieves geographical areas that have data for a specific census event.

#### Parameters

| Parameter  | Type     | Description                                    |
| ---------- | -------- | ---------------------------------------------- |
| `censusID` | `String` | The ID of the census (e.g., 'sp2020') **(required)** |

#### Example

```dart
// Fetch areas for Population Census 2020
final areasResult = await StadataFlutter.instance.list.censusEventAreas(
  censusID: 'sp2020',
);

final areasList = areasResult.data;
final pagination = areasResult.pagination;

// Print pagination info
print('Current Page: ${pagination.page}');
print('Total Pages: ${pagination.pages}');
print('Data Count in This Page: ${pagination.count}');
print('Per Page: ${pagination.perPage}');
print('Total: ${pagination.total}');
print('------------------------');

// Print the retrieved census areas
for (final area in areasList) {
  print('Area ID: ${area.id}'); // Ex. 3200
  print('Name: ${area.name}'); // Ex. Jawa Barat
  print('Level: ${area.level}'); // Ex. 1 (Province level)
  print('------------------------');
}
```

#### Properties (CensusArea)

| Property | Type     | Description                          |
| -------- | -------- | ------------------------------------ |
| `id`     | `String` | Unique identifier for the area       |
| `name`   | `String` | The name of the area                 |
| `level`  | `int`    | Administrative level (1=Province, 2=Regency, etc.) |

### 4. `censusEventDatasets()` - Get Datasets for Census and Topic

Retrieves actual datasets for a specific combination of census event and topic.

#### Parameters

| Parameter  | Type     | Description                                    |
| ---------- | -------- | ---------------------------------------------- |
| `censusID` | `String` | The ID of the census (e.g., 'sp2020') **(required)** |
| `topicID`  | `int`    | The ID of the topic (e.g., 20) **(required)**        |

#### Example

```dart
// Fetch datasets for Population Census 2020, Demographics topic
final datasetsResult = await StadataFlutter.instance.list.censusEventDatasets(
  censusID: 'sp2020',
  topicID: 20,
);

final datasetsList = datasetsResult.data;
final pagination = datasetsResult.pagination;

// Print pagination info
print('Current Page: ${pagination.page}');
print('Total Pages: ${pagination.pages}');
print('Data Count in This Page: ${pagination.count}');
print('Per Page: ${pagination.perPage}');
print('Total: ${pagination.total}');
print('------------------------');

// Print the retrieved census datasets
for (final dataset in datasetsList) {
  print('Dataset ID: ${dataset.id}'); // Ex. 123456
  print('Title: ${dataset.title}'); // Ex. Jumlah Penduduk Menurut Jenis Kelamin
  print('Description: ${dataset.description}');
  print('Updated At: ${dataset.updatedAt}');
  print('------------------------');
}
```

#### Properties (CensusDataset)

| Property      | Type       | Description                             |
| ------------- | ---------- | --------------------------------------- |
| `id`          | `int`      | Unique identifier for the dataset       |
| `title`       | `String`   | The title of the dataset                |
| `description` | `String?`  | Description of the dataset (optional)   |
| `updatedAt`   | `DateTime` | Last update timestamp of the dataset    |

## Common Census IDs

Here are some commonly used census IDs:

| Census ID | Description              | Year |
| --------- | ------------------------ | ---- |
| `sp2020`  | Sensus Penduduk (Population Census) | 2020 |
| `st2023`  | Sensus Pertanian (Agricultural Census) | 2023 |
| `se2016`  | Sensus Ekonomi (Economic Census) | 2016 |

## Usage Workflow

The typical workflow for accessing census data follows this hierarchy:

1. **Get Available Census Types**: Use `census()` to see what census events are available
2. **Get Topics for a Census**: Use `censusTopics(censusID)` to see what topics are available for your chosen census
3. **Get Areas for a Census**: Use `censusEventAreas(censusID)` to see what geographical areas have data
4. **Get Datasets**: Use `censusEventDatasets(censusID, topicID)` to get the actual datasets you can query

### Complete Example

```dart
// 1. Get all available census types
final censusTypes = await StadataFlutter.instance.list.census();
print('Available Census Types: ${censusTypes.data.length}');

// 2. Get topics for Population Census 2020
final topics = await StadataFlutter.instance.list.censusTopics(
  censusID: 'sp2020',
);
print('Topics for SP2020: ${topics.data.length}');

// 3. Get areas for Population Census 2020
final areas = await StadataFlutter.instance.list.censusEventAreas(
  censusID: 'sp2020',
);
print('Areas for SP2020: ${areas.data.length}');

// 4. Get datasets for Population Census 2020, Demographics topic
final datasets = await StadataFlutter.instance.list.censusEventDatasets(
  censusID: 'sp2020',
  topicID: 20, // Demographics topic ID
);
print('Datasets for SP2020 Demographics: ${datasets.data.length}');
```

## Error Handling

All census methods return a `Future<ListResult<T>>` and may throw specific exceptions:

- `CensusDataException`: General census data errors
- `CensusTopicException`: Census topic-related errors
- `CensusAreaException`: Census area-related errors
- `CensusDatasetException`: Census dataset-related errors
- `ApiException`: Network or API-related errors
- `ApiKeyNotFoundException`: Invalid or missing API key

```dart
try {
  final result = await StadataFlutter.instance.list.censusEventDatasets(
    censusID: 'sp2020',
    topicID: 20,
  );
  // Handle success
} on CensusDatasetException catch (e) {
  print('Census dataset error: ${e.message}');
} on ApiException catch (e) {
  print('API error: ${e.message}');
} catch (e) {
  print('Unexpected error: $e');
}
```