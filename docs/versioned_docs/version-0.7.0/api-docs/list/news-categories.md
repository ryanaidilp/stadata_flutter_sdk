# News Categories

This method is used to retrieve a list of news categories based on the selected domain (region).

## Parameters

| Parameter | Type           | Description                                                         |
| --------- | -------------- | ------------------------------------------------------------------- |
| `domain`  | `String`       | The domain (region) code for retrieving news categories.            |
| `lang`    | `DataLanguage` | The language for news categories data (default: `DataLanguage.id`). |

## Example

Example usage and sample output:

![Preview](/gif/news_categories.gif)

```dart
// Fetch news categories data from BPS API
final result = await StadataFlutter.instance.list.newsCategories(domain: '7200');
final newsCategoryList = result.data;
final pagination = result.pagination;


// Print pagination info
print('Current Page: ${pagination.page}');
print('Total Pages: ${pagination.pages}');
print('Data Count in This Page: ${pagination.count}');
print('Per Page: ${pagination.perPage}');
print('Total: ${pagination.total}');
print('------------------------');

// Print the retrieved news category data
for (final newsCategory in newsCategoryList) {
    print('News Category ID: ${newsCategory.id}');
    print('News Category Name: ${newsCategory.name}');
}

```

## Properties (NewsCategory)

| Property | Type     | Description                                  |
| -------- | -------- | -------------------------------------------- |
| `id`     | `String` | The unique identifier for the news category. |
| `name`   | `String` | The name for the news category.              |
