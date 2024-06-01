# Domains

This method is used to retrieve a list of domains (regions) available in the BPS data.

## Parameters

| Parameter      | Type         | Description                                                                                    |
| -------------- | ------------ | ---------------------------------------------------------------------------------------------- |
| `type`         | `DomainType` | The type of domain to retrieve (default: `DomainType.all`).                                    |
| `provinceCode` | `String?`    | The province code for filtering domains (required if `type` = `DomainType.regencyByProvince`). |

## Example

Example usage and sample output:

![Preview](/gif/domains.gif)

```dart
// Fetch domain data from BPS API
final domainResult = await StadataFlutter.instance.list.domains(
  type: DomainType.all,
  provinceCode: null, // Replace with the desired province code if needed
);

final domainList = domainResult.data;
final pagination = domainResult.pagination;

// Print pagination info
print('Current Page: ${pagination.page}');
print('Total Pages: ${pagination.pages}');
print('Data Count in This Page: ${pagination.count}');
print('Per Page: ${pagination.perPage}');
print('Total: ${pagination.total}');
print('------------------------');

// Print the retrieved domain data
for (final domain in domainList) {
  print('Domain ID: ${domain.id}'); /// Ex. 7200
  print('Name: ${domain.name}'); /// Sulawesi Tengah
  print('URL: ${domain.url}'); /// https://sultengprov.bps.go.id
  print('------------------------');
}
```

## Properties (DomainEntity)

| Property | Type     | Description                       |
| -------- | -------- | --------------------------------- |
| `name`   | `String` | The name of the domain (region).  |
| `id`     | `String` | Unique identifier for the domain. |
| `url`    | `String` | URL associated with the domain.   |
