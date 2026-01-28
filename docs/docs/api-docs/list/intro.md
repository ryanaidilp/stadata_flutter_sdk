---
sidebar_position: 1
---

# Intro

The List API provides convenient methods for retrieving lists of data resources from the BPS API based on the type of data needed. To use the List API, you can access it using the following code:

```dart
final list = StadataFlutter.instance.list;
```

## Available Data Types

The List API supports the following data types:

### Geographic and Administrative Data
- **[Domains](./domains)**: Regional domains (provinces, regencies, etc.)

### Statistical Content
- **[Publications](./publications)**: Statistical publications and reports
- **[Static Tables](./static-tables)**: Pre-compiled statistical tables
- **[Dynamic Tables](./dynamic-tables)**: Interactive statistical tables with flexible filtering ⭐ **New**
- **[Infographics](./infographics)**: Visual statistical presentations
- **[Press Releases](./press-releases)**: Official statistical announcements
- **[News](./news)**: Statistical news and updates
- **[News Categories](./news-categories)**: Categories for news content

### Census Data ⭐ **New**
- **[Census](./census)**: Comprehensive census data including:
  - Population Census (Sensus Penduduk)
  - Agricultural Census (Sensus Pertanian) 
  - Economic Census (Sensus Ekonomi)

### Classification and Categorization
- **[Statistic Classifications](./statistic-classifications)**: KBLI and KBKI classifications
- **[Subject Categories](./subject-categories)**: Statistical subject categorizations
- **[Subjects](./subjects)**: Statistical subjects and topics
- **[Strategic Indicators](./strategic-indicators)**: Key performance indicators

### Data Structure and Metadata
- **[Units](./units)**: Data measurement units
- **[Variables](./variables)**: Statistical variables
- **[Vertical Variables](./vertical-variables)**: Hierarchical variable structures

Each data type provides methods to retrieve paginated lists with comprehensive filtering and search capabilities.
