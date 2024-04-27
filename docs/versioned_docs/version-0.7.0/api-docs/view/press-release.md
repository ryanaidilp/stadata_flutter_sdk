# Press Release

This method is used to retrieve detailed information about a specific press release.

## Parameters

| Parameter | Type           | Description                                                       |
| --------- | -------------- | ----------------------------------------------------------------- |
| `id`      | `int`          | The unique identifier of the press release.                       |
| `domain`  | `String`       | The domain (region) code for retrieving press release detail.     |
| `lang`    | `DataLanguage` | The language for press release data (default: `DataLanguage.id`). |

## Example

Example usage and sample output:

![Preview](/gif/press_releases.gif)

```dart
// Fetch publication detail from BPS API
final pressRelease = await StadataFlutter.instance.view.pressRelease(id: 1234:, domain: '7200');

// Print the retrieved press release data
print('Press Release ID: ${pressRelease.id}');
print('Title: ${pressRelease.title}');
print('Abstract: ${pressRelease.abstract}');
print('Release Date: ${pressRelease.releaseDate}');
print('Cover: ${pressRelease.cover}');
print('File Size: ${pressRelease.size}');
print('PDF Url: ${pressRelease.pdf}');
print('Slide Url: ${pressRelease.slide}');
print('Updated At: ${pressRelease.updatedAt}');
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
