# Infographics

This method is used to retrieve a list of infographics based on the selected domain (region).

## Parameters

| Parameter | Type           | Description                                                     |
| --------- | -------------- | --------------------------------------------------------------- |
| `domain`  | `String`       | The domain (region) code for retrieving infographics.           |
| `lang`    | `DataLanguage` | The language for infographic data (default: `DataLanguage.id`). |
| `page`    | `int`          | The page number (default: `1`).                                 |
| `keyword` | `String?`      | A keyword for searching infographics (optional).                |

## Example

Example usage and sample output:

![Preview](/gif/infographics.gif)

```dart
// Fetch infographic data from BPS API
final infographicResult = await StadataFlutter.instance.list.infographics(
  domain: 'example_domain_code', // Replace with the desired domain code
  lang: DataLanguage.id,
  page: 1,
  keyword: 'example_keyword', // Replace with desired keyword or null
);

final infographicList = infographicResult.data;
final pagination = infographicResult.pagination;

// Print pagination info
print('Current Page: ${pagination.page}');
print('Total Pages: ${pagination.pages}');
print('Data Count in This Page: ${pagination.count}');
print('Per Page: ${pagination.perPage}');
print('Total: ${pagination.total}');
print('------------------------');

// Print the retrieved infographic data
for (final infographic in infographicList) {
  print('Infographic ID: ${infographic.id}');
  print('Title: ${infographic.title}');
  print('Image URL: ${infographic.image}');
  print('Description: ${infographic.description}');
  print('Category: ${infographic.category}');
  print('Download URL: ${infographic.downloadUrl}');
  print('------------------------');
}
```

## Properties (Infographic)

| Property      | Type     | Description                                             |
| ------------- | -------- | ------------------------------------------------------- |
| `id`          | `String` | The unique identifier of the infographic.               |
| `title`       | `String` | The title or name of the infographic.                   |
| `image`       | `String` | The URL of the image associated with the infographic.   |
| `description` | `String` | A brief description of the infographic's content.       |
| `category`    | `String` | The category or topic to which the infographic belongs. |
| `downloadUrl` | `String` | The URL from which the infographic can be downloaded.   |
