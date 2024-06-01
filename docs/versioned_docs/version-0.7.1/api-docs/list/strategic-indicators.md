# Strategic Indicators

This method is used to retrieve a list of strategic indicators based on the selected domain (region).

## Parameters

| Parameter    | Type           | Description                                                          |
| ------------ | -------------- | -------------------------------------------------------------------- |
| `domain`     | `String`       | Domain code (region) to retrieve strategic indicators.               |
| `lang`       | `DataLanguage` | Language for strategic indicators data (default: `DataLanguage.id`). |
| `page`       | `int`          | Page number (default: `1`).                                          |
| `variableID` | `int?`         | Variable ID of the strategic indicator (optional).                   |

## Examples

Example usage and output:

![Preview](/gif/strategic_indicators.gif)

```dart
// Fetch strategic indicator data from BPS
final result = await StadataFlutter.instance.list.strategicIndicators(
  domain: 'example_domain_code', // Replace with the desired domain code
  lang: DataLanguage.id,
  page: 1,
  variableID: 'example_variable_id', // Replace with the desired variable ID or null
);

final strategicIndicators = result.data;
final pagination = result.pagination;

// Print page information
print('Current page: ${pagination.page}');
print('Total Pages: ${pagination.pages}');
print('Total Data in This Page: ${pagination.count}');
print('PerPage: ${pagination.perPage}');
print('Total: ${pagination.total}');
print('------------------------');

// Print retrieved strategic indicator data
for (final strategicIndicator in strategicIndicators) {
    print('Indicator ID: ${strategicIndicator.id}');
    print('Title: ${strategicIndicator.title}');
    print('Variable ID: ${strategicIndicator.variableID}');
    print('Category ID: ${strategicIndicator.categoryID}');
    print('Name: ${strategicIndicator.name}');
    print('Value: ${strategicIndicator.value}');
    print('Unit: ${strategicIndicator.unit}');
    print('Data Source: ${strategicIndicator.dataSource}');
    print('Period: ${strategicIndicator.period}');
    print('CSA Subject ID: ${strategicIndicator.csaSubjectID}');
    print('HASH ID: ${strategicIndicator.hashID}');
}
```

## Properties (StrategicIndicator)

| Property       | Type     | Description                                        |
| -------------- | -------- | -------------------------------------------------- |
| `id`           | `int`    | The unique identifier for the Strategic Indicator. |
| `title`        | `String` | The title of the Strategic Indicator.              |
| `name`         | `String` | Name or description of the indicator.              |
| `variableID`   | `int`    | Variable ID of the indicator.                      |
| `csaSubjectID` | `int?`   | CSA Subject ID of the indicator.                   |
| `categoryID`   | `int`    | Category ID of the indicator.                      |
| `hashID`       | `String` | Hash ID of the indicator.                          |
| `value`        | `double` | Value of the strategic indicator.                  |
| `unit`         | `String` | Unit of the indicator.                             |
| `dataSource`   | `String` | Data source of the indicator.                      |
| `period`       | `String` | Data period of the indicator.                      |
