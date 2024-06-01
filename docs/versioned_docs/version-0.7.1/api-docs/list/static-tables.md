# Static Tables

This method is used to retrieve a list of static tables based on the selected domain (region).

## Parameters

| Parameter | Type           | Description                                                      |
| --------- | -------------- | ---------------------------------------------------------------- |
| `domain`  | `String`       | The domain (region) code for retrieving static tables.           |
| `lang`    | `DataLanguage` | The language for static table data (default: `DataLanguage.id`). |
| `page`    | `int`          | The page number (default: `1`).                                  |
| `keyword` | `String?`      | A keyword for searching static tables (optional).                |
| `month`   | `int?`         | The month for filtering static tables (optional - `1..12`).      |
| `year`    | `int?`         | The year for filtering static tables (optional).                 |

## Example

Example usage and sample output:

![Preview](/gif/static_tables.gif)

```dart
// Fetch static table data from BPS API
final staticTableResult = await StadataFlutter.instance.list.staticTable(
  domain: 'example_domain_code', // Replace with the desired domain code
  lang: DataLanguage.id,
  page: 1,
  keyword: 'example_keyword', // Replace with desired keyword or null
  month: null, // Replace with desired month or null
  year: null, // Replace with desired year or null
);

final staticTableList = staticTableResult.data;
final pagination = staticTableResult.pagination;

// Print pagination info
print('Current Page: ${pagination.page}');
print('Total Pages: ${pagination.pages}');
print('Data Count in This Page: ${pagination.count}');
print('Per Page: ${pagination.perPage}');
print('Total: ${pagination.total}');
print('------------------------');

// Print the retrieved static table data
for (final staticTable in staticTableList) {
    print('Table ID: ${staticTable.id}');
    print('Table Title: ${staticTable.title}');
    print('Subject ID: ${staticTable.subjectId}');
    print('Subject: ${staticTable.subject}');
    print('Size: ${staticTable.size}');
    print('Table: ${staticTable.table}');
    print('Updated At: ${staticTable.updatedAt}');
    print('Created At: ${staticTable.createdAt}');
    print('Excel Link: ${staticTable.excel}');
}

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
