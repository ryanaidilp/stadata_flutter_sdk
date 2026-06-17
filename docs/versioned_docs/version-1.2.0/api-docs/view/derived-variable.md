# Derived Variable

The View Derived Variable API provides detailed information about a specific derived variable from BPS (Badan Pusat Statistik) Indonesia. Derived variables (turvar) represent calculated or transformed variables—aggregations or groupings across base variables. They offer grouped categories for more complex statistical analysis.

Examples include regional groupings and categorical aggregations used in dynamic table queries.

## Parameters

| Parameter | Type           | Description                                                           |
| --------- | -------------- | --------------------------------------------------------------------- |
| `id`      | `int`          | **Required**: The unique numerical identifier of the derived variable |
| `domain`  | `String`       | **Required**: The domain (region) code for the request                |
| `lang`    | `DataLanguage` | **Optional**: Language preference (default: `DataLanguage.id`)        |

## Examples

### 1. Basic Derived Variable Retrieval

```dart
// Retrieve a specific derived variable by ID
final derivedVar = await StadataFlutter.instance.view.derivedVariable(
  id: 1,
  domain: '0000',
  lang: DataLanguage.id,
);

if (derivedVar != null) {
  print('Derived Variable ID: ${derivedVar.id}');
  print('Name: ${derivedVar.name}');

  if (derivedVar.groupID != null) {
    print('Group ID: ${derivedVar.groupID}');
    print('Group Name: ${derivedVar.groupName}');
  }
} else {
  print('Derived variable not found');
}
```

### 2. Use Derived Variable in a Dynamic Table Query

```dart
// Get derived variable details then use it to query aggregated data
final derivedVar = await StadataFlutter.instance.view.derivedVariable(
  id: 1,
  domain: '0000',
);

if (derivedVar != null) {
  print('Derived Variable: ${derivedVar.name}');

  // Use in a dynamic table query for aggregated variable data
  final tableData = await StadataFlutter.instance.view.dynamicTable(
    variableID: 145,
    domain: '0000',
    derivedVariableID: derivedVar.id,
  );

  if (tableData != null) {
    print('Table: ${tableData.title}');
  }
}
```

### 3. Browse Available Derived Variables

```dart
// List all derived variables for a variable
final derivedVariables = await StadataFlutter.instance.list.derivedVariables(
  domain: '0000',
  variableID: 145,
);

print('Available derived variables for variable 145:');
for (final dv in derivedVariables.data) {
  final groupInfo = dv.groupName != null ? ' (${dv.groupName})' : '';
  print('[${dv.id}] ${dv.name}$groupInfo');
}
```

## Error Handling

```dart
try {
  final derivedVar = await StadataFlutter.instance.view.derivedVariable(
    id: 1,
    domain: '0000',
    lang: DataLanguage.id,
  );

  if (derivedVar != null) {
    print('Derived Variable: ${derivedVar.name}');
  } else {
    print('Derived variable not found');
  }

} on DerivedVariableException catch (e) {
  print('Derived variable error: ${e.message}');

} on ApiException catch (e) {
  print('API error: ${e.message}');

} on ApiKeyNotFoundException catch (e) {
  print('Authentication required: ${e.message}');

} catch (e) {
  print('Unexpected error: $e');
}
```

## Properties (DerivedVariable)

| Property    | Type      | Description                                                               |
| ----------- | --------- | ------------------------------------------------------------------------- |
| `id`        | `int`     | Unique identifier for the derived variable (`turvar_id` in API response)  |
| `name`      | `String`  | Display label describing the variable grouping or calculation             |
| `groupID`   | `int?`    | Optional numeric code linking this derived variable to its group          |
| `groupName` | `String?` | Optional human-readable label for the group category                      |
