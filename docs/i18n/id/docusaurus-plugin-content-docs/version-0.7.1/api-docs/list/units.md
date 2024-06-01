# Satuan

Metode ini digunakan untuk mengambil daftar satuan berdasarkan domain yang dipilih (wilayah).

## Parameters

| Parameter    | Tipe           | Deskripsi                                              |
| ------------ | -------------- | ------------------------------------------------------ |
| `domain`     | `String`       | Kode domain (wilayah) untuk mengambil satuan.          |
| `lang`       | `DataLanguage` | Bahasa untuk data satuan (default: `DataLanguage.id`). |
| `page`       | `int`          | Nomor halaman (default: `1`).                          |
| `variableID` | `int?`         | ID Variable dari satuan (opsional).                    |

## Contoh

Contoh penggunaan dan keluaran contoh:

```dart
// Fetch units data from BPS
final result = await StadataFlutter.instance.list.units(
  domain: 'kode_domain_contoh', // Ganti dengan kode domain yang diinginkan
  lang: DataLanguage.id,
  page: 1,
  variableID: 'contoh_kata_kunci', // Ganti dengan ID variabel yang diinginkan atau null
);

final units = result.data;
final pagination = result.pagination;

// Mencetak informasi halaman
print('Current page: ${pagination.page}');
print('Total Pages: ${pagination.pages}');
print('Total Data in This Page: ${pagination.count}');
print('PerPage: ${pagination.perPage}');
print('Total: ${pagination.total}');
print('------------------------');

// Mencetak data satuan yang diambil
for (final unit in units) {
    print('Unit ID: ${unit.id}');
    print('Title: ${unit.title}');
}
```

## Properti (UnitData)

| Properti | Tipe     | Deskripsi                    |
| -------- | -------- | ---------------------------- |
| `id`     | `int`    | Identifier unik dari satuan. |
| `title`  | `String` | Nama/Judul satuan.           |
