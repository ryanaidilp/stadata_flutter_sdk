# Statistical Classification (KBKI & KBLI)

This method is used to retrieve the list of Indonesian Standard Industrial Classification (KBLI) & Indonesian Standard Commodity Classification (KBKI) from the BPS API. It enables users to access information regarding classification codes and their descriptions.

## Enums

There are two enum classes that can be used as parameters.

### ClassificationType

`ClassificationType` is the base class for determining the type of classification. This class is then extended by `KBLIType` and `KBKIType`. Each of these classes has the following options.

- **KBLIType**
  | Enum | Value | Description |
  |------|-------|-------------|
  |KBLI.y2009 | `kbli2009` | KBLI year 2009 |
  |KBLI.y2015 | `kbli2015` | KBLI year 2015 |
  |KBLI.y2017 | `kbli2017` | KBLI year 2017 |
  |KBLI.y2020 | `kbli2020` | KBLI year 2020 |

  To make a request to the `detail` endpoint, the KBLI code needs to be formatted in the `kbli_year_code` format. This class also facilitates this formatting process through the `urlParamGenerator` method which accepts the code parameter.

  Example:

  ```dart
  final url = KBLIType.y2009.urlParamGenerator('24');
  /// result: kbli_2009_24
  final value = KBLIType.y2009.value;
  /// result: kbli2009
  final year = KBLIType.y2009.year;
  /// result: 2009
  ```

- **KBKIType**
  | Enum | Value | Description |
  |------|-------|-------------|
  |KBKI.y2015 | `kbki2015` | KBKI year 2015 |

  To make a request to the `detail` endpoint, the KBKI code needs to be formatted in the `kbki_year_code` format. This class also facilitates this formatting process through the `urlParamGenerator` method which accepts the code parameter.

  Example:

  ```dart
  final url = KBKIType.y2015.urlParamGenerator('24');
  /// result: kbki_2015_24
  final value = KBKIType.y2015.value;
  /// result: kbki2015
  final year = KBKIType.y2015.year;
  /// result: 2015
  ```

### ClassificationLevel

`ClassificationLevel` is the base class for determining the group/level of classification. This class is then extended by `KBLILevel` and `KBKILevel`. Each of these classes has the following options.

- **KBLILevel**
  | Enum | Value | Description |
  |------|-------|-------------|
  |KBLILevel.category | `category` | Represents the main classification. Marked with a single alphabet. |
  |KBLILevel.primaryGroup | `primary group` | Detailed description from category, each coded with two digits. |
  |KBLILevel.group | `group` | Further details from the primary group, each coded with three digits. The first two indicate the primary group and the last digit the economic activity. |
  |KBLILevel.subGroup | `subgroup` | Further detail from a group's economic activities, coded with four digits. The first three indicate the group and the last digit specifies the sub-group. |
  |KBLILevel.cluster | `cluster` | Distinguishes activities within a subgroup into more homogeneous activities, coded with five digits. |

  This class also facilitates the KBLI code validation process through the `validateCode` method.

  Example:

  ```dart
  final isValid = KBLILevel.category.validateCode('A');
  /// result: true
  final value = KBLILevel.category.value;
  /// result: category
  ```

- **KBKILevel**
  | Enum | Value | Description |
  |------|-------|-------------|
  |KBKILevel.section | `section` | General classification outline, 1-digit code, 5 sections, 0-4. |
  |KBKILevel.division | `division` | Detailed description from section, 2-digit code. |
  |KBKILevel.group | `group` | Further details from division, 3-digit code. |
  |KBKILevel.classes | `classes` | Further details from group, 4-digit code. |
  |KBKILevel.subClass | `subclass` | Detailed from classes, 5-digit code. |
  |KBKILevel.commodityGroup | `commodity group` | Detailed from sub-classes, 7-digit code for commodity group. |
  |KBKILevel.commodity | `commodity` | Detailed from commodity group, 10-digit code for commodities. |

  This class also facilitates the KBLI code validation process through the `validateCode` method.

  Example:

  ```dart
  final isValid = KBKILevel.section.validateCode('A');
  /// result: false
  final value = KBKILevel.section.value;
  /// result: section
  ```

## Parameters

| Parameter | Type                 | Description                                                                                                                    |
| --------- | -------------------- | ------------------------------------------------------------------------------------------------------------------------------ |
| `id`      | `String`             | `ID` of specific KBLI/KBKI. It must be in `type_year_code` format. You can utilize `urlParamGenerator` method from enum class. |
| `type`    | `ClassificationType` | Specifies the classification type from the `KBLIType` or `KBKIType` enum.                                                      |
| `lang`    | `DataLanguage`       | The language used for KBLI/KBKI data (default: `DataLanguage.id`).                                                             |
| `page`    | `int`                | Page number (default: 1).                                                                                                      |
| `perPage` | `int`                | Number of data per page (default: 10).                                                                                         |

## Example

Here is an example of usage:

```dart
// Fetch KBLI/KBKI data from the BPS API
const type = KBLIType.y2015;

final result = await StadataFlutter.instance.view.statisticClassifications(
  id: type.urlParamGenerator('A'),
  type: type,
);
final statisticClassificationsList = result.data;
final pagination = result.pagination;

// Display page information
print('Current Page: ${pagination.page}');
print('Total Pages: ${pagination.pages}');
print('Data Count on This Page: ${pagination.count}');
print('Per Page: ${pagination.perPage}');
print('Total: ${pagination.total}');
print('------------------------');

// Display the retrieved statuc classification data
for (final statisticClassifications in statisticClassificationsList) {
    print('Statistic Classification ID: ${statisticClassifications.id}');
    print('Source: ${statisticClassifications.source}');
    print('Title: ${statisticClassifications.title}');
    print('Description: ${statisticClassifications.description}');
    print('Last Update: ${statisticClassifications.lastUpdate}');
    print('Release Date: ${statisticClassifications.releaseDate}');
    print('Previous Classification Items: ${statisticClassifications.previous}');
    print('Derived Classification Items: ${statisticClassifications.derived}');
    print('Flag: ${statisticClassifications.flag}');
    print('Tags: ${statisticClassifications.tags}');
    print('Type: ${statisticClassifications.type}');
    print('Level: ${statisticClassifications.level}');
    print('ISBN: ${statisticClassifications.isbn}');
    print('ISSN: ${statisticClassifications.issn}');
    print('Catalogue Number: ${statisticClassifications.catalogueNumber}');
    print('Publication Number: ${statisticClassifications.publicationNumber}');
    print('Location: ${statisticClassifications.location}');
    print('URL: ${statisticClassifications.url}');
    print('MFD: ${statisticClassifications.mfd}');
}

```

## Properties

- StatisticClassification

| Property            | Type                       | Description                            |
| ------------------- | -------------------------- | -------------------------------------- |
| `id`                | `String`                   | Unique identifier for KBLI/KBKI.       |
| `type`              | `ClassificationType?`      | Classification type.                   |
| `level`             | `ClassificationLevel?`     | Classification level.                  |
| `source`            | `String`                   | Data source.                           |
| `title`             | `String`                   | Title.                                 |
| `description`       | `String`                   | Description.                           |
| `isbn`              | `String?`                  | ISBN number.                           |
| `issn`              | `String?`                  | ISSN number.                           |
| `catalogueNumber`   | `String?`                  | Catalogue number.                      |
| `publicationNumber` | `String?`                  | Publication number.                    |
| `lastUpdate`        | `DateTime`                 | Last update date.                      |
| `releaseDate`       | `DateTime`                 | Release date.                          |
| `location`          | `String?`                  | Location.                              |
| `url`               | `String?`                  | URL.                                   |
| `mfd`               | `String?`                  | MFD information.                       |
| `previous`          | `List<ClassificationItem>` | List of previous classification items. |
| `derived`           | `List<ClassificationItem>` | List of derived classification items.  |
| `flag`              | `bool`                     | Flag.                                  |
| `tags`              | `List<String>`             | List of tags.                          |

- ClassificationItem

| Property      | Type     | Description  |
| ------------- | -------- | ------------ |
| `code`        | `String` | Code.        |
| `title`       | `String` | Title.       |
| `description` | `String` | Description. |
