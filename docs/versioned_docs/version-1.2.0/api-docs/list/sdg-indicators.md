# SDG Indicators

The SDG Indicators API provides access to Sustainable Development Goals (SDGs) indicator data from the BPS (Badan Pusat Statistik) API. Each entry represents a statistical indicator variable associated with a specific SDG goal (1–17).

## Parameters

| Parameter | Type           | Default           | Description                                                     |
| --------- | -------------- | ----------------- | --------------------------------------------------------------- |
| `domain`  | `String`       | **Required**      | BPS domain code (e.g. `'0000'` for national)                    |
| `goal`    | `int`          | **Required**      | SDG goal number (1–17) to filter indicators                     |
| `lang`    | `DataLanguage` | `DataLanguage.id` | Response language — `DataLanguage.id` or `DataLanguage.en`      |
| `page`    | `int`          | `1`               | Page number for pagination                                      |

## Examples

### 1. Get SDG Indicators for Goal 1

```dart
final result = await StadataFlutter.instance.list.sdgIndicators(
  domain: '0000',
  goal: 1,
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
  goal: 3,
  lang: DataLanguage.en,
);
```

### 3. Paginated Fetch

```dart
final result = await StadataFlutter.instance.list.sdgIndicators(
  domain: '0000',
  goal: 7,
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
    goal: 1,
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
