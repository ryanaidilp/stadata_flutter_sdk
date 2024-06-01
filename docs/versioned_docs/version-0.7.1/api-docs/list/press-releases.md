# Press Releases

This method is used to retrieve a list of press releases based on the selected domain (region).

## Parameters

| Parameter | Type           | Description                                                       |
| --------- | -------------- | ----------------------------------------------------------------- |
| `domain`  | `String`       | The domain (region) code for retrieving press releases.           |
| `lang`    | `DataLanguage` | The language for press release data (default: `DataLanguage.id`). |
| `page`    | `int`          | The page number (default: `1`).                                   |
| `subcat`  | `int`          | The subject category id for filtering press releases (optional).  |
| `keyword` | `String?`      | A keyword for searching press releases (optional).                |
| `month`   | `int?`         | The month for filtering press releases (optional - `1..12`).      |
| `year`    | `int?`         | The year for filtering press releases (optional).                 |

## Example

Example usage and sample output:

![Preview](/gif/press_releases.gif)

```dart
final result = await StadataFlutter.instance.list.pressReleases(domain: '7200');
final pressReleaseList = result.data;
final pagination = result.pagination;


// Print pagination info
print('Current Page: ${pagination.page}');
print('Total Pages: ${pagination.pages}');
print('Data Count in This Page: ${pagination.count}');
print('Per Page: ${pagination.perPage}');
print('Total: ${pagination.total}');
print('------------------------');

// Print the retrieved press release data
for (final pressRelease in pressReleaseList) {
    print('Press Release ID: ${pressRelease.id}');
    print('Subject ID: ${pressRelease.subject?.id}');
    print('Subject Name: ${pressRelease.subject?.name}');
    print('Title: ${pressRelease.title}');
    print('Abstract: ${pressRelease.abstract}');
    print('Release Date: ${pressRelease.releaseDate}');
    print('Cover: ${pressRelease.cover}');
    print('File Size: ${pressRelease.size}');
    print('PDF Url: ${pressRelease.pdf}');
    print('Slide Url: ${pressRelease.slide}');
    print('Updated At: ${pressRelease.updatedAt}');
}
```

## Properties (PressRelease)

| Property      | Type        | Description                                                             |
| ------------- | ----------- | ----------------------------------------------------------------------- |
| `id`          | `int`       | The unique identifier of the press release.                             |
| `title`       | `String`    | The title of the press release.                                         |
| `subject`     | `Subject?`  | The optional subject of the press release.                              |
| `size`        | `String`    | The file size.                                                          |
| `pdf`         | `String`    | A link or reference to the associated PDF file for the press release.   |
| `cover`       | `String`    | The thumbnail of the press release.                                     |
| `abstract`    | `String?`   | The abstract of the press release.                                      |
| `updatedAt`   | `DateTime`  | The date and time when the table was last updated.                      |
| `releaseDate` | `DateTime?` | The optional date and time when the table was created.                  |
| `slide`       | `String`    | A link or reference to the associated Slide file for the press release. |
