# Publikasi

Metode ini digunakan untuk mengambil informasi terperinci tentang suatu publikasi tertentu.

## Parameter

| Parameter | Tipe           | Deskripsi                                               |
| --------- | -------------- | ------------------------------------------------------- |
| `id`      | `String`       | Identifier unik dari publikasi.                         |
| `domain`  | `String`       | Kode domain (wilayah) untuk mengambil detail publikasi. |
| `lang`    | `DataLanguage` | Bahasa data publikasi (default: `DataLanguage.id`).     |

## Contoh

Contoh penggunaan dan keluaran contoh:

![Preview](/gif/publications.gif)

```dart
// Mengambil detail publikasi dari API BPS
final publikasi = await StadataFlutter.instance.view.publication(
  id: 'contoh_id_publikasi', // Ganti dengan ID publikasi yang diinginkan
  domain: 'contoh_domain', // Ganti dengan Kode Domain yang diinginkan
  lang: DataLanguage.id,
);

print('ID Publikasi: ${publikasi.id}');
print('Judul: ${publikasi.title}');
print('ISSN: ${publikasi.issn}');
print('Tanggal Terjadwal: ${publikasi.scheduledDate}');
print('Tanggal Rilis: ${publikasi.releaseDate}');
print('Tanggal Pembaruan: ${publikasi.updateDate}');
print('URL Gambar Sampul: ${publikasi.cover}');
print('URL Berkas PDF: ${publikasi.pdf}');
print('Ukuran: ${publikasi.size}');
print('Abstrak: ${publikasi.abstract ?? 'Tidak tersedia'}');
print('Nomor Katalog: ${publikasi.catalogueNumber ?? 'Tidak tersedia'}');
print('Nomor Publikasi: ${publikasi.publicationNumber ?? 'Tidak tersedia'}');
```

## Properti (Publication)

| Properti            | Tipe        | Deskripsi                                                                    |
| ------------------- | ----------- | ---------------------------------------------------------------------------- |
| `id`                | `String`    | Pengenal unik untuk publikasi.                                               |
| `title`             | `String`    | Judul publikasi.                                                             |
| `issn`              | `String`    | Nomor Serial Standar Internasional (ISSN).                                   |
| `scheduledDate`     | `DateTime?` | Tanggal terjadwal untuk publikasi (opsional).                                |
| `releaseDate`       | `DateTime?` | Tanggal rilis publikasi (opsional).                                          |
| `updateDate`        | `DateTime?` | Tanggal terakhir publikasi diperbarui (opsional).                            |
| `cover`             | `String`    | URL gambar sampul publikasi.                                                 |
| `pdf`               | `String`    | URL berkas PDF publikasi.                                                    |
| `size`              | `String`    | Ukuran publikasi (mis., ukuran berkas).                                      |
| `abstract`          | `String?`   | Ringkasan atau abstrak opsional dari publikasi dalam Format HTML (opsional). |
| `catalogueNumber`   | `String?`   | Nomor katalog opsional yang terkait dengan publikasi (opsional).             |
| `publicationNumber` | `String?`   | Nomor atau kode publikasi opsional (opsional).                               |
