# STADATA Flutter SDK - Simplified Access to [WebAPI](https://webapi.bps.go.id/developer/) BPS

![Pub Version (including pre-releases)](https://img.shields.io/pub/v/stadata_flutter_sdk)
![Pub Points](https://img.shields.io/pub/points/stadata_flutter_sdk)
[![ci](https://github.com/ryanaidilp/stadata_flutter_sdk/actions/workflows/main.yaml/badge.svg)](https://github.com/ryanaidilp/stadata_flutter_sdk/actions/workflows/main.yaml)
[![Code Coverage](https://github.com/ryanaidilp/stadata_flutter_sdk/actions/workflows/coverage.yaml/badge.svg)](https://github.com/ryanaidilp/stadata_flutter_sdk/actions/workflows/coverage.yaml)
[![codecov](https://codecov.io/gh/ryanaidilp/stadata_flutter_sdk/graph/badge.svg?token=UERSUEG6MD)](https://codecov.io/gh/ryanaidilp/stadata_flutter_sdk)
[![style: very good analysis][very_good_analysis_badge]][very_good_analysis_link]
[![Powered by Mason](https://img.shields.io/endpoint?url=https%3A%2F%2Ftinyurl.com%2Fmason-badge)](https://github.com/felangel/mason)
[![License: MIT][license_badge]][license_link]
![Pub Likes](https://img.shields.io/pub/likes/stadata_flutter_sdk)
![Pub Popularity](https://img.shields.io/pub/popularity/stadata_flutter_sdk)

<div align="center">
<!--   <img src="https://github.com/bps-statistics/stadata/assets/1611358/72ac1fab-900f-4a44-b326-0f7b7707668c" width="40%"> -->
  <img src="https://github.com/bps-statistics/stadata/assets/1611358/5a52b335-8e7c-4198-9d4a-7650fe4004da" width="100%">
</div>

---

## Description

The **STADATA Flutter SDK** is a powerful and user-friendly Flutter SDK designed to seamlessly integrate with the official API offered by the Badan Pusat Statistik (BPS) Statistic of the Republic of Indonesia. BPS offers a [WebAPI](https://webapi.bps.go.id/developer/) - <https://webapi.bps.go.id/developer/> that allows users to programmatically access various types of data, including Publications, Press Releases, static tables, and dynamic tables.

This SDK empowers Flutter developers to effortlessly access a wealth of statistical data and information directly from BPS's extensive database, enabling the creation of data-driven applications that provide valuable insights into various aspects of Indonesia's socio-economic landscape.

With **STADATA Flutter SDK**, you can harness the comprehensive data sets made available by BPS, covering a wide range of domains such as population, economy, demographics, and more. This SDK simplifies the process of fetching, processing, and presenting statistical data within your Flutter apps, ensuring a smooth and efficient user experience by eliminate the need for manual data downloads from the [https://www.bps.go.id/](https://www.bps.go.id/).

---

## Key Features

- **Seamless Integration:** Easily incorporate BPS Statistic of the Republic of Indonesia's data into your Flutter projects.
- **Rich Data Sources:** Access a vast repository of statistical data on Indonesia's diverse economic and demographic aspects.
- **User-Friendly:** Designed with developers in mind, making it straightforward to utilize the API's functionalities.
- **Data Insights:** Create data-driven applications to provide valuable insights and visualizations to your users.
- **Up-to-Date:** Stay current with the latest data releases and updates from BPS.

Unlock the potential of BPS's statistical data with the **stadata_flutter_sdk** and empower your Flutter applications to provide users with valuable information and insights about Indonesia's dynamic landscape.

For detailed usage instructions and documentation of the BPS API, please refer to the [official documentation](https://webapi.bps.go.id/documentation/).

---

## Table Of Contents

- [STADATA Flutter SDK - Simplified Access to WebAPI BPS](#stadata-flutter-sdk---simplified-access-to-webapi-bps)
  - [Description](#description)
  - [Key Features](#key-features)
  - [Table Of Contents](#table-of-contents)
  - [Getting Started](#getting-started)
  - [Try the Example](#try-the-example)
  - [Usage](#usage)
    - [List](#list)
    - [View](#view)
    - [Enums for Simplified API Requests and Response Handling](#enums-for-simplified-api-requests-and-response-handling)
  - [List API](#list-api)
    - [Domains](#domains)
      - [Parameters](#parameters)
      - [Properties (DomainEntity)](#properties-domainentity)
    - [Publications](#publications)
      - [Parameters](#parameters-1)
      - [Properties (Publication)](#properties-publication)
    - [Infographics](#infographics)
      - [Parameters](#parameters-2)
      - [Properties (Infographic)](#properties-infographic)
  - [View API](#view-api)
    - [Publication Detail](#publication-detail)
      - [Parameters](#parameters-3)
      - [Properties (Publication)](#properties-publication-1)
  - [To-Do](#to-do)
    - [List API TODO](#list-api-todo)
    - [View API TODO](#view-api-todo)
  - [Running Tests](#running-tests)

---

## Getting Started

Follow these steps to quickly integrate the Stadata Flutter SDK into your Flutter project.

- **Update Your Dependency:**

  First, ensure that your `stadata_flutter_sdk` dependency is up-to-date by including the latest version in your `pubspec.yaml` file. You can check the latest available version on [pub.dev](https://pub.dev/packages/stadata_flutter_sdk).

  ```yaml
  dependencies:
    stadata_flutter_sdk: ^latest_version
  ```

  Replace `^latest_version` with the actual latest version number.

- **Install Dependencies:**

  After updating your `pubspec.yaml`, run the following command to fetch and install the SDK package:

  ```bash
  flutter pub get
  ```

  You can also install it from the `cli` by using this command

  ```sh
  flutter pub add stadata_flutter_sdk
  ```

- **Initialize the SDK:**

  Initialize the Stadata Flutter SDK in your `main.dart` file and make sure to include your API token. Replace `'YOUR_API_KEY'` with your actual API key obtained from the Stadata API.

  ```dart
  import 'package:flutter/material.dart';
  import 'package:stadata_flutter_sdk/stadata_flutter_sdk.dart';

  void main() async {
    // Ensure Flutter is initialized
    WidgetsFlutterBinding.ensureInitialized();

    // Initialize the StadataFlutter instance with your API key
    await StadataFlutter.instance.init(
      apiKey: 'YOUR_API_KEY',
    );

    // Your app's entry point
    runApp(MyApp());
  }
  ```

- **Start Using Stadata Flutter SDK:**

  With the SDK initialized, you're ready to start using the Stadata API within your Flutter app. Refer to the SDK's documentation and examples to learn how to retrieve data and integrate it into your application.

  ```dart
  // Example: Fetching data using the SDK
  final response = await StadataFlutter.instance.list.domains();
  // Handle the response and update your app's UI as needed.
  ```

That's it! You've successfully integrated the Stadata Flutter SDK into your project. You can now start utilizing the data and features provided by Stadata in your Flutter app.

Now, you're ready to explore the capabilities of the `STADATA Flutter SDK` in your Flutter application.

---

## Try the Example

You can explore the capabilities of the Stadata Flutter SDK by checking out the example app provided in the [SDK's GitHub repository](https://github.com/ryanaidilp/stadata_flutter_sdk/tree/main/example).

To run the example app and see the SDK in action, follow these steps:

1. Create an .env file in the example directory or copy it from .env.example:

   ```bash
   cp .env.example .env
   ```

2. Copy your API_KEY to the .env file:

   ```dotenv
   API_KEY=  # Put your API Key here
   ```

3. Generate `env.g.dart` by running the following command in the example directory:

   ```bash
   dart run build_runner build -d
   ```

   If the build is successful, it will generate the necessary code.

4. Run the example app:

   ```bash
   flutter run
   ```

Now, you're ready to explore the capabilities of the Stadata Flutter SDK in your Flutter application using the example provided. This example will help you understand how to integrate and use the SDK effectively in your own projects.

---

## Usage

The BPS Web API provides two main types of data: "list" and "view." Each type serves different purposes, and here's a guide on how to use them.

### List

The `list` method returns a `ListResult` class, which includes two main properties:

1. **Data Property:**
   - The `data` property contains a list of data based on the specified type. For instance, if you are fetching publications, the data will be of type `List<Publication>`.
2. **Pagination Property:**
   - The `pagination` property is an instance of the `Pagination` entity, which provides information related to pagination. It includes the following properties:
     - `page`: The current page.
     - `pages`: The total number of pages.
     - `count`: The count of data entries on the current page.
     - `perPage`: The number of entries per page.
     - `total`: The total number of data entries.

To retrieve a list of models, follow these steps:

1. Create an instance of `StadataFlutter`.

2. Access the `list` getter from the instance, granting you access to various models from domains, publications, press releases, and more.

3. Use the `list` method with the desired parameters. For example:

```dart
var result = await StadataFlutter.instance.list.publications(domain: '7200');
```

This call will provide you with a `ListResult` containing data of type `List<Publication>` and pagination information for further navigation.

### View

In addition to the `list` property, `StadataFlutter` also provides the `view` property, which allows you to retrieve detailed information about a specific model. For instance, if you want to view the details of a publication, follow these steps:

1. **Create an Instance of StadataFlutter:**

   - Begin by creating an instance of `StadataFlutter`.

2. **Access the `view` Getter:**

   - Access the `view` getter from the instance, granting you access to different models from domains, publications, press releases, and more.

3. **Use the `view` Method with Required Parameters:**
   - Utilize the `view` method, specifying the required parameters. For example:

```dart
var result = await StadataFlutter.instance.view.publication(
  id: 'a78f4d4f1c3548600cffcd29',
  domain: '7200'
);
```

By following these steps, you can seamlessly retrieve detailed information about specific models using the BPS Web API. Whether you need to access lists or in-depth details, `StadataFlutter` provides the tools to help you accomplish your goals efficiently.

### Enums for Simplified API Requests and Response Handling

Within the `StadataFlutter` SDK, you'll find several enums designed to streamline API requests and facilitate the handling of API responses.

**1. DataLanguage Enum:**

- The `DataLanguage` enum is used to specify the language (`lang`) parameter when making API requests. It offers two options:
  | Enums | Param Value | Description | Status |
  |---|---|---|---|
  | `DataLanguage.id` | `ind` | Represents the Indonesian language. | **Default** |
  | `DataLanguage.en` | `eng` | Represents the English language. | |

**2. DomainType Enum:**

- The `DomainType` enum simplifies domain type (`type`) parameters for `Domain` models in API requests. It includes the following options:
  | Enums | Actual Value | Description | Status |
  |---|---|---|---|
  | `DomainType.all` | `all` | Retrieve all domains, including provinces and regencies. | **Default** |
  | `DomainType.province` | `prov` | Retrieve all province domains. | |
  | `DataLanguage.regency` | `kab` | Retrieve all regency domains. | |
  | `DataLanguage.regencyByProvince` | `kabbyprov` | Retrieve all regency domains within a specified province ID. | |

**3. DataAvailability Enum:**

- The `DataAvailability` enum helps you check the `data-availability` key in API responses, making it easier to determine the availability of data. It includes the following options:
  | Enums | Actual Value | Description |
  |---|---|---|
  | `DataAvailability.available` | `available` | Indicates that data is available. |
  | `DataAvailability.listNotAvailable` | `list-not-available` | Indicates that the list is not available. |
  | `DataAvailability.notAvailable` | `not-available` | Indicates that data is not available. |

These enums serve as valuable tools to enhance the readability and manageability of your API-related code. Whether you're specifying language preferences, domain types, or checking data availability, these enums simplify the process and make your code more concise and expressive.

---

## List API

The List API provides convenient methods for retrieving lists of data resources from the BPS API based on the type of data needed. To use the List API, you can access it using the following code:

```dart
final list = StadataFlutter.instance.list;
```

Several types of data are available, including:

### Domains

This method is used to retrieve a list of domains (regions) available in the BPS data.

#### Parameters

| Parameter      | Type         | Description                                                                                    |
| -------------- | ------------ | ---------------------------------------------------------------------------------------------- |
| `type`         | `DomainType` | The type of domain to retrieve (default: `DomainType.all`).                                    |
| `provinceCode` | `String?`    | The province code for filtering domains (required if `type` = `DomainType.regencyByProvince`). |

Example usage and sample output:

```dart
// Fetch domain data from BPS API
final domainResult = await StadataFlutter.instance.list.domains(
  type: DomainType.all,
  provinceCode: null, // Replace with the desired province code if needed
);

final domainList = domainResult.data;
final pagination = domainResult.pagination;

// Print pagination info
print('Current Page: ${pagination.page}');
print('Total Pages: ${pagination.pages}');
print('Data Count in This Page: ${pagination.count}');
print('Per Page: ${pagination.perPage}');
print('Total: ${pagination.total}');
print('------------------------');

// Print the retrieved domain data
for (final domain in domainList) {
  print('Domain ID: ${domain.id}'); /// Ex. 7200
  print('Name: ${domain.name}'); /// Sulawesi Tengah
  print('URL: ${domain.url}'); /// https://sultengprov.bps.go.id
  print('------------------------');
}
```

#### Properties (DomainEntity)

| Property | Type     | Description                       |
| -------- | -------- | --------------------------------- |
| `name`   | `String` | The name of the domain (region).  |
| `id`     | `String` | Unique identifier for the domain. |
| `url`    | `String` | URL associated with the domain.   |

### Publications

This method is used to retrieve a list of publications based on the selected domain (region).

#### Parameters

| Parameter | Type           | Description                                                     |
| --------- | -------------- | --------------------------------------------------------------- |
| `domain`  | `String`       | The domain (region) code for retrieving publications.           |
| `lang`    | `DataLanguage` | The language for publication data (default: `DataLanguage.id`). |
| `page`    | `int`          | The page number (default: `1`).                                 |
| `keyword` | `String?`      | A keyword for searching publications (optional).                |
| `month`   | `int?`         | The month for filtering publications (optional - `1..12`).      |
| `year`    | `int?`         | The year for filtering publications (optional).                 |

Example usage and sample output:

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

#### Properties (Publication)

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

### Infographics

This method is used to retrieve a list of infographics based on the selected domain (region).

#### Parameters

| Parameter | Type           | Description                                                     |
| --------- | -------------- | --------------------------------------------------------------- |
| `domain`  | `String`       | The domain (region) code for retrieving infographics.           |
| `lang`    | `DataLanguage` | The language for infographic data (default: `DataLanguage.id`). |
| `page`    | `int`          | The page number (default: `1`).                                 |
| `keyword` | `String?`      | A keyword for searching infographics (optional).                |

Example usage and sample output:

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
  print('Category: ${infographic
```

#### Properties (Infographic)

| Property      | Type     | Description                                             |
| ------------- | -------- | ------------------------------------------------------- |
| `id`          | `String` | The unique identifier of the infographic.               |
| `title`       | `String` | The title or name of the infographic.                   |
| `image`       | `String` | The URL of the image associated with the infographic.   |
| `description` | `String` | A brief description of the infographic's content.       |
| `category`    | `String` | The category or topic to which the infographic belongs. |
| `downloadUrl` | `String` | The URL from which the infographic can be downloaded.   |

You can use these methods and properties to retrieve and work with data resources from the BPS API.

---

## View API

The View API provides methods for retrieving detailed information about specific models from the BPS API. To use the View API, you can access it using the following code:

```dart
final view = StadataFlutter.instance.view;
```

Several model types are available, each with its own set of properties. Below, you'll find documentation for the available model types and their respective methods.

### Publication Detail

This method is used to retrieve detailed information about a specific publication.

#### Parameters

| Parameter | Type           | Description                                                     |
| --------- | -------------- | --------------------------------------------------------------- |
| `id`      | `String`       | The unique identifier of the publication.                       |
| `domain`  | `String`       | The domain (region) code for retrieving publication detail.     |
| `lang`    | `DataLanguage` | The language for publication data (default: `DataLanguage.id`). |

Example usage and sample output:

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

#### Properties (Publication)

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

---

## To-Do

### List API TODO

- [x] Domains
- [x] Publications
- [x] Infographics
- [ ] Static Table
- [ ] Dynamic Table
- [ ] Press Release
- [ ] News
- [ ] KBLI

### View API TODO

- [x] Publication
- [ ] Static Table
- [ ] Dynamic Table
- [ ] Press Release
- [ ] News
- [ ] KBLI

---

## Running Tests

For first time users, install the [very_good_cli][very_good_cli_link]:

```sh
dart pub global activate very_good_cli
```

To run all unit tests:

```sh
very_good test --coverage
```

To view the generated coverage report you can use [lcov](https://github.com/linux-test-project/lcov).

```sh
# Generate Coverage Report
genhtml coverage/lcov.info -o coverage/

# Open Coverage Report
open coverage/index.html
```

[license_badge]: https://img.shields.io/badge/license-MIT-blue.svg
[license_link]: https://github.com/ryanaidilp/stadata_flutter_sdk/blob/main/LICENSE
[very_good_analysis_badge]: https://img.shields.io/badge/style-very_good_analysis-B22C89.svg
[very_good_analysis_link]: https://pub.dev/packages/very_good_analysis
[very_good_cli_link]: https://pub.dev/packages/very_good_cli
