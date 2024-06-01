# Enums

## Enums for Simplified API Requests and Response Handling

Within the `StadataFlutter` SDK, you'll find several enums designed to streamline API requests and facilitate the handling of API responses.

### `DataLanguage` Enum

- The `DataLanguage` enum is used to specify the language (`lang`) parameter when making API requests. It offers two options:

  | Enums             | Param Value | Description                         | Status      |
  | ----------------- | ----------- | ----------------------------------- | ----------- |
  | `DataLanguage.id` | `ind`       | Represents the Indonesian language. | **Default** |
  | `DataLanguage.en` | `eng`       | Represents the English language.    |             |

### `DomainType` Enum

- The `DomainType` enum simplifies domain type (`type`) parameters for `Domain` models in API requests. It includes the following options:

  | Enums                            | Actual Value | Description                                                  | Status      |
  | -------------------------------- | ------------ | ------------------------------------------------------------ | ----------- |
  | `DomainType.all`                 | `all`        | Retrieve all domains, including provinces and regencies.     | **Default** |
  | `DomainType.province`            | `prov`       | Retrieve all province domains.                               |             |
  | `DataLanguage.regency`           | `kab`        | Retrieve all regency domains.                                |             |
  | `DataLanguage.regencyByProvince` | `kabbyprov`  | Retrieve all regency domains within a specified province ID. |             |

### `DataAvailability` Enum

- The `DataAvailability` enum helps you check the `data-availability` key in API responses, making it easier to determine the availability of data. It includes the following options:

  | Enums                               | Actual Value         | Description                               |
  | ----------------------------------- | -------------------- | ----------------------------------------- |
  | `DataAvailability.available`        | `available`          | Indicates that data is available.         |
  | `DataAvailability.listNotAvailable` | `list-not-available` | Indicates that the list is not available. |
  | `DataAvailability.notAvailable`     | `not-available`      | Indicates that data is not available.     |

These enums serve as valuable tools to enhance the readability and manageability of your API-related code. Whether you're specifying language preferences, domain types, or checking data availability, these enums simplify the process and make your code more concise and expressive.
