# Changelog

All notable changes to this project will be documented in this file. The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/), and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

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
