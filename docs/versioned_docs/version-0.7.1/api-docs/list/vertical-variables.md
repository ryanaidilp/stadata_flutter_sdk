# Vertical Variables

This method is used to retrieve a list of vertical variables based on the selected domain (region).

## Parameters

| Parameter    | Type           | Description                                                        |
| ------------ | -------------- | ------------------------------------------------------------------ |
| `domain`     | `String`       | Domain code (region) to retrieve vertical variables.               |
| `lang`       | `DataLanguage` | Language for vertical variables data (default: `DataLanguage.id`). |
| `page`       | `int`          | Page number (default: `1`).                                        |
| `variableID` | `int?`         | Variable ID of the vertical variables (optional).                  |

## Examples

Example usage and output:

```dart
// Fetch vertical variables data from BPS
final result = await StadataFlutter.instance.list.verticalVariables(
  domain: 'example_domain_code', // Replace with the desired domain code
  lang: DataLanguage.id,
  page: 1,
  variableID: 'example_variable_id', // Replace with the desired variable ID or null
);

final variables = result.data;
final pagination = result.pagination;

// Print page information
print('Current page: ${pagination.page}');
print('Total Pages: ${pagination.pages}');
print('Total Data in This Page: ${pagination.count}');
print('PerPage: ${pagination.perPage}');
print('Total: ${pagination.total}');
print('------------------------');

// Print retrieved variables data
for (final variable in variables) {
    print('Vertical Variable ID: ${unit.id}');
    print('Title: ${unit.title}');
    print('Item ID: ${unit.itemID}');
    print('Group ID: ${unit.groupID}');
    print('Group Name: ${unit.groupName}');
}
```

## Properties (VerticalVariable)

| Property    | Type      | Description                                                             |
| ----------- | --------- | ----------------------------------------------------------------------- |
| `id`        | `int`     | The unique identifier for the Vertical Variable.                        |
| `title`     | `String`  | The official title or label of the vertical variable.                   |
| `itemID`    | `int`     | It specifies a particular item or element within the vertical variable. |
| `groupID`   | `int?`    | This identifies the group to which the variable belongs.                |
| `groupName` | `String?` | It indicates the name of the group associated with the variable.        |
