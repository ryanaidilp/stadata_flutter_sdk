# Variabel Vertikal

Metode ini digunakan untuk mengambil daftar variabel vertikal berdasarkan domain yang dipilih (wilayah).

## Parameters

| Parameter    | Tipe           | Deskripsi                                                         |
| ------------ | -------------- | ----------------------------------------------------------------- |
| `domain`     | `String`       | Kode domain (wilayah) untuk mengambil variabel vertikal.          |
| `lang`       | `DataLanguage` | Bahasa untuk data variabel vertikal (default: `DataLanguage.id`). |
| `page`       | `int`          | Nomor halaman (default: `1`).                                     |
| `variableID` | `int?`         | ID Variable dari variabel vertikal (opsional).                    |

## Contoh

Contoh penggunaan dan keluaran contoh:

```dart
// Fetch vertical variables data from BPS
final result = await StadataFlutter.instance.list.verticalVariables(
  domain: 'kode_domain_contoh', // Ganti dengan kode domain yang diinginkan
  lang: DataLanguage.id,
  page: 1,
  variableID: 'contoh_kata_kunci', // Ganti dengan ID variabel yang diinginkan atau null
);

final variables = result.data;
final pagination = result.pagination;

// Mencetak informasi halaman
print('Current page: ${pagination.page}');
print('Total Pages: ${pagination.pages}');
print('Total Data in This Page: ${pagination.count}');
print('PerPage: ${pagination.perPage}');
print('Total: ${pagination.total}');
print('------------------------');

// Mencetak data variabel vertikal yang diambil
for (final variable in variables) {
    print('Vertical Variable ID: ${unit.id}');
    print('Title: ${unit.title}');
    print('Item ID: ${unit.itemID}');
    print('Group ID: ${unit.groupID}');
    print('Group Name: ${unit.groupName}');
}
```

## Properti (VerticalVariable)

| Properti    | Tipe      | Deskripsi                                                        |
| ----------- | --------- | ---------------------------------------------------------------- |
| `id`        | `int`     | Pengenal unik untuk Variabel Vertikal.                           |
| `title`     | `String`  | Judul resmi atau label dari variabel vertikal.                   |
| `itemID`    | `int`     | Menentukan item atau elemen tertentu dalam variabel vertikal.    |
| `groupID`   | `int?`    | Ini mengidentifikasi kelompok di mana variabel tersebut berada.  |
| `groupName` | `String?` | Menunjukkan nama kelompok yang terkait dengan variabel tersebut. |
