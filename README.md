# Stadata Flutter SDK

![Coverage](https://img.shields.io/badge/coverage-47.5%25-orange)
[![style: very good analysis][very_good_analysis_badge]][very_good_analysis_link]
[![Powered by Mason](https://img.shields.io/endpoint?url=https%3A%2F%2Ftinyurl.com%2Fmason-badge)](https://github.com/felangel/mason)
[![License: MIT][license_badge]][license_link]

## Description

The **stadata_flutter_sdk** is a powerful and user-friendly Flutter SDK designed to seamlessly integrate with the official API offered by the Badan Pusat Statistik (BPS) Statistic of the Republic of Indonesia. This SDK empowers Flutter developers to effortlessly access a wealth of statistical data and information directly from BPS's extensive database, enabling the creation of data-driven applications that provide valuable insights into various aspects of Indonesia's socio-economic landscape.

With **stadata_flutter_sdk**, you can harness the comprehensive data sets made available by BPS, covering a wide range of domains such as population, economy, demographics, and more. This SDK simplifies the process of fetching, processing, and presenting statistical data within your Flutter apps, ensuring a smooth and efficient user experience.

## Table Of Contents

- [Stadata Flutter SDK](#stadata-flutter-sdk)
  - [Description](#description)
  - [Table Of Contents](#table-of-contents)
  - [Key Features](#key-features)
  - [Installation](#installation)
  - [Usage](#usage)
    - [List](#list)
    - [View](#view)
    - [Enums for Simplified API Requests and Response Handling](#enums-for-simplified-api-requests-and-response-handling)
  - [Continuous Integration](#continuous-integration)
  - [Running Tests](#running-tests)

## Key Features

- **Seamless Integration:** Easily incorporate BPS Statistic of the Republic of Indonesia's data into your Flutter projects.
- **Rich Data Sources:** Access a vast repository of statistical data on Indonesia's diverse economic and demographic aspects.
- **User-Friendly:** Designed with developers in mind, making it straightforward to utilize the API's functionalities.
- **Data Insights:** Create data-driven applications to provide valuable insights and visualizations to your users.
- **Up-to-Date:** Stay current with the latest data releases and updates from BPS.

Unlock the potential of BPS's statistical data with the **stadata_flutter_sdk** and empower your Flutter applications to provide users with valuable information and insights about Indonesia's dynamic landscape.

For detailed usage instructions and documentation of the BPS API, please refer to the [official documentation](https://webapi.bps.go.id/documentation/).

## Installation

**❗ In order to start using Stadata Flutter Sdk you must have the [Flutter SDK][flutter_install_link] installed on your machine.**

**Step 1:** Add `stadata_flutter_sdk` to your `pubspec.yaml` file:

```yaml
dependencies:
  stadata_flutter_sdk:
    git:
      url: https://github.com/ryanaidilp/stadata_flutter_sdk.git
      ref: main
```

**Step 2:** Install the package:

```sh
flutter packages get
```

**Step 3:** Get your API Key:

Visit [https://webapi.bps.go.id/](https://webapi.bps.go.id/) to obtain your API Key.

**Step 4:** Initialize the SDK:

Inside your `main.dart` file, add the following code to initialize the SDK with your API Key:

```dart
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await StadataFlutter.instance.init(
    apiKey: 'YOUR_API_KEY', // Replace 'YOUR_API_KEY' with your actual API Key
  );
}
```

**Step 5:** Try the Example:

You can explore the SDK by checking out the [example](https://github.com/ryanaidilp/stadata_flutter_sdk/tree/develop/example). To run the example app, follow these steps:

- Create an `.env` file in the `example` directory or copy it from `.env.example`:

  ```sh
  cp .env.example .env
  ```

- Copy your `API_KEY` to `.env` file

  ```env
  API_KEY=  #Put your API Key here
  ```

- Generate `env.g.dart` by running the following command:

  ```sh
  dart run build_runner build -d
  ```

- If the build is successful, you can run the example app:

  ```sh
  flutter run
  ```

Now, you're ready to explore the capabilities of `stadata_flutter_sdk` in your Flutter application.

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

- The `DataLanguage` enum is used to specify the language parameter when making API requests. It offers two options:
  - `DataLanguage.id`: Represents the Indonesian language.
  - `DataLanguage.en`: Represents the English language.

**2. DomainType Enum:**

- The `DomainType` enum simplifies domain type parameters for domain models in API requests. It includes the following options:
  - `DomainType.all`: Retrieve all domains, including provinces and regencies.
  - `DomainType.province`: Retrieve all province domains.
  - `DomainType.regency`: Retrieve all regency domains.
  - `DomainType.regencyByProvince`: Retrieve all regency domains within a specified province ID.

**3. DataAvailability Enum:**

- The `DataAvailability` enum helps you check the `data-availability` key in API responses, making it easier to determine the availability of data. It includes the following options:
  - `DataAvailability.available`: Indicates that data is available.
  - `DataAvailability.listNotAvailable`: Indicates that the list is not available.
  - `DataAvailability.notAvailable`: Indicates that data is not available.

These enums serve as valuable tools to enhance the readability and manageability of your API-related code. Whether you're specifying language preferences, domain types, or checking data availability, these enums simplify the process and make your code more concise and expressive.

---

## Continuous Integration

Stadata Flutter Sdk comes with a built-in [GitHub Actions workflow][github_actions_link] powered by [Very Good Workflows][very_good_workflows_link] but you can also add your preferred CI/CD solution.

Out of the box, on each pull request and push, the CI `formats`, `lints`, and `tests` the code. This ensures the code remains consistent and behaves correctly as you add functionality or make changes. The project uses [Very Good Analysis][very_good_analysis_link] for a strict set of analysis options used by our team. Code coverage is enforced using the [Very Good Workflows][very_good_coverage_link].

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

[flutter_install_link]: https://docs.flutter.dev/get-started/install
[github_actions_link]: https://docs.github.com/en/actions/learn-github-actions
[license_badge]: https://img.shields.io/badge/license-MIT-blue.svg
[license_link]: https://opensource.org/licenses/MIT
[very_good_analysis_badge]: https://img.shields.io/badge/style-very_good_analysis-B22C89.svg
[very_good_analysis_link]: https://pub.dev/packages/very_good_analysis
[very_good_cli_link]: https://pub.dev/packages/very_good_cli
[very_good_coverage_link]: https://github.com/marketplace/actions/very-good-coverage
[very_good_workflows_link]: https://github.com/VeryGoodOpenSource/very_good_workflows
