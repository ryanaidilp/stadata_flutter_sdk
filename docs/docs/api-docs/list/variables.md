# Variables

This method is used to retrieve a list of variables based on the selected domain (region).

## Parameters

| Parameter              | Type           | Description                                                                                                                                                                                                                                                                                                      |
| ---------------------- | -------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `domain`               | `String`       | Domain code (region) to retrieve variables.                                                                                                                                                                                                                                                                      |
| `lang`                 | `DataLanguage` | Language for variables data (default: `DataLanguage.id`).                                                                                                                                                                                                                                                        |
| `page`                 | `int`          | Page number (default: `1`).                                                                                                                                                                                                                                                                                      |
| `subjectID`            | `int?`         | Variable ID of the variables (optional).                                                                                                                                                                                                                                                                         |
| `showExistingVariable` | `bool`         | A boolean flag to determine whether to only show variables that have values for the specified domain. When set to `true`, the function translates this to the `area` query parameter with a value of 1, filtering the variables to include only those that have existing values in the domain (default: `false`) |
| `year`                 | `int?`         | (Optional) The specific year for which variables are being requested.                                                                                                                                                                                                                                            |

## Examples

Example usage and output:

```dart
// Fetch variables data from BPS
final result = await StadataFlutter.instance.list.variables(
  domain: 'example_domain_code', // Replace with the desired domain code
  lang: DataLanguage.id,
  page: 1,
  showExistingVariable: false,
  year: 2020,
  subjectID: 'example_subject_id', // Replace with the desired subject ID or null
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
    print('Variable ID: ${unit.id}');
    print('Title: ${unit.title}');
    print('Subject ID: ${unit.subjectID}');
    print('Subject Name: ${unit.subjectName}');
    print('Vertical Variable ID: ${unit.verticalVariableID}');
    print('CSA Subject Name: ${unit.csaSubjectName}');
    print('Graph Name: ${unit.graphName}');
    print('Notes: ${unit.notes}');
    print('Unit: ${unit.unit}');
    print('Type: ${unit.type}');
    print('Derived Period ID: ${unit.derivedPeriodID}');
    print('Derived Variable ID: ${unit.derivedVariableID}');
}
```

## Properties (Variable)

| Property             | Type      | Description                                                                     |
| -------------------- | --------- | ------------------------------------------------------------------------------- |
| `id`                 | `int`     | The unique identifier for the Variable.                                         |
| `title`              | `String`  | The official title or label of the variable                                     |
| `subjectID`          | `int`     | An identifier for the sub-category of the variable.                             |
| `subjectName`        | `String`  | The name of the subject to which the variable belongs.                          |
| `verticalVariableID` | `int`     | An identifier for the vertical variable.                                        |
| `csaSubjectName`     | `String?` | The name of the cross-sectional subject related to the variable, if applicable. |
| `graphName`          | `String`  | A descriptive name used for graphing purposes.                                  |
| `notes`              | `String`  | Additional notes or descriptions about the variable.                            |
| `unit`               | `String`  | The measurement unit of the variable.                                           |
| `type`               | `int?`    | The type of the variable, if applicable.                                        |
| `derivedPeriodID`    | `int?`    | The identifier for the derived period, if applicable.                           |
| `derivedVariableID`  | `int?`    | The identifier for the derived variable, if applicable.                         |
