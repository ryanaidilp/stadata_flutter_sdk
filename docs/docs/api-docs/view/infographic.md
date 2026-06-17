# Infographic

The View Infographic API provides detailed information about a specific infographic from BPS (Badan Pusat Statistik) Indonesia. Infographics are visual representations of statistical data created by BPS to make complex statistics more accessible and understandable. They cover topics including demographics, economy, social indicators, and regional statistics.

## Parameters

| Parameter | Type           | Description                                                      |
| --------- | -------------- | ---------------------------------------------------------------- |
| `id`      | `int`          | **Required**: The unique numerical identifier of the infographic |
| `domain`  | `String`       | **Required**: The domain (region) code for the request           |
| `lang`    | `DataLanguage` | **Optional**: Language preference (default: `DataLanguage.id`)   |

## Examples

### 1. Basic Infographic Retrieval

```dart
// Retrieve detailed information for a specific infographic
final infographic = await StadataFlutter.instance.view.infographic(
  id: 12345,
  domain: '0000', // National level
  lang: DataLanguage.id,
);

if (infographic != null) {
  print('Infographic ID: ${infographic.id}');
  print('Title: ${infographic.title}');
  print('Category: ${infographic.category}');
  print('Preview Image: ${infographic.image}');
  print('Download URL: ${infographic.downloadUrl}');

  if (infographic.description != null) {
    print('Description: ${infographic.description}');
  }
} else {
  print('Infographic not found');
}
```

### 2. Display Infographic in a Flutter Widget

```dart
// Use infographic data in a Flutter widget
final infographic = await StadataFlutter.instance.view.infographic(
  id: 12345,
  domain: '3300', // Central Java
);

if (infographic != null) {
  // Use in a widget (pseudocode)
  return Column(
    children: [
      Text(infographic.title),
      Image.network(infographic.image),
      if (infographic.description != null)
        Text(infographic.description!),
      ElevatedButton(
        onPressed: () => launchUrl(Uri.parse(infographic.downloadUrl)),
        child: Text('Download Full Infographic'),
      ),
    ],
  );
}
```

### 3. Discover and Display Infographics

```dart
// Browse infographics then get details for selected ones
final infographicList = await StadataFlutter.instance.list.infographics(
  domain: '0000',
  keyword: 'penduduk',
);

print('=== Population Infographics ===');
for (final item in infographicList.data.take(5)) {
  final detail = await StadataFlutter.instance.view.infographic(
    id: item.id,
    domain: '0000',
  );

  if (detail != null) {
    print('Title: ${detail.title}');
    print('Category: ${detail.category}');
    print('Download: ${detail.downloadUrl}');
    if (detail.description != null) {
      print('Description: ${detail.description}');
    }
    print('---');
  }
}
```

## Error Handling

```dart
try {
  final infographic = await StadataFlutter.instance.view.infographic(
    id: 12345,
    domain: '0000',
    lang: DataLanguage.id,
  );

  if (infographic != null) {
    print('Infographic: ${infographic.title}');
    print('Download: ${infographic.downloadUrl}');
  } else {
    print('Infographic not found');
  }

} on InfographicException catch (e) {
  print('Infographic error: ${e.message}');

} on ApiException catch (e) {
  print('API error: ${e.message}');

} on ApiKeyNotFoundException catch (e) {
  print('Authentication required: ${e.message}');

} catch (e) {
  print('Unexpected error: $e');
}
```

## Properties (Infographic)

| Property      | Type      | Description                                                     |
| ------------- | --------- | --------------------------------------------------------------- |
| `id`          | `int`     | Unique identifier for the infographic                           |
| `title`       | `String`  | Descriptive title of the infographic                            |
| `image`       | `String`  | URL of the preview image for the infographic                    |
| `category`    | `int`     | Category identifier for organizing infographics by topic        |
| `downloadUrl` | `String`  | Direct download URL for the full infographic file               |
| `description` | `String?` | Optional detailed description of the infographic's content      |
