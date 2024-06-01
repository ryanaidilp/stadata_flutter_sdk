# Enums

## Enums untuk Mempermudah Permintaan dan Penanganan Respon API

Dalam SDK `StadataFlutter`, Anda akan menemukan beberapa enums yang dirancang untuk menyederhanakan permintaan API dan memfasilitasi penanganan respon API.

## Enum `DataLanguage`

- Enum `DataLanguage` digunakan untuk menentukan parameter bahasa (`lang`) saat membuat permintaan API. Ini menawarkan dua opsi:

  | Enums             | Nilai Param | Deskripsi                  | Status      |
  | ----------------- | ----------- | -------------------------- | ----------- |
  | `DataLanguage.id` | `ind`       | Mewakili bahasa Indonesia. | **Default** |
  | `DataLanguage.en` | `eng`       | Mewakili bahasa Inggris.   |             |

## Enum `DomainType`

- Enum `DomainType` menyederhanakan parameter jenis domain (`type`) untuk model `Domain` dalam permintaan API. Ini mencakup opsi berikut:

  | Enums                          | Nilai Aktual | Deskripsi                                                    | Status      |
  | ------------------------------ | ------------ | ------------------------------------------------------------ | ----------- |
  | `DomainType.all`               | `all`        | Mengambil semua domain, termasuk provinsi dan kabupaten.     | **Default** |
  | `DomainType.province`          | `prov`       | Mengambil semua domain provinsi.                             |             |
  | `DomainType.regency`           | `kab`        | Mengambil semua domain kabupaten.                            |             |
  | `DomainType.regencyByProvince` | `kabbyprov`  | Mengambil semua domain kabupaten dalam ID provinsi tertentu. |             |

## Enum `DataAvailability`

- Enum `DataAvailability` membantu Anda memeriksa kunci `data-availability` dalam respon API, memudahkan penentuan ketersediaan data. Ini mencakup opsi berikut:

  | Enums                               | Nilai Aktual         | Deskripsi                                |
  | ----------------------------------- | -------------------- | ---------------------------------------- |
  | `DataAvailability.available`        | `available`          | Menunjukkan bahwa data tersedia.         |
  | `DataAvailability.listNotAvailable` | `list-not-available` | Menunjukkan bahwa daftar tidak tersedia. |
  | `DataAvailability.notAvailable`     | `not-available`      | Menunjukkan bahwa data tidak tersedia.   |

Enums ini adalah alat berharga untuk meningkatkan keterbacaan dan pengelolaan kode terkait API Anda. Apakah Anda menentukan preferensi bahasa, jenis domain, atau memeriksa ketersediaan data, enums ini menyederhanakan proses dan membuat kode Anda lebih ringkas dan ekspresif.
