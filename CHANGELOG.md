# Changelog

All notable changes to this project will be documented in this file. The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/), and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## 0.6.0+12

> 2023-09-26

### What's New?

- **Added** subject category entity.
- **Added** subject category repository contract.
- **Added** use case to get all subject categories.
- **Added** subject category model.
- **Added** subject category remote data source.
- **Added** subject category repository implementation.
- **Added** subject category feature export.
- **Added** subject entity.
- **Added** subject repository contract.
- **Added** use case to get all subjects.
- **Added** subject model.
- **Added** subject remote data source.
- **Added** subject repository implementation.
- **Added** subject feature export.
- **Added** press release entity.
- **Added** press release repository.
- **Added** use cases to get list and detail of press releases.
- **Added** press release model.
- **Added** press release remote data source.
- **Added** press release repository implementation.
- **Added** press release feature export.
- **Added** example pages for subject, subject category, and press release.
- **Added** routes for subject, subject category, and press release.
- **Added** press release card in the example.
- **Added** fixtures for subject category, subject list, and press release.
- **Added** unit tests for subject category use case.
- **Added** unit tests for subject use case.
- **Added** unit tests for press release use case.
- **Added** unit tests for API endpoints.
- **Added** unit tests for data layer of subject category.
- **Added** unit tests for subject remote data source.
- **Added** unit tests for subject repository implementation.
- **Added** unit tests for press release data source.
- **Added** unit tests for press release repository implementation.
- **Refactored** exception classes.
- **Removed** dead code from the repository.
- **Updated** test names and added missing tests for domain and publication models.
- **Renamed** infographic endpoint and added a new endpoint.
- **Added** tests for the static table endpoint.
- **Created** the `StaticTable` entity, repository contract, use case, and model.
- **Optimized** code import and file export.
- **Added** exceptions and failures for the static table feature.
- **Created** a table serializer.
- **Added** tests for the static table model, remote data source, and repository implementation.
- **Integrated** the static table feature into list and view.
- **Updated** static table property documentation.
- **Added** fixtures and tests for static tables.
- **Implemented** unit tests for the static table use case and repository.
- **Added** teardown steps to all unit tests.
- **Fixed** analyzer issues.
- **Fixed** unused page in the example app.
- **Fixed** the UI of the publication example.
- **Fixed** the STADATA exception class to be a normal class.
- **Fixed** exception handling in the HTTP module.

[View Pull Request](https://github.com/ryanaidilp/stadata_flutter_sdk/pull/32)

## 0.5.0+11

> 2023-09-16

### What's New?

- **Added** exceptions and failure handling for news.
- **Added** a news entity to represent news data.
- **Added** a news repository contract.
- **Added** use cases for retrieving all news and news details.
- **Added** a news model to represent news data.
- **Added** fixtures for news and news details.
- **Added** fixture enums.
- **Added** unit tests for news use cases.
- **Added** an endpoint for news.
- **Added** a news remote data source.
- **Added** an example page for news.
- **Added** a news category entity.
- **Added** exceptions and failure handling for news categories.
- **Added** a news category repository contract.
- **Added** a use case for getting all news categories.
- **Added** a news category model.
- **Added** fixtures for news categories.
- **Added** unit tests for news category use cases.

### Fixed

- **Fixed** analyzer issues.
- **Fixed** unused page in the example app.
- **Fixed** the UI of the publication example.
- **Fixed** the STADATA exception class to be a normal class.
- **Fixed** exception handling in the HTTP module.

[View Pull Request](https://github.com/ryanaidilp/stadata_flutter_sdk/pull/19)

## 0.4.0+10

> 2023-09-15

### What's New?

#### Fetch Static Table Data from BPS API (PR [#17](https://github.com/ryanaidilp/stadata_flutter_sdk/pull/17))

- Added support for fetching static table data from the BPS (Bureau of Public Statistics) API.
- Introduced a new `StaticTable` class to model static table data.
- Implemented API requests and data parsing logic for retrieving static tables.
- Documented the usage of the new feature in the SDK's documentation.

#### Documentation Updates

- Updated README to reflect the new Static Table feature (PR [#17](https://github.com/ryanaidilp/stadata_flutter_sdk/pull/17)).

### Refactor

#### Codebase Improvements (PR [#17](https://github.com/ryanaidilp/stadata_flutter_sdk/pull/17))

- Refactored exception classes.
- Removed dead code from the repository.
- Updated test names and added missing tests for domain and publication models (PR #128).
- Renamed infographic endpoint and added a new endpoint.
- Added tests for the static table endpoint.
- Created the `StaticTable` entity, repository contract, use case, and model.
- Optimized code import and file export.
- Added exceptions and failures for the static table feature (PR #138).
- Created a table serializer.
- Added tests for the static table model, remote data source, and repository implementation.
- Integrated the static table feature into list and view.
- Added an example preview for the static table feature.
- Updated static table property documentation.
- Added fixtures and tests for static tables.
- Implemented unit tests for the static table use case and repository.
- Added teardown steps to all unit tests.

### Chore

#### Dependency Updates

- Updated project dependencies to the latest versions.

## 0.3.5+9

> 2023-09-15

### Fixed

- revert broken changes that makes the SDK unusable from version 0.3.0 [#16](https://github.com/ryanaidilp/stadata_flutter_sdk/pull/16)
- add test for `PaginationModel` [#16](https://github.com/ryanaidilp/stadata_flutter_sdk/pull/16)
- add config to run example app on ios [#16](https://github.com/ryanaidilp/stadata_flutter_sdk/pull/16)

## 0.3.4+8

> 2023-09-15

### Fixed

- revert broken changes [#15](https://github.com/ryanaidilp/stadata_flutter_sdk/pull/15)

## 0.3.3+7

> 2023-09-15

### Fixed

- issue with auto publish [#14](https://github.com/ryanaidilp/stadata_flutter_sdk/pull/14)

## 0.3.2+6

> 2023-09-15

### Fixed

- add `homepage` & `repository` to `pubspec.yaml` [#13](https://github.com/ryanaidilp/stadata_flutter_sdk/pull/13)

## 0.3.1+5

> 2023-09-15

### Fixed

- add list of `platforms` to `pubspec.yaml` [#12](https://github.com/ryanaidilp/stadata_flutter_sdk/pull/12)

## 0.3.0+4

> 2023-09-14

### Added

- Fetch Infographic Data from BPS API by @ryanaidilp in [#9](https://github.com/ryanaidilp/stadata_flutter_sdk/pull/9)
- Fetch Infographic Data from BPS API & Improve Documentation by @ryanaidilp in [#10](https://github.com/ryanaidilp/stadata_flutter_sdk/pull/10)

### Changed

- Chore: Add test coverage by @ryanaidilp in [#8](https://github.com/ryanaidilp/stadata_flutter_sdk/pull/8)

## 0.2.1+3

> 2023-09-13

### Fixed

- Enable multidex by @ryanaidilp in [#7](https://github.com/ryanaidilp/stadata_flutter_sdk/pull/7)

## 0.2.0+2

> 2023-09-13

### Added

- Publications API by @ryanaidilp in [#5](https://github.com/ryanaidilp/stadata_flutter_sdk/pull/5)
- Release version 0.2.0 by @ryanaidilp in [#6](https://github.com/ryanaidilp/stadata_flutter_sdk/pull/6)

### Changed

- Chore(deps): Bump mocktail from 0.3.0 to 1.0.0 by @dependabot in [#1](https://github.com/ryanaidilp/stadata_flutter_sdk/pull/1)
- Chore(deps): Bump mocktail from 0.3.0 to 1.0.0 by @dependabot in [#4](https://github.com/ryanaidilp/stadata_flutter_sdk/pull/4)

### New Contributors

- @dependabot made their first contribution in [#1](https://github.com/ryanaidilp/stadata_flutter_sdk/pull/1)

## 0.1.0+1

> 2023-09-13

- Initial Release of Stadata Flutter SDK

### Added

- Core Modules by @ryanaidilp in [#2](https://github.com/ryanaidilp/stadata_flutter_sdk/pull/2)
- Initial SDK Release by @ryanaidilp in [#3](https://github.com/ryanaidilp/stadata_flutter_sdk/pull/3)

### New Contributors

- @ryanaidilp made their first contribution in [#2](https://github.com/ryanaidilp/stadata_flutter_sdk/pull/2)

[0.3.0]: https://github.com/ryanaidilp/stadata_flutter_sdk/compare/0.2.1...0.3.0
[0.2.1]: https://github.com/ryanaidilp/stadata_flutter_sdk/compare/0.2.0...0.2.1
[0.2.0]: https://github.com/ryanaidilp/stadata_flutter_sdk/compare/0.1.0...0.2.0
[0.1.0]: https://github.com/ryanaidilp/stadata_flutter_sdk/compare/0.1.0...0.1.0
