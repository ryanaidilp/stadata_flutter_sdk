# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is the **STADATA Flutter SDK**, a Flutter package that provides access to the official API from Badan Pusat Statistik (BPS) Indonesia. The SDK enables developers to integrate statistical data from BPS into their Flutter applications.

## Architecture

The project follows **Clean Architecture** principles with clear separation of concerns:

### Monorepo Structure

- `packages/stadata_flutter_sdk/` - Main SDK package
- `app/example/` - Example Flutter application demonstrating SDK usage
- `docs/` - Documentation site built with Docusaurus

### SDK Architecture (packages/stadata_flutter_sdk/)

The SDK is organized into features, each following Clean Architecture:

```text
lib/src/
├── core/           # Core utilities, network, DI, error handling
├── features/       # Feature modules (domains, news, publications, etc.)
├── shared/         # Shared entities, models, and utilities
├── list/           # List API implementation (StadataList)
└── view/           # View API implementation (StadataView)
```

Each feature follows this structure:

```text
features/{feature_name}/
├── domain/         # Entities, repositories, use cases
├── data/           # Data sources, models, repository implementations
└── injector/       # Dependency injection setup
```

## Key Technologies

- **Flutter SDK**: >=3.7.0 <4.0.0
- **Melos**: Monorepo management
- **Very Good Analysis**: Linting and code standards
- **Logger**: Logging functionality
- **HTML Unescape**: HTML content processing
- **Mocktail**: Testing framework

## Development Commands

### Melos Commands

```bash
# Install dependencies for all packages
melos get

# Run build_runner in all packages
melos run build

# Clean build artifacts
melos run build:clean

# Format code in all packages
melos format

# Run tests in all packages
melos test

# Lint all packages
melos analyze

# Fix linting issues
melos run fix
```

### Testing

```bash
# Run tests for the SDK
cd packages/stadata_flutter_sdk
flutter test

# Run tests for the example app
cd app/example
flutter test

# Run all tests with coverage
melos test --coverage
```

### Documentation

```bash
# Run documentation site locally
cd docs
npm install
npm start
```

### Changelog Generation

```bash
# Generate changelog since last tag (interactive)
./scripts/generate-changelog.sh --preview --update-main

# Generate for specific version
./scripts/generate-changelog.sh --version 1.0.0 --update-main

# Preview changelog without updating
./scripts/generate-changelog.sh --dry-run

# Generate with specific commit types only
./scripts/generate-changelog.sh --types feat,fix,docs --version 1.0.0
```

## Code Style and Conventions

### Linting Rules

- Uses **very_good_analysis** with custom rules
- Preserves trailing commas (`trailing_commas: preserve`)
- Requires trailing commas (`require_trailing_commas: true`)
- Prefers single quotes (`prefer_single_quotes: true`)
- Documentation comments required for ignored lints

### Architecture Guidelines

1. **Entity Reuse**: Always check for existing entities before creating new ones
2. **Barrel Exports**: Use barrel files for clean imports/exports
3. **Parameter Rules**:
   - Single field params: Use field type directly
   - Multi-field params: Create param classes extending BaseEntity
4. **Import Rules**: Always use full package paths, never relative imports
5. **Model Rules**: Use appropriate default values with @Default() annotation

### Error Handling Patterns

- Repository implementations use generic catch clauses for comprehensive error handling
- Network client uses generic catch for HTTP error handling
- All exceptions inherit from appropriate base exception classes
- Use Result pattern for success/failure handling

### Testing Standards

- Minimum 80% test coverage required
- Unit tests for all layers (entities, repositories, use cases)
- Integration tests for API endpoints
- Mock data using fixtures in `test/fixtures/`
- Test file naming: `{feature_name}_test.dart`

## SDK Usage Patterns

### Initialization

```dart
final stadata = StadataFlutter.instance;
await stadata.init(apiKey: 'your_api_key');
```

### List API

```dart
final result = await stadata.list.domains(
  lang: DataLanguage.id,
  type: DomainType.regency,
);
```

### View API

```dart
final result = await stadata.view.news(
  id: 123,
  lang: DataLanguage.id,
);
```

## Key Features and Status

### List API (✅ = Complete, 🔄 = In Progress)

- ✅ Domains
- ✅ Publications
- ✅ Infographics
- ✅ Static Tables
- ✅ Press Releases
- ✅ News & News Categories
- ✅ Subject Categories & Subjects
- ✅ Statistical Classifications (KBLI)
- ✅ Strategic Indicators
- ✅ Units, Variables, Vertical Variables
- ✅ Census Data (recently completed)
- 🔄 Dynamic Tables
- 🔄 Glossary
- 🔄 Foreign Trade Data
- 🔄 SDGs Data

### View API Implementation

- ✅ Publication, Static Table, Press Release, News, News Category, KBLI

## Testing Structure

- Unit tests located in `test/` directory
- Test fixtures in `test/fixtures/`
- Mock data for each feature domain
- Helper utilities in `test/helpers/`
- Test coverage reports generated automatically

## Contributing Guidelines

### Development Workflow

1. **Adding a new feature**:
   - Create feature directory under `lib/src/features/`
   - Implement domain layer (entities, repositories, use cases)
   - Implement data layer (data sources, models, repository implementations)
   - Set up dependency injection
   - Add tests with fixtures
   - Update exports in barrel files
   - Update example app with feature demo

2. **Before committing**:

   ```bash
   melos format
   melos analyze
   melos test
   ```

3. **Branch naming conventions**:
   - `feature/feature-name` - for new features
   - `fix/bug-name` - for bug fixes
   - `docs/topic` - for documentation updates
   - `test/test-name` - for adding tests

### Code Quality Requirements

- All public APIs must be documented
- All new features require comprehensive tests
- Follow Clean Architecture patterns consistently
- Use Result pattern for error handling
- Maintain consistent naming conventions
- Add localization support for UI features

## Example App Guidelines

- Uses GetX for state management
- Supports bilingual localization (Indonesian/English)
- Each feature should have a dedicated demo screen
- Extract all hardcoded strings to localization files
- Follow Material Design principles
- Implement proper error handling and loading states

## Common Patterns

### Model Creation

```dart
class ExampleModel extends ExampleEntity {
  const ExampleModel({
    required super.id,
    required super.name,
  });

  factory ExampleModel.fromJson(Map<String, dynamic> json) => ExampleModel(
    id: json['id'] as String,
    name: json['name'] as String,
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
  };

  ExampleModel copyWith({
    String? id,
    String? name,
  }) => ExampleModel(
    id: id ?? this.id,
    name: name ?? this.name,
  );
}
```

### Repository Implementation

```dart
class ExampleRepositoryImpl implements ExampleRepository {
  final ExampleRemoteDataSource dataSource;
  final Log logger;

  @override
  Future<Result<List<Example>>> getExamples() async {
    try {
      final result = await dataSource.getExamples();
      return Result.success(result);
    } catch (error, stackTrace) {
      logger.e('Failed to get examples', error: error, stackTrace: stackTrace);
      return Result.failure(ExampleFailure());
    }
  }
}
```

### Localization Usage

```dart
// In views
Text(LocaleKeys.label_title.tr)

// In controllers
Get.snackbar(
  LocaleKeys.error_title.tr,
  LocaleKeys.error_message.tr,
);
```

## API Key Configuration

The SDK requires a valid API key from BPS WebAPI. Register at <https://webapi.bps.go.id/developer/> to obtain your key.

## Documentation Standards

- All public classes and methods must have documentation comments
- Include usage examples for complex APIs
- Maintain both Indonesian and English documentation
- Update API documentation when making changes
- Include BPS API reference links where applicable

## Performance Considerations

- Use Result pattern to avoid throwing exceptions
- Implement proper error handling at all levels
- Use appropriate data structures for collections
- Consider caching for frequently accessed data
- Optimize network requests with proper timeouts

## Security Guidelines

- Never commit API keys or sensitive data
- Use environment variables for configuration
- Validate all input parameters
- Implement proper error messages without exposing internals
- Follow secure coding practices for network requests
- this is the python version of this package. https://github.com/bps-statistics/stadata, use this as reference for some feature like dynamic table.
- to fix linter error, just run dart fix and dart format
- use melos fix to run dart fix command
- always use mobile dev expert for this