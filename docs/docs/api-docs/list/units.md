# Units

This method is used to retrieve a list of units based on the selected domain (region).

## Parameters

| Parameter    | Type           | Description                                           |
| ------------ | -------------- | ----------------------------------------------------- |
| `domain`     | `String`       | Domain code (region) to retrieve units.               |
| `lang`       | `DataLanguage` | Language for units data (default: `DataLanguage.id`). |
| `page`       | `int`          | Page number (default: `1`).                           |
| `variableID` | `int?`         | Variable ID of the units (optional).                  |

## Examples

Example usage and output:

```dart
// Fetch units data from BPS
final result = await StadataFlutter.instance.list.units(
  domain: 'example_domain_code', // Replace with the desired domain code
  lang: DataLanguage.id,
  page: 1,
  variableID: 'example_variable_id', // Replace with the desired variable ID or null
);

final units = result.data;
final pagination = result.pagination;

// Print page information
print('Current page: ${pagination.page}');
print('Total Pages: ${pagination.pages}');
print('Total Data in This Page: ${pagination.count}');
print('PerPage: ${pagination.perPage}');
print('Total: ${pagination.total}');
print('------------------------');

// Print retrieved units data
for (final unit in units) {
    print('Unit ID: ${unit.id}');
    print('Title: ${unit.title}');
}
```

## Properties (UnitData)

| Property | Type     | Description                         |
| -------- | -------- | ----------------------------------- |
| `id`     | `int`    | The unique identifier for the Unit. |
| `title`  | `String` | The title of the Unit.              |
