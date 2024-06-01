# Subjek

Metode ini digunakan untuk mendapatkan daftar subjek berdasarkan domain yang dipilih (wilayah).

## Parameter

| Parameter           | Tipe           | Deskripsi                                              |
| ------------------- | -------------- | ------------------------------------------------------ |
| `domain`            | `String`       | Kode domain (wilayah) untuk mendapatkan subjek.        |
| `lang`              | `DataLanguage` | Bahasa untuk data subjek (default: `DataLanguage.id`). |
| `page`              | `int`          | Nomor halaman (default: `1`).                          |
| `subjectCategoryId` | `int?`         | ID kategori subjek untuk menyaring subjek (opsional).  |

## Contoh

Contoh penggunaan dan hasil keluaran:

![Preview](/gif/subjects.gif)

```dart
// Mengambil data kategori berita dari API BPS
final result = await StadataFlutter.instance.list.subjects(domain: '7200');
final daftarSubjeck = result.data;
final pagination = result.pagination;


// Menampilkan informasi halaman
print('Halaman Saat Ini: ${pagination.page}');
print('Total Halaman: ${pagination.pages}');
print('Jumlah Data di Halaman Ini: ${pagination.count}');
print('Per Halaman: ${pagination.perPage}');
print('Total: ${pagination.total}');
print('------------------------');

// Menampilkan data subjek yang didapatkan
for (final subjek in daftarSubjeck) {
    print('ID subjek: ${subjek.id}');
    print('Nama subjek: ${subjek.name}');
    print('ID Kategori subjek: ${subjek.category?.id}');
    print('Nama Kategori subjek: ${subjek.category?.name}');
    print('N Tabel subjek: ${subjek.nTable}');
}
```

## Properti (Subject)

| Properti   | Tipe               | Deskripsi                           |
| ---------- | ------------------ | ----------------------------------- |
| `id`       | `int`              | Pengidentifikasi unik untuk subjek. |
| `name`     | `String`           | Nama subjek.                        |
| `category` | `SubjectCategory?` | Kategori subjek.                    |
| `nTable`   | `int?`             | Jumlah tabel dari subjek.           |
