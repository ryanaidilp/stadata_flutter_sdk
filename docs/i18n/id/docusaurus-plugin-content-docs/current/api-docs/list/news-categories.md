# Kategori Berita

Metode ini digunakan untuk mengambil daftar kategori berita berdasarkan domain (wilayah) yang dipilih.

## Parameter

| Parameter | Tipe           | Deskripsi                                                       |
| --------- | -------------- | --------------------------------------------------------------- |
| `domain`  | `String`       | Kode domain (wilayah) untuk mengambil kategori berita.          |
| `lang`    | `DataLanguage` | Bahasa untuk data kategori berita (default: `DataLanguage.id`). |

## Contoh

Contoh penggunaan dan contoh output:

![Preview](/gif/news_categories.gif)

```dart
// Mengambil data kategori berita dari API BPS
final result = await StadataFlutter.instance.list.newsCategories(domain: '7200');
final daftarKategoriBerita = result.data;
final paginasi = result.pagination;

// Menampilkan informasi paginasi
print('Halaman Saat Ini: ${paginasi.page}');
print('Total Halaman: ${paginasi.pages}');
print('Jumlah Data pada Halaman Ini: ${paginasi.count}');
print('Per Halaman: ${paginasi.perPage}');
print('Total: ${paginasi.total}');
print('------------------------');

// Menampilkan data kategori berita yang diperoleh
for (final kategoriBerita in daftarKategoriBerita) {
    print('ID Kategori Berita: ${kategoriBerita.id}');
    print('Nama Kategori Berita: ${kategoriBerita.name}');
}

```

## Properti (NewsCategory)

| Properti | Tipe     | Deskripsi                                    |
| -------- | -------- | -------------------------------------------- |
| `id`     | `String` | Pengidentifikasi unik untuk kategori berita. |
| `name`   | `String` | Nama kategori berita.                        |
