# News

This method is used to retrieve a list of news based on the selected domain (region).

## Parameters

| Parameter        | Type           | Description                                              |
| ---------------- | -------------- | -------------------------------------------------------- |
| `domain`         | `String`       | The domain (region) code for retrieving news.            |
| `lang`           | `DataLanguage` | The language for news data (default: `DataLanguage.id`). |
| `page`           | `int`          | The page number (default: `1`).                          |
| `keyword`        | `String?`      | A keyword for searching news (optional).                 |
| `newsCategoryId` | `String?`      | The category for filtering news (optional).              |
| `month`          | `int?`         | The month for filtering news (optional - `1..12`).       |
| `year`           | `int?`         | The year for filtering news (optional).                  |

## Example

Example usage and sample output:

![Preview](/gif/news.gif)

```dart
// Fetch news from BPS API
final result = await StadataFlutter.instance.list.news(domain: '7200');
final newsList = result.data;
final pagination = result.pagination;


// Print pagination info
print('Current Page: ${pagination.page}');
print('Total Pages: ${pagination.pages}');
print('Data Count in This Page: ${pagination.count}');
print('Per Page: ${pagination.perPage}');
print('Total: ${pagination.total}');
print('------------------------');

// Print the retrieved news data
for (final news in newsList) {
    print('News ID: ${news.id}');
    print('Category: ${news.category}');
    print('Title: ${news.title}');
    print('Content: ${news.content}');
    print('Release Date: ${news.releaseDate}');
    print('Picture: ${news.picture}');
    print('------------------------');
}

```

## Properties (News)

| Property      | Type       | Description                                      |
| ------------- | ---------- | ------------------------------------------------ |
| `id`          | `int`      | The unique identifier for the news.              |
| `categoryId`  | `String`   | The category identifier for the news (optional). |
| `category`    | `String?`  | The name of the news category (optional).        |
| `title`       | `String`   | The title of the news.                           |
| `content`     | `String`   | The content of the news.                         |
| `releaseDate` | `DateTime` | The date when the news was released.             |
| `picture`     | `String`   | The picture associated with the news.            |
