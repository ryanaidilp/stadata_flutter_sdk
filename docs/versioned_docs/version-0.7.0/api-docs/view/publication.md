# Publication

This method is used to retrieve detailed information about a specific publication.

## Parameters

| Parameter | Type           | Description                                                     |
| --------- | -------------- | --------------------------------------------------------------- |
| `id`      | `String`       | The unique identifier of the publication.                       |
| `domain`  | `String`       | The domain (region) code for retrieving publication detail.     |
| `lang`    | `DataLanguage` | The language for publication data (default: `DataLanguage.id`). |

## Example

Example usage and sample output:

![Preview](/gif/publications.gif)

```dart
// Fetch publication detail from BPS API
final publication = await StadataFlutter.instance.view.publication(
  id: 'example_publication_id', // Replace with the desired publication ID
  domain: 'example_domain', // Replace with the desired Domain Code
  lang: DataLanguage.id,
);

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
