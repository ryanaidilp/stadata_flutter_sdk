# Siaran Pers

Metode ini digunakan untuk mendapatkan daftar siaran pers berdasarkan domain (wilayah) yang dipilih.

## Parameter

| Parameter | Tipe           | Deskripsi                                                   |
| --------- | -------------- | ----------------------------------------------------------- |
| `domain`  | `String`       | Kode domain (wilayah) untuk mengambil siaran pers.          |
| `lang`    | `DataLanguage` | Bahasa untuk data siaran pers (default: `DataLanguage.id`). |
| `page`    | `int`          | Nomor halaman (default: `1`).                               |
| `subcat`  | `int`          | ID kategori subjek untuk memfilter siaran pers (opsional).  |
| `keyword` | `String?`      | Kata kunci untuk mencari siaran pers (opsional).            |
| `month`   | `int?`         | Bulan untuk memfilter siaran pers (opsional - `1..12`).     |
| `year`    | `int?`         | Tahun untuk memfilter siaran pers (opsional).               |

## Contoh

Contoh penggunaan dan hasil keluaran:

![Preview](/gif/press_releases.gif)

```dart
final result = await StadataFlutter.instance.list.pressReleases(domain: '7200');
final pressReleaseList = result.data;
final pagination = result.pagination;

// Cetak informasi paginasi
print('Halaman Saat Ini: ${pagination.page}');
print('Total Halaman: ${pagination.pages}');
print('Jumlah Data di Halaman Ini: ${pagination.count}');
print('Per Halaman: ${pagination.perPage}');
print('Total: ${pagination.total}');
print('------------------------');

// Cetak data siaran pers yang didapat
for (final pressRelease in pressReleaseList) {
    print('ID Siaran Pers: ${pressRelease.id}');
    print('ID Subjek: ${pressRelease.subject?.id}');
    print('Nama Subjek: ${pressRelease.subject?.name}');
    print('Judul: ${pressRelease.title}');
    print('Abstrak: ${pressRelease.abstract}');
    print('Tanggal Rilis: ${pressRelease.releaseDate}');
    print('Sampul: ${pressRelease.cover}');
    print('Ukuran File: ${pressRelease.size}');
    print('URL PDF: ${pressRelease.pdf}');
    print('URL Slide: ${pressRelease.slide}');
    print('Diperbarui Pada: ${pressRelease.updatedAt}');
}
```

## Properti (PressRelease)

| Properti      | Tipe        | Deskripsi                                                      |
| ------------- | ----------- | -------------------------------------------------------------- |
| `id`          | `int`       | Pengenal unik dari siaran pers.                                |
| `title`       | `String`    | Judul siaran pers.                                             |
| `subject`     | `Subject?`  | Subjek siaran pers yang bersifat opsional.                     |
| `size`        | `String`    | Ukuran file.                                                   |
| `pdf`         | `String`    | Tautan atau referensi ke file PDF terkait untuk siaran pers.   |
| `cover`       | `String`    | Gambar miniatur dari siaran pers.                              |
| `abstract`    | `String?`   | Abstrak dari siaran pers.                                      |
| `updatedAt`   | `DateTime`  | Tanggal dan waktu ketika tabel terakhir diperbarui.            |
| `releaseDate` | `DateTime?` | Tanggal dan waktu ketika tabel dibuat (opsional).              |
| `slide`       | `String`    | Tautan atau referensi ke file Slide terkait untuk siaran pers. |
