# Static Table

This method is used to retrieve detailed information about a specific static table.

## Parameters

| Parameter | Type           | Description                                                      |
| --------- | -------------- | ---------------------------------------------------------------- |
| `id`      | `int`          | The unique identifier of the static table.                       |
| `domain`  | `String`       | The domain (region) code for retrieving static table detail.     |
| `lang`    | `DataLanguage` | The language for static table data (default: `DataLanguage.id`). |

## Example

Example usage and sample output:

![Preview](/gif/static_tables.gif)

```dart
// Fetch static table detail from BPS API
final staticTable = await StadataFlutter.instance.view.staticTable(
  id: 'example_static_table_id', // Replace with the desired static table ID
  domain: 'example_domain', // Replace with the desired Domain Code
  lang: DataLanguage.id,
);


print('Table ID: ${staticTable.id}');
print('Table Title: ${staticTable.title}');
print('Subject ID: ${staticTable.subjectId}');
print('Subject: ${staticTable.subject}');
print('Size: ${staticTable.size}');
print('Table: ${staticTable.table}');
print('Updated At: ${staticTable.updatedAt}');
print('Created At: ${staticTable.createdAt}');
print('Excel Link: ${staticTable.excel}');
```

## Properties (StaticTable)

| Property    | Type        | Description                                                     |
| ----------- | ----------- | --------------------------------------------------------------- |
| `id`        | `int`       | The unique identifier of the table.                             |
| `title`     | `String`    | The title or name of the table.                                 |
| `subjectId` | `int`       | The optional subject identifier associated with the table.      |
| `subject`   | `String?`   | The optional subject name or description.                       |
| `size`      | `String`    | The file size.                                                  |
| `table`     | `String?`   | The HTML representation of the table.                           |
| `updatedAt` | `DateTime`  | The date and time when the table was last updated.              |
| `createdAt` | `DateTime?` | The optional date and time when the table was created.          |
| `excel`     | `String`    | A link or reference to the associated Excel file for the table. |
