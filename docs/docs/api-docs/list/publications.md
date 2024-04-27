# Publications

This method is used to retrieve a list of publications based on the selected domain (region).

## Parameters

| Parameter | Type           | Description                                                     |
| --------- | -------------- | --------------------------------------------------------------- |
| `domain`  | `String`       | The domain (region) code for retrieving publications.           |
| `lang`    | `DataLanguage` | The language for publication data (default: `DataLanguage.id`). |
| `page`    | `int`          | The page number (default: `1`).                                 |
| `keyword` | `String?`      | A keyword for searching publications (optional).                |
| `month`   | `int?`         | The month for filtering publications (optional - `1..12`).      |
| `year`    | `int?`         | The year for filtering publications (optional).                 |

## Example

Example usage and sample output:

![Preview](/gif/publications.gif)

```dart
// Fetch publication data from BPS API
final publicationResult = await StadataFlutter.instance.list.publications(
  domain: 'example_domain_code', // Replace with the desired domain code
  lang: DataLanguage.id,
  page: 1,
  keyword: 'example_keyword', // Replace with desired keyword or null
  month: null, // Replace with desired month or null
  year: null, // Replace with desired year or null
);

final publicationList = publicationResult.data;
final pagination = publicationResult.pagination;

// Print pagination info
print('Current Page: ${pagination.page}');
print('Total Pages: ${pagination.pages}');
print('Data Count in This Page: ${pagination.count}');
print('Per Page: ${pagination.perPage}');
print('Total: ${pagination.total}');
print('------------------------');

// Print the retrieved publication data
for (final publication in publicationList) {
  print('Publication ID: ${publication.id}');
  print('Title: ${publication.title}');
  print('ISSN: ${publication.issn}');
  print('Scheduled Date: ${publication.scheduledDate}');
  print('Release Date: ${publication.releaseDate}');
  print('Update Date: ${publication.updateDate}');
  print('Cover Image URL: ${publication.cover}');
  print('PDF File URL: ${publication.pdf}');
  print('Size: ${publication.size}');
  print('Abstract: ${publication.abstract ?? 'Not available'}');
  print('Catalogue Number: ${publication.catalogueNumber ?? 'Not available'}');
  print('Publication Number: ${publication.publicationNumber ?? 'Not available'}');
  print('------------------------');
}

```

## Properties (Publication)

| Property            | Type        | Description                                                                   |
| ------------------- | ----------- | ----------------------------------------------------------------------------- |
| `id`                | `String`    | Unique identifier for the publication.                                        |
| `title`             | `String`    | The title of the publication.                                                 |
| `issn`              | `String`    | The International Standard Serial Number (ISSN).                              |
| `scheduledDate`     | `DateTime?` | The scheduled date for the publication (optional).                            |
| `releaseDate`       | `DateTime?` | The release date of the publication (optional).                               |
| `updateDate`        | `DateTime?` | The date when the publication was last updated (optional).                    |
| `cover`             | `String`    | The cover image URL of the publication.                                       |
| `pdf`               | `String`    | The PDF file URL of the publication.                                          |
| `size`              | `String`    | The size of the publication (e.g., file size).                                |
| `abstract`          | `String?`   | An optional abstract or summary of the publication in HTML Format (optional). |
| `catalogueNumber`   | `String?`   | An optional catalogue number associated with the publication (optional).      |
| `publicationNumber` | `String?`   | An optional publication number or code (optional).                            |
