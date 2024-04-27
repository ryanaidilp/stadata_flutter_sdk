# Indikator Strategis

Metode ini digunakan untuk mengambil daftar indikator strategis berdasarkan domain (wilayah) yang dipilih.

## Parameter

| Parameter    | Tipe           | Deskripsi                                                           |
| ------------ | -------------- | ------------------------------------------------------------------- |
| `domain`     | `String`       | Kode domain (wilayah) untuk mengambil indikator strategis.          |
| `lang`       | `DataLanguage` | Bahasa untuk data indikator strategis (default: `DataLanguage.id`). |
| `page`       | `int`          | Nomor halaman (default: `1`).                                       |
| `variableID` | `int?`         | ID Variable dari indikator strategis (opsional).                    |

## Contoh

Contoh penggunaan dan keluaran contoh:

![Preview](/gif/strategic_indicators.gif)

```dart
// Fetch indicator strategic data from BPS
final result = await StadataFlutter.instance.list.strategicIndicators(
  domain: 'kode_domain_contoh', // Ganti dengan kode domain yang diinginkan
  lang: DataLanguage.id,
  page: 1,
  variableID: 'contoh_kata_kunci', // Ganti dengan ID variabel yang diinginkan atau null
);

final strategicIndicators = result.data;
final pagination = result.pagination;

// Mencetak informasi halaman
print('Current page: ${pagination.page}');
print('Total Page: ${pagination.pages}');
print('Total Data in This Page: ${pagination.count}');
print('PerPage: ${pagination.perPage}');
print('Total: ${pagination.total}');
print('------------------------');

// Mencetak data indikator strategis yang diambil
for (final strategicIndicator in strategicIndicators) {
    print('Indicator ID: ${strategicIndicator.id}');
    print('Title: ${strategicIndicator.title}');
    print('Variable ID: ${strategicIndicator.variableID}');
    print('Category ID: ${strategicIndicator.categoryID}');
    print('Name: ${strategicIndicator.name}');
    print('Value: ${strategicIndicator.value}');
    print('Unit: ${strategicIndicator.unit}');
    print('Data Source: ${strategicIndicator.dataSource}');
    print('Period: ${strategicIndicator.period}');
    print('CSA Subject ID: ${strategicIndicator.csaSubjectID}');
    print('HASH ID: ${strategicIndicator.hashID}');
}

```

## Properti (StrategicIndicator)

| Properti       | Tipe     | Deskripsi                                          |
| -------------- | -------- | -------------------------------------------------- |
| `id`           | `int`    | The unique identifier for the Strategic Indicator. |
| `title`        | `String` | The title of the Strategic Indicator.              |
| `name`         | `String` | Nama atau keterangan indikator.                    |
| `variableID`   | `int`    | ID variabel dari indikator.                        |
| `csaSubjectID` | `int?`   | ID Subjek CSA dari indikator.                      |
| `categoryID`   | `int`    | ID kategori dari indikator.                        |
| `hashID`       | `String` | ID hash dari indikator.                            |
| `value`        | `double` | Nilai dari indikator strategis.                    |
| `unit`         | `String` | Satuan dari indikator.                             |
| `dataSource`   | `String` | Sumber data dari indikator.                        |
| `period`       | `String` | Periode data dari indikator.                       |
