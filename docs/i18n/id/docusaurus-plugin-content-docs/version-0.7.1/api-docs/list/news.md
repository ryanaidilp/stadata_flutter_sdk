# Berita

Metode ini digunakan untuk mengambil daftar berita berdasarkan domain (wilayah) yang dipilih.

## Parameter

| Parameter        | Tipe           | Deskripsi                                              |
| ---------------- | -------------- | ------------------------------------------------------ |
| `domain`         | `String`       | Kode domain (wilayah) untuk mengambil berita.          |
| `lang`           | `DataLanguage` | Bahasa untuk data berita (default: `DataLanguage.id`). |
| `page`           | `int`          | Nomor halaman (default: `1`).                          |
| `keyword`        | `String?`      | Kata kunci untuk mencari berita (opsional).            |
| `newsCategoryId` | `String?`      | Kategori untuk menyaring berita (opsional).            |
| `month`          | `int?`         | Bulan untuk menyaring berita (opsional - `1..12`).     |
| `year`           | `int?`         | Tahun untuk menyaring berita (opsional).               |

## Contoh

Contoh penggunaan dan contoh keluaran:

![Preview](/gif/news.gif)

```dart
// Mengambil berita dari API BPS
final result = await StadataFlutter.instance.list.news(domain: '7200');
final newsList = result.data;
final pagination = result.pagination;


// Menampilkan informasi halaman
print('Halaman Saat Ini: ${pagination.page}');
print('Total Halaman: ${pagination.pages}');
print('Jumlah Data di Halaman Ini: ${pagination.count}');
print('Per Halaman: ${pagination.perPage}');
print('Total: ${pagination.total}');
print('------------------------');

// Menampilkan data berita yang diambil
for (final news in newsList) {
    print('ID Berita: ${news.id}');
    print('Kategori: ${news.category}');
    print('Judul: ${news.title}');
    print('Isi: ${news.content}');
    print('Tanggal Rilis: ${news.releaseDate}');
    print('Gambar: ${news.picture}');
    print('------------------------');
}

```

## Properti (News)

| Properti      | Tipe       | Deskripsi                                          |
| ------------- | ---------- | -------------------------------------------------- |
| `id`          | `int`      | Pengidentifikasi unik untuk berita.                |
| `categoryId`  | `String`   | Pengidentifikasi kategori untuk berita (opsional). |
| `category`    | `String?`  | Nama kategori berita (opsional).                   |
| `title`       | `String`   | Judul berita.                                      |
| `content`     | `String`   | Isi berita.                                        |
| `releaseDate` | `DateTime` | Tanggal ketika berita dirilis.                     |
| `picture`     | `String`   | Gambar yang terkait dengan berita.                 |
