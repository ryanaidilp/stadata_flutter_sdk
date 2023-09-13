# Stadata Flutter SDK

![Coverage](https://img.shields.io/badge/coverage-44%25-orange)
[![style: very good analysis][very_good_analysis_badge]][very_good_analysis_link]
[![Powered by Mason](https://img.shields.io/endpoint?url=https%3A%2F%2Ftinyurl.com%2Fmason-badge)](https://github.com/felangel/mason)
[![License: MIT][license_badge]][license_link]

## Description

The **stadata_flutter_sdk** is a powerful and user-friendly Flutter SDK designed to seamlessly integrate with the official API offered by the Badan Pusat Statistik (BPS) Statistic of the Republic of Indonesia. This SDK empowers Flutter developers to effortlessly access a wealth of statistical data and information directly from BPS's extensive database, enabling the creation of data-driven applications that provide valuable insights into various aspects of Indonesia's socio-economic landscape.

With **stadata_flutter_sdk**, you can harness the comprehensive data sets made available by BPS, covering a wide range of domains such as population, economy, demographics, and more. This SDK simplifies the process of fetching, processing, and presenting statistical data within your Flutter apps, ensuring a smooth and efficient user experience.

## Key Features

- **Seamless Integration:** Easily incorporate BPS Statistic of the Republic of Indonesia's data into your Flutter projects.
- **Rich Data Sources:** Access a vast repository of statistical data on Indonesia's diverse economic and demographic aspects.
- **User-Friendly:** Designed with developers in mind, making it straightforward to utilize the API's functionalities.
- **Data Insights:** Create data-driven applications to provide valuable insights and visualizations to your users.
- **Up-to-Date:** Stay current with the latest data releases and updates from BPS.

Unlock the potential of BPS's statistical data with the **stadata_flutter_sdk** and empower your Flutter applications to provide users with valuable information and insights about Indonesia's dynamic landscape.

For detailed usage instructions and documentation of the BPS API, please refer to the [official documentation](https://webapi.bps.go.id/documentation/).

## Installation 💻

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

To fetch a list of models, you can use the following steps:

1. Create an instance of `StadataFlutter`.

2. Access the `list` getter from the instance. This will grant you access to various models from domains, publications, press releases, and more.

3. Use the `list` method with the desired parameters. For example:

```dart
var result = await StadataFlutter.instance.list.publications(domain: '7200');
```

### View

To view the details of a specific model, follow these steps:

1. Create an instance of `StadataFlutter`.

2. Access the view getter from the instance. This will allow you to access different models from domains, publications, press releases, and more.

3. Use the view method with the required parameters. For example:

```dart
var result = await StadataFlutter.instance.view.publication(
  id: 'a78f4d4f1c3548600cffcd29',
  domain: '7200'
);

```

These steps will help you make effective use of the BPS Web API to retrieve both lists and detailed views of various models.

---

## Continuous Integration 🤖

Stadata Flutter Sdk comes with a built-in [GitHub Actions workflow][github_actions_link] powered by [Very Good Workflows][very_good_workflows_link] but you can also add your preferred CI/CD solution.

Out of the box, on each pull request and push, the CI `formats`, `lints`, and `tests` the code. This ensures the code remains consistent and behaves correctly as you add functionality or make changes. The project uses [Very Good Analysis][very_good_analysis_link] for a strict set of analysis options used by our team. Code coverage is enforced using the [Very Good Workflows][very_good_coverage_link].

---

## Running Tests 🧪

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
