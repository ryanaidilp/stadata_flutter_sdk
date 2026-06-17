# Vertical Variable

The View Vertical Variable API provides detailed information about a specific vertical variable from BPS (Badan Pusat Statistik) Indonesia. Vertical variables represent categorical dimensions or classification systems used to organize and break down statistical data into meaningful sub-categories. They provide the dimensional structure for cross-tabulation and disaggregation of statistical variables.

Common examples include geographic breakdowns (province, regency, urban/rural), demographic characteristics (age groups, gender, education level), and economic classifications (industry sectors, occupation types).

## Parameters

| Parameter | Type           | Description                                                          |
| --------- | -------------- | -------------------------------------------------------------------- |
| `id`      | `int`          | **Required**: The unique numerical identifier of the vertical variable |
| `domain`  | `String`       | **Required**: The domain (region) code for the request               |
| `lang`    | `DataLanguage` | **Optional**: Language preference (default: `DataLanguage.id`)       |

## Examples

### 1. Basic Vertical Variable Retrieval

```dart
// Retrieve detailed information for a specific vertical variable
final vertVar = await StadataFlutter.instance.view.verticalVariable(
  id: 7315,
  domain: '0000',
  lang: DataLanguage.id,
);

if (vertVar != null) {
  print('Vertical Variable ID: ${vertVar.id}');
  print('Title: ${vertVar.title}');
  print('Item ID: ${vertVar.itemID}');

  if (vertVar.groupID != null) {
    print('Group ID: ${vertVar.groupID}');
    print('Group Name: ${vertVar.groupName}');
  }
} else {
  print('Vertical variable not found');
}
```

### 2. Use Vertical Variable in Dynamic Table Query

```dart
// Get vertical variable details then use it to query dynamic data
final vertVar = await StadataFlutter.instance.view.verticalVariable(
  id: 7315,
  domain: '0000',
);

if (vertVar != null) {
  print('Vertical Variable: ${vertVar.title}');
  print('Group: ${vertVar.groupName ?? 'No group'}');

  // Use in a dynamic table query to get disaggregated data
  final tableData = await StadataFlutter.instance.view.dynamicTable(
    variableID: 145,
    domain: '0000',
    verticalVarID: vertVar.id,
  );

  if (tableData != null) {
    print('Table: ${tableData.title}');
  }
}
```

### 3. Browse Vertical Variables for a Variable

```dart
// List all vertical variables associated with a statistical variable
final verticalVariables = await StadataFlutter.instance.list.verticalVariables(
  domain: '0000',
  variableID: 145,
);

print('Vertical variables for variable 145:');
for (final vv in verticalVariables.data) {
  print('[${vv.id}] ${vv.title} (Item ID: ${vv.itemID})');

  if (vv.groupName != null) {
    print('    Group: ${vv.groupName}');
  }
}
```

## Error Handling

```dart
try {
  final vertVar = await StadataFlutter.instance.view.verticalVariable(
    id: 7315,
    domain: '0000',
    lang: DataLanguage.id,
  );

  if (vertVar != null) {
    print('Vertical Variable: ${vertVar.title}');
  } else {
    print('Vertical variable not found');
  }

} on VerticalVariableException catch (e) {
  print('Vertical variable error: ${e.message}');

} on ApiException catch (e) {
  print('API error: ${e.message}');

} on ApiKeyNotFoundException catch (e) {
  print('Authentication required: ${e.message}');

} catch (e) {
  print('Unexpected error: $e');
}
```

## Properties (VerticalVariable)

| Property    | Type      | Description                                                           |
| ----------- | --------- | --------------------------------------------------------------------- |
| `id`        | `int`     | Unique identifier for the vertical variable (`kode_ver_id` in API)    |
| `title`     | `String`  | Descriptive name of the vertical variable category (`vervar` in API)  |
| `itemID`    | `int`     | Identifier for specific items within the variable structure (`item_ver_id` in API) |
| `groupID`   | `int?`    | Optional identifier for hierarchical grouping (`group_ver_id` in API) |
| `groupName` | `String?` | Optional name of the hierarchical group (`name_group_ver_id` in API)  |
