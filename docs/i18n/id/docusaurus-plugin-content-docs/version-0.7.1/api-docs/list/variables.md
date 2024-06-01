# Variabel

Metode ini digunakan untuk mengambil daftar variabel berdasarkan domain yang dipilih (wilayah).

## Parameters

| Parameter              | Tipe           | Deskripsi                                                                                                                                                                                                                                                                                                                              |
| ---------------------- | -------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `domain`               | `String`       | Kode domain (wilayah) untuk mengambil variabel.                                                                                                                                                                                                                                                                                        |
| `lang`                 | `DataLanguage` | Bahasa untuk data variabel (bawaan: `DataLanguage.id`).                                                                                                                                                                                                                                                                                |
| `page`                 | `int`          | Nomor halaman (bawaan: `1`).                                                                                                                                                                                                                                                                                                           |
| `subjectID`            | `int?`         | ID variabel dari variabel yang dipilih (opsional).                                                                                                                                                                                                                                                                                     |
| `showExistingVariable` | `bool`         | Digunakan untuk menentukan apakah hanya menampilkan variabel yang memiliki data berdasarkan domain yang ditentukan. Ketika diatur menjadi `true`, fungsi ini menerjemahkan data tersebut ke parameter kueri `area` dengan nilai 1, memfilter variabel untuk hanya menyertakan yang memiliki nilai yang ada di domain (bawaan: `false`) |
| `year`                 | `int?`         | (Opsional) Tahun spesifik untuk permintaan variabel.                                                                                                                                                                                                                                                                                   |

## Contoh

Contoh penggunaan dan keluaran contoh:

```dart
// Fetch variables data from BPS
final result = await StadataFlutter.instance.list.variables(
  domain: 'example_domain_code', // Replace with the desired domain code
  lang: DataLanguage.id,
  page: 1,
  showExistingVariable: false,
  year: 2020,
  subjectID: 'example_subject_id', // Replace with the desired subject ID or null
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

// Mencetak data variabel yang diambil
for (final variable in variables) {
    print('Variable ID: ${unit.id}');
    print('Title: ${unit.title}');
    print('Subject ID: ${unit.subjectID}');
    print('Subject Name: ${unit.subjectName}');
    print('Vertical Variable ID: ${unit.verticalVariableID}');
    print('CSA Subject Name: ${unit.csaSubjectName}');
    print('Graph Name: ${unit.graphName}');
    print('Notes: ${unit.notes}');
    print('Unit: ${unit.unit}');
    print('Type: ${unit.type}');
    print('Derived Period ID: ${unit.derivedPeriodID}');
    print('Derived Variable ID: ${unit.derivedVariableID}');
}
```

## Properti (Variable)

| Properti             | Tipe      | Deskripsi                                                                |
| -------------------- | --------- | ------------------------------------------------------------------------ |
| `id`                 | `int`     | Pengenal unik untuk Variabel.                                            |
| `title`              | `String`  | Judul resmi atau label dari variabel                                     |
| `subjectID`          | `int`     | Pengenal untuk sub-kategori dari variabel.                               |
| `subjectName`        | `String`  | Nama subjek di mana variabel tersebut berada.                            |
| `verticalVariableID` | `int`     | Pengenal untuk variabel vertikal.                                        |
| `csaSubjectName`     | `String?` | Nama subjek lintas seksional yang terkait dengan variabel, jika berlaku. |
| `graphName`          | `String`  | Nama deskriptif yang digunakan untuk keperluan grafis.                   |
| `notes`              | `String`  | Catatan atau deskripsi tambahan tentang variabel.                        |
| `unit`               | `String`  | Satuan pengukuran dari variabel.                                         |
| `type`               | `int?`    | Tipe dari variabel, jika berlaku.                                        |
| `derivedPeriodID`    | `int?`    | Pengenal untuk periode turunan, jika berlaku.                            |
| `derivedVariableID`  | `int?`    | Pengenal untuk variabel turunan, jika berlaku.                           |
