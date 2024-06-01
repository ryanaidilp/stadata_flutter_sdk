# Infografis

Metode ini digunakan untuk mendapatkan daftar infografis berdasarkan domain (wilayah) yang dipilih.

## Parameter

| Parameter | Tipe           | Deskripsi                                                  |
| --------- | -------------- | ---------------------------------------------------------- |
| `domain`  | `String`       | Kode domain (wilayah) untuk mendapatkan infografis.        |
| `lang`    | `DataLanguage` | Bahasa untuk data infografis (default: `DataLanguage.id`). |
| `page`    | `int`          | Nomor halaman (default: `1`).                              |
| `keyword` | `String?`      | Kata kunci untuk mencari infografis (opsional).            |

## Contoh

Contoh penggunaan dan output contoh:

![Preview](/gif/infographics.gif)

```dart
// Mengambil data infografis dari API BPS
final hasilInfografis = await StadataFlutter.instance.list.infografis(
  domain: 'kode_domain_contoh', // Ganti dengan kode domain yang diinginkan
  lang: DataLanguage.id,
  page: 1,
  keyword: 'kata_kunci_contoh', // Ganti dengan kata kunci yang diinginkan atau null
);

final daftarInfografis = hasilInfografis.data;
final paginasi = hasilInfografis.pagination;

// Menampilkan info paginasi
print('Halaman Saat Ini: ${paginasi.page}');
print('Total Halaman: ${paginasi.pages}');
print('Jumlah Data di Halaman Ini: ${paginasi.count}');
print('Per Halaman: ${paginasi.perPage}');
print('Total: ${paginasi.total}');
print('------------------------');

// Menampilkan data infografis yang didapatkan
for (final infografis in daftarInfografis) {
  print('ID Infografis: ${infografis.id}');
  print('Judul: ${infografis.title}');
  print('URL Gambar: ${infografis.image}');
  print('Deskripsi: ${infografis.description}');
  print('Kategori: ${infografis.category}');
  print('URL Unduh: ${infografis.downloadUrl}');
  print('------------------------');
}
```

## Properti (Infographic)

| Properti      | Tipe      | Deskripsi                                           |
| ------------- | --------- | --------------------------------------------------- |
| `id`          | `String`  | Pengenal unik dari infografis.                      |
| `title`       | `String`  | Judul atau nama dari infografis.                    |
| `image`       | `String`  | URL gambar yang terkait dengan infografis.          |
| `description` | `String?` | Deskripsi singkat dari konten infografis.           |
| `category`    | `String`  | Kategori atau topik yang menjadi subjek infografis. |
| `downloadUrl` | `String`  | URL tempat infografis dapat diunduh.                |
