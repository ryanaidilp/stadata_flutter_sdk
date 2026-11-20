# SDG Indicators

The SDG Indicators API provides access to Sustainable Development Goals (SDGs) indicator data from the BPS (Badan Pusat Statistik) API. Each entry represents a statistical indicator variable associated with a specific SDG goal (1–17).

## Parameters

| Parameter | Type            | Default            | Description                                                                         |
| --------- | --------------- | ------------------ | ------------------------------------------------------------------------------------ |
| `domain`  | `String`        | **Required**       | BPS domain code (e.g. `'0000'` for national)                                        |
| `goal`    | `SdgGoalNumber` | **Required**       | The SDG goal to filter indicators by — see [Goal Reference](#goal-reference) below   |
| `lang`    | `DataLanguage`  | `DataLanguage.id`  | Response language — `DataLanguage.id` or `DataLanguage.en`                          |
| `page`    | `int`           | `1`                 | Page number for pagination                                                          |

### Goal Reference

`goal` takes a `SdgGoalNumber` enum member instead of a raw `1`–`17` integer, so you don't need to memorize which number maps to which goal:

| `SdgGoalNumber` member  | Goal # | Official title                          |
| ------------------------ | ------ | ----------------------------------------- |
| `noPoverty`              | 1      | No Poverty                                |
| `zeroHunger`              | 2      | Zero Hunger                               |
| `goodHealth`              | 3      | Good Health and Well-being                |
| `qualityEducation`        | 4      | Quality Education                         |
| `genderEquality`          | 5      | Gender Equality                           |
| `cleanWater`              | 6      | Clean Water and Sanitation                |
| `affordableEnergy`        | 7      | Affordable and Clean Energy               |
| `decentWork`              | 8      | Decent Work and Economic Growth           |
| `industry`                | 9      | Industry, Innovation and Infrastructure   |
| `reducedInequalities`     | 10     | Reduced Inequalities                      |
| `sustainableCities`       | 11     | Sustainable Cities and Communities        |
| `responsibleConsumption`  | 12     | Responsible Consumption and Production    |
| `climateAction`           | 13     | Climate Action                            |
| `lifeBelowWater`          | 14     | Life Below Water                          |
| `lifeOnLand`              | 15     | Life on Land                              |
| `peace`                   | 16     | Peace, Justice and Strong Institutions    |
| `partnerships`            | 17     | Partnerships for the Goals                |

## Examples

### 1. Get SDG Indicators for Goal 1 (No Poverty)

```dart
final result = await StadataFlutter.instance.list.sdgIndicators(
  domain: '0000',
  goal: SdgGoalNumber.noPoverty,
);

for (final indicator in result.data) {
  print('${indicator.id}: ${indicator.title} (${indicator.unit})');
  print('Goal: ${indicator.goalName}');
  print('SDGs ID: ${indicator.sdgsId}');
}
```

### 2. Get SDG Indicators in English

```dart
final result = await StadataFlutter.instance.list.sdgIndicators(
  domain: '0000',
  goal: SdgGoalNumber.goodHealth,
  lang: DataLanguage.en,
);
```

### 3. Paginated Fetch

```dart
final result = await StadataFlutter.instance.list.sdgIndicators(
  domain: '0000',
  goal: SdgGoalNumber.affordableEnergy,
  page: 2,
);
```

## Properties

| Property             | Type      | Description                                                                        |
| -------------------- | --------- | ---------------------------------------------------------------------------------- |
| `id`                 | `int`     | Unique identifier of the SDG indicator variable (`var_id`)                         |
| `title`              | `String`  | Official title of the SDG indicator variable                                       |
| `goal`               | `String`  | SDG goal code, e.g. `"sdgs_1"` (`sdgs_goal`)                                      |
| `goalName`           | `String`  | Human-readable SDG goal name, e.g. `"1. Tanpa Kemiskinan"` (`sdgs_goal_name`)     |
| `sdgsId`             | `String`  | SDG indicator reference code, e.g. `"1.2.1*"` (`sdgs_id`)                         |
| `subjectId`          | `int`     | Identifier of the statistical subject this indicator belongs to (`sub_id`)         |
| `subjectName`        | `String`  | Name of the statistical subject (`sub_name`)                                       |
| `unit`               | `String`  | Unit of measurement for the indicator values                                       |
| `definition`         | `String`  | Definition or description of the indicator (`def`)                                 |
| `notes`              | `String`  | Methodological notes, may contain HTML content                                     |
| `verticalVariableId` | `int`     | Identifier linking to the associated vertical variable (`vertical`)                |
| `graphId`            | `int`     | Identifier for the chart/graph type (`graph_id`)                                   |
| `graphName`          | `String`  | Name of the chart/graph type, e.g. `"bar"` (`graph_name`)                         |
| `metaActivity`       | `String?` | URL to the activity metadata in SIRUSA (`meta_activity`), may be `null`            |
| `metaVar`            | `String?` | URL to the variable metadata in SIRUSA (`meta_var`), may be `null`                 |

## Error Handling

```dart
try {
  final result = await StadataFlutter.instance.list.sdgIndicators(
    domain: '0000',
    goal: SdgGoalNumber.noPoverty,
  );
  print('Found ${result.data.length} indicators');
} on SdgException catch (e) {
  print('SDG error: ${e.message}');
} catch (e) {
  print('Unexpected error: $e');
}
```

## See Also

- [BPS Web API Documentation](https://webapi.bps.go.id/documentation/)
