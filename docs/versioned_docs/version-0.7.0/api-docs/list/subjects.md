# Subjects

This method is used to retrieve a list of subject based on the selected domain (region).

## Parameters

| Parameter           | Type           | Description                                                  |
| ------------------- | -------------- | ------------------------------------------------------------ |
| `domain`            | `String`       | The domain (region) code for retrieving subject.             |
| `lang`              | `DataLanguage` | The language for subject data (default: `DataLanguage.id`).  |
| `page`              | `int`          | The page number (default: `1`).                              |
| `subjectCategoryId` | `int?`         | ID of the subject category for filtering subject (optional). |

## Example

Example usage and sample output:

![Preview](/gif/subjects.gif)

```dart
// Fetch news categories data from BPS API
final result = await StadataFlutter.instance.list.subjects(domain: '7200');
final subjectList = result.data;
final pagination = result.pagination;


// Print pagination info
print('Current Page: ${pagination.page}');
print('Total Pages: ${pagination.pages}');
print('Data Count in This Page: ${pagination.count}');
print('Per Page: ${pagination.perPage}');
print('Total: ${pagination.total}');
print('------------------------');

// Print the retrieved subject data
for (final subject in subjectList) {
    print('Subject ID: ${subject.id}');
    print('Subject Name: ${subject.name}');
    print('Subject Category ID: ${subject.category?.id}');
    print('Subject Category Name: ${subject.category?.name}');
    print('Subject N Table: ${subject.nTable}');
}
```

## Properties (Subject)

| Property   | Type               | Description                            |
| ---------- | ------------------ | -------------------------------------- |
| `id`       | `int`              | The unique identifier for the subject. |
| `name`     | `String`           | The name for the subject.              |
| `category` | `SubjectCategory?` | The category for the subject.          |
| `nTable`   | `int?`             | Sum of the table of the subject.       |
