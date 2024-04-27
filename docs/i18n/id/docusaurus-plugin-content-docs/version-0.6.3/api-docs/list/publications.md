# Publikasi

Metode ini digunakan untuk mengambil daftar publikasi berdasarkan domain (wilayah) yang dipilih.

## Parameter

| Parameter | Tipe           | Deskripsi                                                 |
| --------- | -------------- | --------------------------------------------------------- |
| `domain`  | `String`       | Kode domain (wilayah) untuk mengambil publikasi.          |
| `lang`    | `DataLanguage` | Bahasa untuk data publikasi (default: `DataLanguage.id`). |
| `page`    | `int`          | Nomor halaman (default: `1`).                             |
| `keyword` | `String?`      | Kata kunci untuk mencari publikasi (opsional).            |
| `month`   | `int?`         | Bulan untuk memfilter publikasi (opsional - `1..12`).     |
| `year`    | `int?`         | Tahun untuk memfilter publikasi (opsional).               |

## Contoh

Contoh penggunaan dan contoh output:

![Preview](/gif/publications.gif)

```dart
// Ambil data publikasi dari API BPS
final publicationResult = await StadataFlutter.instance.list.publications(
  domain: 'contoh_kode_domain', // Ganti dengan kode domain yang diinginkan
  lang: DataLanguage.id,
  page: 1,
  keyword: 'contoh_kata_kunci', // Ganti dengan kata kunci yang diinginkan atau null
  month: null, // Ganti dengan bulan yang diinginkan atau null
  year: null, // Ganti dengan tahun yang diinginkan atau null
);

final publicationList = publicationResult.data;
final pagination = publicationResult.pagination;

// Cetak info paginasi
print('Halaman Saat Ini: ${pagination.page}');
print('Total Halaman: ${pagination.pages}');
print('Jumlah Data di Halaman Ini: ${pagination.count}');
print('Per Halaman: ${pagination.perPage}');
print('Total: ${pagination.total}');
print('------------------------');

// Cetak data publikasi yang didapatkan
for (final publication in publicationList) {
  print('ID Publikasi: ${publication.id}');
  print('Judul: ${publication.title}');
  print('ISSN: ${publication.issn}');
  print('Tanggal Terjadwal: ${publication.scheduledDate}');
  print('Tanggal Rilis: ${publication.releaseDate}');
  print('Tanggal Pembaruan: ${publication.updateDate}');
  print('URL Gambar Cover: ${publication.cover}');
  print('URL Berkas PDF: ${publication.pdf}');
  print('Ukuran: ${publication.size}');
  print('Abstrak: ${publication.abstract ?? 'Tidak tersedia'}');
  print('Nomor Katalog: ${publication.catalogueNumber ?? 'Tidak tersedia'}');
  print('Nomor Publikasi: ${publication.publicationNumber ?? 'Tidak tersedia'}');
  print('------------------------');
}

```

## Properti (Publication)

| Properti            | Tipe        | Deskripsi                                                                    |
| ------------------- | ----------- | ---------------------------------------------------------------------------- |
| `id`                | `String`    | Pengidentifikasi unik untuk publikasi.                                       |
| `title`             | `String`    | Judul publikasi.                                                             |
| `issn`              | `String`    | Nomor Standar Internasional Serial (ISSN).                                   |
| `scheduledDate`     | `DateTime?` | Tanggal terjadwal untuk publikasi (opsional).                                |
| `releaseDate`       | `DateTime?` | Tanggal rilis publikasi (opsional).                                          |
| `updateDate`        | `DateTime?` | Tanggal terakhir publikasi diperbarui (opsional).                            |
| `cover`             | `String`    | URL gambar cover publikasi.                                                  |
| `pdf`               | `String`    | URL berkas PDF publikasi.                                                    |
| `size`              | `String`    | Ukuran publikasi (mis., ukuran berkas).                                      |
| `abstract`          | `String?`   | Abstrak atau ringkasan opsional dari publikasi dalam Format HTML (opsional). |
| `catalogueNumber`   | `String?`   | Nomor katalog opsional yang terkait dengan publikasi (opsional).             |
| `publicationNumber` | `String?`   | Nomor atau kode publikasi opsional (opsional).                               |
