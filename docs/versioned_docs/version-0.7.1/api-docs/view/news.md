# News

This method is used to retrieve detailed information about a specific news.

## Parameters

| Parameter | Type           | Description                                              |
| --------- | -------------- | -------------------------------------------------------- |
| `id`      | `int`          | The unique identifier of the news.                       |
| `domain`  | `String`       | The domain (region) code for retrieving news detail.     |
| `lang`    | `DataLanguage` | The language for news data (default: `DataLanguage.id`). |

## Example

Example usage and sample output:

![Preview](/gif/news.gif)

```dart
// Fetch news detail from BPS API
final news = await StadataFlutter.instance.view.news(id: 12:, domain: '7200');

// Print the retrieved news category data
print('News ID: ${news.id}');
print('Category: ${news.category}');
print('Title: ${news.title}');
print('Content: ${news.content}');
print('Release Date: ${news.releaseDate}');
print('Picture: ${news.picture}');
print('------------------------');
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
