# Subject Categories

This method is used to retrieve a list of subject categories based on the selected domain (region).

## Parameters

| Parameter | Type           | Description                                                         |
| --------- | -------------- | ------------------------------------------------------------------- |
| `domain`  | `String`       | The domain (region) code for retrieving subject categories.         |
| `lang`    | `DataLanguage` | The language for news categories data (default: `DataLanguage.id`). |

## Example

Example usage and sample output:

![Preview](/gif/subject_categories.gif)

```dart
// Fetch news categories data from BPS API
final result = await StadataFlutter.instance.list.subjectCategories(domain: '7200');
final subjectCategoryList = result.data;
final pagination = result.pagination;


// Print pagination info
print('Current Page: ${pagination.page}');
print('Total Pages: ${pagination.pages}');
print('Data Count in This Page: ${pagination.count}');
print('Per Page: ${pagination.perPage}');
print('Total: ${pagination.total}');
print('------------------------');

// Print the retrieved subject category data
for (final subjectCategory in subjectCategoryList) {
    print('Subject Category ID: ${subjectCategory.id}');
    print('Subject Category Name: ${subjectCategory.name}');
}
```

## Properties (SubjectCategory)

| Property | Type     | Description                                     |
| -------- | -------- | ----------------------------------------------- |
| `id`     | `int`    | The unique identifier for the subject category. |
| `name`   | `String` | The name for the subject category.              |
