# STADATA Flutter SDK - Simplified Access to [WebAPI](https://webapi.bps.go.id/developer/) BPS

![Pub Version (including pre-releases)](https://img.shields.io/pub/v/stadata_flutter_sdk)
![Pub Points](https://img.shields.io/pub/points/stadata_flutter_sdk)
[![ci](https://github.com/ryanaidilp/stadata_flutter_sdk/actions/workflows/main.yaml/badge.svg)](https://github.com/ryanaidilp/stadata_flutter_sdk/actions/workflows/main.yaml)
[![Code Coverage](https://github.com/ryanaidilp/stadata_flutter_sdk/actions/workflows/coverage.yaml/badge.svg)](https://github.com/ryanaidilp/stadata_flutter_sdk/actions/workflows/coverage.yaml)
[![codecov](https://codecov.io/gh/ryanaidilp/stadata_flutter_sdk/graph/badge.svg?token=UERSUEG6MD)](https://codecov.io/gh/ryanaidilp/stadata_flutter_sdk)
![Website](https://img.shields.io/website?up_message=Up&up_color=green&down_message=Down&down_color=red&url=https%3A%2F%2Fwebapi.bps.go.id&logo=serverfault&label=https%3A%2F%2Fwebapi.bps.go.id&link=https%3A%2F%2Fwebapi.bps.go.id)
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

The **STADATA Flutter SDK** is a powerful and user-friendly Flutter SDK designed to seamlessly integrate with the official API offered by the Badan Pusat Statistik (BPS) Statistic of the Republic of Indonesia. BPS offers a [WebAPI](https://webapi.bps.go.id/developer/) - <https://webapi.bps.go.id/developer/> that allows users to programmatically access various types of data, including Publications, Press Releases, Static Tables, Dynamic Tables, and many more.

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

For detailed usage instructions and documentation of the BPS API, please refer to the [API BPS documentation](https://webapi.bps.go.id/documentation/).

---

## Documentation

For detailed usage instructions and documentation of this package, please refer to the [official documentation](https://ryanaidilp.github.io/stadata_flutter_sdk/).

---

## 🚀 Getting Started

### Prerequisites

- Flutter SDK `>=3.7.0 <4.0.0`
- An API key from [BPS WebAPI](https://webapi.bps.go.id/developer/)

### Installation

Add this package to your `pubspec.yaml`:

```yaml
dependencies:
  stadata_flutter_sdk: ^latest_version
```

### Quick Example

```dart
import 'package:stadata_flutter_sdk/stadata_flutter_sdk.dart';

// Initialize the SDK
final stadata = StadataFlutter.instance;
await stadata.init(apiKey: 'your_api_key_here');

// Fetch domains
final domains = await stadata.list.domains(
  lang: DataLanguage.id,
  type: DomainType.all,
);

// Fetch publications
final publications = await stadata.list.publications(
  lang: DataLanguage.en,
  domain: '0000',
);
```

For more detailed examples, check our [example app](app/example) or visit the [documentation](https://ryanaidilp.github.io/stadata_flutter_sdk/).

---

## 🛠️ Development Status

### List API Implementation

| Feature                     | Status | Description                         |
| --------------------------- | ------ | ----------------------------------- |
| Domains                     | ✅     | Geographic administrative divisions |
| Publications                | ✅     | BPS publications and reports        |
| Infographics                | ✅     | Statistical infographics            |
| Static Tables               | ✅     | Pre-defined statistical tables      |
| Press Releases              | ✅     | Official press releases             |
| News                        | ✅     | Statistical news and updates        |
| News Categories             | ✅     | News categorization                 |
| Subject Categories          | ✅     | Statistical subject hierarchies     |
| Subjects                    | ✅     | Statistical subjects                |
| Statistical Classifications | ✅     | KBLI & KBKI classifications         |
| Strategic Indicators        | ✅     | Key performance indicators          |
| Units                       | ✅     | Measurement units                   |
| Variables                   | ✅     | Statistical variables               |
| Vertical Variables          | ✅     | Vertical measurement variables      |
| Census Data                 | ✅     | Census information and datasets     |
| Dynamic Tables              | ✅     | Dynamic statistical tables          |
| Glossary                    | 🔄     | Statistical terms glossary          |
| Foreign Trade               | 🔄     | Export/import statistics            |
| SDGs Data                   | 🔄     | Sustainable Development Goals       |

### View API Implementation

| Feature                     | Status | Description                 |
| --------------------------- | ------ | --------------------------- |
| Publications                | ✅     | Detailed publication view   |
| Static Tables               | ✅     | Detailed table view         |
| Press Releases              | ✅     | Detailed press release view |
| News                        | ✅     | Detailed news view          |
| News Categories             | ✅     | Category details            |
| Statistical Classifications | ✅     | Classification details      |
| Dynamic Tables              | ✅     | Dynamic table details       |

**Legend:** ✅ Complete | 🔄 In Progress | ❌ Not Started

---

## 🤝 Contributing

We welcome contributions from the community! Whether you're fixing bugs, adding features, improving documentation, or helping with translations, your contributions are valuable.

### Quick Start for Contributors

1. **👋 New to Contributing?** Read our [Contributor Guide](CONTRIBUTOR_GUIDE_EN.md) | [Panduan Kontributor](CONTRIBUTOR_GUIDE.md)
2. **🔍 First Time?** Check our [Contribution Guidelines](CONTRIBUTING.md)
3. **🚀 New Feature?** Follow our [Feature Development Workflow](FEATURE_DEVELOPMENT_WORKFLOW_EN.md) | [Panduan Pengembangan Fitur](FEATURE_DEVELOPMENT_WORKFLOW.md)
4. **📋 GitHub Process?** See our [GitHub Contribution Workflow](GITHUB_CONTRIBUTION_WORKFLOW_EN.md) | [Alur Kontribusi GitHub](GITHUB_CONTRIBUTION_WORKFLOW.md)

### Ways to Contribute

- 🐛 **Bug Reports**: Found an issue? [Report it here](https://github.com/ryanaidilp/stadata_flutter_sdk/issues/new/choose)
- ✨ **Feature Requests**: Have an idea? [Suggest it here](https://github.com/ryanaidilp/stadata_flutter_sdk/issues/new/choose)
- 📝 **Documentation**: Help improve our docs
- 🧪 **Testing**: Write tests to improve coverage
- 🌍 **Localization**: Help translate the example app
- 🔄 **Pending Features**: Help implement features marked with 🔄

### Good First Issues

Look for issues labeled [`good first issue`](https://github.com/ryanaidilp/stadata_flutter_sdk/labels/good%20first%20issue) - these are perfect for newcomers!

### Documentation

- 📖 [API Documentation](https://ryanaidilp.github.io/stadata_flutter_sdk/)
- 🎯 [Contribution Guidelines](CONTRIBUTING.md) 
- 🔧 [Feature Development Guide](FEATURE_DEVELOPMENT_WORKFLOW_EN.md) | [Panduan Pengembangan Fitur](FEATURE_DEVELOPMENT_WORKFLOW.md)
- 🔄 [GitHub Workflow](GITHUB_CONTRIBUTION_WORKFLOW_EN.md) | [Alur Kontribusi GitHub](GITHUB_CONTRIBUTION_WORKFLOW.md)
- 📋 [Contribution Workflow](CONTRIBUTION_WORKFLOW_EN.md) | [Alur Kontribusi](CONTRIBUTION_WORKFLOW.md)
- 🏗️ [Architecture Guide](CLAUDE.md)

<a href="https://github.com/ryanaidilp/stadata_flutter_sdk/graphs/contributors">
  <img src="https://contrib.rocks/image?repo=ryanaidilp/stadata_flutter_sdk" />
</a>

## Activities

![Alt](https://repobeats.axiom.co/api/embed/a54b7524a1269a5f4e1d39ec68b99713b07317c2.svg "Repobeats analytics image")

[license_badge]: https://img.shields.io/badge/license-MIT-blue.svg
[license_link]: https://github.com/ryanaidilp/stadata_flutter_sdk/blob/main/LICENSE
[very_good_analysis_badge]: https://img.shields.io/badge/style-very_good_analysis-B22C89.svg
[very_good_analysis_link]: https://pub.dev/packages/very_good_analysis
